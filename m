Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF60CD1283
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 16:25:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C141124CE;
	Thu, 28 Mar 2024 16:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X2xvhv/+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815931124CE
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 16:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711643136; x=1743179136;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DWanmEphKOwlVsA1YIMiDVhZl9kZOw1k6nFUYOBXyeo=;
 b=X2xvhv/+wzTDEpjGtfjOVgaCMAQWsfisNVIlL48Jg50ontYCBtgDItyF
 8P0cJl+152cH1S/08kr9dp1gtd8Wj25fu1hWkX8kqgDkUYhio3n/GV/mG
 M5S62FRvnEAwKjs/q80ozhdzXLHrJs/I/B40SoCqhRMoGnDpkX5Js0Zo1
 u3qKiYJQ5lBxhFXFESUWtSm5WHc885xgFFNtvppom1nde+wqkUzBSlBrt
 JIX/ddy68nJ9zPP6bldIcTH730I6AuWPNVqUemRebYU9v7OEEFtadnSjt
 e5i1YoXIU1RBsCZVT23qs8Z4+00Bbruzs3CapvvWktM7rz7t6t32DkzDd g==;
X-CSE-ConnectionGUID: qyPJvkhSQrqplnarlo52fg==
X-CSE-MsgGUID: sJsFsdMNSo2JDcAoYxAzlg==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="10618242"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="10618242"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 09:25:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="16531598"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 09:25:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 09:25:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 09:25:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 09:25:34 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 09:25:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mecy+NqkNU0WxszJ9BbA05QbA70QTERWw1VxNfc4GufMjYH7iPEhXpEzp2C9I+T24OiaXorlALwSNJimfKXh36jzg7FG0lM9XQmfNSnKplHqpDa7nxINjdERdzDrbHsomGqDC5h58m6K3CIn6mTcZKLXV0UCjhBbxH0ERaGi7KcDfcyZTJBS4gV1cHr7HFbc7SEzCPzCQvT/cQh0WDem2XWhEAIfMnH061tOFqcqJ0M6Rh/dZwgai6g5cfo4hn1dA0Bab3ruTnw2OOgQHLl3+HfzLULu1AI1B+OtFkMKxYubUEmTmeJ29xySI75egdFAzxnOHWqt8Qs/zxRLuu1dXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xAfw7Xb1wRzej3Og5oaK4P6f83gXs6e8graDGSwEcg0=;
 b=oDACjojp1oVEGuidW/nE+Uj/is3cT5dGI2T6WjrhgAyXo8mBGRTFF+cZQFAwF9bJE+OGxUUHekG1gu9p3fVtN4j03voy9vE96x0m3LhKna+pqwZLIFI7D/94HWLuElmupSwsG8tAo71pFx4VgkQJ/XXypB8MEkTkdiazYpAofGAK9k+KdmBga7Rtjoy80Q1RES4TLy+GsiSV9aKT+fpEJy8NuBSbrxLBiR8/n16Zo6+8CsQHWMWavCzMbZIXV/0AcXxVRvgcJTEE8YdMA6CQGVtHC29sQsr9xdbt+e76rHVWAp6XgL9vr4GFIe9QOnUQdjMyZWMLIJuOHTEv4jnC4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SA2PR11MB5161.namprd11.prod.outlook.com (2603:10b6:806:fa::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 16:25:26 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::4c82:4136:12c1:30f8]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::4c82:4136:12c1:30f8%7]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 16:25:26 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Subject: RE: [PATCH] drm/xe/hwmon: Update xe hwmon with couple of fixes
Thread-Topic: [PATCH] drm/xe/hwmon: Update xe hwmon with couple of fixes
Thread-Index: AQHagRci+jHhgCYfmUmJOhBW8zd4urFNNvaQ
Date: Thu, 28 Mar 2024 16:25:26 +0000
Message-ID: <CY5PR11MB6211047AB6D61E060214E60E953B2@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240328140222.3796853-1-karthik.poosa@intel.com>
In-Reply-To: <20240328140222.3796853-1-karthik.poosa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|SA2PR11MB5161:EE_
x-ms-office365-filtering-correlation-id: 27c31230-1831-4887-6a9e-08dc4f43acf5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0toy0BeE4GX36jOtRGt36Pn+mHx0ajs8X4PgPsLbbnpIFCMaon8+gufUGEA+4e3cpHB8xnwU5i35rxIum4X9RR1uoOMAN4uvF0sIbLhyH7AY0BQ5drubIPcj4bspWtHIjYgT2Fbrlu7qULNuFDc8RpN5a4f0wh902MD0ncrxN59PJdZaAvh2JfYgBiCZ4fi983ARPYrnmfACnDnwyGJfOmmzr4tbjVE8uizPDFDcS2Uez47Ybd5PEw2IMcAG0qKZNERhdf7KVygIytvUl+rCX16UxP5LOscebYlxGWFxSbE4A82ZTBzUKErNTfqY0YixXWRtVXBTmSlOR7zqvxcijZbwM2ap4nQzNfxs0m+MQ8wev3Ku49WLGhMqKIEBDmoUx68Fq0P+Wuw9eoNgZ5PsOkl5Sv9/7PBSmMehBeTmr/Pyvoy8SqJAL1fkhrRv6OvrqIYlMGij2Lg6p3n1wDGrngMNH9WBJsvRpPJxDicAS5PAEH9giFv19KRsRZjCRY+EaLhqVbTfpLKGgX3XvY5S4dm8Xy47w5+tv6IyMYK2wQwK3lS/5rblkq0wYwuasFZyGGUDhx9iP7IYVtgmd6E2q8jfBLfqYCURJzhYA117/Ff2PN0o7qZB4hyaLH0KZmOyYRlRanOI0nXrjWFDdVJlwo7MxfTuDGAFOTB9UZhxB9DwyNwpzwMqy3F7gIYNP/qTN4gtELq0RpKXljbTxCPySw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Y6FNyDKU35cTCL1g/WnSHTh7VLVwamDOlFtXItxF2tXVgfyB7fkBUUBL3IwH?=
 =?us-ascii?Q?9tUOfGtLv9LgorfeHCFEKicM7L9LpUqeQEw8wN9OR7SuiLOPMPA75q9kIHEt?=
 =?us-ascii?Q?ZCHh+fJPsuH7cWv7JXVoM67wsj4+FQBMkOWAFVaDwloj99yBhG79UQTg0rit?=
 =?us-ascii?Q?EflaCU4N0f6oeQ9/dVE8+KVrMzyd5TNFJk7hrK+9HUo6eeOENn34JYjVwUeu?=
 =?us-ascii?Q?X4RJ0+cfoh8EKGQH35Npxmj1fZLNYmv/k5EHoLeiTfFBQ663aYhbgpC2LHnO?=
 =?us-ascii?Q?HbuwvdmKV1aXkJBondMVJP63//6vGWGz4mkmftvrTU+aOiNojnzl+4TlMLrp?=
 =?us-ascii?Q?a9CCXAKvALVl/kP0TNRMvhmUtv6sGBSFVpDn2e+HF0psJ8ms6IfEk1OBU5ly?=
 =?us-ascii?Q?xsl3SuVSUAzwXj92rJ98XZpQF5poucBOLczgH8vRT/prUOPAqNexoy8JZuyD?=
 =?us-ascii?Q?3Tf9sZV33vs5O1sedx+C2sK+6KhnZybr6qE77MZ/16hC4MBpoYKJlr2lLswS?=
 =?us-ascii?Q?gf0mn6WMw8VeZpPWdLHTB9nlQFLTLCgpeaGxT6LogXmSoDeZEWsCgOYxLiNp?=
 =?us-ascii?Q?3bmYTkiWbcstI0A25lUC+kEXAa4U423jCeH4Tfz82EFJ1w3owPi0/WuJHXSo?=
 =?us-ascii?Q?UaNuNMxna/8qJbbRAiekSZD9fZ9fK9Q/PfSEqzxLSRLqCE7rSCb+rrdrbo0s?=
 =?us-ascii?Q?cwRBAnp6YKfKt3L0RsFPs5xuT2lacCmnsB25aEYtLjQnijn2C7l7M2TjUSCz?=
 =?us-ascii?Q?JCfRPMht0aTTYsoQLHHtv8CQKZV84Bau90yHRS6AxrLrPPRDGvjp/gPO/8JP?=
 =?us-ascii?Q?JLB/ZBc3QE92tvuB59HEoJ5KEyGf54JEhsxglDrV47J2SHf2Smw3EBzXhxN9?=
 =?us-ascii?Q?jEXVdq2QRgpxK8ambuf4wNJ+gC9yFmpx1F014JSnX+cJoE8MVid1jmOaYSHX?=
 =?us-ascii?Q?UViKaynmk/DPvDo7mwEHy4kRNZLRaJLpfxdysPvLgEvPqr3DAkfQiSmx3mFL?=
 =?us-ascii?Q?FBv5+gtB2pENJyKKClTZ3eQS2SL8QycG5BXpstcPZmsCKiZx3q4JmwCcvJ8a?=
 =?us-ascii?Q?r6xfBagifEycvQpHxltrpwSty+A/DXxB45NvcohNTMO0YqBPTNs7/ziAwsUQ?=
 =?us-ascii?Q?tDePmayy9NoybZTOTPqSxo1IpQmCrorNZuE9iu3jj/4n/rDCJNMDpndKrSdt?=
 =?us-ascii?Q?bD0Dia2dT8kW77qJxyjDPDU9a+Ehf6o+GQaCXLpUmcktsGxcYMO/UHzPsMPQ?=
 =?us-ascii?Q?jpNUIEzsdlI9PuzUbdZWo3WCc4kvYM60gMfrHyPeALa++3kPi0Xt9MjBQRO8?=
 =?us-ascii?Q?a0eWP6aziVVvB8vZWlMP23UOj5l4/c4VUQEUYglrYRQY08jDX6Hth5ehWbZt?=
 =?us-ascii?Q?UgGNGXK7MnDh6l6bSwM5cIBwbXRKlLQ2WBlpDw+tkdydMJ7qnEm9eAwQ9PuZ?=
 =?us-ascii?Q?93utFxFxDQJJf0bK+mwi5c4vDh0oDTW2xd5hG3CtUvWD6TISbUA55SFFSSfC?=
 =?us-ascii?Q?DBrXZWceM1k0z3K8p/taM9pmpRTYY8F0rzGNhCKbcNgo9OQXBKFVEROZLsey?=
 =?us-ascii?Q?QfY4JNbRd9C2ipHjXj/l11MYsH8gnqweGdH4egfq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c31230-1831-4887-6a9e-08dc4f43acf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2024 16:25:26.2604 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UqDiAFATuAksWdvPWcemjqkCCiZyx1BfHEhOwtQJrsYF+F4346rzDThENR2dfX2RFQV0bdoo2D4DF4T+XtsMopyMX+jt4X3lmAySO08AFsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5161
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
> From: Poosa, Karthik <karthik.poosa@intel.com>
> Sent: Thursday, March 28, 2024 7:32 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Poosa,
> Karthik <karthik.poosa@intel.com>
> Subject: [PATCH] drm/xe/hwmon: Update xe hwmon with couple of fixes
>=20
> Fix potential overflows with upcasting.
> Initialize variables which were being used uninitialized.
Few initialization is not needed as reg_val is initialized be call by refer=
ence.
>=20
> Fixes: 4446fcf220ce ("drm/xe/hwmon: Expose power1_max_interval")
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Few reg_value initialization  is not needed as those were initialized by xe=
_hwmon_process_reg()
but for symmetry=20
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Thanks,
Anshuman Gupta.
> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
> b/drivers/gpu/drm/xe/xe_hwmon.c index a256af8c2012..6ed9d5c4f6b1 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -153,7 +153,7 @@ static void xe_hwmon_process_reg(struct xe_hwmon
> *hwmon, enum xe_hwmon_reg hwmon
>   */
>  static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long
> *value)  {
> -	u64 reg_val, min, max;
> +	u64 reg_val =3D 0, min, max;
>=20
>  	mutex_lock(&hwmon->hwmon_lock);
>=20
> @@ -182,7 +182,7 @@ static void xe_hwmon_power_max_read(struct
> xe_hwmon *hwmon, long *value)  static int
> xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)  {
>  	int ret =3D 0;
> -	u64 reg_val;
> +	u64 reg_val =3D 0;
>=20
>  	mutex_lock(&hwmon->hwmon_lock);
>=20
> @@ -212,7 +212,7 @@ static int xe_hwmon_power_max_write(struct
> xe_hwmon *hwmon, long value)
>=20
>  static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon,
> long *value)  {
> -	u64 reg_val;
> +	u64 reg_val =3D 0;
>=20
>  	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU,
> REG_READ32, &reg_val, 0, 0);
>  	reg_val =3D REG_FIELD_GET(PKG_TDP, reg_val); @@ -243,7 +243,7 @@
> static void  xe_hwmon_energy_get(struct xe_hwmon *hwmon, long *energy)  {
>  	struct xe_hwmon_energy_info *ei =3D &hwmon->ei;
> -	u64 reg_val;
> +	u64 reg_val =3D 0;
>=20
>  	xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS,
> REG_READ32,
>  			     &reg_val, 0, 0);
> @@ -264,8 +264,8 @@ xe_hwmon_power1_max_interval_show(struct device
> *dev, struct device_attribute *a
>  				  char *buf)
>  {
>  	struct xe_hwmon *hwmon =3D dev_get_drvdata(dev);
> -	u32 x, y, x_w =3D 2; /* 2 bits */
> -	u64 r, tau4, out;
> +	u32 x =3D 0, y =3D 0, x_w =3D 2; /* 2 bits */
> +	u64 r =3D 0, tau4, out;
>=20
>  	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
>=20
> @@ -291,7 +291,7 @@ xe_hwmon_power1_max_interval_show(struct device
> *dev, struct device_attribute *a
>  	 * As y can be < 2, we compute tau4 =3D (4 | x) << y
>  	 * and then add 2 when doing the final right shift to account for units
>  	 */
> -	tau4 =3D ((1 << x_w) | x) << y;
> +	tau4 =3D (u64)((1 << x_w) | x) << y;
>=20
>  	/* val in hwmon interface units (millisec) */
>  	out =3D mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
> @@ -331,7 +331,7 @@ xe_hwmon_power1_max_interval_store(struct device
> *dev, struct device_attribute *
>  	r =3D FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
>  	x =3D REG_FIELD_GET(PKG_MAX_WIN_X, r);
>  	y =3D REG_FIELD_GET(PKG_MAX_WIN_Y, r);
> -	tau4 =3D ((1 << x_w) | x) << y;
> +	tau4 =3D (u64)((1 << x_w) | x) << y;
>  	max_win =3D mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time +
> x_w);
>=20
>  	if (val > max_win)
> @@ -466,7 +466,7 @@ static int xe_hwmon_power_curr_crit_write(struct
> xe_hwmon *hwmon, long value, u3
>=20
>  static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, long *value)  {
> -	u64 reg_val;
> +	u64 reg_val =3D 0;
>=20
>  	xe_hwmon_process_reg(hwmon, REG_GT_PERF_STATUS,
>  			     REG_READ32, &reg_val, 0, 0);
> --
> 2.25.1

