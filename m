Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D953CC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 17:54:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCAA10EA88;
	Wed, 14 Oct 2026 17:54:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5503B10EA81
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 17:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792000460; x=1823536460;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0z3ZXyjyt/YpAnHrR+w4EhWQreCsdxpBwqQ8xnMo2lY=;
 b=G2cFCAFqIatKE1nn7T21gOnCOrUQfQdZ6XoZepTnSjWzzZBkegB/8FSM
 qJOXYWqgF/VKmC73kfqrMs0X6Wfig7tHo7SXZeZhR1ftnPp3w8/BWLgcx
 oUmA4KXhnxGdmtboz1fOHgaiqQ1GzK2wb9XxoKceYHakdUudXZzsdF+I7
 SDNhBAm4mWME38Gj48WMkVXt5aNhDLNN9ZWtvHvZuwT6CnU2ZPVuLEOk7
 Hk2I8XcNSM0Y2DZmzxM2yXlr0NTAOEvEk1MlknyuPv+jB/gqpuzMch2X1
 Yr1tMFvnXo7zSM0FXXsvAK7xjUuc9M2K0h3EF0d7W0pekWoSl2bGENGBc Q==;
X-CSE-ConnectionGUID: lNACML50RUSmW8SAXHP8Jg==
X-CSE-MsgGUID: tnGHBFY+ThiuZQWfQmlfQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="760961"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="760961"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 10:54:20 -0700
X-CSE-ConnectionGUID: bug7pM7HSLetKa8AYfyrnQ==
X-CSE-MsgGUID: PW5chIThSuuH+iNf59F/jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="3235422"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 10:54:20 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 10:54:19 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 10:54:19 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 10:54:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ldaEhnt4Ie/4hKgIHuUOAdjiJoQ326RdToNFYopXjLnMWo7GyzhKS0zfLBGDkr1EuxWxYJJ0hIqQBGXApW2sAW201HV+4AMhAODyLvk+G/xaS1pcaYYVVqeowqoOLtL+w9UI7NywipYP1r1F1FLXMVpcJW/a9+UljsmbKg3diiig37WGi32fO6CulYjseMuI7MwLjK4D/k4UhGoL78u37BFjFPDSOyMuvll51sSeS7z3uRbZhE7RbIVc6WhE+kGjsHgpK4sYyhdTQw0+E9oJAuCzbwNca+YWXlS4FcwScwRfpddv1kq5Pl+W7Tv6wHRz102Ev1WPUBjlpSrzBfOIcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SldlHtajcP1sXCWetUMvFEOYqc1DOQMBadpgtPDw5fw=;
 b=fC6gd9F/S69kv3GOzd5R0z3IPzkJ7l0xg6LcTmyeXldcx538MtBz0PtCUa6ml52c3ecrjxefxVNOECcjIthGdAKShfn8eErxhdzFkX2eJxjHRTFJ2Ty4t0xlG7sG17Juhi3GfSDU4DqT6fV9WpWTiAb0B2Gv3byhghVGXy7gP81hLeQVl+tu2Mc8T8QtMs6/TyVXO2uzXKyxG8QUamkTqYBaggjd6xUhVmcUOsRElG2YUsAN2VjagAavHq0cH2qD8Ckyyx01feOPpRokSIK68n8q1L8FQsmemVecfZY7KAbIjT3YGWqT0/yuNBsypRWsAM4BA994nAhJbkvzwg1lsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by SA3PR11MB097687.namprd11.prod.outlook.com (2603:10b6:806:595::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 17:53:30 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 17:53:30 +0000
Date: Wed, 14 Oct 2026 13:53:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>
Subject: Re: [PATCH v13 15/16] drm/xe: Validate thermal sensor count before
 reads
Message-ID: <as_Ble4LoxNVp_2p@intel.com>
References: <20261014115806.831459-1-karthik.poosa@intel.com>
 <20261014115806.831459-16-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261014115806.831459-16-karthik.poosa@intel.com>
X-ClientProxiedBy: PH8P221CA0004.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::9) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|SA3PR11MB097687:EE_
X-MS-Office365-Filtering-Correlation-Id: 71c78f0c-e354-4981-d215-08df2a1c0e63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|56012099006|261009223027099003|11063799006|4143699003|22082099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: obWNTAb93dJX8+Es+zhUD8RLKWWPhG0svg4FDhOQrB1htPfg4AJ8VwJLLHU3+wlWU5+OhNJm34JlsXlcnXp4kIaRNFMEhnGiOUS+1wHtO4QWgZDMvVJukJNbm2yDXHKfas6vlAtfoqLN5CM7p2xfkrQbZFpxKX1mxDzZ5JPmmNsSb/1odHIbhdZ5zppMXbWXn4qR74ovGBOzavwe22oKadCZqTDA0QDhFfIn6NiyIp1t35rSU2luJbSSNxYYduZDOPoPN8P11dgGeiB5c9rarEIkNoFmm4SKlGwSk6IFZu+VHfPsJygvPbwj5gtMHC0HmaZ/Z3nHnq8nHdsN0NeCowiFB2fwC3h0dNjuqE9kUhyU2QFsjcgLmxVHD/qTRn2sLn11ZHqwzEAD5Hn73WRKu7+gq13FWh4+6UEqGpvMN5lE2CW8hSQLYBvDNuLOm1KyTwgZIw6FIAjXgVPpUk+QnRoijINx3rqw4pdksm3GeQl+ilLewrUmtZUVCWzx57U+LnyI88hob2LR4bebie4ZDGqQsBKjO7WDmS8wUAaR+JQdVA4loEJBjFnIGFNpSPyhbEg2IihLEg1+V/Kwbmc7orX5/dEyG+etOyGZjU6XbmthCtFWSIoduCJTcf54wWWq4pRDGAnUDenxFQ6M+pkRe/a7MjXpWpk1KiH7+SD+DDc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(261009223027099003)(11063799006)(4143699003)(22082099003)(10067099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s1QHxk4M7GHzZR0uAiWf0LxTUAfcwAkTCIFWT8rMKSSCAD4SOzIpcepGT/MB?=
 =?us-ascii?Q?0bfsZSS0J0oJf+/L4vwJ167s5Z+FmCpVu8ZSxMPJL8OpcnXr4gYWGy2o4YeP?=
 =?us-ascii?Q?RJX9xbURiv1XpXnJHYE1HghZcTYcLt6ISxav186iqEVQb/o8K91dzsivtW8Z?=
 =?us-ascii?Q?wAsWi6WmTnIlpkv7di7MtlMG4Y//8VVIcgjKsUs81pajhSFeaDy6GXUbaush?=
 =?us-ascii?Q?lxEKVIndJW28J24RQEOA6uFm6HDe5Vfa2Q/HRKeUcLPKokq9gpNgQFTQ246F?=
 =?us-ascii?Q?AZ7BoyRq0eMcPY2joNwIqvjuefB0q162pBLWGIqKo3ZOv2YVWEdGSg1rnT0+?=
 =?us-ascii?Q?d13Ih+ghHk68B/1RtD2FoR+wvDJHzEPa0Lbp0Om1aft60E3jsGsWVsqzwozI?=
 =?us-ascii?Q?gfRDhm8qffPYvu6+IREhdkhV14l33Cgvfkdbqz3WTXNtMEWx+MKzL39YYi6z?=
 =?us-ascii?Q?ciZ/RIzrwijN/81NXBoD1guwbOsV5sGpAtO/Ay0VmSMVAKvTJ5tyKkTR6Vas?=
 =?us-ascii?Q?wU6K5rItGFILLn8hQyca8lbJ5N73EVXtPH7eE4LsjOGQJwHfJJcF0K1XMtn2?=
 =?us-ascii?Q?DQilmiAlAu392g0wvhveiEpjX9ct6hb3bPNDlzQT6olbobDYjxT+GYhwwZmg?=
 =?us-ascii?Q?ZzBUhOWeaOTC7rphMRa3Mbc5OgDhF0jYnWFXyOIQLjJBizu7Ip9xnHqFUSQ2?=
 =?us-ascii?Q?KHYma8p6ElxXhZutawhupVxwo2ddpbNj2GMHSLRyBPrBMQWNg8fml1v+LFjr?=
 =?us-ascii?Q?RT78sfLKQXQ9yfDXMDgm9mkWE2Oe+MQGI77nY2vD9VJSk4qFIg/tWGXmarO7?=
 =?us-ascii?Q?w1MYvhFDlPxGexS+7+CAwAmmqMrVOdh37bqd4kXdx0iG46O1gbptbQ8pP8lK?=
 =?us-ascii?Q?PkdjaORT0i+UxQimgVMgF97m+F0ARVIhXGZAjUANITFZh2SOMp9el3VsD6d6?=
 =?us-ascii?Q?yupI3qOHJnDqynpYzc3BeifV9BdmvBGAmTKuJHeL7gYm4dwu6F88+J8xAPzr?=
 =?us-ascii?Q?EDO46W2D6yX8z85KrDZW3SBynNCS/Vwmes2hQeOw5axxDBJIlGk/ZIkvoPvb?=
 =?us-ascii?Q?l3IC504xgblbdl5vONTNIECeVcbtSVmO0vrdGuJglcS+5uhvgt3WIgVUE6a7?=
 =?us-ascii?Q?h6NGoyvhUcqedTE+SEiA2WAVL+qP1NOmJKjjidLIFlL3LxTLl57gPMurJdGk?=
 =?us-ascii?Q?naWXPKtWNGjWyk2Cxt/Z3it6iDrOQlqvWRAKM9B534gbvYtvwaWUis2YABrm?=
 =?us-ascii?Q?Wv6Ujqhry6niVzSCVr0Tcry37cd20geH5cl8GLZC82jgcwz+C+cPJrAldh4T?=
 =?us-ascii?Q?by4PR2gL3kCJgzFqvl/LhGgn3Wm9fOFe/PuNloIR8TG5uQRq/FU5dO489sKU?=
 =?us-ascii?Q?na2f2r/S1nra/r5rYOk+FXh7jdk9wepCaAEwpbtP0lSxstNtLtXiMc1X0xDS?=
 =?us-ascii?Q?xmXt4nv+UF84neuhB9rI8f2be4y6WzsG8EcIsWTGPqZan6YJ66uPccUDAfz4?=
 =?us-ascii?Q?FuhLVlWYnkoZW6EKZ7hPLP4Pgh9TufpsIFH3c0YhDChASyNR/voeDF66eUB/?=
 =?us-ascii?Q?vg2+xhOxfkfeX/TLvy2N1eBWwCHjCYV+A3QbslVUvVrvi/myXwKNpOLddcI0?=
 =?us-ascii?Q?HXUnCQbU30jxRYQ7awAM5kH2hrmLpFlynyb0r3EgcOTlSHHVIlGOeJY3V+b3?=
 =?us-ascii?Q?irJLDfiKlCbM5zRz+J4xYD3z+nf6Fird24jI0bzgptvwWl13jE+5QTRPAgjb?=
 =?us-ascii?Q?203Rp+bRrg=3D=3D?=
X-Exchange-RoutingPolicyChecked: ytRXgKM/CnLx2ZdpI+7zm0afEPxNXsy9086Kfl5QTE+dMgrAk+qjhMIj1io7sy/mxc3wzLe00at1cWzvgejtmrdsC+9UpiNX36rvErOPGcRnhFFoTZHDRX+qwEBDSuHidkMRJx5MnI+C+2HMYPqSeLqmq0tcFE5nAAHfGp10R7u8iTXgGzKVWxaMHtt9K1nzRlycP3Q9GuSuT7Kg5uW49QLM2u8N7EKdGj26g/5U+63veWcgOQd9p+a0ZOtN7/2Gzv5V0AoJeRqXDURUbCBKcRrjKX1CPF3isBme1ABssLTqVnhvnKLiD8NfZtiT5xm0wsL/WUw0Epn1hihKMnl73A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c78f0c-e354-4981-d215-08df2a1c0e63
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 17:53:30.0561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wM3ZeQ0VaKTJshQvGpDnuDBNIV4A3k7xPTCU87UK3p/rC5uTw3mzpQfUKtWrc8xx5Z9V4mkBM56+BUKRWNj3OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB097687
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

On Wed, Oct 14, 2026 at 05:28:05PM +0530, Karthik Poosa wrote:
> Check that READ_THERMAL_CONFIG reports enough thermal entries for the
> platform-specific MCTRL range and PCIe sensor index before reading
> READ_THERMAL_DATA.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
> 
> v2:
> - Cap the memory controller sensor range at the PCIe sensor index so the
>   PCIe temperature is not averaged into the memory controller temperature.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
>  drivers/gpu/drm/xe/xe_hwmon.c | 44 ++++++++++++++++++++++++-----------
>  1 file changed, 30 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 4249faf9fb39..4b9c18230ade 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -920,6 +920,17 @@ static int mbx_temp_decode(u8 value)
>  	return (value & TEMP_MBX_SIGN) ? -temp : temp;
>  }
>  
> +static u8 xe_hwmon_pcie_temp_index(const struct xe_hwmon *hwmon)
> +{
> +	if (hwmon->xe->info.platform == XE_CRESCENTISLAND)
> +		return CRI_TEMP_INDEX_PCIE;
> +
> +	if (hwmon->xe->info.subplatform == XE_SUBPLATFORM_BATTLEMAGE_G21)
> +		return BMG_G21_TEMP_INDEX_PCIE;
> +
> +	return TEMP_INDEX_PCIE;
> +}
> +
>  static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> @@ -935,7 +946,14 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>  		end = CRI_TEMP_INDEX_MCTRL + CRI_TEMP_MCTRL_COUNT;
>  	} else {
>  		start = TEMP_INDEX_MCTRL;
> -		end = hwmon->temp.count - 1;
> +		end = min_t(int, hwmon->temp.count - 1, xe_hwmon_pcie_temp_index(hwmon));
> +	}
> +
> +	if (end <= start || end > hwmon->temp.count) {
> +		drm_warn(&hwmon->xe->drm,
> +			 "memory controller range [%d, %d) is invalid for temperature count %d\n",
> +			 start, end, hwmon->temp.count);
> +		return -ENODATA;
>  	}
>  
>  	for (i = start / sizeof(u32); i < DIV_ROUND_UP(end, sizeof(u32)); i++) {
> @@ -967,30 +985,28 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>  	return 0;
>  }
>  
> -static u8 xe_hwmon_pcie_temp_index(const struct xe_hwmon *hwmon)
> -{
> -	if (hwmon->xe->info.platform == XE_CRESCENTISLAND)
> -		return CRI_TEMP_INDEX_PCIE;
> -
> -	if (hwmon->xe->info.subplatform == XE_SUBPLATFORM_BATTLEMAGE_G21)
> -		return BMG_G21_TEMP_INDEX_PCIE;
> -
> -	return TEMP_INDEX_PCIE;
> -}
> -
>  static int get_pcie_temp(const struct xe_hwmon *hwmon, long *val)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>  	u32 data = 0;
> +	int index;
>  	int ret;
>  
> +	index = xe_hwmon_pcie_temp_index(hwmon);
> +	if (index >= hwmon->temp.count) {
> +		drm_warn(&hwmon->xe->drm,
> +			 "PCIe temperature index %d out of range for temperature count %d\n",
> +			 index, hwmon->temp.count);
> +		return -ENODATA;
> +	}
> +
>  	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA,
> -						  xe_hwmon_pcie_temp_index(hwmon) / sizeof(data)),
> +						  index / sizeof(data)),
>  						  &data, NULL);
>  	if (ret)
>  		return ret;
>  
> -	data >>= (xe_hwmon_pcie_temp_index(hwmon) % sizeof(data)) * BITS_PER_BYTE;
> +	data >>= (index % sizeof(data)) * BITS_PER_BYTE;
>  	data = REG_FIELD_GET(TEMP_MASK, data);
>  	if (!mbx_temp_valid(hwmon, data)) {
>  		drm_dbg(&hwmon->xe->drm, "PCIe temperature not available\n");
> -- 
> 2.25.1
> 
