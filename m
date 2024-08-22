Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDFDC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 15:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE8C10EB41;
	Thu, 22 Aug 2024 15:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iOsoEXDd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5747110EB41
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Aug 2024 15:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724341653; x=1755877653;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5L0IPs/o8J/4cURo9ZEwUDc5/sO+Gly1ih4cZ15Vz4E=;
 b=iOsoEXDduRckqx5+d7gdZtTEFCGW+UaljFL99NBEeDmxNdn+E+EyDPk/
 zamuT+XVNM1pr2ZjrgDlE+ydgmb/El4RjQ/8Ncy3tq6PrH4d1Cf0TVuRM
 EppmZuVd2chqOLef3ItGVnirrIIvvbmcITA2NCr8oiCUkkcMomtJCQSJ2
 mRmmor0fICUk36Dyh+TFN8D5J0gYZMjY5sJoMjaqRoi3kMKJGAwT2KZaz
 eRDXMzo6uw76JUWPkWxZ2M1+Ek5gIbkBe7B+AzKmVuUXyaK06+wnLQNBl
 tyW3Vy2BWdexo7M838b5zLHqj/w/tIWxXhK2NvUMziFW8TW15BqUN8TyC w==;
X-CSE-ConnectionGUID: /EKNpDhWSMS0fxI23R+n3w==
X-CSE-MsgGUID: i5mSxxOCQFuLR2EWp2qHQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22921191"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="22921191"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 08:47:27 -0700
X-CSE-ConnectionGUID: LdL8gNEDSXeDmEqqwWpbnQ==
X-CSE-MsgGUID: KpWA1vSyTSqpTTFOY/K+rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="61201763"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Aug 2024 08:47:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 08:47:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 08:47:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 08:47:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KBkl06DcOURvotx82LOf4PM+hdpbt40uZuA/3jdWLVeUoWno3JGBtMFOpVrZj84PHA3TDYavnnXuPvx/deJBjxwJ00SHEuucGKa6NnKbASrFrrtmTxWbItZbJlQcH4x32r8DqCbls6RG1d5+laaOvnYhqOAd0NITH6GzQi55wIVWuPBLEYKFY/+GE7+9bGyqk5u9kSgf5uU+6yn6wJrphGE9q/1l1lFnG1TVaF3gXDbHsZ5q39ifa85HOX6Q4h2/Xtz4xQgH9KkNcSaSL8gA7LZim5GkYMYHvbn5gE2HCtXZ8YMjXhjT2wrzD0yCSzevAa/q0uQaz0XbYdKTM7C1nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QD24AKJsq6o7zO41AkV4zeKOxV3bbpiRlVaPKDLs7pw=;
 b=NQBWrnC3mrF5Zfpqd71LdoSjQE+6hC9iT0vbwPwGhQSwakRi1iFlj1XkM6GlS3vUqLob9lnSm55N3YlyicPsKGuW5Naoj4niMhdcfdmxKxcH6Rh1oAFae3o+dFl8bnbMLWVbe/J1u1vqjm0GROlQymzwVhppt7EkERVrvEjaR1h/zMs3riWWhlT0mT/koLgdHJFwXKSaA3HYxICOzc1IABRDxpVEo9mV7OeKzsCjsafY9AOfV3Om7B7fR/YZPt30LByEd5WhAUwtmuu/2uh6GoQLepCZAr7gnJbzztouFg2SqVyzQzK10XawFD5Msy0uiB2UW+KOVHyoQfuf6gKdew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH0PR11MB5831.namprd11.prod.outlook.com (2603:10b6:510:14b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Thu, 22 Aug
 2024 15:47:21 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 15:47:21 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Levi, Ilia" <ilia.levi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Levi, Ilia" <ilia.levi@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, "Elbaz, Koby" <koby.elbaz@intel.com>,
 "Avizrat, Yaron" <yaron.avizrat@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 4/5] drm/xe: memirq handler changes
Thread-Topic: [PATCH 4/5] drm/xe: memirq handler changes
Thread-Index: AQHa9JR6anP0ZY47HE68HYuaRhK41LIzaquA
Date: Thu, 22 Aug 2024 15:47:21 +0000
Message-ID: <CH0PR11MB5444AEB3A513F67F4376850BE58F2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240822130815.1355437-1-ilia.levi@intel.com>
 <20240822130815.1355437-5-ilia.levi@intel.com>
In-Reply-To: <20240822130815.1355437-5-ilia.levi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH0PR11MB5831:EE_
x-ms-office365-filtering-correlation-id: f054c6e7-0500-4ae3-a2f4-08dcc2c1b5a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?rLQXiQatohccsPP7qAfkfCHA+wZ/EfBkm4mZzer2pRClAqm42GOg9lFWBm6i?=
 =?us-ascii?Q?9fGZCd6nYcp0Cox72PHuIxCkgySN5nWln6qnfoENwE8RXyKF06Uu7cPuwF19?=
 =?us-ascii?Q?17t+xZoJs6NsVZcyIHL6quhlv5EAWG73p6WKB6VPVZN/ZCDYM7Rg4IPe36Bw?=
 =?us-ascii?Q?nG/d1X9HcUNTbEJwHI4Scjg76uCBgYbykZV2Ex+NvlSABRq9K5ksFa5PnD70?=
 =?us-ascii?Q?SA/pppEfKu14ZjOdLNC+yk3bsN/OgPddy2ytYV3rZXCVcZnroJF0AmkvwIGD?=
 =?us-ascii?Q?qY0kLuOdE6VAGNYY9dcpqVlljevxBIbT+WNPt0IdN1DtHycjXGCXs0SatBMi?=
 =?us-ascii?Q?63Fni+7DsTfUuqJeT4VJaO7B7nS+/VgQ+RwKANMVNcPUIb2pGf7yVGPw8pLa?=
 =?us-ascii?Q?uui/v1Wmvd7Q2W5KeINUifufcnm3NWfG/QoIR+DNDxkp7SzvPPxUtGXeDv4K?=
 =?us-ascii?Q?hQ+egPt6hlPFKwDB7NIIEzVlJpHntW4Tit735FAAFFcAgHg88I4my+S8+C/v?=
 =?us-ascii?Q?YsRtBHImLevJfWuvOZJO2AzzNeIVtrp20NlmBywMfDv4oCaXrii87yAHvrMH?=
 =?us-ascii?Q?d1ScX0SFYca6nRwJV+yHfbp+YYmE7CkGNVSd3EryEWFcLsYArsVyhPKqpFBA?=
 =?us-ascii?Q?nwOQl4HPNjknUzUAMYAbPKcY7aJt4fTqaQbovSONV302zCrZ8mkZUbV4axa3?=
 =?us-ascii?Q?L4SRkuB4tckbiVE36woFr12eQ2Ju1ya4/WP06xjM6Kpm0hp2oEvglxJ3t+8f?=
 =?us-ascii?Q?XiWPCMsceweo7u3DppjRX59cKLUY3kmYjuFgRdUzZQf2g5J86QS3D1boldXz?=
 =?us-ascii?Q?BDsVyNdek4XLTlzID5qWwxz1J2eQOSe+H3/RRu0F6Ba7bnV1PipYV09Tghso?=
 =?us-ascii?Q?qyD6OM5c/iDX5IEu7nZ4GI71xeQa+0TGpgnb+m3bsPxI8N8DVJ8qKyjpknt/?=
 =?us-ascii?Q?FkkXB2tucQEIbCrbJeR4Q0lkAmiDRCgi7/TjN0g3WP7hrL6VWLpMKZ7uq0SI?=
 =?us-ascii?Q?1DCHGU5wFTJGhs5b5ZwoCg1YCwPsIVVhUouWt+tKfZ3bCfGfr7vFFdvtr5CP?=
 =?us-ascii?Q?3X48A7wpg1CR3Z3oZ0wGlgVO2puqVmG2EtvCP7Ipu5lsMlj1dOO4hLg+X08y?=
 =?us-ascii?Q?MdX77iKDi0+KxQdnj4kW2de1ZAeii1m1McW4qO5OQj274JTxSvSMkY4Uv/8/?=
 =?us-ascii?Q?H72TdG7XJulso8YUj0eGBpJrFpPt7t9blBtxYC/cj845/JHrVmh7etMOKdb3?=
 =?us-ascii?Q?c122ivjnMc/ZQCvp6RCwxxre73D3leSY7YvwgingAk2VXW7a34C5JL/Sollb?=
 =?us-ascii?Q?Cy+F87tufGeoNG0ESDzRGE3YQvPVGScoYWz7FnKwckBtcZmupUcJDpHpwa0g?=
 =?us-ascii?Q?ekxR146C8we/iYsYzS0LEYr8SiBc3gXYziuAEAunSsNK7om9IQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?97zTtK+E07+/5eLbML5MhhItcpNsJ5szXWpZnpWLVUybgc1U3U1AbPZy9GR1?=
 =?us-ascii?Q?5A1ImGdfAal+yJlEr0YZKwiMpU07vzry/2M16+nY+2mPsixuAOqGRwgGumNp?=
 =?us-ascii?Q?oQcwC2lCXiQPdiRneYkYkSojco/tAy2XJHkPpt5bOKJ00SaFdRg56uTW1vj9?=
 =?us-ascii?Q?7BWndymb5OfmbGFT5zZYG6vxU1i9Mghqqu8BlDLPMqPZ5KkzmSPV97/My28r?=
 =?us-ascii?Q?Thu0phDrvMoCaM9bobsZ/vjj7kwFgMJqfPBaaOJ8gE31ZajNq0xAHfTbiK0x?=
 =?us-ascii?Q?nDWkBL0cMrav+r1MKSqfwrQHpaFHkgtfR20JqDwm9uaWB/eDyx9yF9u0Pbzs?=
 =?us-ascii?Q?/7rWdzlld8cYWcpKj8QWK2PBFycKKdO3a/L0uDE+9nYhow2dXFIYe1iZcSKd?=
 =?us-ascii?Q?JbGcXxWBdNQdMsaOmCZTSOpZeW23y44yboXreLw+l+dfp9ioGFoAnxd9cQjh?=
 =?us-ascii?Q?Gn34GHJOOM0UTVjDXTzUMgfL4xxFUYBMLK3KAEqwY2PbxnKrrdKN2J5VPpyZ?=
 =?us-ascii?Q?i/VfFqcxSvLmwSL/BolW0dN3ivgEOSOqpck9E/n6aNqCs06fvNKhCUAkWJtJ?=
 =?us-ascii?Q?i2c3WqAaipBEDsdaDSZBQ2Xa6ckh2ThEjqgGZi1vLZqYna2+LMU0ojj1xj2Z?=
 =?us-ascii?Q?EkvNjkwXoGgwV/Z2P5eQOzc88vb2hhBlDoCQj1uw/KeZAP++XUNOkB5DKVEi?=
 =?us-ascii?Q?8b0hMImUa0OlmPxTGynmn/iSpi691x/R0TyFkCjkRGK72S5FwI6DZhUKTAJc?=
 =?us-ascii?Q?VoGTqjHHIUN7xlX1Ty29W4XzzJYgGPcYbrIySmscuxO3yqboT7ZP9WxvvbLr?=
 =?us-ascii?Q?+eME6jONXHQUO/rmQ/FALlUKAxgBhwAc5efYLOQrzDqPU25lQkMgUi8+RWM4?=
 =?us-ascii?Q?9YtrZxkF8DkHaQCnqcpfQ+lvAyh1ThineuB48WbGPOkQ4iXdTlWJe/nS83fW?=
 =?us-ascii?Q?46dUhEy/KokY+0fpqAAq2q93hbF0wPs/Kj014iCU5GijMSLkGufXjTo1moEZ?=
 =?us-ascii?Q?1QwwmZ7pB9uKOBP/LKYcHl9zUB9UmRQt80RcCJiaB+JJyJkmxPPOYp+zVa9A?=
 =?us-ascii?Q?bwHdvyAJWx8dHPhTYaiSi4DR1ESFxoAFfIRysRNaJbq4RTTUAtEe/VJ9QAb5?=
 =?us-ascii?Q?qDy4YTx3J74eCKQhHySWlSgOMoTiQBjMWZ5gLAqef85aUjhd4fYCGMxvKAxm?=
 =?us-ascii?Q?HW1Z4A3aaGnijNyatJfEGlOZ4FCRPqNA3Igupq+Unp4PDbafMNOlJExBf4H6?=
 =?us-ascii?Q?SoZJX+4Z9KeHxK5vmjxe0jK5wsAdgYfITJsKWIkn2oyf1+lmEfuV7qfq88Nl?=
 =?us-ascii?Q?ud00WS070Wj3a7QxMxv55H8YOcQYfiOeBbKDmVu77EKc+3GtdlOEF+1be+lY?=
 =?us-ascii?Q?hLpmS2Jvyk6QUVtQI+Z6kpNPwgGcbkmx12uUme0VSAp0dKVnYOdHckNtxNct?=
 =?us-ascii?Q?HaVKuebMWrLPPEci0k0fUuM/DGLubrrJwccESl7M0tF8miX3Se75eLDfN4Wz?=
 =?us-ascii?Q?RvMBX7V2nYf5vUu/NkdzohQyqAI8GReAn5Rv/AdMeoy36/Dra3Ag/gtdNFkU?=
 =?us-ascii?Q?siAeKN7V/v0p+Awz8MyGxLoldXE2Z1CcF3PsGZMn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f054c6e7-0500-4ae3-a2f4-08dcc2c1b5a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2024 15:47:21.1465 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f5yKf498nGrwpiGMSOa+CQSnEhPE8TR5LBJ3Q4qclDDk2zUcRIEBmxln2hS2fW8y4pRVfWXhAQ3Lf/g2ODxAlm4T1AtILLfp557sDMomAyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5831
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Ilia L=
evi
Sent: Thursday, August 22, 2024 6:08 AM
To: intel-xe@lists.freedesktop.org
Cc: Levi, Ilia <ilia.levi@intel.com>; Wajdeczko, Michal <Michal.Wajdeczko@i=
ntel.com>; Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>=
; Elbaz, Koby <koby.elbaz@intel.com>; Avizrat, Yaron <yaron.avizrat@intel.c=
om>
Subject: [PATCH 4/5] drm/xe: memirq handler changes
>=20
> This patch exposes an interrupt processing handler for a single hw engine=
.
> This handler also caters for the new "reports to engine instance 0" mode.
> Use this handler from the VF use-case as well.
>=20
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_memirq.c | 31 ++++++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_memirq.h |  1 +
>  2 files changed, 25 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memir=
q.c
> index a1d4bc3f9e42..c388e480b5c8 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -383,6 +383,28 @@ static void memirq_dispatch_guc(struct xe_memirq *me=
mirq, struct iosys_map *stat
>  		xe_guc_irq_handler(guc, GUC_INTR_GUC2HOST);
>  }
> =20
> +/**
> + * xe_memirq_hwe_handler - Check and process interrupts for a specific H=
W engine.
> + * @memirq: the &xe_memirq
> + * @hwe: the hw engine to process
> + *
> + * This function reads and dispatches `Memory Based Interrupts` for the =
provided HW engine.
> + */
> +void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine=
 *hwe)
> +{
> +	u16 offset =3D memirq->reports_to_e0 ? hwe->e0_irq_offset : hwe->irq_of=
fset;
> +	u16 instance =3D memirq->reports_to_e0 ? hwe->instance : 0;
> +
> +	struct iosys_map src_offset =3D IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap=
,
> +							    XE_MEMIRQ_SOURCE_OFFSET(instance));
> +	if (memirq_received(memirq, &src_offset, offset, "SRC")) {
> +		struct iosys_map status_offset =3D
> +			IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
> +					      XE_MEMIRQ_STATUS_OFFSET(instance) + offset * SZ_16);
> +		memirq_dispatch_engine(memirq, &status_offset, hwe);
> +	}
> +}
> +
>  /**
>   * xe_memirq_handler - The `Memory Based Interrupts`_ Handler.
>   * @memirq: the &xe_memirq
> @@ -410,13 +432,8 @@ void xe_memirq_handler(struct xe_memirq *memirq)
>  		if (gt->tile !=3D tile)
>  			continue;
> =20
> -		for_each_hw_engine(hwe, gt, id) {
> -			if (memirq_received(memirq, &memirq->source, hwe->irq_offset, "SRC"))=
 {
> -				map =3D IOSYS_MAP_INIT_OFFSET(&memirq->status,
> -							    hwe->irq_offset * SZ_16);
> -				memirq_dispatch_engine(memirq, &map, hwe);
> -			}
> -		}
> +		for_each_hw_engine(hwe, gt, id)
> +			xe_memirq_hwe_handler(memirq, hwe);
>  	}
> =20
>  	/* GuC and media GuC (if present) must be checked separately */
> diff --git a/drivers/gpu/drm/xe/xe_memirq.h b/drivers/gpu/drm/xe/xe_memir=
q.h
> index 98e2b61ef973..8a9334482a9b 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.h
> +++ b/drivers/gpu/drm/xe/xe_memirq.h
> @@ -20,6 +20,7 @@ u32 xe_memirq_enable_ptr(struct xe_memirq *memirq);
> =20
>  void xe_memirq_reset(struct xe_memirq *memirq);
>  void xe_memirq_postinstall(struct xe_memirq *memirq);
> +void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine=
 *hwe);
>  void xe_memirq_handler(struct xe_memirq *memirq);
> =20
>  int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc);
> --=20
> 2.43.2
>=20
>=20
