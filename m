Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4CACD343F
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 17:16:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBD110F7C2;
	Thu,  7 May 2026 17:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GIIbnUGI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8168410F7BE
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 17:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778174214; x=1809710214;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nxXnZkciprRyT75yF3t3v50yvLC+1R7rOXICkWgVm6A=;
 b=GIIbnUGIKzS3u7MwU3Xtm0AyQ1vGTGof6jgn8NdsPMEcyh9ketIiyY6L
 JJk8ra0611//gtO4o/MZYVWgTScLXSnCgqtgIzOgnCTepcTPQwjZMamrA
 IKC8iWqn+uJvwzNjtYIVL6v2bCtVnP5PjHSQCmVBZAg7Fn0VZ4iqd4HBA
 ojg5gs22Sz1yrzjGI9ibVqrtrp6WCiiJAb8CM/YgEYO/czOhJCblNyzeJ
 mvZV8yVq3XFwo8V882O8kYDiJgCwEI7gCDPCjCjMrSa3ASHDJt40BPPuX
 C7EpZn1KEx+1DtYDAQykzibG+vLWn/0rt2I8eQVOrMcpEEZwQrxFKzPNK w==;
X-CSE-ConnectionGUID: wmuV8oCkQ+y3S+aZ4ajR4Q==
X-CSE-MsgGUID: MF+VMQKQSmKgbkBwbTFUIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="89829288"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="89829288"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 10:16:54 -0700
X-CSE-ConnectionGUID: jF8kUt4LTF2MAToNtOv6Kw==
X-CSE-MsgGUID: 4n3Nl8iuRn+p7RwfP4hwGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="241501995"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 10:16:54 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 10:16:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 10:16:53 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 10:16:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kcl7L5j/pUUoQnfC4/0vfa+jRFViSXM4Nd93fqoOun7zVy8RCVXPsT1IWVOQOdoLt7xUCXPNhNJAo2btY2Cvuu3HNAxaKWKHUaiGZ4Jkk30xPkpEf0BrwiQxrAaWkBaLxgn0x4RaiEPNC4vPJQCb24XwXJeN25aBMg0gDCgcyZnS7M/VpXId58ePtSPZEcm13vMyh4pLjlzZQ8OoCH860EZ9lFiNe0nrAmMi5QpOg1YsDEwKtlSi0wTGdjIsFQyPxL1dMCrguZNZn2iHUQrSi2YqYx1Iti1Ya+Qkyhnan7IyeoVgJF6Fgml1wdO7kqEnH2UWEMV2nUVsCVb2EAF/AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toaG9Wz1WbMcWaoT2ZS3Xo4fULNjdZj9HJax6ZRD1N0=;
 b=ej8Z0Q+r4RcFFBiv3DPfxc3zfwGp2R73dw1mhUZ/ID6uoWRzIvDPVG3v/QD0WBeEZpdOBK8pvlC0kwTHzJs79fHUaPU5mi5FklbKcXZtsh9kc0HpZNczeJstNWVb6eXUXnHA19+yhPsU0AloTCE+IvwSbhUNZe47Nl84E/B89jqRqMuSzfIcKOQwd2R7CtILUM4Sasg5L/LZF2pOBVh752jbNtz/scwmHE9iTaFMIjW4Jpq8pqiaHnWiAxEK8aE0LPzQ9+yAzJL/aV1JY9OcWMehtB+SuDUBheRXrUXb1YxYmjy59MUfM57rFe0ruCxEmW17M5f61kWodLtPQdx87A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV8PR11MB8745.namprd11.prod.outlook.com (2603:10b6:408:204::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 17:16:49 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 17:16:46 +0000
Date: Thu, 7 May 2026 10:16:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe: Refactor emit_clear_main_copy
Message-ID: <20260507171643.GM2131374@mdroper-desk1.amr.corp.intel.com>
References: <20260507064229.397673-5-balasubramani.vivekanandan@intel.com>
 <20260507064229.397673-6-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260507064229.397673-6-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BY3PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:254::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV8PR11MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: 970fed8c-6bd7-489b-8419-08deac5c6acf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003|3023799003;
X-Microsoft-Antispam-Message-Info: s+kOJxu9ISOhZyHq4XvO8He68TTt4JHa5kf8Vs96fk0pnC5bCkoMAmVQqGE3TJUOjDYDz4dH453UONe3CDX6LEeSQCoGx4M5Dpk/kB7YsT7XVoo44kylTE/bADV/tQEDpWdO8Puw23MSDo32Go7a7ucrSkHQyVGhKE60d/ihCqK1a8+xsMOur0LWv61xG6dMBDVF6HVt9TGr+qVfeF+f9/nfzaHSTd55TYL6sfu7ibtxrTMTiHBAIh3k0rVY305/oB1jZc58FLHTJH4HlTscGgTIVPSh4VYyI5fIfnyIQ2EQff5gDQrICFu+cCIw3xoBBlWpYTyvysp3Q2drg+ezMnc4Ij9KrhvqVtJ4vKCxdJL+TCr41ovb0DeVSO0Kq52nVDh0cmDwQGYYwexr7DdBGVa7ZoY4Lf8GcqSwZhmmV9FEmfXKoXe2my4hWY30aN2/GclEcESGTQe5cEytON5zW/HrBz4Kh/DL1bTfi9Q0VrGDQLt1dUa+CRB0rJXVcKwCgnnGD8o9zdPV+Y4nTf6tHJ7F7mzN04/FQ5VXDl7T+d/ML8/euHhrHKpu9gjMs98sxyhQe8U9ETaCd+xOvZvp1FeYr/JbAc/UzowOXWjdOH6cfBdjZx4Hy0rHNZMp6+t5nvIC+Udhef7VZheCfa3DhPnKYioN/ih8u6jSKWX6elV5oSxzFFz2FrwmwkCzQrPk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003)(3023799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ArdeVIL5lBAtkP/qbR8lKiuxvOAlWQ29XqYrHsrTigAuvCluoruEGC1Dw6kb?=
 =?us-ascii?Q?nMstRJJXy5Tcanfs3duNFG6NfzpDChShuGa3pZdqOKSAB6EEyAowI8cdARY8?=
 =?us-ascii?Q?AbeUe0JbIxjz1kYjgo87AX5u19Mst0zprOuuBCCeTZAdxqYbquhC+isgmWuk?=
 =?us-ascii?Q?TYXrws/ch98XRvnwV4DP43mzrCZQFuAdfoU4StVwXjxBP3rEMcjwmV3ohyQV?=
 =?us-ascii?Q?r13XXzsj1lyhGtqovDaPs6DaHMps5Crs7uer3EyzUkrDhArcCGzltU9/Odl8?=
 =?us-ascii?Q?rmKXoB8Zo/RNBY3hxIwbNJVmOECJ6LLHP03YvSVX03AdmDeU4rwjXAq/MBtJ?=
 =?us-ascii?Q?wtoKy2ncvcDw5hUDEkZruCOW1twaR3AviHxKalHt01vnXbQckD4laZAzSb+b?=
 =?us-ascii?Q?6z4Bznk5ChFtdp3TESxRq/LpoAWevP2eWoNYw0WzQbXQfHycVnXWSHRfbRCG?=
 =?us-ascii?Q?tRtLDn1RQGgZ0dnM/APOmc56OqaHZ/FkcAQSpKB6XlKJxlaWR7XQdhlc8ZLf?=
 =?us-ascii?Q?nzKzK1xz9NoISSh7TQuo5YY2V7Oo86W/6SsVulxvWsEAMxVQFXMJb1YpLg6R?=
 =?us-ascii?Q?LvpjbPUHr0mnn9iqPD00sjzG3/+EOrNxYKCTuN+KOROy7Km3nw9nQRcUvupl?=
 =?us-ascii?Q?LlABhdanIlA8r3cBVIPRd9ZVFSHDyqBbV2IlSq3ttCpXPwZ6zJgXWl6GuxkI?=
 =?us-ascii?Q?+0b/3CQyhwgtXdYxLoGZYlVnZUP52KDqz20ZxsAfTdUpxI1YeQzsoBuoFPAB?=
 =?us-ascii?Q?ITxRuHbgYmd9KqllTcajr7Cxjmy2sv0RHI/BUkpHitKNDnDzRN6LzhcgGV3l?=
 =?us-ascii?Q?HJUVjJnqFE/I2n77a4b0Ji0dSH/9FKUavnyUXhrd2GUx1/hvIKJFKYN4gzSU?=
 =?us-ascii?Q?CU+0dtWyytgo7z+8VknUU5cxbxt8WGv7EP6jw+JSBWYM2CqAahA6CEvMAMbP?=
 =?us-ascii?Q?RH3C+oyGEWPiq5IuQQRiWX3MPllz71imqjlMKXL4VewKIJk70/U0VwqBgleg?=
 =?us-ascii?Q?jJTs0Re4iQD8XI7qgP8Hq8KHQACZYQ+taDOuJxWPl2x90D1DA2nw90VYZRe0?=
 =?us-ascii?Q?fyUKCjqcukFYZKC4w7QXGdU4ohji4f09URGxoksbBMi2L75gyU59TTu9thQY?=
 =?us-ascii?Q?vAuhnQx+K3Nb4yBSyzQDySIwhYYLAwJuYPxdGFYHoQI61tEtwbXW3IKK0Di9?=
 =?us-ascii?Q?PJLfnEcKBLLkmqETKa5g8zbATa5hBKWgNLDzcJ3e4e4dhVZcy960egmTwOpP?=
 =?us-ascii?Q?wZyX3HAiLWRzhmAo7on460DHVnjmvikG7s3InyxQsJPiQUbPBsqcrARsbyXU?=
 =?us-ascii?Q?eHLNFlNxtTWpBGfJ30m7fjDlnkIN+lgy8pEPVZAJ4fV+ZMzip7pC9IXeLMVX?=
 =?us-ascii?Q?GUC4k06kkXUcLDfQQYDD9EsVckQHChNfPtFq+3fHrYhYP66PdRqXKMM92uQd?=
 =?us-ascii?Q?UI9UNAXE0dZiXhE5pQe3Dq0spDcjVSLLaI19uZs8hNz3MPBjS3GtqYOeUrxr?=
 =?us-ascii?Q?vI/qEC1oTYAmOfQfyEHQrQZRXM4+M1BqkuglL4Eq95Uqbr3AhMU5FjidnGo6?=
 =?us-ascii?Q?ov9ErzbwBlLYZ//0DjGal5bCiUhtaS6kKIeN3iuzSTx2Atgaz0oUtQMm8uIY?=
 =?us-ascii?Q?AfJbLdVnguO9alXwewuemrsCqkTbnWSWiCbwuD2dCherqylMNZa/cCD4W3w7?=
 =?us-ascii?Q?O6gtYduZ/H2c22W1KVDzNXjywxkVRQsoFXj5o6vOxxq4KQWMBxUd2/YgQmfr?=
 =?us-ascii?Q?VyH24RrYTu4MMf14PHlzDz4c1oBm+i4=3D?=
X-Exchange-RoutingPolicyChecked: qecFnRTeVS5illvIZn2sdM+IoU5H1bCrWqmAoC54qfSRTcvt2OYMCbaTeAtjcLqbFOjVNZWgka+qKX2AF4DUG3cowtnritkDu0jGBSKQTFPySwMu9zlFrtMmZoFG716RMPQOROfOWqgZm4LAQJLbUPoTFTGg/pqg9Tt1PqbiFlt9z8gZb7vLhnwvo+oblPfmh/TMI+kDoU/Ea8Qjd8PphGUTCmDT6LwXx4lOLFShIejXFB7XGYjAw4zsw+RU0MsPWBaKtRAAo5QGowfV3+W6NDjaySe9vtY0sRnN+uoKPbtSRkbqtLBuHgf54QAlVv3YRCbOSP2ReezLVsWzSpWkhA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 970fed8c-6bd7-489b-8419-08deac5c6acf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 17:16:46.5002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IYp87FgyO0K2jCd42RpJvBUse5KpgWWXG569iGr1HhRK0GR1JtlkN5OmErXC92W7DX7c1vH0oRkWoetJaRcJ5mrfVc7OJqPZa4d7Kz2miAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8745
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

On Thu, May 07, 2026 at 12:12:31PM +0530, Balasubramani Vivekanandan wrote:
> Implement a function which returns the length of XY_FAST_COLOR_BLT
> instruction instead of hardcoding it inside the emit_clear_main_copy.
> In future platforms, the length of this instruction is expected to
> change and this patch helps in preparing for it.
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  .../gpu/drm/xe/instructions/xe_gpu_commands.h    |  2 +-
>  drivers/gpu/drm/xe/xe_migrate.c                  | 16 ++++++++++++----
>  2 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> index 885fcf211e6d..082f2926feab 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> @@ -20,7 +20,7 @@
>  
>  #define XY_FAST_COLOR_BLT_CMD		(2 << 29 | 0x44 << 22)
>  #define   XY_FAST_COLOR_BLT_DEPTH_32	(2 << 19)
> -#define   XY_FAST_COLOR_BLT_DW		16
> +#define   XY_FAST_COLOR_BLT_LEN_DW	16

It might be best to just drop the #define completely if it's only going
to apply to a subset of our platforms.  Leaving the define here risks
someone seeing it and trying to use it elsewhere in the driver where it
isn't actually correct.  E.g., it looks like the existing usage in
emit_clear_cmd_len() was probably incorrect since Xe_LP platforms
actually needed a different value (11)?


Matt

>  #define   XY_FAST_COLOR_BLT_MOCS_MASK	GENMASK(27, 22)
>  #define   XE2_XY_FAST_COLOR_BLT_MOCS_INDEX_MASK	GENMASK(27, 24)
>  #define   XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT 31
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 078a9bc2821d..e4afe011f246 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1409,15 +1409,21 @@ static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs
>  	bb->len += len;
>  }
>  
> +static u32 blt_fast_color_cmd_len(struct xe_device *xe)
> +{
> +	if (GRAPHICS_VERx100(xe) >= 1250)
> +		return XY_FAST_COLOR_BLT_LEN_DW;
> +	else
> +		return 11;
> +}
> +
>  static void emit_clear_main_copy(struct xe_gt *gt, struct xe_bb *bb,
>  				 u64 src_ofs, u32 size, u32 pitch, bool is_vram)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 *cs = bb->cs + bb->len;
> -	u32 len = XY_FAST_COLOR_BLT_DW;
> +	u32 len = blt_fast_color_cmd_len(xe);
>  
> -	if (GRAPHICS_VERx100(xe) < 1250)
> -		len = 11;
>  
>  	*cs++ = XY_FAST_COLOR_BLT_CMD | XY_FAST_COLOR_BLT_DEPTH_32 |
>  		(len - 2);
> @@ -1466,10 +1472,12 @@ static bool has_service_copy_support(struct xe_gt *gt)
>  
>  static u32 emit_clear_cmd_len(struct xe_gt *gt)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
> +
>  	if (has_service_copy_support(gt))
>  		return PVC_MEM_SET_CMD_LEN_DW;
>  	else
> -		return XY_FAST_COLOR_BLT_DW;
> +		return blt_fast_color_cmd_len(xe);
>  }
>  
>  static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
