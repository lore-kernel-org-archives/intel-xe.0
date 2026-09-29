Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D5ECA5FA7
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 18:28:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6851810F014;
	Tue, 29 Sep 2026 18:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jUXELA5V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F2C10F014
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 18:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790706500; x=1822242500;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=k/pn+eImfG+4PB+9m8vI4SUPv3kKJsl06YLyusGIMrI=;
 b=jUXELA5VemoM1xiP0m4C4ID516D/BfirvLKqO4hoJssbvBUvQzPfzP9e
 4rlpD9e5f5HUHOn8HB7bbjuvs8hUu9gJED/hBKS3aoCf6Xaa9xgCqgJAg
 80FrLH8Kg+ffdFmq+9SHh5NsWOijrU2VsyZ3n7TDW12kVT7FarHgvQdVK
 9eW/l/jZJg/TQ/IueN0Lo4qxF2jibGSjLfB457ZvHcjrzMWIHfO6zt5kA
 ULm1/gLZd3veDK9PjSWPJc+Eq3kCffSAJ38hQ3vOqr3o1VOLbO4bNhtQj
 sliNFIVJpOsmpvXIgjZL5gLON6R5RxRJAFzAOethI+Nj1wiNuE9vY7yzJ w==;
X-CSE-ConnectionGUID: doAdcE92S2a7rXf+bvHTbA==
X-CSE-MsgGUID: gkxYDQj2S3uo+FEj+HSm6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="101960011"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="101960011"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 11:28:19 -0700
X-CSE-ConnectionGUID: felhpNUSTWmuyooSxYN3sQ==
X-CSE-MsgGUID: kIqriM4tSYe6yHgB+WtMmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="301705923"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 11:28:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 11:28:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 11:28:18 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 11:28:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdoWTDp0UGoRg5ITMiBPQxk6rFuCi73vRAH5LgHh+AxG5+LrCR7bMZHkmwJnzzNAOjJqFq4E1it0X1zmMW81j+a4pKk5E1OSXW7umP7Td9BrVUh5vxugAPFzw8LG51n2qm2cHeVWSUySjxxZ/M1I0+qcBj9bQ4sbeeV2x1i8I3BLKsp0L/4EiWwUJWrMSefUmlIunikdgPTaVSlH0RFK/WgtBZcIMxKxr3JA3lewr12oew925N5nSgurOljETDxuqjTflYB0yPPm2ypZrviVRklEtrBAHXZCNi3mTnjLxGSOjlp8YsU9bsjaEqUc3qzbjXqxr7PPTsR6k2IG5y9f9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3J5IWdST3hOoTmvL1PPtNGm8NFwPiciKcp6sxtBVYao=;
 b=BCQXa5B6KyAF5lmY/6hnjEf9qOZCzEU1gqSIvH/mo9HtONTnNStZknFrcnp+17iypr0YZn0z50x8byu6Tb/BkcTvuhzXBfhll39W2Nnl+CW1YW1eTS4zkKoqkpKQ+Fhexvg9jyrs+P+gChLJaH1G8e2wP2XRhBVFLK/78xa5THJYUBVp+5zOylmfTkkfyryKLTlbOQR3mdVwm0VV+I9LUJRkLIrBnif33hmBHiAUyBy6JNz/qDZQyHdu+wtJALqrMePOpGLJzqAyYu31+faP1FnLqaNV3vPUvAzFGJVlkomUZSd4aZORD41ryMejkZtpTXk42fi2e6wuyKjmuHEfmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by PH8PR11MB8037.namprd11.prod.outlook.com (2603:10b6:510:25d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 18:28:14 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 18:28:13 +0000
Date: Tue, 29 Sep 2026 14:27:58 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v6 12/13] drm/xe/hwmon: Update memory controller
 temperature offset for CRI
Message-ID: <arwDLi65aga2Gfna@intel.com>
References: <20260924205429.2846256-1-karthik.poosa@intel.com>
 <20260924205429.2846256-13-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260924205429.2846256-13-karthik.poosa@intel.com>
X-ClientProxiedBy: SI3PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::12) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|PH8PR11MB8037:EE_
X-MS-Office365-Filtering-Correlation-Id: 64e6b1db-947d-45d1-47d1-08df1e576be8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|3023799007|10067099003|11063799006|56012099006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: XFCNLQmlcv2WPByf3WQYC2GocHpQXGSYw/GIzgS+nxUf9tQuS95IKjvLdmXuJtLRPUch+HF7KKTtezTCJjEirPtPwp/UAEiOKvd4jjVh4DFtxrx/XZ/ATVdyNKiL0wTTyC0D348e+ltc0XksOIztEo1rD2GkTeot7HzsHc0BDUYml40xCxun3GiBnVN3UmPiLPn6/mWsTDKpp2fh39wbZ0xlZYc1HdlsHqWni+we4IDVTQAvCWsHLTG5367NZYvdMY7GG6wX53hD2GfH/vQMJUWInk2HS44VfJaEik2z7jlO/STTEJbPSONJj+K4ZgAaKPQ9UbxAtDn0GSK+ymytnaMjBQu1O/k1nFhTP+g7I2IzUoxZeE3jhZf2pa381jDv5az8dWXBhOCBCeXRR9eQ8RSHUpxo5G+HwJQ+zbPNP7Z4IPQMZWDfHSZkvSSQwy3Qa4TxQFjCgIy8NMWj927IOA2szHGwzwz0gKrma40oJug1nvQUJrkLtCmjXBDika0C8X0gP1EPNy3Tuhd2aiBSPez6N4DZ6Ak1++V3pDRYYm9DAwzCjQQytBHrDcdf6DVnEOB95YttyVwQJhFQZod01ucje8231AVktnBrjfRDzjCsJ/iyKnP3TYEPTVctiWXHqytacMEcGE8+tiPpZbxZn5Xui3a3Ltb8UqC8/eb4uTs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(3023799007)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tYo/W+fhBdFNqrxl9bZxxEFs+qipkuvqoeb8KFnSY9ZwIHTrRwdbcdVI9fLz?=
 =?us-ascii?Q?6fALfhF3exrM09kezNNVfIMytncRGSFhNIydMj+LTCSUDbBPD+QIor9tb4tr?=
 =?us-ascii?Q?cW1X3dJbZwdUSAhx+f5PMXR4hotC2nwbxx/tfyOJrk6JQIKAMWLNeatQuBQQ?=
 =?us-ascii?Q?YQY+j8ITMLc9WZ5Fu8dG2s0ptCVg7Ha37KYA25C/f9hrx0/iVk47ga7hSBWF?=
 =?us-ascii?Q?z+MZE0zbAj/kjOw+mkQIvRnNyVnUDfcqeqywLunYuJlBvxqCUrf7gxCh2E2W?=
 =?us-ascii?Q?dCCUB/WhXOBdqIUIKrPERMaIQASVM89er319YgbvU/PkutmcRgBnJ57o4h9e?=
 =?us-ascii?Q?MqcCc2jo/ZOMbXrSfViqDY8iQ+M0nlvMaCTZLgvah8/sSDRd+VBedsixJ4kp?=
 =?us-ascii?Q?ljD/MqwiHuk/yM+qULFt000j7ZOczM7FbRVNddF+hylCqHd8T3MlH3MmwYf/?=
 =?us-ascii?Q?BS8NJjA43UG1PcuAbZZIeuQkPERcQRiM+cRStl7WKxSHeNUrM0ylcyM6XFcm?=
 =?us-ascii?Q?8bTCKZdTZ8wKSdFjWMaE+sORx3FOG/7URinSBz+qQdJn7LU+54Mu/UBaG/oA?=
 =?us-ascii?Q?ai2rjSoe3vPg+dqD7WRTnfJVzouhnLFcsjMZAwKMo4Tvg65hRtsraGm+FOov?=
 =?us-ascii?Q?guGw9wEjzcc4dNijg7haSM5nahHAxrcG3H5Z5/QB/jw6fdEZkxOy+OfbZYef?=
 =?us-ascii?Q?4zZ9FQPQTTvXd+SOblu3DsvOO7AvabpHP/8Im8IbQrVCGkD2ZHbrtiX0PH5T?=
 =?us-ascii?Q?lTT7O8WfJ9Imw+u0VsQv2mJ/K5wRvUiFno4auYSHzH0B08OzY4Qnfy1V5yFb?=
 =?us-ascii?Q?R1UbcgecntrvGGLNKVZJSP8Yk//xTtzWzCTQ0AkPCRtnJMjBLGSL7dU+dJQG?=
 =?us-ascii?Q?h/vd1H9f/cl3tmEwLvS7QVzdck5U4md2OZeHvJy1kOSqE9tHrWUP0purgfLG?=
 =?us-ascii?Q?v1XNHh5ewsr45+CkI6fx650jyYQh8brmsQUX+HS0v+4vT2uh4eA1cx9OUY1q?=
 =?us-ascii?Q?XVYjDUT2ySNh1yrTQ2BQBpFmvyNS9UQD1pFKr1OgWNmF+8oCoU/Z3WniY6qz?=
 =?us-ascii?Q?OKVAL2qC/Sbyuf77191lznuoZZ8wNUjRT+1k3t/NoFhXsmcFdUg0Dzbx83wG?=
 =?us-ascii?Q?WMRX40QxP3NeyLJsOEU5eGvpWuzBcBs7/Cj4M9yy55T7vNqSGm642zLbstvD?=
 =?us-ascii?Q?xj8Tn0K3O//BdCkLhOe/4wZsRjFzD9ohV1mXJ3Mqw61Rcq46lXx2nTjY4IOR?=
 =?us-ascii?Q?2NPcO5ps4mfgBURS0zdOjY27tWfkEhCeFIvjyb9GEPNMX9rE7Uzh4MpkWKNO?=
 =?us-ascii?Q?/0U338G9AZQLfwToKEdFHUy9+Tk7gYdoWq1whG1cJtn5Cfhk+iWkS8+vPM7z?=
 =?us-ascii?Q?xRuQJQpSEl+Tu4wVTaYIpF3J3am3yNeF5OeGhtnFNth0XJuTf/3qwd7I4jmw?=
 =?us-ascii?Q?1qePMF9GxznpHTq2MsBmR6M7sqVUm1Yy0FBhH0IoZP+41kcUD9dA5/5Wd9Ze?=
 =?us-ascii?Q?IR2BfXdixw75rgWEyT4dIHTYIPHfuXeLnm2nrB5dAUkC4vP+hq+iU0hANxpJ?=
 =?us-ascii?Q?bXsPcpKFT/AKpkR86WtOciupPkOB7l/pFFhLlGiMT9G27ilAKxj5ZWujRLUs?=
 =?us-ascii?Q?nikYSkPcdQtICtcG9LP+PpCzTYG2vjKTOAoK3hNLmxbrmOX5hTV8IlO2zQbp?=
 =?us-ascii?Q?cdbfDpJukZ9OgCGZ+oTyecv8N+QMFUWyKZ0Sy1EdHWJenM6fnKjyymGcDTeE?=
 =?us-ascii?Q?s1hgwD1WM808AKRe1vxmAbmdCG7DWe0=3D?=
X-Exchange-RoutingPolicyChecked: Btj2cvp5B5YRqwqmpP8UKjxAzQfDzGuyIqyJx4Yh1UHkceYLe4rHPwzv9waoIE9lLP21w+jC87/QSbw6tKawd+50SgqiZviOALwangv3LuxWw9ufnIe0Tvm52qWe1rbibKVU5eDfQLPKSCh1R1l7dTY2TweEqffikJpwD3fR9DX2VO6kmTmFsJFBAqR8HOVzvEwi9+zyxU6OjkwT8BGIZERFrYbYkvi3qq2DfhkI6IZB/pAgOXI1f0VINjrc7yEtVPLmrhNMvG6ZT2yytBqTSlLkakhMUJW1dIis1vrVtA3XmS7IBrf+O6avC+ljS9y7OYA5+LcXg3w813KQsPgTLg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e6b1db-947d-45d1-47d1-08df1e576be8
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 18:28:13.7673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oYkYUC1j87cWjSO+QkcnTNQsjtpdXKbweQeXy8LSLNs9JIT6bDKk4zKty54fHcnoqxo0ALNpHefe0gTD3nvgsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8037
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

On Fri, Sep 25, 2026 at 02:24:28AM +0530, Karthik Poosa wrote:
> On CRI the memory controller temperatures moved in the READ_THERMAL_DATA
> output: they now occupy bytes 16..19 instead of starting at byte 2.
> 
> Read and average the CRI memory controller sensors from bytes 16..19,
> keeping the existing byte 2..count-1 range for earlier platforms. Only
> the group(s) covering the used bytes are fetched.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 76251d949b11..79240d4aadd3 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -109,6 +109,10 @@ enum sensor_attr_power {
>  /* Index of memory controller in READ_THERMAL_DATA output */
>  #define TEMP_INDEX_MCTRL	2
>  
> +/* On CRI the memory controller temperatures are READ_THERMAL_DATA bytes 16..19. */
> +#define CRI_TEMP_INDEX_MCTRL	16
> +#define CRI_TEMP_MCTRL_COUNT	4
> +
>  /* Mailbox sentinel reported for an unavailable temperature sensor */
>  #define TEMP_MBX_INVALID	0xFF
>  
> @@ -963,10 +967,19 @@ static int mbx_temp_decode(u8 value)
>  static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> -	int ret, i, count = 0;
> +	int ret, i, start, end, count = 0;
>  	s32 average = 0;
>  
> -	for (i = 0; i < DIV_ROUND_UP(hwmon->temp.count, sizeof(u32)); i++) {
> +	/* CRI relocated the memory controller temperatures to READ_THERMAL_DATA bytes 16..19. */
> +	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND) {
> +		start = CRI_TEMP_INDEX_MCTRL;
> +		end = CRI_TEMP_INDEX_MCTRL + CRI_TEMP_MCTRL_COUNT;
> +	} else {
> +		start = TEMP_INDEX_MCTRL;
> +		end = hwmon->temp.count - 1;
> +	}
> +
> +	for (i = start / sizeof(u32); i < DIV_ROUND_UP(end, sizeof(u32)); i++) {
>  		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
>  				    &hwmon->temp.dword[i], NULL);
>  		if (ret)
> @@ -975,7 +988,7 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>  			hwmon->temp.dword[i]);
>  	}
>  
> -	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++) {
> +	for (i = start; i < end; i++) {
>  		if (!mbx_temp_valid(hwmon, hwmon->temp.value[i]))
>  			continue;
>  		average += mbx_temp_decode(hwmon->temp.value[i]);
> -- 
> 2.25.1
> 
