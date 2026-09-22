Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DBEC982FE
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 14:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA2710ECC8;
	Tue, 22 Sep 2026 14:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QfX4is9r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4000D10ECC8;
 Tue, 22 Sep 2026 14:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790087791; x=1821623791;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KNqLFAGWJ2O8I9f1N20nwVczejOUjbUY2pR+8wXVUQU=;
 b=QfX4is9rnXunn3VDNcnEAzZ2kJ+6xRRsRHL38xuhvQx7iTKpDZPBFjmR
 J7F8SlTM6DWcU83s4Nrb653rQTRGw55nvLU8ZCFMLssbMA6G7Ki+uCm6B
 lV8BG97p0ZgMPerMRTnbZ29iyrhBt73WkPsBLLj9BWWD3EOpaOpjwvZVp
 OrXAOwlPLkrRXe2EowhOaXOsb3WUMkTlMj9nt0+s0NICmdRah7JoyGIMM
 i5TOEpJdt/f+8BSqjX1C9Fx5pm16KxCwfQM8tM1rUR13SP249QuVvOzxZ
 PvG6I/h1FbyCZNYmOgPS3aMZmBTYPT+IIr5+6DfxUfYA6/tv0w6laiho7 g==;
X-CSE-ConnectionGUID: dYuTtbmxSYmLQssm/ud0vw==
X-CSE-MsgGUID: 4D2ZpHL8RTq98AGW0w4eQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="94524967"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="94524967"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 07:36:31 -0700
X-CSE-ConnectionGUID: XfNKOS5FSOmLHwOcsAy7aA==
X-CSE-MsgGUID: dG53U/sdQ4WsyOA8Ez4ArQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="272360028"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 07:36:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 07:36:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 07:36:30 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.44) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 07:36:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lpBqJC/hyBN2/xVyRYxwhAI1wzZLezto+/fv7iO21Vikca8m60P+BLeTv0cjK4a8ugpZXspZ2me8uv3fs0bhqyF1xQ8SkKDhn4eKVd/D35wXLcq5SdEGOs5KWgDgB1a6qN1WuMtsqqDITZrJvu5H1hzH7vb6Iwwi1fUXUrsd4SLm7dwcM1rws+fUwH1lGitRRw8NChPVGC63s3vIbcfkLB/GsT3UssVSrKaNYzNs4dSQG1LiWAs1Snkkq2ptvJsAFy1bEuxU8SyoYk6Tgxl3fsGMIKDsvCP7Vi1yeal4WBye+i4vkw/68shSF89QncF/u/ZnF2CZ6UMS+BzAdRj97A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtyI16NMKTl4+b/Z0c/CnNHjgD2JSc0zuhcj84h3Otc=;
 b=Q24/SrtG5YCMySQjmFntfU/1Ij7c9JZVbzjYOnmK+Rl6IGFej8EgNz6BvABTN/IEtk2Fynj7GQEkRxM+5UkDVZK9K0N9tGlvElso58FI0dMOg1SiFJgl6IGmfgchqB6/HiOCoZd8mJbCBvo9HZoqa5Ob8Eha+8vqUqWTjqWamsCLn4yFNSX0oy+ovnDyR4+FgHyWq4hI1uVMc1hc9bJvqBMK3/ZAXCeMioqnww8JQcoM3X0pCVnw7YJ8wclXpat2YbGehL+xVLgkmIYapFvsSBBycnHqlm8VGEkJq3VuDPv/a1LfgQaw/kYvxNvh6JS8otmY0+oKyZlqt1WlrNLqnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB6887.namprd11.prod.outlook.com (2603:10b6:303:225::16)
 by SA1PR11MB8489.namprd11.prod.outlook.com (2603:10b6:806:3a9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 14:36:27 +0000
Received: from MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494]) by MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494%5]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 14:36:26 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH v2 1/8] drm/i915/lspcon: log DPCD access errors
Thread-Topic: [PATCH v2 1/8] drm/i915/lspcon: log DPCD access errors
Thread-Index: AQHdSovPirBmYo38V0y22JxzD5Ogsbbaqliw
Date: Tue, 22 Sep 2026 14:36:26 +0000
Message-ID: <MW4PR11MB6887DEA5C63BDC66AB9E6BD9E3832@MW4PR11MB6887.namprd11.prod.outlook.com>
References: <20260921053710.1586776-2-suraj.kandpal@intel.com>
 <20260922121316.1768918-1-suraj.kandpal@intel.com>
In-Reply-To: <20260922121316.1768918-1-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6887:EE_|SA1PR11MB8489:EE_
x-ms-office365-filtering-correlation-id: 5457f2db-ffe5-4aa3-6e8a-08df18b6e23b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|38070700021|10067099003|11063799006|5023799004|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: 3NnyCYN/xjrmss6gzWR8+DNIlaiDQvndSLbSBsGKOnrRomp4DshFxdsVNhvgOuBroyWcGE07NhEUVSaiwzfQpDGz7ZACWNF84ek286pFVFA0l4KFaAgt5jT019Cp6tBb+esupS3rosY5TWj21PD5JISE3Z3YovtuOtrao/QJsNr0FGPBEww1gOdr2TDB3yHpCssxthEikIyvq2XvevROxhdf3MnMP6wz7BXhMtAGl7fWEwn3eyQlXeNhNalCSxopLxyC9bd0o0EZg0I3N65RB/lVeIR7sPlRx/XpaQuPK9+HH0vwffXRlxL6a1YF7oTXY8CqKygZmP4dp4grs87LYSuk4d8RdDhBiPaqs6xZfUAuIKwLWG2xK6yCCa15cK3IpZ5oG1mt/6LBBAqb4SA8Qy+r7ZnwNvGlFO+XNXz0SN1dUXu371RftLyu1Iagi4j43d2eJguh83/jepT05F0J9CouiP2Dext8CFiDrp6DDSk4CzFaE1b1MnPZmGrAE4xf8d7PLU9vDhLojBzKc549D7LKq+ocej110veYNZ1X0pXDtgmh/EEuSgR/GPuBh3CTKgcdJ0vNjJVnDwVku1kRdCnB0rSQEHd6aTtGDQy/5XcqbowKho58w7UQ6HREXbW9kRXDruEvzGBK0kKrlohCfqbdm6p7BdbY6omVIlk2JnRpSvpXBKSmhG4ho57t5y+JA9jRjCP5AWYHzTKR4TVkbAxpm0s6BajXZR78dPg3bdY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6887.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(10067099003)(11063799006)(5023799004)(4143699003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xr0MSK1yy9oU07gDw3zzlAO21O4NgNXzTsLQMzWacI2DaaqjpBKHhZDRWKsO?=
 =?us-ascii?Q?Ene4MkVNFsO1zsWnm75ftp5VyqMI/iUZE62XFC/fsi4IF2dD2GJV8LWxIbJy?=
 =?us-ascii?Q?qIScQ0QMORR1ZbhtufzJz7L0KeinV/VPnInAxDT6GQOXlat/audwd3e9nx1W?=
 =?us-ascii?Q?FKFWWF6OVkmrRfPd+4uf2fKN32UukElxOIcunVMAnqRPYy2EolkLT9KToDRf?=
 =?us-ascii?Q?US0V3HSrDPL06ilrtldYJC9bJfL7nVBxmn/IdCpKHWlkLGTB7gd1gANY/lca?=
 =?us-ascii?Q?v0LCCP2ovCJPH8MWUhpqouqtxNp9EuDrmlz0CEmD+IPix0AycyEEhbJJ85Bq?=
 =?us-ascii?Q?iKGZDz2flh+MCx3pgzQUa5Fjk9AaMu5Dv8fZmw2hD8of6WWJ+2jXr8nTi0JA?=
 =?us-ascii?Q?Bagzli0n4O+pYLFWTrPU4ZNk9ENGmJNPaeMlwgMwu/rrhwgnd/yG5bGOdhqU?=
 =?us-ascii?Q?OlZh8qaDjfHrFPJXjxWNWoC2WZb7kxaWcDPzcdBcT8iLWmOixWON66LKRTH3?=
 =?us-ascii?Q?s/eGUGUZXAgmtI5T/LXXhcwiqtyoI8Ilo4of/AequqEfUabAyZzoeQPzypb7?=
 =?us-ascii?Q?y9wH6qHT433N4AmoUQ2rjoRANTZG7ttI204Na0vWNEVuHJsl3hRxvlzHWCGZ?=
 =?us-ascii?Q?wJpgzSz9TNFSWVOzz5ZJUiTGl+sH3+ysFjAWwxsndZQ1t4+FagL4PWfUPlaR?=
 =?us-ascii?Q?rWclcFVh14D7E1mtNg+GNRSID2OSDMdJJCjk+LJLFalZoURGoQIAQnlx1RMm?=
 =?us-ascii?Q?HhuwImIUr1I7IbmgHAZDa3Vt3zBiKh7UYuilfroguQngEUuZQ9re2kmq62oo?=
 =?us-ascii?Q?TffoxFlt5FOv00bhi8LRU+xpNOLCylZkvcynr4Zp5B2YEjm8nEG9ARjfdROT?=
 =?us-ascii?Q?m2xD8nTUxsNs4NKx0XiJK8QXB+IyOtiTXcW7/VA8RUeABeqTGjRILwsflhOR?=
 =?us-ascii?Q?2fUvtsqj4vvDrCOiysKf5K4WYU4XG2fe1uz8h1AM38ksYK/IuU0H5VN7qTsv?=
 =?us-ascii?Q?7wOzk0Eq0fBhh2R5w/fXLseYPB6mJNj6k08XeA/HKE9LjC3X/ElqZ53t3YyB?=
 =?us-ascii?Q?Jr+0FK1Kff4bJtPpwVV95pb3MNLreD/0O8erFmFNgf77XUKwb1wyyLPt1EmO?=
 =?us-ascii?Q?slzMTOYeGkqafQXTqfZtk4M+NCNuvtOUj5W6EgOmHkpdeYONuaIMY4xZlkiA?=
 =?us-ascii?Q?+89N3VcJFKg1iMNLC1FjFsrHlru1d7MnzLapqqYgaz4/XYkOkIekw7nEdDG0?=
 =?us-ascii?Q?Q3xx4ebvI5kpx+kXEgwC06HW3hOtdzSUqBj7nNEqJbC/T7nb82Zx/s+ZZCsW?=
 =?us-ascii?Q?fgN+pVA4VbL83a/PgXjvTgP0X+EJfRuDS+GnnaPbeoZqhFnn+FFTnEIMZ2zl?=
 =?us-ascii?Q?6U1pzIq2FAXR+1b/lYntXP90rc/fpI3yLpSTvvEhM/6kI8iqM93Hi1qshitA?=
 =?us-ascii?Q?BQUDtqlXYiczQstXZq3OymSZy0vpratGONx4+vb+pGLhEmh1j4oqaAVsoqWG?=
 =?us-ascii?Q?dOsBr81fuyjq7gJrNkjHyF0GdCwYv1BPvwPwXzEoKTMK6HX4Td4jb/B8vp6a?=
 =?us-ascii?Q?3HYfB5cRqd5HnzkFhRHLIuSuiCXv9LrqhKal5cqKC9YBV2wCBGI7gKQu9mEh?=
 =?us-ascii?Q?Vtzg9u5dNdlLAF5gRpWEMeP0shDeHxksLIAiOeG+WuclaC4qLMVqULawFnvb?=
 =?us-ascii?Q?94KmSMqVdxErcWE5rSs1W5Qe3Y+S0HSQSpkzP07PWeA2NksdecXVT9bOwyql?=
 =?us-ascii?Q?sq4Cfy9lxg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: SnPSAcDmbzKh56k7JZx7Vo9vu2unR+dAXRf5CPZdbql7h7XIbxN/Of5xVIwkDggzg09nO8lD5eT0xGNjw46Rb3X2JsJudXMZmvQaS5FMQF0mwlv5Yq7cXfw26I1BzkEK0zovdnthM149IGFZFg/wQ7pvZtBry/xmVnF0Wjdr22DOYPPMSKzuFXIAnX+6reHSdghzDDJ5ZjNDmuFfYuIoFyIskPmLJO+Jp1WkevgNV7K0xyH+PIrxc5ZyiShqLIQVriBvYHma1DurJBDmPk/NELsAHdO7Dj7/ODh689yNr0LwwxwEeQM77c4EiS18/G8uUVose0i+OBbZ7TdAhVSFLw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6887.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5457f2db-ffe5-4aa3-6e8a-08df18b6e23b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 14:36:26.8086 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uFGSzo371N6DAGB0fRWckfmYZs/Nv2ivK1utljMSolW/4ReU5yRdIYr7Xjh8xPDVHO7jQLjnp4ii3A7HERc1Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8489
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
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Tuesday, September 22, 2026 5:43 PM
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Nikula, Jani <jani.nikula@intel.com>; Garg, Nemesa
> <nemesa.garg@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH v2 1/8] drm/i915/lspcon: log DPCD access errors
>=20
> Now that the DPCD accessors return a proper error code, include it in the
> error messages using %pe and ERR_PTR(), instead of just stating that the
> access failed.
>=20
> While at it, fix the AVI IF control write error message, which incorrectl=
y
> reported a failed read.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
> v1 -> v2:
> -Fix debug log (Nemesa)
>=20
>  drivers/gpu/drm/i915/display/intel_lspcon.c | 34 +++++++++++++--------
>  1 file changed, 21 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c
> b/drivers/gpu/drm/i915/display/intel_lspcon.c
> index 07b5a9d010ff..a61224523318 100644
> --- a/drivers/gpu/drm/i915/display/intel_lspcon.c
> +++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
> @@ -139,7 +139,8 @@ bool intel_lspcon_detect_hdr_capability(struct
> intel_digital_port *dig_port)
>=20
>  	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux,
> get_hdr_status_reg(lspcon), &hdr_caps);
>  	if (ret < 0) {
> -		drm_dbg_kms(display->drm, "HDR capability detection
> failed\n");
> +		drm_dbg_kms(display->drm, "HDR capability detection failed
> (%pe)\n",
> +			    ERR_PTR(ret));
>  		lspcon->hdr_supported =3D false;
>  	} else if (hdr_caps & 0x1) {
>  		drm_dbg_kms(display->drm, "LSPCON capable of HDR\n");
> @@ -247,7 +248,7 @@ static bool lspcon_wake_native_aux_ch(struct
> intel_lspcon *lspcon)
>=20
>  	ret =3D drm_dp_dpcd_read_byte(&lspcon_to_intel_dp(lspcon)->aux,
> DP_DPCD_REV, &rev);
>  	if (ret < 0) {
> -		drm_dbg_kms(display->drm, "Native AUX CH down\n");
> +		drm_dbg_kms(display->drm, "Native AUX CH down (%pe)\n",
> +ERR_PTR(ret));
>  		return false;
>  	}
>=20
> @@ -339,7 +340,8 @@ static bool lspcon_parade_fw_ready(struct
> drm_dp_aux *aux)
>=20
>  		ret =3D drm_dp_dpcd_read_byte(aux,
> LSPCON_PARADE_AVI_IF_CTRL, &avi_if_ctrl);
>  		if (ret < 0) {
> -			drm_err(aux->drm_dev, "Failed to read AVI IF
> control\n");
> +			drm_err(aux->drm_dev, "Failed to read AVI IF control
> (%pe)\n",
> +				ERR_PTR(ret));
>  			return false;
>  		}
>=20
> @@ -371,8 +373,8 @@ static bool
> _lspcon_parade_write_infoframe_blocks(struct drm_dp_aux *aux,
>  		data =3D avi_buf + block_count * 8;
>  		ret =3D drm_dp_dpcd_write_data(aux, reg, data, 8);
>  		if (ret < 0) {
> -			drm_err(aux->drm_dev, "Failed to write AVI IF block
> %d\n",
> -				block_count);
> +			drm_err(aux->drm_dev, "Failed to write AVI IF block
> %d (%pe)\n",
> +				block_count, ERR_PTR(ret));
>  			return false;
>  		}
>=20
> @@ -386,8 +388,8 @@ static bool
> _lspcon_parade_write_infoframe_blocks(struct drm_dp_aux *aux,
>  		avi_if_ctrl =3D LSPCON_PARADE_AVI_IF_KICKOFF | block_count;
>  		ret =3D drm_dp_dpcd_write_byte(aux, reg, avi_if_ctrl);
>  		if (ret < 0) {
> -			drm_err(aux->drm_dev, "Failed to update (0x%x),
> block %d\n",
> -				reg, block_count);
> +			drm_err(aux->drm_dev, "Failed to update (0x%x),
> block %d (%pe)\n",
> +				reg, block_count, ERR_PTR(ret));
>  			return false;
>  		}
>=20
> @@ -450,7 +452,8 @@ static bool _lspcon_write_avi_infoframe_mca(struct
> drm_dp_aux *aux,
>  				mdelay(50);
>  				continue;
>  			} else {
> -				drm_err(aux->drm_dev, "DPCD write failed
> at:0x%x\n", reg);
> +				drm_err(aux->drm_dev, "DPCD write failed
> at:0x%x (%pe)\n",
> +					reg, ERR_PTR(ret));
>  				return false;
>  			}
>  		}
> @@ -462,7 +465,8 @@ static bool _lspcon_write_avi_infoframe_mca(struct
> drm_dp_aux *aux,
>  	reg =3D LSPCON_MCA_AVI_IF_CTRL;
>  	ret =3D drm_dp_dpcd_read_byte(aux, reg, &val);
>  	if (ret < 0) {
> -		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n",
> reg);
> +		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x
> (%pe)\n",
> +			reg, ERR_PTR(ret));
>  		return false;
>  	}
>=20
> @@ -472,13 +476,15 @@ static bool _lspcon_write_avi_infoframe_mca(struct
> drm_dp_aux *aux,
>=20
>  	ret =3D drm_dp_dpcd_write_byte(aux, reg, val);
>  	if (ret < 0) {
> -		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n",
> reg);
> +		drm_err(aux->drm_dev, "DPCD write failed at:0x%x (%pe)\n",
> +			reg, ERR_PTR(ret));
>  		return false;
>  	}
>=20
>  	ret =3D drm_dp_dpcd_read_byte(aux, reg, &val);
>  	if (ret < 0) {
> -		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n",
> reg);
> +		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x
> (%pe)\n",
> +			reg, ERR_PTR(ret));
>  		return false;
>  	}
>=20
> @@ -615,7 +621,8 @@ static bool
> _lspcon_read_avi_infoframe_enabled_mca(struct drm_dp_aux *aux)
>=20
>  	ret =3D drm_dp_dpcd_read_byte(aux, reg, &val);
>  	if (ret < 0) {
> -		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n",
> reg);
> +		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x
> (%pe)\n",
> +			reg, ERR_PTR(ret));
>  		return false;
>  	}
>=20
> @@ -630,7 +637,8 @@ static bool
> _lspcon_read_avi_infoframe_enabled_parade(struct drm_dp_aux *aux)
>=20
>  	ret =3D drm_dp_dpcd_read_byte(aux, reg, &val);
>  	if (ret < 0) {
> -		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n",
> reg);
> +		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x
> (%pe)\n",
> +			reg, ERR_PTR(ret));
>  		return false;
>  	}
>=20
LGTM,
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>

> --
> 2.34.1

