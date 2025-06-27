Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF537C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 08:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804C310E97D;
	Fri, 27 Jun 2025 08:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="awp12iDt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A6110E979
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 08:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751012048; x=1782548048;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DwxpTDrfKK4iogiafyDKxiyMajOQU3kgpfZboeF9y40=;
 b=awp12iDt6Gk23+yu/TijT+FoHGws1kKnQDl2urfBsoVc/r/H2Qey4eYv
 yk7yUmbAgAhrxd9dkhhoggQkXQEK9FjKhLcaMu1r49DNjJEtujXDNlLP3
 jASkLUhM5wtHItPJePrSlrLIO7ySpgzmCiI03GMgrTeFzsYgBct17vX0t
 973rncxUzyRT3wOUi036/29QFDM24gZIhpTVgkq1IEzLhzGCFDjCadBth
 DPq0c3UbghItL0ln9zKXZgGxttJ0HoU3B0kUzgT4l8btcX8P14zxNXEq5
 CUR8wiO9e0IkTvOBn/o1LzaBSsK6XH1r5hp859aZ4TtHbG/TJvQ6uKnyM g==;
X-CSE-ConnectionGUID: DHNYhJVwSrmVsXKdv7zyWA==
X-CSE-MsgGUID: MlO9/NySSJ6AfnTGHkFRxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="57127394"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="57127394"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 01:14:07 -0700
X-CSE-ConnectionGUID: LeI0QXV3ThiE+pI0ejz9cQ==
X-CSE-MsgGUID: ve2gmEfzQB2FGUAY2OrW6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="157029454"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 01:14:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 01:14:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 01:14:05 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.48)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 01:14:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+58+JQkaxUJTRcvkDBRKlqQhm+otAWyJRg3o1o2d+ug/Y7GllT6mLH7MOBm8YxSCt9lNKlxXj1HcAx2Okk10uehebl+Vj3sSrd21ByRv58SxYW90kP914ygvfVSVAv2c8e/ulvHECmUeiSVuKNmE2z9qsuRPMpZdAS6fMP94dF0S4BrfG10LLoiCho7o4EuCO6v/SAf+pW3MV+Ym9rtZcefs0fGqXvqQC9INu+cmOItQ6czE8NE0pvUO8RwSCgHiWaI9r97vs8Qsy5J9pNynGYQh0IwX31RNJwSJJMy59m6NpwV9b6n1w3FIaU3x2Ho7gaO2pMyzQAFKqHkeQNjCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P12DDY2+iCmg5MG4AaqKlrJKrPO1yos4NwfBmYHZ9BQ=;
 b=wV0jrXh3kMF8NrfrVZMj1KsFZwVsA2Hhd+aXhMy2MeyaoVqCSjFIQM3edUgIHeXXJXUMAcahQv4N6mr1Lu4h+UwFQZmbykiy6jJcXp4/OCJ1Q+YbT2Bf4wiNQVHIub66z1FdwOVgbph+yVvrTLXVglrF0AhW36oZhgxldROV8gpcj4IcFJZZJCIEoC8K2Ikfz1XcZJ93APHMkvOk+JgynrIIUwTLrCpfDviQNlJG7ZTfearcZfEUnU4jHucC7lMsNmkNR+k5KuQxhWsCB9VhV10oCJ71HrI/Q/XjVfLW7HFhCurGVQvpMQnlQ1+y4aqw0cBOEr2kMPVgX15rCH771A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8987.namprd11.prod.outlook.com (2603:10b6:208:574::18)
 by SN7PR11MB7019.namprd11.prod.outlook.com (2603:10b6:806:2ae::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Fri, 27 Jun
 2025 08:14:02 +0000
Received: from IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e]) by IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e%3]) with mapi id 15.20.8769.022; Fri, 27 Jun 2025
 08:14:02 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
Thread-Topic: [PATCH] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
Thread-Index: AQHb5bRIDEpcgF78KUm51MffYJCX67QT7XeAgAFlzFCAAVXFQA==
Date: Fri, 27 Jun 2025 08:14:02 +0000
Message-ID: <IA3PR11MB898706D0EC2F50C11BCE2F64D045A@IA3PR11MB8987.namprd11.prod.outlook.com>
References: <20250625095805.1390907-1-nitin.r.gote@intel.com>
 <aFwF53I_d8OkwI3_@intel.com>
 <IA3PR11MB89873DE9E3CF21838937618AD07AA@IA3PR11MB8987.namprd11.prod.outlook.com>
In-Reply-To: <IA3PR11MB89873DE9E3CF21838937618AD07AA@IA3PR11MB8987.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8987:EE_|SN7PR11MB7019:EE_
x-ms-office365-filtering-correlation-id: 99fd5e7a-bf84-4dbf-f290-08ddb55293ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?1A0ipQaDy8SDUpN9W3futLo9Zu7ciwf1L8xvQLNTQvefwx3KmwL5pVqY+0?=
 =?iso-8859-1?Q?P96/QgB6TJWGaK9Lu3kcm6gP/iEPHMKCu/s9P9xJGeK2Po0LyS1vUnsxD5?=
 =?iso-8859-1?Q?fP7xKX2e++H/4khqf2Ln3So16bS/LnZlqEP/7X229eXLg6e7Smg26PBRL7?=
 =?iso-8859-1?Q?I5Fbf2GTDTn7d53qw84qUTL+sWeRFzO1QVIQEb/hf78va0eERTuhTdCfaY?=
 =?iso-8859-1?Q?eGgSeIvMSnslxCI2uc8PWkZNg7hBRabUoyJeSOpveUz7tLDOd1J10K9oeI?=
 =?iso-8859-1?Q?Ci5qcyNgxjdeIuPNBh+BF0gIgkFcmAfFSwFfpygmYyB9r6F++rrbJcy13G?=
 =?iso-8859-1?Q?t3ASPqsrsc9W6B80YYlSdkTJLho/pC78lu8tPZN4f+MIja36HDYRJf9bmi?=
 =?iso-8859-1?Q?LSfI5P0ksffzp+s5GwG3c2yOz8p8ubVTsCOcxTPS23Wo5tBtcTsNdH2CwA?=
 =?iso-8859-1?Q?4hD2omwA622JM44H4nKfQi9AlknNtMxTjSLZA2eWLEdWVycw+LALgYvnFh?=
 =?iso-8859-1?Q?o9g0ffImFHn5Kv6rqHWP0Mg2SRz1PV2VF58u8W8UAzsx0JCG46ZPHIYnsB?=
 =?iso-8859-1?Q?2NyaVUMepXu9XAwFFQHi3jniwlp+p9/U4GpgvKtguNhVspwgkt8Ekm4rk3?=
 =?iso-8859-1?Q?t8fzUUgBx+UGL8SsmIP70C9aWVEakV2iIb2ICLnwYLE58w4ZvGi1bVA89Q?=
 =?iso-8859-1?Q?PemvRXZpVQQiwdK70rAES1kBiymoqEdO5SmWqLiBjfUTsl/4bL4PgcMhgD?=
 =?iso-8859-1?Q?oVi17rOrwvTziYXMoO7CzQUMaYZrlGMbsbiL7e+mZWB/Y9uIO5lAE/4H85?=
 =?iso-8859-1?Q?bN89mG7XgPHkCAqWAmHO97A3uOy9p2UCm8T/bv2fEFUCDvkgQZrB74oUDI?=
 =?iso-8859-1?Q?iXjFef44x5Xb+V810Jv0S/opYwkVLRb52B3V5Q8he4HW5F2G8R7kL5FAgg?=
 =?iso-8859-1?Q?z+X0zpgh+N+i6UWs/AQBSdL8sOcYINDprv5TbYeDhYnNhImwj0NoqHvIVs?=
 =?iso-8859-1?Q?88NKl1uwOvj3M7O1DCLkDD88fM7Q7IYS/jSu0InXlLEUAQefcoQvcntKJ9?=
 =?iso-8859-1?Q?qUHqDP76heAl8X5jB39mc5517yEmFjyztTKNPFIQT4JRvzIIne9jVyotgn?=
 =?iso-8859-1?Q?vWBj1LxIO1C9t/a/+yjA/7O8s33z2FnB6jPV9Rw1lz9IylXn1bdvJDYBFJ?=
 =?iso-8859-1?Q?ucTIfprW8LsomniXyRaQ0b1ntzC7lEdT9YVnxE0HWbBE0+HVKsvYpCn5wq?=
 =?iso-8859-1?Q?MXlMgCtjKx934bkySvokAnOBrbompgwL6scEaJDp9vFDWouDMiG+XaaUGS?=
 =?iso-8859-1?Q?NMoZPfBgMsxMiy6qhY2EHCU5EdJLcQnm3gOEt82EK9E7+KMZ0bkrZLvBFi?=
 =?iso-8859-1?Q?Nk5nKEA1uf3JFC2vvmyqrJHs5p8znVrTxTRPz+4MJ2rx1/EHcTR+oG/olN?=
 =?iso-8859-1?Q?BET6FYhB00n0zZ+sDc+LqkX0yCJHcmMpqgru9IjPA5JYIW0QZCuuQPv6+D?=
 =?iso-8859-1?Q?4ew4DTcYeMIADYi87SiI4Lz0+qcuT9V22QWcSX4JMkqxFKp8Wo9vSrxbzb?=
 =?iso-8859-1?Q?rCRT7F4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?+SfQXYBxQudDLfcbhKE9/k3XGQMKzE1Ity1jWNdUodgrVJGo7OoqHr4l1W?=
 =?iso-8859-1?Q?ThyK/GLVfXxK9BaChUm4JjifGcpxBh023oHv3/7FAVU8HOkc0TMmrDQeQ0?=
 =?iso-8859-1?Q?Gg9Fvtdh0vjbX/9q/beI4pErzW64eIIDucFy4buP9BMu57NZMJJbCofL+D?=
 =?iso-8859-1?Q?1fhCWep3uWyxNYNlkD+lgjOWp415Bn9ZMIs7szRlefG3za5j6h38J3Mm8S?=
 =?iso-8859-1?Q?Z/dWg7mSdcmTWVwMfl3WLKFfpvGWxDrVTINIo6Si1NLqsk42nktX5nvRfX?=
 =?iso-8859-1?Q?Oi9SePE8YMYPJ7j+LG2ZgXIxb6eAp9FWNVYmRRhNsaNqiYSV/5RQxY5fp/?=
 =?iso-8859-1?Q?pnrhkz5VPmSGstXzWa20EuBcAPnc2X9zmdhpyMjhxPps+DaornxVPjiPwe?=
 =?iso-8859-1?Q?UXySS6zIyLG1m1l4NngWa8ceDV5H8SzUIzgTdWI5N6LWSO32SXJfLrlCVO?=
 =?iso-8859-1?Q?eB0uKGWsAlHpaAxLYDXb51ocNkXGbG+seVt/pKSV7RuDrrBDD+M3yN0HDQ?=
 =?iso-8859-1?Q?t3zEnLyRgIcJpE82sh+PF1ALK9CJ6K4Uxd6vcK1SRKpwA2QgE/LVox8eqy?=
 =?iso-8859-1?Q?aEHS+8Wn6z+7redDA9ZnhUF4WLLKuFc3b93Pb7lL1UM7Gn88gNNHwdLHez?=
 =?iso-8859-1?Q?O3OlIn691alSWg5xocTTUnsnD2+sP7yGU9dNk/WmqG5VnRQE7ZZB4+V/OW?=
 =?iso-8859-1?Q?dTQlP0NuPBChBSEA5e2doy8kgBgZfs/WDNdYyY8goLja5dgVRQdh8fK4jT?=
 =?iso-8859-1?Q?RMAhWGqDGA4vDk42E2hT9o+4Y7Xj9KbLsC6N159ZAdRrSkogixLDwEmXn5?=
 =?iso-8859-1?Q?qrrN55Aub0prsjm3lvcNKrRNmQzSMtHASIyHWUUMaSctN0Be+a4UA7Ng23?=
 =?iso-8859-1?Q?5WaEN1DArsY8f7wShGJ7RHQB+KopNyKdiouoOXoYY/d7fBbY1Wswd190oo?=
 =?iso-8859-1?Q?H6nK5XVYGz/6tx2sC7csVowTnGtCzHR+GHQwaEwiq5Kiuy5Vxo5AhaOKaQ?=
 =?iso-8859-1?Q?Tw73YzpoG9/v2FpRvnYIRctvGt2esNTf7q1mV5amyI11vi19vWTt8Syyz2?=
 =?iso-8859-1?Q?9lpO/wc+AD7YZANyIODcKcPJ1NKkgR4ZYGLZTImeDD225zijD4KqRofqZB?=
 =?iso-8859-1?Q?IyoV9oi/PzBEWu29JVAOU8Z+Eq9hDS8oiMbHuOH9LoGQbuRnQbIHn7dUH6?=
 =?iso-8859-1?Q?3sDtbXCnKnhkDxRM55uTMriwP9jaIiMBbjaADmxpZik1hYuayhwh8ilJ7A?=
 =?iso-8859-1?Q?1Kfr1/5K7G1Vy8zg7vH6+uHVfKmBHvzkmpHcIUjsv/N0YJEACjESj3wLu9?=
 =?iso-8859-1?Q?q7PK+35cFZe2Ej2hj029A5mdT4q2VNpxJwl2LTnAQHTJoOqA6N6YAfjAXG?=
 =?iso-8859-1?Q?7yxNdtaC1GwuCQGn8xWZTQZlkvp4LgFRYwOv2D9lLcNbWQwCUIALNYCxLF?=
 =?iso-8859-1?Q?K0GfK0ACgVLnQjJTzRSkYcGGjixCe3KYK9UAUXuIEPaY1rMqn/dwvD6DzM?=
 =?iso-8859-1?Q?M//LoboI1lJ5NNSBINiSi3PyTORajwBJbjiHPr4Y1pwpeAjqchKtTSipPR?=
 =?iso-8859-1?Q?4uX7ApV5w62oyFWJf9OdnRSP8V7Il+kGonx5+BshjhPqDuYyk4v4vnIaBA?=
 =?iso-8859-1?Q?vg8l0tNEto1RZbuwyGbmdMGfzpyRVqV869?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99fd5e7a-bf84-4dbf-f290-08ddb55293ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 08:14:02.5805 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +FDjOHmZYppVI/KPdjFDHt+xjfX0CAqwUtHESLIBuibMTf8NhI4YaTibGEE7+Ezc7MoQZd+ZayCbD3NK6bYrMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7019
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

Hi Matt,
>=20
> Hi Matt and Rodrigo,
>=20
> > On Wed, Jun 25, 2025 at 03:28:05PM +0530, Nitin Gote wrote:
> > > Add the DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY device
> query
> > flag
> > > which indicates whether a device supports DIS_NULL_QUERY (Disable
> > > null anyhit shader query mechanism). The intent is for UMDs to use
> > > this query and opt-in DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY flag to
> > > disable null query mechanism for anyhit shader by setting
> > > DIS_NULL_QUERY bit of RT_CTRL register for Xe2.
> > >
> > > v2:
> > >    - Use xe_rtp_match_first_render_or_compute() api to check
> > >      render_or_compute. (Tejas)
> > >    - Validate args->flags (Tejas/Matthew)
> > >    - Add proper kernel-doc for both
> DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY
> > >      and DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT. (Matthew)
> >
> > Matt asked for full spelling of DISABLE, no?!
>=20
> Thank you for clarifying the uAPI naming convention.
> I will update it.
>=20
> >
> > Also, where are the UMD patches/merge-requests for this? And their ack?
> >
> From the Mesa team (Palli, Tapani) is going to send the corresponding Mes=
a
> patch.
> Meanwhile, I floated this patch.
>=20
> > Thanks,
> > Rodrigo.
> >
> > >
> > > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_exec_queue.c | 11 ++++++++++-
> > >  drivers/gpu/drm/xe/xe_query.c      |  3 ++-
> > >  include/uapi/drm/xe_drm.h          | 12 ++++++++++++
> > >  3 files changed, 24 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index fee22358cc09..ef8b49d2242a 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -26,6 +26,9 @@
> > >  #include "xe_trace.h"
> > >  #include "xe_vm.h"
> > >  #include "xe_pxp.h"
> > > +#include "xe_gt_mcr.h"
> > > +#include "regs/xe_gt_regs.h"
> > > +#include "xe_rtp.h"
> > >
> > >  enum xe_exec_queue_sched_prop {
> > >  	XE_EXEC_QUEUE_JOB_TIMEOUT =3D 0,
> > > @@ -597,7 +600,8 @@ int xe_exec_queue_create_ioctl(struct drm_device
> > *dev, void *data,
> > >  	u32 len;
> > >  	int err;
> > >
> > > -	if (XE_IOCTL_DBG(xe, args->flags &
> > ~DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT) ||
> > > +	if (XE_IOCTL_DBG(xe, args->flags &
> > > +	    ~(DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT |
> > > +DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY)) ||
> > >  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> > >  		return -EINVAL;
> > >
> > > @@ -693,6 +697,11 @@ int xe_exec_queue_create_ioctl(struct
> > > drm_device
> > *dev, void *data,
> > >  		}
> > >  	}
> > >
> > > +	if (((GRAPHICS_VER(xe) >=3D 20) && (GRAPHICS_VER(xe) < 30)) &&
> > > +	    (args->flags & DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY) &&
> > > +	    xe_rtp_match_first_render_or_compute(q->gt, q->hwe))
> > > +		xe_gt_mcr_multicast_write(q->gt, RT_CTRL, DIS_NULL_QUERY);
> > > +
>=20
> Also, as per Matt's suggestion in rev1, I'm exploring the WA BB program t=
o set
> this.
>=20

If we move this implementation from the=A0exec queue creation time to the=
=A0submission time and write=20
a WW BB program, then this register will be set for every exec queue submis=
sion.=20
Let's say if submission happens 3 times, then register gets written 3 times=
, which seems unnecessary.

So, having implementation in the=A0exec queue create time, the=A0register w=
ill be updated only once,=20
and we can disable it in the=A0exec queue destroy.

What do=A0you think? Could you please suggest?

Thanks,
Nitin

> > >  	q->xef =3D xe_file_get(xef);
> > >
> > >  	/* user id alloc must always be last in ioctl to prevent UAF */
> > > diff --git a/drivers/gpu/drm/xe/xe_query.c
> > > b/drivers/gpu/drm/xe/xe_query.c index e8e1743dcb1e..c5002b8c9ac0
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_query.c
> > > +++ b/drivers/gpu/drm/xe/xe_query.c
> > > @@ -344,7 +344,8 @@ static int query_config(struct xe_device *xe,
> > > struct
> > drm_xe_device_query *query)
> > >  		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=3D
> > >
> > 	DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR;
> > >  	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=3D
> > > -			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
> > > +			(DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY
> > |
> > > +
> > 	DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY);
> > >  	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =3D
> > >  		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K :
> > SZ_4K;
> > >  	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] =3D xe->info.va_bits; dif=
f
> > > --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h index
> > > 8e8bbdec8c5c..7c30e707346c 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -397,6 +397,8 @@ struct drm_xe_query_mem_regions {
> > >   *      has low latency hint support
> > >   *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - Flag is
> > set if the
> > >   *      device has CPU address mirroring support
> > > + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY - Flag is set
> if
> > the
> > > + *      device has null query support for anyhit shader.
> > >   *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory
> > alignment
> > >   *    required by this device, typically SZ_4K or SZ_64K
> > >   *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual
> > > address @@ -415,6 +417,7 @@ struct drm_xe_query_config {
> > >  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> > >  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 <<
> > 1)
> > >  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
> > 	(1 << 2)
> > > +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY	(1 <<
> > 3)
> > >  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
> > >  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
> > >  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> > > @@ -1270,7 +1273,16 @@ struct drm_xe_exec_queue_create {
> > >  	/** @vm_id: VM to use for this exec queue */
> > >  	__u32 vm_id;
> > >
> > > +	/** DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY - \
> > > +	 *	Flag is set if the device has low latency hint support
> > > +	 */
> > >  #define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
> > > +
> > > +	/** DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY - \
> > > +	 *	flag is use to disable null query check for Anyhit shader
> > > +	 */
> > > +#define DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY	(1 << 1)
> > > +
> > >  	/** @flags: flags to use for this exec queue */
> > >  	__u32 flags;
> > >
> > > --
> > > 2.25.1
> > >
