Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B02C5475B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 10:48:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89AE010EEA7;
	Fri,  8 Mar 2024 10:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TI7mm/zh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1826F10EEA7
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 10:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709894918; x=1741430918;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iXJHgKg/MklR8z3cEjQIacfADvSq5jTNpUWiDzHuk9s=;
 b=TI7mm/zhU0PNh5ns5oaGt0bTGxZ08Hs9NywVLOLznWv7ZOcvqz0YlSE9
 A5IEOQEGfH4PuPz2hXsS0YtAgD5x32P9/3zzjQKV19oLC9P0WKScnR52p
 DFMpDqM4fibnrtCY6+4fnV4Fq1mxdoPr3yODU7B9AoLpAKtQ1RCVsetlC
 H0rvQ3ibMaXxhRI14+hQosckNwHajjxMOYLIAM8Ca8lQb4HDaafQOqqgp
 1J1br9UgHS2QOwXRdtlQhr93trbPHvG/3UQbe88L8TX6Dt4W6gh4Wr8IS
 NqfuvGGY1agtPGrr5/CuQyOT7NprXmcGzhuEDFMOlux+r+cUggZeMulJ9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="7554682"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="7554682"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 02:48:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="15097875"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Mar 2024 02:48:38 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 02:48:36 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Mar 2024 02:48:36 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Mar 2024 02:48:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pvpri/GIUrRanElspqqrt/l5+ei54QYBox27gigkhX/fuxo4HX2c1G5ahfvBP0cdkhxMeQl+SKTZQEmuYeGNJFvz6ft5kYQY9QWEINnBe8n/99ABEOlpJvxmKS+CQh/VlCkRqZGtQ9yAD+aNnukgU7QcL47B5Xx4UmtcG9FeCFvUs1Xt5pFJAdm883+z4cFDCJj3zli6fxH8IgOm66Q1kFy10RqLe241gQeForQMCjF+blNbEhu3X6hV7U/GBr3BTsbM9Gm0/fw7gT6KMlqUaovqFoyQbfnr6h4yRmMg+tGkt9MTJuyEPIrc4SoKQsCAublpzoZpO2ORVtzcDa/utw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzLgC4bHZD+2gw1iM+VHmD2/MCKhpUQFsACTynpCuWk=;
 b=WfDdY/XM7Uy30N6FEWWozev1o938NOBvDJuQ3Rpuaygx8uiKipsa9hHqD/oFWpgCExVql+xXpuexgm2DhIMLE1NAnOcvzNA/RMpMzybfp+o6yokci+aqTX+Ptj1x9xmeU7PE/x4KLwGqEttqu6osrrg+uWKy99aXaAESabYOcy9qPZzfGdWHIxnjgVO31Sakc7McCrt33o4GPw3SVt5ZIoLGftd7VxurQFMCb+LTaaQFLMcDltwjzz3gKjXhAjnPpq+FyZvyXCPb9eQmDaY47pc9jnbysJKDbjdd3/GRnSU/JhlBhhM2GI4uaGrn/QQtb59gL8uhdkVQEkJDm2XNGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA0PR11MB8334.namprd11.prod.outlook.com (2603:10b6:208:483::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.9; Fri, 8 Mar
 2024 10:48:34 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7386.005; Fri, 8 Mar 2024
 10:48:34 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>
Subject: RE: [PATCH] drm/xe: Modify min various scheduler timeout to 0.
Thread-Topic: [PATCH] drm/xe: Modify min various scheduler timeout to 0.
Thread-Index: AQHacUWsw5RD7QYzf0CyIP+WfS/NVrEtqbFA
Date: Fri, 8 Mar 2024 10:48:34 +0000
Message-ID: <MW4PR11MB705683BD51C9992E53B9997DB3272@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20240308105744.2478794-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240308105744.2478794-1-himal.prasad.ghimiray@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|IA0PR11MB8334:EE_
x-ms-office365-filtering-correlation-id: 23bf3f9d-c21a-4322-a4db-08dc3f5d4d6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uh3wz9dLnpAF50X5JnQhDIOg/bsCorEpxTx3SUp+yDn4CyrK7V84XD5lfQRvw2PFG5aGl3uzMyf+858sne5tstTIcCQtEJyWgWhRlgey3UwN0jCnQtkC07W4SZo0JzR7kL/t9O/MMREoJWiFKlP5uhHpb26zk0dnIOQYrETGoj8/YafZh+YmcpxuTM7cKmRNt5yqkr8owsQ7Pk3grebvk5bTz4eWLT5mgQg5Le3FY4OtjwdUfi1C9hOJL+JL3ITgrPIiutX1sxFMufsnYAI/7QoyPcLIcAwubhfZAp2Rg8sI9vRKJYFZcI1/1dBlHzVJCR6ovW5fuCkttsoiTApwEwmBAi6F8C8PsYjeWXYzaudet2iI9sjmzQCVRuFhVEp4DA3GwsoxQ1RzmkhOf153n07VbWQXhay8/lIyRxEC/oEUxQGGTZYlwtAmoz477jpr7wFfcE1l2enY5Gv8V4BAm/c3d9Od4rcQwCRWIaKNc5IVUnA4fybdaGVvKrO5ssgiArj/srIadvdRbDVp1g/ADp9P/SEb/ZP0YBFl548Mmx2T/UCXYtkt5ic52IljCVC7s2J34PeSO3mECVuKp0jqEgXsNweLoY2X39IuJRmSLQKMwHRTbDitJVoY03G2OlYLk/fTWTHD81wSdDgd3sU8ecSGBJkyB4jxWBOJMU5P1mVo3Yektw0Vg7Cysi/O3mWxW3c+IeD7jv+mnDmPFN1whONIMa6crq7aR54MZI4CEsc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZDOOpYeGKwHSytS7e0zpz+Z5g+eACCbW7AWCqJkAWFq2V1oD15wXp4Y63HQr?=
 =?us-ascii?Q?5NaYsi7i5Pkuf2SgCYaZRe1aNd/pU3rCZC0+n+qLOyDwGpO7DhcXLd3xHjul?=
 =?us-ascii?Q?TPT1WujVQeMbz4pf072TR47yRhPgGuMr4upYRcZfKPk0ZYFaLjGwHT9IN5kR?=
 =?us-ascii?Q?BKS6CyNrts+ZeCtS10WtlA4fyDqEgz6v/Ma298QHvUj+mqKYXgu4P+Wwwl4f?=
 =?us-ascii?Q?az89QzA6wKA2CKPhDMeKOUgYpM3zNdYepswzoiVEhOaTo4swSO7krBfwUEjt?=
 =?us-ascii?Q?Y4eNoCD71T6F/2gC1GPcrLMHrFVZw57EDd6HkuUPxeHiIna01hw8qkYmrj6q?=
 =?us-ascii?Q?WaarrrNgZrA7GN3pBJwqV3Eu+A/g25CTZLgLWoENeDT4PnvFd4YgVkUAKvbz?=
 =?us-ascii?Q?7bKrMeKMAltTp1a7NF+LSoRQ9MEvp2kFWuk6Crp6ieppSZ2ODmWbBNqMdky8?=
 =?us-ascii?Q?eq27qgppTGyh0tQAvrkmuoPqujZA9vuoJK/dnvpZkek22bi6oFjk668p+Sgj?=
 =?us-ascii?Q?0bfWfsDHP/OYSSrEVl02lh5R5wfk6w7gPF1ZRhecinKDoww8cp2Gs+LDwNKw?=
 =?us-ascii?Q?PNqsgYmRKS/45uNIPdSCOixCkkF9MBftNl1saqk24XR5ma/OFygfrCGIH6jO?=
 =?us-ascii?Q?KgB2ZjeXAqWSH00EZcQhltP+61m98ZZL7giBp7P24qsMl9ZbMbDb0JMJID8i?=
 =?us-ascii?Q?8t9xHJuMcPTjiWKDrN9wzeNUxu6UMg+sxDPEE3cek1YISc9DMl9h0szA2p2a?=
 =?us-ascii?Q?3+dVXboYeJafCurWzjazXloCmWyGTd+cnpg65TqawPtZDaDlA8oBXZLcHQQG?=
 =?us-ascii?Q?OeymCPK8LKa+ttcX0AOUYc8XokPZrrPrN7OP0Zj+93w7Z+6L6vfxgv3uljgH?=
 =?us-ascii?Q?5+IDXdbbswo4vNBx9xUQO3Kv2C0nLWqUWbPBXJpZxt5iHMs44LOcsqFKLxvC?=
 =?us-ascii?Q?acj2gp5RR5B4AGe/Y8RgaMMyHIHzLE/P8NeTg8e2US288Ikw9NEHj50lvNap?=
 =?us-ascii?Q?f1IM1L7QP41gmC3D3amPqVM3Cv8ABXQyCLzBujfTvmBCzuXN8qrSBpI6Cop8?=
 =?us-ascii?Q?9qTwAdQSnZeyu5UGx8NNgyCu6T7gv4EUay81GQpAe695CrhtDItHZZWGgiSh?=
 =?us-ascii?Q?Dz4jXZy6xYkauZg6GNZJ3BNdhiRvIEv2ex0OaBJzuOm61GhBODtXT9dudUM6?=
 =?us-ascii?Q?gc3luKkEL1+o/C8iJVoIW9JTApVnmCnnC5Rulw3eG/kcfj07CE/9laChtgjs?=
 =?us-ascii?Q?zTYTRFLb6+M2z7Zx7reF3+oNp+PWMBs+jivD39Imp/eXbAFVdKYx5hDD+AX2?=
 =?us-ascii?Q?ijQ0LpriQqZXYYYpoYfNEsZrBBMkMMEuZ8j6io34jRcn9XzpuZ+pmmZ0jEIe?=
 =?us-ascii?Q?P0fk9GS1AfSZvvCXaYW/rkQvPdhG3lQoqY5T6VlOh2HvKNSNg9BccFZmsDH0?=
 =?us-ascii?Q?1na0x1sKEsHIKBtFCiIgsf1jTwP1Pac4oUtwE1enymZxB1blDE9C1Q4MkcW8?=
 =?us-ascii?Q?FzYvokNyFHBCa83kwh0Jn9YbSqSitfcs7Mk5BxhNH1HszlQy67dh3wdCSMGS?=
 =?us-ascii?Q?DqeNP0/mR8x9UU2lH+ARc1j8EX1DxqDzxNP8/uySDsc40xu2BoDphjzE48Io?=
 =?us-ascii?Q?Hw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23bf3f9d-c21a-4322-a4db-08dc3f5d4d6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2024 10:48:34.2696 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S7MMPW7oFi58v2jAwcrlSHLLNeNJS9lDHtvbJFkFeUJ6X02JDiUIr5MNvE6pTdG649owKbhlVKBSf6pFRdJDQZvAfL1IM4z8O8ISFL1w3Iw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8334
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

Please ignore this patch.=20

> -----Original Message-----
> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Sent: 08 March 2024 16:28
> To: intel-xe@lists.freedesktop.org
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost,
> Matthew <matthew.brost@intel.com>; Vishwanathapura, Niranjana
> <niranjana.vishwanathapura@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH] drm/xe: Modify min various scheduler timeout to 0.
>=20
> The sysman teams needs to disable preemption and timneslice to test
> exclusivity mode and are relying on setting 'timeslice_duration_us'
> and 'preempt_timeout_us' to 0 for using exclusive mode. Hence seting the
> min configs to 0.
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig.profile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/Kconfig.profile
> b/drivers/gpu/drm/xe/Kconfig.profile
> index ba17a25e8db3..80e80b55467f 100644
> --- a/drivers/gpu/drm/xe/Kconfig.profile
> +++ b/drivers/gpu/drm/xe/Kconfig.profile
> @@ -18,7 +18,7 @@ config DRM_XE_TIMESLICE_MAX
>  	  contexts by guc scheduling.
>  config DRM_XE_TIMESLICE_MIN
>  	int "Default min timeslice duration (us)"
> -	default 1 # microseconds
> +	default 0 # microseconds
>  	help
>  	  Configures the default min timeslice duration between multiple
>  	  contexts by guc scheduling.
> @@ -39,7 +39,7 @@ config DRM_XE_PREEMPT_TIMEOUT_MAX
>  	  run.
>  config DRM_XE_PREEMPT_TIMEOUT_MIN
>  	int "Default min preempt timeout (us)"
> -	default 1 # microseconds
> +	default 0 # microseconds
>  	help
>  	  Configures the default min preempt timeout after which context
>  	  will be forcefully taken away and higher priority context will
> --
> 2.25.1

