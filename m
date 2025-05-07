Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796AEC3ABC0
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 21:26:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5CA10E1CE;
	Wed,  7 May 2025 21:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oJe+qxCU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95DB10E1CE
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 21:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746653218; x=1778189218;
 h=from:to:subject:date:message-id:references:in-reply-to:
 mime-version; bh=WfoYfkN42CgS9j5OX/tUbrQVaE4AYNocDhGNpI267Fk=;
 b=oJe+qxCUkvvcGrBDPgraw2q1p/lA3slZg0WkAVyu7+Z5O0T2PkytM6nI
 nxil2BzLFw0cbdpCy9N7aPo5DAZOTLGKPhh5m+dO9/qE0M0Bo+Q2I8sjD
 oPHz8ahtNPGV3Tsv3taMcn16NstxIsGXndjYSMd2VdIv4idtcP5QXwKeO
 k8PBVbWsQw+Gii39TjlSsac/5h6jywYgCUlik+5hrB7OQ0msKRIhiFaOX
 I4w+ELubDUCW+7/dI2PkAH/PIuvaBCvzSaGhbFy7fwmzLVbuRqLnu0bg9
 2IFpTuCVbm/lqullnH0e6sEHPzfMdpifwPYDsIhGb6nuFhVYTJ6QMZZ08 g==;
X-CSE-ConnectionGUID: HWTNgFRNSX6h3tNYosgMOA==
X-CSE-MsgGUID: Sc2+CTW9T+mytxYl+94xcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="47514130"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208,217";a="47514130"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 14:26:57 -0700
X-CSE-ConnectionGUID: xZxE5qiGTUWDUtJf56w3Jg==
X-CSE-MsgGUID: gxUlSNnmR1eqIsxeCpA/dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
 d="scan'208,217";a="159402281"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 14:26:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 14:26:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 14:26:56 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 14:26:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MteW5Xcf3lVEirxRz+g8j6SnuEwe7HK4kDZhkCsz0Hcy8i8Nw98t8GJP7i2LPutUYngZtY0pVyT8m4tGT2xiNnncg3N0e0nbRL8fex/sjezpTZ7NLJqrY2EGoTb+gsglyJy/e1xtVmU3lgWG7K0IFU05yxRsgUOpm3G3zsnk8rnPhmpN3q262wlyQlBKJxSybcWMwwtDusheNfqx5jwpNy745z6AABj7M9JkBoZotAb1FbBMXgtlD3bWgCcWq9VkKoC2BLRIJlCNv+HKr27H3wPutQOkdSyI0746XWoClNfsvaKgQbpmKnvFPzqp+FW21oYc9dq16KnNx0/ar3hdLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AyoOrRQbQfUGaUUqm4W3zbW76rhPCtnBn/qKD6v5Gk8=;
 b=XSvJJDu/QxAPt9QeF5MngrjL1ryBy3Hl/wMrZzUc4MYDjnbB8Co0KyvGrxvaec+i8OwSl97b60UiSrTCh/OrujUBUPVX+7Drt/2TruwRgH6JeWeVTPH2ow7UBecFCfFBqd8mq/WNy11V0H3sJNAAVCQpNCQRcev0qIzchfmZXimFlNJAk/gvV4fxI5g5uKMCplbbHC1xvIs81BxayAo4xUsNXTZaQqY4dxS5aHx7TorYaREGgoihLjrjArnFd0UHzjW378O3cgUtwlVeaDUiKNDycMNQc/9yMaXPR8hRIo+zkvbGK3RRvfu4boPz3AjqbIPrCxb6AZa/0fMV/euK8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB4849.namprd11.prod.outlook.com (2603:10b6:303:90::13)
 by DS7PR11MB7739.namprd11.prod.outlook.com (2603:10b6:8:e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 21:26:48 +0000
Received: from CO1PR11MB4849.namprd11.prod.outlook.com
 ([fe80::6436:4307:8099:958b]) by CO1PR11MB4849.namprd11.prod.outlook.com
 ([fe80::6436:4307:8099:958b%5]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 21:26:48 +0000
From: "Johnstone, Nicholas" <nicholas.johnstone@intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Box,
 David E" <david.e.box@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2] drm/xe/vsec: Allow for kernel context access
Thread-Topic: [PATCH v2] drm/xe/vsec: Allow for kernel context access
Thread-Index: AQHbv4elopINUpZw3UapxAGVUEoh1bPHra3w
Date: Wed, 7 May 2025 21:26:48 +0000
Message-ID: <CO1PR11MB484970590BE12478BB5EBD7F9C88A@CO1PR11MB4849.namprd11.prod.outlook.com>
References: <20250507193811.268719-1-michael.j.ruhl@intel.com>
In-Reply-To: <20250507193811.268719-1-michael.j.ruhl@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB4849:EE_|DS7PR11MB7739:EE_
x-ms-office365-filtering-correlation-id: 2d9632e1-254e-412d-d6a5-08dd8dade047
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007|8096899003; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?NiPUfkQKft4XDaLQ5ogQBQPM5qSnW1DDXAUkKHEnNgBW1I1uROa5HNqkZU?=
 =?iso-8859-1?Q?dkqotUIkwwVfFUPejNXo5HWgMUgpX6lvP2nGmYvN3W0oEvSscn3XwaMt9t?=
 =?iso-8859-1?Q?jwhnM6aHzU6HlR2GJjjR4mDFHAXXCEoBLOGBCjkoOnp/J94NHws21JTso6?=
 =?iso-8859-1?Q?4X1KYewjcEXBYADGSBzhpwHmHbjBvsdHkOoByFYRaV0npUGmd1X/q2SG4o?=
 =?iso-8859-1?Q?tB9nm5Rstri7q2wHfKEQgBwReJmLe8O7ueGbY0DgaAcxti6r0hSsTg1Go/?=
 =?iso-8859-1?Q?hBYgOwogm759zIwh70PkgV3wcORgsOq6TFYC/y+Qz272DpSPTIbirrD7uU?=
 =?iso-8859-1?Q?uMzWubCRZ7MYyBPT0rAL4D1LEH1a9cNPzsqche4vyolvwmpt/Xvk5zb+FM?=
 =?iso-8859-1?Q?4l1T239WRepZYY7ZY/UYoO6b4soaeOv9Jx2ib6awjR6bhdnAKkTWCzm1Gk?=
 =?iso-8859-1?Q?TgL5d3UyBuPFGJ0PvPR861fTlBcCVASZ9rrUSqRRZloCBGXacJQMYq/dis?=
 =?iso-8859-1?Q?5Iv/aiCzK9zN+XNGVU08g5+e9o6/Eni5xpclLj/cd3RKwuHu6t40LBsg3H?=
 =?iso-8859-1?Q?MdzNyl5J/tvUh0ak3LDZB1ELgrwbI7E4aKiAFYaR5SfXrQolp4bZyDy9nS?=
 =?iso-8859-1?Q?olNV5GKBsjnaCVCDfxkEHz/ZqMJOQlenWkPRkuAHnq3nqgM/8q9ZPDhZLZ?=
 =?iso-8859-1?Q?sDzTTcvRkjaOKO5b+LhElP/LBcRwsUKKCISde0S3bv9gyXAaHlhkBLbQm7?=
 =?iso-8859-1?Q?811ldo5G7VE8ZswdUSSWs9b1H07mJt6ot8ouzM+eYno4okwoQZvXIsry1K?=
 =?iso-8859-1?Q?rBRNsJMDDKvLW58LMMEjnh9WzU72IARdWGulAbprDQ43laK7MjZoeLuFPd?=
 =?iso-8859-1?Q?urNQroBMHJYlIFC+S0Op54Ib96+mDUR29NtISbVieEeVEUpH1+kRmiFUAf?=
 =?iso-8859-1?Q?JfG12ufdbSZ8/sPZ4kk+D41OujQjfvOPrpLkRFSUWJxOJaqsP5hjxfzzIg?=
 =?iso-8859-1?Q?c+XBteiUneGULwHiT+m8OM75wuPIDC0JF4MtKHcc/P7sbDOAMkehqfP1qO?=
 =?iso-8859-1?Q?yvpta6F6cKgJxmho3Rwy8FxWr15MjKseMzQ5iykAlqXqYSt7lDyM+kuv8l?=
 =?iso-8859-1?Q?Oq09BXcjDjB28GKdt+KVDxGfTsx0QFHU4ipUUdUur/erYUW0qT02WgjHkS?=
 =?iso-8859-1?Q?Mp1hR6aJmHS5APkw50mgO9JwejpFpE2JEmjIML1wK+LBByAh7Utv06pWx9?=
 =?iso-8859-1?Q?7tKMQk4Rf+HbuLIEqWHW4bRe2D7+2dMMmkF9/vGwyEh1DvBTX4fPCOMCzT?=
 =?iso-8859-1?Q?OCzS1m+vjI4pqbR4tG+DkDmHXTyGoWvQvDlovSvYRBi2y273A1fPqwcagR?=
 =?iso-8859-1?Q?ULgkyXei+ihYO6PcpEgVEumzGo2DbHWojfe5+F87gAuFi5tYd2YqGjo/4E?=
 =?iso-8859-1?Q?pTN3GGEMI6M2YGJr5XlVxRv9mNiZfQ9stOYZ5uphywZEHae8daP3OGlKsH?=
 =?iso-8859-1?Q?eHDui7KOEaqIuN6ZjV4ssHt0DcAoQWK9trtY89bDXHv3hQD3GRAbc8indH?=
 =?iso-8859-1?Q?HPACypo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4849.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?jtTaSKLWMuH+P+riI6jGXWc9jEktYJB9IUb6C1R7BDOUzMENMBXFDn1pFc?=
 =?iso-8859-1?Q?C1fwjiEVeB57nZVeFfD6USiKqLX87xi/vPmWbUOpCOuKbEYr1UM+bicW+o?=
 =?iso-8859-1?Q?Vb8lYZUNeGdGzIJ2rEgLixJ3KzQmqnYFVKSmu/91ldd5iHwj9PxKPf5u6+?=
 =?iso-8859-1?Q?Q0xe8WBKyEX7Dn90ZpIlwqJCcACOjFNbLq6n1ou1j0tZsDiIszxXT7t7O5?=
 =?iso-8859-1?Q?vI5j2gvRkzk+gnJiGW6bGw1QEUxmdBsVvgzzMgulzIHJpd4O917fRh722j?=
 =?iso-8859-1?Q?h1HShQAgk0IGxfgoRvQuZPgRXXmAZktRQbGhE/5PglHg9kXEs5fR+vGfTK?=
 =?iso-8859-1?Q?sYqM2uTDPSv5ZUj/39MOGtgnyUXDnpF/exZMS6XvpO/0B3W9qN6dwhpxbS?=
 =?iso-8859-1?Q?QRUYenc5NEaM5Vw40fpnfsBJRcPRtmJgooQBBTnhWnHBY2Y1Ml47r0toYB?=
 =?iso-8859-1?Q?MoihTPuvYg9GLTX9FVCjORicx+AilpaVBizDDfb87w3OmZaHL2Q/D5E1Ra?=
 =?iso-8859-1?Q?ewPbdbCqZdVUuruhPnplOPEQ9eaFQunpVLYPMG1KzuRYOIkl2X4B3V4RJv?=
 =?iso-8859-1?Q?V640dCKmsEE0VMgg2xXpmEdPqjrrWZJXgGEY9DK76cWVIOdVFpN2qKow50?=
 =?iso-8859-1?Q?pABb52zbrfFkOFGnFt8f6eZIrmMeMrFGBqRJ4a/FtxwwJadiB4W5+oWcV6?=
 =?iso-8859-1?Q?QViBzes43w7s5YBp1NOo6QxVlFBOFZNCTAqzI78nHDJbykr+/X84ZEzSXr?=
 =?iso-8859-1?Q?J0fL5IZSVGh2ELcwqQhIWNvF3florq/mTnZwmNq4OG2oWkby3QH23vYIEw?=
 =?iso-8859-1?Q?HKA6Ta3PqoeBGF846A0sU79ViYR1wD2HsU7ZbU3OSbFOsHcfuczD0cqBe2?=
 =?iso-8859-1?Q?23juxz1miz031w8TUOSttbCG57sNqS1m4iPeu9FZXENSWTXPrmjk4pWj4+?=
 =?iso-8859-1?Q?Tzndxsyr2xVsgVlDZeSJvhkZ+7mIc2fAO+aj/KJlbc4gdRAtv/vRaEaUIX?=
 =?iso-8859-1?Q?u78CNPo5fpyO1WQntUhYfT4UfVkLgj+l45cz096hm9KRUWsg0vH2MIJ+Yj?=
 =?iso-8859-1?Q?2UH+qzsYrXn0FmtOHiHEGs40inV185Cj/ucSaRriS/K0xO6JF0loTQoOIs?=
 =?iso-8859-1?Q?6bhXh5ttv68KiVyqiiLX3I6bhYUFnY+VHR4S5XMONvFuUD9VIH9TdOC1at?=
 =?iso-8859-1?Q?/MZifjr6Ud19ZtJr6T0Y/8lbxgqld40shXvo82srFIO7KFGcfFJ+LuWFSz?=
 =?iso-8859-1?Q?edVFymP2sscNBvkhqy4UCQwhYWaJ1Aho3RD9DCo3RRutYhxaT6mzeRFjfu?=
 =?iso-8859-1?Q?5npwsgXnwhLcWtmMrRSFEN/PyRUW3LxOS/uVbkHj0skBv+W3VrOAgadxXs?=
 =?iso-8859-1?Q?XdqCJzsrYWX13hARR9ila/jf3+tctmZHqSXWc1R1BVtxb+TvoW5shHFGlW?=
 =?iso-8859-1?Q?NUpg40ovKJDMDTxgW+U8WM9bicc1kZB1nDL7RTh9aMtjzYLVHoXWC02Fbw?=
 =?iso-8859-1?Q?hVKRi8T5UW3aqDbBh0PY7apEiRWfqEymyjPvD2i+WqczPN9ouROLEojSHC?=
 =?iso-8859-1?Q?rYFq+wBCrOXKat3XgDkgku7uznMAXAdchERQwljSLuAPaG+ZGDCLCojpqI?=
 =?iso-8859-1?Q?hWKE9vLpu7fRtdfGdmLy7YX3NHPjxn4f4ngSFn0eE9t3x7ufMEuIzBHw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CO1PR11MB484970590BE12478BB5EBD7F9C88ACO1PR11MB4849namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4849.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9632e1-254e-412d-d6a5-08dd8dade047
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 21:26:48.7503 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UuKJok+GPq6CSzQh7yEsaxuJo6Bn8TPDTzE3y1jcQtBMrNKTQ0H31QauioXDxwB7Yfbct6tz+uMPOh0VyUcKC1RCrgT6Gcb6/d4EqD5s174=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7739
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--_000_CO1PR11MB484970590BE12478BB5EBD7F9C88ACO1PR11MB4849namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Reviewed by: nicholas.johnstone@intel.com

Best,
Nick

________________________________
From: Ruhl, Michael J
Sent: Wednesday, May 7, 2025 2:37 PM
To: intel-xe@lists.freedesktop.org; Johnstone, Nicholas; Box, David E; Vivi=
, Rodrigo; De Marchi, Lucas
Cc: Ruhl, Michael J
Subject: [PATCH v2] drm/xe/vsec: Allow for kernel context access

The PMT driver API allows kernel level access to device
data.  Because of this, the mutex lock use by the Xe copy
callback function turns out to be a poor choice.

Change the mutex to a spinlock to avoid sleeping when it
isn't allowed.

Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
v2: checkpatch fix, update email address

 drivers/gpu/drm/xe/xe_device.c       | 5 ++---
 drivers/gpu/drm/xe/xe_device_types.h | 2 +-
 drivers/gpu/drm/xe/xe_vsec.c         | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.=
c
index 75e753e0a682..72c81b8203a5 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -8,6 +8,7 @@
 #include <linux/aperture.h>
 #include <linux/delay.h>
 #include <linux/fault-inject.h>
+#include <linux/spinlock.h>
 #include <linux/units.h>

 #include <drm/drm_atomic_helper.h>
@@ -488,9 +489,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev=
,
                 goto err;
         }

-       err =3D drmm_mutex_init(&xe->drm, &xe->pmt.lock);
-       if (err)
-               goto err;
+       spin_lock_init(&xe->pmt.lock);

         err =3D xe_display_create(xe);
         if (WARN_ON(err))
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_d=
evice_types.h
index 06c65dace026..b57e1ba7cbdf 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -527,7 +527,7 @@ struct xe_device {
         /** @pmt: Support the PMT driver callback interface */
         struct {
                 /** @pmt.lock: protect access for telemetry data */
-               struct mutex lock;
+               spinlock_t lock;
         } pmt;

         /**
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index b378848d3b7b..df44e28abbdf 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -6,7 +6,7 @@
 #include <linux/errno.h>
 #include <linux/intel_vsec.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
+#include <linux/spinlock.h>
 #include <linux/pci.h>
 #include <linux/types.h>

@@ -164,7 +164,7 @@ static int xe_pmt_telem_read(struct pci_dev *pdev, u32 =
guid, u64 *data, loff_t u

         telem_addr +=3D offset + user_offset;

-       guard(mutex)(&xe->pmt.lock);
+       guard(spinlock)(&xe->pmt.lock);

         /* indicate that we are not at an appropriate power level */
         if (!xe_pm_runtime_get_if_active(xe))
--
2.49.0


--_000_CO1PR11MB484970590BE12478BB5EBD7F9C88ACO1PR11MB4849namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: black;">
Reviewed by: nicholas.johnstone@intel.com</div>
<div id=3D"appendonsend" style=3D"color: inherit;"></div>
<div class=3D"elementToProof"><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Best,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Nick</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Ruhl, Michael J<br>
<b>Sent:</b>&nbsp;Wednesday, May 7, 2025 2:37 PM<br>
<b>To:</b>&nbsp;intel-xe@lists.freedesktop.org; Johnstone, Nicholas; Box, D=
avid E; Vivi, Rodrigo; De Marchi, Lucas<br>
<b>Cc:</b>&nbsp;Ruhl, Michael J<br>
<b>Subject:</b>&nbsp;[PATCH v2] drm/xe/vsec: Allow for kernel context acces=
s </div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">The PMT driver API allows kernel level acce=
ss to device<br>
data.&nbsp; Because of this, the mutex lock use by the Xe copy<br>
callback function turns out to be a poor choice.<br>
<br>
Change the mutex to a spinlock to avoid sleeping when it<br>
isn't allowed.<br>
<br>
Fixes: 0c45e76fcc62 (&quot;drm/xe/vsec: Support BMG devices&quot;)<br>
Signed-off-by: Michael J. Ruhl &lt;michael.j.ruhl@intel.com&gt;<br>
---<br>
v2: checkpatch fix, update email address<br>
<br>
&nbsp;drivers/gpu/drm/xe/xe_device.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
5 ++---<br>
&nbsp;drivers/gpu/drm/xe/xe_device_types.h | 2 +-<br>
&nbsp;drivers/gpu/drm/xe/xe_vsec.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; | 4 ++--<br>
&nbsp;3 files changed, 5 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.=
c<br>
index 75e753e0a682..72c81b8203a5 100644<br>
--- a/drivers/gpu/drm/xe/xe_device.c<br>
+++ b/drivers/gpu/drm/xe/xe_device.c<br>
@@ -8,6 +8,7 @@<br>
&nbsp;#include &lt;linux/aperture.h&gt;<br>
&nbsp;#include &lt;linux/delay.h&gt;<br>
&nbsp;#include &lt;linux/fault-inject.h&gt;<br>
+#include &lt;linux/spinlock.h&gt;<br>
&nbsp;#include &lt;linux/units.h&gt;<br>
&nbsp;<br>
&nbsp;#include &lt;drm/drm_atomic_helper.h&gt;<br>
@@ -488,9 +489,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev=
,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; goto err;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err =3D drmm_mutex_init(&amp;xe-&gt;d=
rm, &amp;xe-&gt;pmt.lock);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto err;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_lock_init(&amp;xe-&gt;pmt.lock);=
<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err =3D xe_display_create(=
xe);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (WARN_ON(err))<br>
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_d=
evice_types.h<br>
index 06c65dace026..b57e1ba7cbdf 100644<br>
--- a/drivers/gpu/drm/xe/xe_device_types.h<br>
+++ b/drivers/gpu/drm/xe/xe_device_types.h<br>
@@ -527,7 +527,7 @@ struct xe_device {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @pmt: Support the PMT =
driver callback interface */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /** @pmt.lock: protect access for telemetry data */<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct mutex lock;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; spinlock_t lock;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } pmt;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /**<br>
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c<br=
>
index b378848d3b7b..df44e28abbdf 100644<br>
--- a/drivers/gpu/drm/xe/xe_vsec.c<br>
+++ b/drivers/gpu/drm/xe/xe_vsec.c<br>
@@ -6,7 +6,7 @@<br>
&nbsp;#include &lt;linux/errno.h&gt;<br>
&nbsp;#include &lt;linux/intel_vsec.h&gt;<br>
&nbsp;#include &lt;linux/module.h&gt;<br>
-#include &lt;linux/mutex.h&gt;<br>
+#include &lt;linux/spinlock.h&gt;<br>
&nbsp;#include &lt;linux/pci.h&gt;<br>
&nbsp;#include &lt;linux/types.h&gt;<br>
&nbsp;<br>
@@ -164,7 +164,7 @@ static int xe_pmt_telem_read(struct pci_dev *pdev, u32 =
guid, u64 *data, loff_t u<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; telem_addr +=3D offset + u=
ser_offset;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; guard(mutex)(&amp;xe-&gt;pmt.lock);<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; guard(spinlock)(&amp;xe-&gt;pmt.lock)=
;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* indicate that we are no=
t at an appropriate power level */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!xe_pm_runtime_get_if_=
active(xe))<br>
--<br>
2.49.0<br>
<br>
</div>
</body>
</html>

--_000_CO1PR11MB484970590BE12478BB5EBD7F9C88ACO1PR11MB4849namp_--
