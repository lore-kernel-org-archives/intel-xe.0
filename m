Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B351BCD1288
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 10:10:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4423D10F060;
	Mon,  1 Apr 2024 10:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CoQn/Noi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D6210F060
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Apr 2024 10:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711966208; x=1743502208;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8MlQCuEwcf86cECyXVOnlEu4nM/CYkgu6eAW5VVSnCA=;
 b=CoQn/NoiXk7ebOqhhLDdAtH4hio6Bj7C+Y4XMstpYvX0v+x20g72ka2p
 Was8PmUr3uTk8RCjMgHmgnj9vyAmIbKC5fnekHyJ1h56fAkE1iDTmZUDW
 rqrsD+5uW2Rd22T3DGJE9ZNTF7GciMyfxnXPJEQp8KPN/7ov+bfaMtVpw
 +EmFlV9XrNAmKpbmhwDKIyT3INHUDHbLXjEr31Uljk1htwA6F1LR5OjCi
 FQK1YVNQfCBXUt7Fvq6e7jfqNSAhZpNb+f1DwN5lAJ+1zZsedGAvAxeFY
 g4brIAySI1oufNGIJv/4b5A1ACtX3n4ezWT3IiWQQydPF0/YcaC+Bj1mA Q==;
X-CSE-ConnectionGUID: e5BmEppiRimT1MKdxtqYoQ==
X-CSE-MsgGUID: 61RQ3QV8S5qNmZQAIENQIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="7215097"
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="7215097"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 03:10:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; d="scan'208";a="17746101"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2024 03:10:08 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 03:10:07 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 03:10:07 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Apr 2024 03:10:07 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 1 Apr 2024 03:09:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c18ts4r/BpvdPELJo/TM7yiZwh3xwRd313nfp2fTrNWWMbCG3s3WB/CfJKvy1DuABwIon5ZPNQkKKNaGflUpu/7e50sr/J1ZWJ4OT4+x/tBYdX5zNhukCd1y2/71PHjYedfBp8H3Z8BbczlGg1US7IEYoMfVhSeiXDcZjuf5D1HRE5YzX1CzwPH2syY6yYQDRMbEgkaPe2qd37fVoAOk2QVD5QzC4kYD6c8AZ8WfRLjDeDBqKSKeq3ty8pBUvvGjqKuPpOwRfzvbhBWP0+lBaAHS/uSlGJn3ZA11PDMJHp0mZXH25UUjxMVYrTSKt1RvOtluKeYopQoHf/SkV7sfqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRO7sdigp2hZryqiGY/Tl7yUov9V5vc67sHaMTvVl78=;
 b=VhONhgemWxeBonM7Rs6Oltkoo7rYrc8XM7wqmpfsuR2PZF4MaACvfMZsUAhYYEwuqoxElq2Ii37IEvfOZRh+cy43Bk5DXYTh087jVOLMRT+5aJTKb3OJu4gbnK90ZbDupseudH6fxVJDZpj/lIoMj09xG8JQW6Fs0+NYQdOdc6xV8VYy7Pkjjl/cMhN0WdZCQW+HTG5RwQP8p/TbditYnx62NNZmwnbXs3oKOTB44JqyaJmSrhgzJHvbNSkpLJHPQxOYymQjGNFhGzPA5sWVZ8JuGRqCTV3UVCcrWuAmXm8Mo9o3NEXR2ZPcvfIFbhE2G5uvjZj0ayM4im/I/9kI2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH8PR11MB6997.namprd11.prod.outlook.com (2603:10b6:510:223::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Mon, 1 Apr
 2024 10:09:32 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::d9d9:9478:6d70:d09a]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::d9d9:9478:6d70:d09a%4]) with mapi id 15.20.7452.019; Mon, 1 Apr 2024
 10:09:31 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Subject: RE: [PATCH v2] drm/xe/hwmon: Update xe hwmon with couple of fixes
Thread-Topic: [PATCH v2] drm/xe/hwmon: Update xe hwmon with couple of fixes
Thread-Index: AQHag3nLjqnfQhySxkymV4ekoEUW77FTMjzg
Date: Mon, 1 Apr 2024 10:09:31 +0000
Message-ID: <MN0PR11MB6207F5C58BED22A5B130EC14953F2@MN0PR11MB6207.namprd11.prod.outlook.com>
References: <20240331145340.4065125-1-karthik.poosa@intel.com>
In-Reply-To: <20240331145340.4065125-1-karthik.poosa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6207:EE_|PH8PR11MB6997:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jXj7qPHlsGZhRaxj/dMfCqsiZcGlAyb3lfKG3eEbp4XXsntqYv1FQJHqI0ChZ1jFYU4OAt4Bc+Pu89Xl1yQE+cVYOae+gsGQxc0+H6MuEGWyFA4HZ0rhQb7q3Md5kM+dnm6LJsPbLG/NYOHEaTfEqu9GWIKTa8wLLiXIrlFjzEX5F7Xv2jh8O6N3kE24v93ruKs/SmXlESLAhdIE/+HpHqTYkpxpI2tN5PhoQVAZ8wbdI9CJSWeTJ3ZoVMb7ckA+fG+2MoOcGiiGPFuTCw7YI+zDu7kZ3MPI2abq/z5deLrihr/cpfeONVLS8tV8cRbGaTK688JzyO8L0cSdwawaRzgKlh2TSGx3E1ERpy7vXqthRYWoFwkYedPUAkbUtTZc7LLHMXwb1oruB7ivSFohDDYTnkMdXqontWTH7YT5ikchPooHSm1GbSOOAK5bZwnju6HDVPenQ7lWoTvHgofZH64x+zlr3onvYeyTHxMZU4Lgfu9eLVt0+B/+C5gHtNlLaTHdGM1Ag0p4Um9L1kuFRlhyaSslsE52Oe6M7NDxyIRy1mZBzZqbRAeAieMt0jH9McgSVuAWp+uf+7Yyppjo2HImxqT1efzGnWODvURc8Uxn/graqonupFhdltQjrUBZAk2pjPvOj25jPy8T56u++A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?A3lOlOTrm0qiM8RVOcZsvaRQB7q5OiNBa/VPEDVDwACjTPi6ZwUEEIkZWB5F?=
 =?us-ascii?Q?HwJPdE2dM4uKKooPYbY5FNnEA+ZJirRT3Sz9gPoSjq6zXVlJ34TPjKmDDXCP?=
 =?us-ascii?Q?csorwoQWjZA0DacintYoH1tiI0A+FDgCaUKkY2DTMsU9cmSDoVsABGofxpvf?=
 =?us-ascii?Q?fP1PFfC2+EwOun1oO7JRiSlzKU/jSIOy+WSr64xn4/JTEKBVJbO5eSA5EqqQ?=
 =?us-ascii?Q?LU6U61GrS07vImct0QuZCBIjcwmlydgOMVvAAOIbBidJadLsOjIqL/F+ybRV?=
 =?us-ascii?Q?pKb5I9HPyvk1QwOYwOvD9E4T9dg6SrQTe5khR6I6Ju0HDMldUoFT3kFL7j03?=
 =?us-ascii?Q?ORDMLAn1lFGMy75y9UhJ3N5civ5HvNrAzVGTMZz0DDs80rx+e6ooWADFQnBm?=
 =?us-ascii?Q?Dvj3MLJ346B7Lr2UXJMioztIkLDwxANrrQckeLrWXa9mw15L0KJ08XYlG9YB?=
 =?us-ascii?Q?MoTt6uIpGqlTJ2YuDAiIBkDU/5u2+09GAnIZ8ak/838BwMljriDSIvIS9h+q?=
 =?us-ascii?Q?K9BjNzfR3nauUxb139YxN5lRK/SVPtQ1GyfQU1rV9qHld/WLN7rC5tP467If?=
 =?us-ascii?Q?PbZQ0qkQrMSW5pnhwDp4bBHlH5KZbCrqsrg+Rid9dy1HCS/e1ESmhdN7H+i6?=
 =?us-ascii?Q?pk6NjWX7ff77R8jT0UqmsydP/A9slEVI2w/YOq9hW76highuCmYWPa618vgs?=
 =?us-ascii?Q?Kmmp0N7ycMoJ/XxToUTDiPxWSoQ7xP9tqFMJwOBT0nuuiNR01O2szpj7wRjP?=
 =?us-ascii?Q?c+Fd2LfBvFYFhKSVV/oJP0VIMH7B1GlIhX/dL6VV9HRjbZIo/MubIuBV/3n5?=
 =?us-ascii?Q?G/UJBKwBL6uorxV/sAgzXXk1o1DAbscM6MpAvot3vuByyYyw13aGf8rE6G7+?=
 =?us-ascii?Q?E7uOmC4M7XulqINUOlAJq63jpPpEj4M92w0OYjZshQZHkYIEVoJLKNbGaKIh?=
 =?us-ascii?Q?Oj0z1et8zTfWk1el8/4Mn7M9FfL3dYhPucB9tnv3pwr86zgd2xIn04YxZnZQ?=
 =?us-ascii?Q?Zb7BfMaIrr/PA/Zh3AjCi2MMDlZlOXqNn/3t2dZRJ2dM6Lfb1w5MWkSz/lKd?=
 =?us-ascii?Q?AvuyqbFd5VXU/6PrhTjY1G7nZxfmyK06SygkCwIMNZHVE8wzXg2g7dVWZtzz?=
 =?us-ascii?Q?sirD9U1mu31bl9csaM7r3jm3MOQZBiABLzrQS/UoarQOxN/CR5Ut2Hfsncnv?=
 =?us-ascii?Q?l9Kh3WO9btGsDAGL/VfCshiGyBuLkw+UgHHrR8C6cdZhQaSUSn7XEDmWpLlW?=
 =?us-ascii?Q?HrwSYeF6if5X9m5qYHuitHPCN3xqe1vx2V+q+O24z2lUfaX3f2U+k7Umah5C?=
 =?us-ascii?Q?fz8bekh8JstrZwwJTgQ/VsMOYtyEnTki2Yuoh5kap64rEJBAa+KH/TOpazTE?=
 =?us-ascii?Q?Pr1VnEfX8CZ0XdgI/M8nTFJnAYFhka1X9uO9EFyCAZ4engMdTAZ3eUuviFga?=
 =?us-ascii?Q?3ovlfOFFlyBNjFptjNZVsEtm9cnbhYZSCVs4yiJ7UKaqBAJQyZMmbMXHI/UZ?=
 =?us-ascii?Q?3b83D/n89GPGzRLiqAGxTLnGrmCO/AcG1/woP7RaEs5asLcRXpSW5QL6lHnK?=
 =?us-ascii?Q?HllWewfhzYHsezreuDtCjcV1dSzm2bFHJdvImzUc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15878555-1321-4226-bbbe-08dc5233d30b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2024 10:09:31.6765 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5yDQeKNizRBMIHgD+/Zyp/AVu/kj9xuyIhNjc5m5gL7OcY2KVxXHK7whL9zJRzjid5mPsu50z6LndBr2DApV7aZsZ8sEJ/+0Vop5CM+cJyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6997
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
> Sent: Sunday, March 31, 2024 8:24 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Poosa,
> Karthik <karthik.poosa@intel.com>
> Subject: [PATCH v2] drm/xe/hwmon: Update xe hwmon with couple of fixes
>=20
> Fix potential overflows with upcasting.
> Initialize variables which were being used uninitialized.
>=20
> v2:
>  - Rebase.
>  - In xe_hwmon_process_reg, set argument 'value' to 0 on failure.
>    With this change caller function need not initialize value to 0.
>=20
> Fixes: 4446fcf220ce ("drm/xe/hwmon: Expose power1_max_interval")
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Looks good to me.
> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
> b/drivers/gpu/drm/xe/xe_hwmon.c index 7e8caac838e0..bc1bc73749c1
> 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -129,8 +129,10 @@ static void xe_hwmon_process_reg(struct xe_hwmon
> *hwmon, enum xe_hwmon_reg hwmon
>=20
>  	reg.raw =3D xe_hwmon_get_reg(hwmon, hwmon_reg, channel);
>=20
> -	if (!reg.raw)
> +	if (!reg.raw) {
> +		*value =3D 0;
>  		return;
> +	}
>=20
>  	switch (operation) {
>  	case REG_READ32:
> @@ -143,6 +145,7 @@ static void xe_hwmon_process_reg(struct xe_hwmon
> *hwmon, enum xe_hwmon_reg hwmon
>  		*value =3D xe_mmio_read64_2x32(hwmon->gt, reg);
>  		break;
>  	default:
> +		*value =3D 0;
>  		drm_warn(&gt_to_xe(hwmon->gt)->drm, "Invalid xe hwmon
> reg operation: %d\n",
>  			 operation);
>  		break;
> @@ -298,7 +301,7 @@ xe_hwmon_power_max_interval_show(struct device
> *dev, struct device_attribute *at
>  	 * As y can be < 2, we compute tau4 =3D (4 | x) << y
>  	 * and then add 2 when doing the final right shift to account for units
>  	 */
> -	tau4 =3D ((1 << x_w) | x) << y;
> +	tau4 =3D (u64)((1 << x_w) | x) << y;
>=20
>  	/* val in hwmon interface units (millisec) */
>  	out =3D mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time +
> x_w); @@ -339,7 +342,7 @@ xe_hwmon_power_max_interval_store(struct
> device *dev, struct device_attribute *a
>  	r =3D FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
>  	x =3D REG_FIELD_GET(PKG_MAX_WIN_X, r);
>  	y =3D REG_FIELD_GET(PKG_MAX_WIN_Y, r);
> -	tau4 =3D ((1 << x_w) | x) << y;
> +	tau4 =3D (u64)((1 << x_w) | x) << y;
>  	max_win =3D mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time
> + x_w);
>=20
>  	if (val > max_win)
> --
> 2.25.1

