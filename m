Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745A2C02194
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 15:16:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B80C10E88B;
	Thu,  6 Feb 2025 15:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bQ8V7rPw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC1310E88B
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 15:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738855010; x=1770391010;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xd4bBW6p/hIdJR6cz4F/e7ygyoAHer31806kimts1Kg=;
 b=bQ8V7rPwwSb0oJ90yHewIEewOxLN+xY/nji69oNBKqrBsEogkB/wKl9t
 +R8m7Ux5hQIXIb3kXaweJbELWua3O5GkrWBSObCsCmZkPaU77HK8ebWIM
 NMczIS0u/0eJaQsBQsvQWNgziD1FMDs7xOugTEichKjg2CzXOs3xxvs8U
 PBisQo1Y8tqm26/t4KqDxZe+YyQ+UmEt+yRgrJ+yyzg9HKXxVhAA47QPw
 svrEMwChDoQPsNJ+AWNea7iWkMAzpDcv+Hhx5bB+DDV6SBsedZIyhlQPa
 xguHzPifDnx1nRmFHL6TVA9p+8fM23P7PcER8RnMZ2/HpSSd7dWjpRuqs g==;
X-CSE-ConnectionGUID: khgtN4YcS/uneVMvl2jA/Q==
X-CSE-MsgGUID: HG3YyGTXQOOPAa3TY68f2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43220420"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="43220420"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 07:16:44 -0800
X-CSE-ConnectionGUID: biKOLz8bSmyeU3rOEjZsHw==
X-CSE-MsgGUID: DrexHSZ2RNaLKo2s49gy1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134473512"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 07:16:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 07:16:41 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 07:16:41 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 07:16:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pi8wuhsl5fVSkDeP19uhXlwlnc1LCRax3lYIuWM4z3ztGLU+c1qTXfW7bHGW124vWNMPcXvac1PW5jvcDUHtbqB4smKksTiOGSYrM6o25Z0xeiKSOkgA6/ZAjTwuoxhssW2GbILL6VqhvEZNx3oeQrGne8mgOUbbgwiZq0SblAajmxpWs+fjbsR9C4jvOokI9vAwNFgalLI4KU4+aKsuediADoHVXOhbA6nu63LGDSX8lTpUIH1MC1y/q3Ya0qGnRZhGai+5qBJ3K6GL5hXLszMPEGW/Dzdo+6kvkFTERZET2FZlVPcF3K1JazzPiDrxYfjROpORMKhbxOMfOkfY0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Xczvlq52mjTFourWS/th/5eZ44Fqx54/aXoGEQjTZM=;
 b=l0sqkEgt3oQIEKNxAHRdLX6H8dGfQd2e/FCQGvU/A2Glpr++5iqBPLnTazFFpRYT1rO4eqPRPHqKI+JJ5lwOHKZF7KITdalK2+Lx2fHAZUqSvR6VXNgUEapL+sa7wc7xemKYq+eUQMKbYJ67GpUKwu6Ip0uoIWeLcfuAeY7PGyHuWADe4N6jsBDt0MN18OxSB9dYce6cSn36CS9tk+Q1aRXAf3qmOivxKqcltusmX2ThT1GoGAOb3G/zj97IdmNtMqnwmFLQ7h+6lJmf92zTcapH81ZqTm3aKtGxlUbVsv1G6LODljBkEwh3lZ65GKCRrInpM18dNVHfxLLdkZSjZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4728.namprd11.prod.outlook.com (2603:10b6:208:261::17)
 by MN0PR11MB6254.namprd11.prod.outlook.com (2603:10b6:208:3c5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 15:16:36 +0000
Received: from MN2PR11MB4728.namprd11.prod.outlook.com
 ([fe80::2fe8:64e:97a1:b4bf]) by MN2PR11MB4728.namprd11.prod.outlook.com
 ([fe80::2fe8:64e:97a1:b4bf%7]) with mapi id 15.20.8398.021; Thu, 6 Feb 2025
 15:16:36 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/3] drm/xe: Clear scratch page before vm_bind
Thread-Topic: [PATCH 2/3] drm/xe: Clear scratch page before vm_bind
Thread-Index: AQHbdzMO4B85sF8PdEmWQYm9uJyi97M6FxcAgABOObA=
Date: Thu, 6 Feb 2025 15:16:36 +0000
Message-ID: <MN2PR11MB47286694E479DE45E24C93F892F62@MN2PR11MB4728.namprd11.prod.outlook.com>
References: <20250204184558.4181478-1-oak.zeng@intel.com>
 <20250204184558.4181478-2-oak.zeng@intel.com>
 <Z6SQSHJQL+M8FvA2@lstrano-desk.jf.intel.com>
In-Reply-To: <Z6SQSHJQL+M8FvA2@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4728:EE_|MN0PR11MB6254:EE_
x-ms-office365-filtering-correlation-id: bf68bda7-08c2-40fe-289e-08dd46c13f70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?brd5qXoraqwYKQEP/eeiORwaeDM84qd+QFc+EITrE7zmDnKtlqvtyvfhf7Ys?=
 =?us-ascii?Q?qhSLm0MtI+rXST2olEfLANG4D7OVH5QMA9E0Puhz/TBVXO8u1EByKYKTSI0M?=
 =?us-ascii?Q?2F8SmUaJspDgSkj2+R3VRtDMECZVxuXGu5u2SJjd93I7wBpN5B665TCIzJwh?=
 =?us-ascii?Q?7ztAKISUiVLtbLFXtQsAnIlAPs/RndtGVZT90J4qzKY7qbv+84QO/HNReb9b?=
 =?us-ascii?Q?hJQWAcmSl0P8IE5ige21Ypw/L3WCI3pKJvf259vrEZIhhBW/SyDVWuSOcuGf?=
 =?us-ascii?Q?oH4t06VaomDFLSq8rBUM6SLAwMPKOZJlJ4NC1WHkdUsvhMCejBwzlqI3z3HL?=
 =?us-ascii?Q?knpwyvOierHxklHTpqnDyVB3CpgzR4rULRbQ2D4CljXnSuMS+rKzSlsrVqUU?=
 =?us-ascii?Q?WdDyREJq+JqcbVOarTcBf3reRA02OEK/Fud0FT7a3sRcrvIMrs/RXDc0MWPx?=
 =?us-ascii?Q?xd4y8zgImWXKIb7V4hgzMvlqjpEJ37PpZ2tABpgfsCCrXFQCcvowYGzQPymf?=
 =?us-ascii?Q?Ieucq4oz2lDZ08uHdKFiE20ajIs54bx7JYvd04BQjbKgAwcJEtg2LlKo9lZ8?=
 =?us-ascii?Q?LAKanWyPlNZV6hVP5fPuG02kol4nwfFHcxxP159ezxHiMlAwOTAa1ezqYt2e?=
 =?us-ascii?Q?vBuLYv0RlYeqCv0gHHVNeNBeHdzL4DeaY1FpAkxcSK8P6m1OZAJncJuGGUJB?=
 =?us-ascii?Q?GBSsyY3n/mNF252n4BknFXBIY3FbAn4spO1jwCcMro+k7V2XdNFY2mu+eV7h?=
 =?us-ascii?Q?Abv1hvAXYdaQ1N/sCKNocSV+KVL8Lm6TF0B7q2pQbxatlz0WG9M/tUwQWFGe?=
 =?us-ascii?Q?rT0S+TvwsZM9r/RFsLDKGDzaf92gVQNyuejEtGrZv16Rp0O2nsJqrwI15Mhk?=
 =?us-ascii?Q?PHGbwdHWY2P+iQ9fJAVeEEupx+k74se+bZG4FEz9gP0eQhtkfu9wGHnbg3r9?=
 =?us-ascii?Q?v7AuoVycZSp5N9jfFCh4bBIGD7mekRJxL9jOxCVaTxLwmdDioSIs3IaoJ+t4?=
 =?us-ascii?Q?ysIKLDio8oHTVZdCbAtK+NozbtwAZlsvVHPk9bJIYQqjcls2jy6h0bYl9oSS?=
 =?us-ascii?Q?tbwWGNFnKBjzySrvVa8g8IYOZ9oQJkDmmojCnWjkkbOX6MCPaPNdvYbvCScx?=
 =?us-ascii?Q?ABtJt+v1lMvt4NRdKd4dGnLyKu0WP5EZc4+heC41dkRscDkr+newctl7sX34?=
 =?us-ascii?Q?FrZHNzAMO9ChR/4b2PY6SrHKZg5guPUtKpCCmxnFVv+S0vF/xzmXzSYCIdYf?=
 =?us-ascii?Q?Z4JXrbgpoYDl+CgBgNM3dxgKizH0oqho6kcLiZGld4lnG0c6u+De6IDi3Iuk?=
 =?us-ascii?Q?Gzkb8S62N1WND1vhaBHlsNgOi0ynaRNDIS0DaY2puoXDyOylSKkqSZlNbIj2?=
 =?us-ascii?Q?/Rs1CDtzlcqDUCoxpdPRhcyeinYh3znUzEefTypzGnEQL3fXYONnvB0GJ1y8?=
 =?us-ascii?Q?KJ/IVElU7krzhPXZuErOnU2HZDqzHyMA?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4728.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?phTrfMRiHzXaFP07VHxTEH3e0hnEqTfJt2jIMZygRJFUtF+53h7LwwCxeUgF?=
 =?us-ascii?Q?hwj3P7gm8HCzlgJ4e/p+phctQhlfqThEamoVAKJu2tsP5FPzSB4gRKZi6Y8J?=
 =?us-ascii?Q?zQp79phEZbhAUjGngiYFKff/V5jBz7vn4HX0JI2LNTbw6rpoXibAYJ44a7Sq?=
 =?us-ascii?Q?MxRKr0SKSCtIMU7gQJwoZpHWNASY6ux2PTlN//ZiKMKmCDuqkthDIh3PHzNX?=
 =?us-ascii?Q?PgufoQnNGUBNDMjD/EA9UU8kwCNj5HZhPxGO9AjpFxpHNfL/9HL3aadqYIom?=
 =?us-ascii?Q?Z/tzePnStX66ss5P9E9X6xCXMwVzHZB+28qbY414OaB6d5sRDeQhbRROqzuK?=
 =?us-ascii?Q?Vt8OC3jyLUYXR//Ofsuq/GSlGmoPKb1IW8BA1GzAii7SG57m0NGCpkwyPF7l?=
 =?us-ascii?Q?5486akOU4rcq3iO2sE9Vtlz8zWNNgsyHU+/7wuEB3F5KGRofM0gmKM0dk+CV?=
 =?us-ascii?Q?9DaElXLwOkNJDlLxyJfdBELhqAV1l+J968qp2cpdV0dt6vRt5UvGK4HYzuf3?=
 =?us-ascii?Q?pdKC/s5pUA0+UkcpZF5llUi4zsJ5KfiOMRjc5K8OG3BluFz+fhF4Jmw05/yn?=
 =?us-ascii?Q?MCkSymX7H27evsOPU7MR1d5Q6AWew/z39swM9GyISg3ONIiiMMtbYz9lzKiK?=
 =?us-ascii?Q?nx3MQjaVorpj/FaAIABfl2WEragxDF9uqhFvKHIz6TdNiB/7xPTAk9ibXFnx?=
 =?us-ascii?Q?f+gfl6mRZVC8IcR56O2bKt66EIekr7m2EUE6sWcavZlU3gSbZ6W2EljyIYVq?=
 =?us-ascii?Q?ZHmW1VNH+VBusRgkBA/xrSr2KESPSbbxxeEKlgDR0DG8/pZbTdtBeCmXXFam?=
 =?us-ascii?Q?3Z6yp0cOeuE/ICBQCn7Ad0VmNG/NnNVUQnqmVn9vPI7VZreDnXxwdYIpYKFR?=
 =?us-ascii?Q?VrntRjpqkiHs0XvZCEdREFMks3Fadfi6OZe6PfAei5f35UXc5mBjiCCY5Cku?=
 =?us-ascii?Q?yLQjOc2pDgJb7SoD93EN65u/jZkGTR7EU8JGGj1qqNUOeUeYmLLJGALa3s0x?=
 =?us-ascii?Q?+/C0ymv1tKPNySDtzqMVqYlncvltuQOO43V3vFAEZBHp+WApmk31+wT7AmBm?=
 =?us-ascii?Q?dkdBrH4yoE+LRe6ozZ9SUS12xI4/MY4aklvaMXEvNxk6H56b1xY62HTR3Sha?=
 =?us-ascii?Q?LVII/jGCYznVx5Hx2sa7ZKnlsxXzmg1TdgXqwYP2cm4qiZTznCBhVaNoPnXD?=
 =?us-ascii?Q?Jv8+H5AaA9zO7e4fH4DWl5NuBiBv43cSU+HAbMgMrSnKgY3EWk8U2dBvzp0U?=
 =?us-ascii?Q?yVZPcGonKKMTQUV8MeXsyL49GsMDELiJIx1/LIw58JRSkWji8JgjOtMlIYXQ?=
 =?us-ascii?Q?/U5aYNUwVSm/zTm0GxHhciHLReT3DPGlZ/7sDoqJCh8gHV9miJv6oDgtiGQ+?=
 =?us-ascii?Q?8Lq336tK1+6bm6ivD4Cq0Kmw+/4Jd6ibPTS81WIZYD/G67xjxs/fji4fHE1V?=
 =?us-ascii?Q?/hAoxCmK4aOMrYwQzNEGMPRCLW0O2VsWuagsn90s+n9JmHwbhoIBaWzMT7u1?=
 =?us-ascii?Q?xMMYnzzzR1dp2lVMvy6PFVLzy286fpBv+yGgZ4WhJSjXTwKSYF8xfnOjJG/n?=
 =?us-ascii?Q?PvuPIsPLCoKaOdMj3HI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4728.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf68bda7-08c2-40fe-289e-08dd46c13f70
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 15:16:36.2817 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tmSjev0I2dvtnx9YfaofNpCveIjsGEjPDLyvNiDPBBFzl5luHd7dRutSSzqmbGQbQm7gBFrZziitog2TljFvww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6254
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



> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: February 6, 2025 5:35 AM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org;
> Thomas.Hellstrom@linux.intel.com; Cavitt, Jonathan
> <jonathan.cavitt@intel.com>
> Subject: Re: [PATCH 2/3] drm/xe: Clear scratch page before vm_bind
>=20
> On Tue, Feb 04, 2025 at 01:45:57PM -0500, Oak Zeng wrote:
> > When a vm runs under fault mode, if scratch page is enabled, we
> need
> > to clear the scratch page mapping before vm_bind for the vm_bind
> > address range. Under fault mode, we depend on recoverable page
> fault
> > to establish mapping in page table. If scratch page is not cleared,
> > GPU access of address won't cause page fault because it always hits
> > the existing scratch page mapping.
> >
> > When vm_bind with IMMEDIATE flag, there is no need of clearing as
> > immediate bind can overwrite the scratch page mapping.
> >
> > So far only is xe2 and xe3 products are allowed to enable scratch
> page
> > under fault mode. On other platform we don't allow scratch page
> under
> > fault mode, so no need of such clearing.
> >
> > v2: Rework vm_bind pipeline to clear scratch page mapping. This is
> similar
> > to a map operation, with the exception that PTEs are cleared
> instead of
> > pointing to valid physical pages. (Matt, Thomas)
> >
> > TLB invalidation is needed after clear scratch page mapping as larger
> > scratch page mapping could be backed by physical page and cached
> in
> > TLB. (Matt, Thomas)
> >
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
>=20
> Given the complexity of the VM bind path, I think we need an IGT
> posted
> with this series before merging as I suggested in v1. Without it, it
> will be fairly difficult to ensure correctness by reviews only.

I did have an igt posted in patch 3 of this series.

The reason I posted on patch 3 is, without patch 3 this "feature"
Is not enabled.=20

Oak

>=20
> Matt
>=20
> > ---
> >  drivers/gpu/drm/xe/xe_pt.c       | 66 ++++++++++++++++++++++--
> --------
> >  drivers/gpu/drm/xe/xe_pt_types.h |  2 +
> >  drivers/gpu/drm/xe/xe_vm.c       | 29 ++++++++++++--
> >  drivers/gpu/drm/xe/xe_vm_types.h |  2 +
> >  4 files changed, 75 insertions(+), 24 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> b/drivers/gpu/drm/xe/xe_pt.c
> > index 1ddcc7e79a93..3fd0ae2dbe7d 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -268,6 +268,8 @@ struct xe_pt_stage_bind_walk {
> >  	 * granularity.
> >  	 */
> >  	bool needs_64K;
> > +	/* @clear_pt: clear page table entries during the bind walk */
> > +	bool clear_pt;
> >  	/**
> >  	 * @vma: VMA being mapped
> >  	 */
> > @@ -497,21 +499,25 @@ xe_pt_stage_bind_entry(struct xe_ptw
> *parent, pgoff_t offset,
> >
> >  		XE_WARN_ON(xe_walk->va_curs_start !=3D addr);
> >
> > -		pte =3D vm->pt_ops->pte_encode_vma(is_null ? 0 :
> > -						 xe_res_dma(curs) +
> xe_walk->dma_offset,
> > -						 xe_walk->vma,
> pat_index, level);
> > -		pte |=3D xe_walk->default_pte;
> > +		if (xe_walk->clear_pt) {
> > +			pte =3D 0;
> > +		} else {
> > +			pte =3D vm->pt_ops->pte_encode_vma(is_null ?
> 0 :
> > +					xe_res_dma(curs) + xe_walk-
> >dma_offset,
> > +					xe_walk->vma, pat_index,
> level);
> > +			pte |=3D xe_walk->default_pte;
> >
> > -		/*
> > -		 * Set the XE_PTE_PS64 hint if possible, otherwise if
> > -		 * this device *requires* 64K PTE size for VRAM, fail.
> > -		 */
> > -		if (level =3D=3D 0 && !xe_parent->is_compact) {
> > -			if (xe_pt_is_pte_ps64K(addr, next, xe_walk))
> {
> > -				xe_walk->vma->gpuva.flags |=3D
> XE_VMA_PTE_64K;
> > -				pte |=3D XE_PTE_PS64;
> > -			} else if (XE_WARN_ON(xe_walk-
> >needs_64K)) {
> > -				return -EINVAL;
> > +			/*
> > +			 * Set the XE_PTE_PS64 hint if possible,
> otherwise if
> > +			 * this device *requires* 64K PTE size for
> VRAM, fail.
> > +			 */
> > +			if (level =3D=3D 0 && !xe_parent->is_compact) {
> > +				if (xe_pt_is_pte_ps64K(addr, next,
> xe_walk)) {
> > +					xe_walk->vma->gpuva.flags
> |=3D XE_VMA_PTE_64K;
> > +					pte |=3D XE_PTE_PS64;
> > +				} else if (XE_WARN_ON(xe_walk-
> >needs_64K)) {
> > +					return -EINVAL;
> > +				}
> >  			}
> >  		}
> >
> > @@ -519,7 +525,7 @@ xe_pt_stage_bind_entry(struct xe_ptw
> *parent, pgoff_t offset,
> >  		if (unlikely(ret))
> >  			return ret;
> >
> > -		if (!is_null)
> > +		if (!is_null && !xe_walk->clear_pt)
> >  			xe_res_next(curs, next - addr);
> >  		xe_walk->va_curs_start =3D next;
> >  		xe_walk->vma->gpuva.flags |=3D (XE_VMA_PTE_4K <<
> level);
> > @@ -589,6 +595,7 @@ static const struct xe_pt_walk_ops
> xe_pt_stage_bind_ops =3D {
> >   * @vma: The vma indicating the address range.
> >   * @entries: Storage for the update entries used for connecting the
> tree to
> >   * the main tree at commit time.
> > + * @clear_pt: Clear the page table entries.
> >   * @num_entries: On output contains the number of @entries
> used.
> >   *
> >   * This function builds a disconnected page-table tree for a given
> address
> > @@ -602,7 +609,8 @@ static const struct xe_pt_walk_ops
> xe_pt_stage_bind_ops =3D {
> >   */
> >  static int
> >  xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> > -		 struct xe_vm_pgtable_update *entries, u32
> *num_entries)
> > +		 struct xe_vm_pgtable_update *entries,
> > +		 bool clear_pt, u32 *num_entries)
> >  {
> >  	struct xe_device *xe =3D tile_to_xe(tile);
> >  	struct xe_bo *bo =3D xe_vma_bo(vma);
> > @@ -622,10 +630,19 @@ xe_pt_stage_bind(struct xe_tile *tile,
> struct xe_vma *vma,
> >  		.vma =3D vma,
> >  		.wupd.entries =3D entries,
> >  		.needs_64K =3D (xe_vma_vm(vma)->flags &
> XE_VM_FLAG_64K) && is_devmem,
> > +		.clear_pt =3D clear_pt,
> >  	};
> >  	struct xe_pt *pt =3D xe_vma_vm(vma)->pt_root[tile->id];
> >  	int ret;
> >
> > +	if (clear_pt) {
> > +		ret =3D xe_pt_walk_range(&pt->base, pt->level,
> xe_vma_start(vma),
> > +				       xe_vma_end(vma),
> &xe_walk.base);
> > +
> > +		*num_entries =3D xe_walk.wupd.num_used_entries;
> > +		return ret;
> > +	}
> > +
> >  	/**
> >  	 * Default atomic expectations for different allocation
> scenarios are as follows:
> >  	 *
> > @@ -981,12 +998,14 @@ static void xe_pt_free_bind(struct
> xe_vm_pgtable_update *entries,
> >
> >  static int
> >  xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
> > -		   struct xe_vm_pgtable_update *entries, u32
> *num_entries)
> > +		   struct xe_vm_pgtable_update *entries,
> > +		   bool invalidate_on_bind, u32 *num_entries)
> >  {
> >  	int err;
> >
> >  	*num_entries =3D 0;
> > -	err =3D xe_pt_stage_bind(tile, vma, entries, num_entries);
> > +	err =3D xe_pt_stage_bind(tile, vma, entries, invalidate_on_bind,
> > +			       num_entries);
> >  	if (!err)
> >  		xe_tile_assert(tile, *num_entries);
> >
> > @@ -1661,6 +1680,7 @@ static int bind_op_prepare(struct xe_vm
> *vm, struct xe_tile *tile,
> >  		return err;
> >
> >  	err =3D xe_pt_prepare_bind(tile, vma, pt_op->entries,
> > +				 pt_update_ops->invalidate_on_bind,
> >  				 &pt_op->num_entries);
> >  	if (!err) {
> >  		xe_tile_assert(tile, pt_op->num_entries <=3D
> > @@ -1685,7 +1705,7 @@ static int bind_op_prepare(struct xe_vm
> *vm, struct xe_tile *tile,
> >  		 * it needs to be done here.
> >  		 */
> >  		if ((!pt_op->rebind && xe_vm_has_scratch(vm) &&
> > -		     xe_vm_in_preempt_fence_mode(vm)))
> > +		     xe_vm_in_preempt_fence_mode(vm)) ||
> pt_update_ops->invalidate_on_bind)
> >  			pt_update_ops->needs_invalidation =3D true;
> >  		else if (pt_op->rebind && !xe_vm_in_lr_mode(vm))
> >  			/* We bump also if batch_invalidate_tlb is
> true */
> > @@ -1759,9 +1779,13 @@ static int op_prepare(struct xe_vm *vm,
> >
> >  	switch (op->base.op) {
> >  	case DRM_GPUVA_OP_MAP:
> > -		if (!op->map.immediate &&
> xe_vm_in_fault_mode(vm))
> > +		if (!op->map.immediate &&
> xe_vm_in_fault_mode(vm) &&
> > +		    !op->map.invalidate_on_bind)
> >  			break;
> >
> > +		if (op->map.invalidate_on_bind)
> > +			pt_update_ops->invalidate_on_bind =3D true;
> > +
> >  		err =3D bind_op_prepare(vm, tile, pt_update_ops, op-
> >map.vma);
> >  		pt_update_ops->wait_vm_kernel =3D true;
> >  		break;
> > @@ -1871,6 +1895,8 @@ static void bind_op_commit(struct xe_vm
> *vm, struct xe_tile *tile,
> >  	}
> >  	vma->tile_present |=3D BIT(tile->id);
> >  	vma->tile_staged &=3D ~BIT(tile->id);
> > +	if (pt_update_ops->invalidate_on_bind)
> > +		vma->tile_invalidated |=3D BIT(tile->id);
> >  	if (xe_vma_is_userptr(vma)) {
> >  		lockdep_assert_held_read(&vm-
> >userptr.notifier_lock);
> >  		to_userptr_vma(vma)->userptr.initial_bind =3D true;
> > diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> b/drivers/gpu/drm/xe/xe_pt_types.h
> > index 384cc04de719..3d0aa2a5102e 100644
> > --- a/drivers/gpu/drm/xe/xe_pt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> > @@ -108,6 +108,8 @@ struct xe_vm_pgtable_update_ops {
> >  	bool needs_userptr_lock;
> >  	/** @needs_invalidation: Needs invalidation */
> >  	bool needs_invalidation;
> > +	/** @invalidate_on_bind: Invalidate the range before bind */
> > +	bool invalidate_on_bind;
> >  	/**
> >  	 * @wait_vm_bookkeep: PT operations need to wait until VM
> is idle
> >  	 * (bookkeep dma-resv slots are idle) and stage all future VM
> activity
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> b/drivers/gpu/drm/xe/xe_vm.c
> > index d664f2e418b2..813d893d9b63 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1921,6 +1921,23 @@ static void print_op(struct xe_device *xe,
> struct drm_gpuva_op *op)
> >  }
> >  #endif
> >
> > +static bool __xe_vm_needs_clear_scratch_pages(struct xe_vm
> *vm, u32 bind_flags)
> > +{
> > +	if (!xe_vm_in_fault_mode(vm))
> > +		return false;
> > +
> > +	if (!NEEDS_SCRATCH(vm->xe))
> > +		return false;
> > +
> > +	if (!xe_vm_has_scratch(vm))
> > +		return false;
> > +
> > +	if (bind_flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE)
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> >  /*
> >   * Create operations list from IOCTL arguments, setup operations
> fields so parse
> >   * and commit steps are decoupled from IOCTL arguments. This
> step can fail.
> > @@ -1991,6 +2008,8 @@ vm_bind_ioctl_ops_create(struct xe_vm
> *vm, struct xe_bo *bo,
> >  			op->map.is_null =3D flags &
> DRM_XE_VM_BIND_FLAG_NULL;
> >  			op->map.dumpable =3D flags &
> DRM_XE_VM_BIND_FLAG_DUMPABLE;
> >  			op->map.pat_index =3D pat_index;
> > +			op->map.invalidate_on_bind =3D
> > +
> 	__xe_vm_needs_clear_scratch_pages(vm, flags);
> >  		} else if (__op->op =3D=3D DRM_GPUVA_OP_PREFETCH) {
> >  			op->prefetch.region =3D prefetch_region;
> >  		}
> > @@ -2188,7 +2207,8 @@ static int vm_bind_ioctl_ops_parse(struct
> xe_vm *vm, struct drm_gpuva_ops *ops,
> >  				return PTR_ERR(vma);
> >
> >  			op->map.vma =3D vma;
> > -			if (op->map.immediate
> || !xe_vm_in_fault_mode(vm))
> > +			if (op->map.immediate
> || !xe_vm_in_fault_mode(vm) ||
> > +			    op->map.invalidate_on_bind)
> >
> 	xe_vma_ops_incr_pt_update_ops(vops,
> >  							      op-
> >tile_mask);
> >  			break;
> > @@ -2416,9 +2436,10 @@ static int op_lock_and_prep(struct
> drm_exec *exec, struct xe_vm *vm,
> >
> >  	switch (op->base.op) {
> >  	case DRM_GPUVA_OP_MAP:
> > -		err =3D vma_lock_and_validate(exec, op->map.vma,
> > -					    !xe_vm_in_fault_mode(vm)
> ||
> > -					    op->map.immediate);
> > +		if (!op->map.invalidate_on_bind)
> > +			err =3D vma_lock_and_validate(exec, op-
> >map.vma,
> > +
> 	    !xe_vm_in_fault_mode(vm) ||
> > +						    op-
> >map.immediate);
> >  		break;
> >  	case DRM_GPUVA_OP_REMAP:
> >  		err =3D check_ufence(gpuva_to_vma(op-
> >base.remap.unmap->va));
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 52467b9b5348..dace04f4ea5e 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -297,6 +297,8 @@ struct xe_vma_op_map {
> >  	bool is_null;
> >  	/** @dumpable: whether BO is dumped on GPU hang */
> >  	bool dumpable;
> > +	/** @invalidate: invalidate the VMA before bind */
> > +	bool invalidate_on_bind;
> >  	/** @pat_index: The pat index to use for this operation. */
> >  	u16 pat_index;
> >  };
> > --
> > 2.26.3
> >
