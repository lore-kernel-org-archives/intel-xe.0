Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E51E7717F
	for <intel-xe@archiver.kernel.org>; Mon, 16 Dec 2024 21:35:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FE410E630;
	Mon, 16 Dec 2024 21:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DVYhz+Hc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3CA10E630
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Dec 2024 21:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734384951; x=1765920951;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=896+e0hK0mIWM5eAq34fECeJcf6lKsM8McMWbtEx5BU=;
 b=DVYhz+HcgdF/oPDS61cZxDGPSaHJqAhjSMbKfG9QUNa6vs44CRLUMuAg
 ZsGdRLXzIEGcl4zd+J9CevEBQ5KKrPldQVn9IftoCCxvDv6EeLlT4CmP0
 7XT72k+gFiDwwTICI7FUbC7/qhrCQYDRvXIzB/Kra4pV6Gm1s8tgUgZDl
 nKr1qA329jDezLUvE5AqaBS/uUBxqv5gnJeewotaxe7tw/jucqR97MhaX
 JW450aXKqRXiakfrgugmt5fTsYaZXeGQuwQeFg2uAgxU/T+nn+QhGJ30V
 jwxmMc2dEeI3Ft81+Ph7rWQKVhKrkI0sBkBM/VVZaTRYadhDpM6ex/BAo g==;
X-CSE-ConnectionGUID: CfD9Wi/5S2GGmhvNoZC4Pw==
X-CSE-MsgGUID: cAQ7inqmT+C7OAO9/ssXoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34824965"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; d="scan'208";a="34824965"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 13:35:50 -0800
X-CSE-ConnectionGUID: A54EcTntT/eBit5NOnG2Qw==
X-CSE-MsgGUID: 6kISB+eGT76JtqjDwECFhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; d="scan'208";a="97889017"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Dec 2024 13:35:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 16 Dec 2024 13:35:49 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 16 Dec 2024 13:35:49 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 16 Dec 2024 13:35:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HDvPMSptEKwMh2EqJ02V1zwvBW/4RHessfmL+luuoHRe4F4RfidvXqRGquA0dOAj+ZeoOryX1uvayHjxx4P5d/311F7VGTat07252uefvyJDalLRe5oVtJ/9Kc+EL5RrWJS4eqXGQ5ZJVCxwwd4/ucDWzy7JRUXe+fqkmnu5pA+vzYL7Lfm5HPmdZY8rCNG4hYakGIcPfLikiMOOAehVOD6KnJmACtzFn10Ys8mN3WULhyYp4xQkkb9qZM0m4gO7yXMxjZEWFoJjL40Bh9X3eoAPV4S1ucZQ/C6ltnqBo0b2WJm3GmarNS7drUEOe2lPiS+HtE8dvfseRX36Xxa9Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jdCzCtBO600O7zsQ7aAghSB2e7PuX2ly3vFjdo07OSk=;
 b=LXDNAG/VvmcLUc3VV0mOQCQ5MoL35BwJr+Yi4h9vAGfyikXaGYzZ2/UOaOxvxQYQVIDaw3wzpdsoomi18+EIsJUAwevmFV2eQm6kfWXYu50MYLK7Sda8Hz8OoIMxHvvoYjcIQuy4v7iabBKfaCnLFm4Wc8+7NnhGquw5cz+rS/Ox4HcK3JNWSDnJtM4dRy3TQTcEY2fDoMLg+E98TSS3y2Pu27H5Z5+vDPYMaAa699EzjJn8PsFLRcdVq6uUVZkJXq9p2JlrBsnPD5uEzjn5UtbP4nNrmJPC6D8eQ7UDUWHxflw7N3sWqSFvf5GjTWpJdtOu+gdHAIKgGa2cT89GnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by MN2PR11MB4534.namprd11.prod.outlook.com (2603:10b6:208:265::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Mon, 16 Dec
 2024 21:35:45 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 21:35:44 +0000
Date: Mon, 16 Dec 2024 16:35:41 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/slpc: Remove unnecessary force wakes
Message-ID: <Z2CdLRToxCN6lPts@intel.com>
References: <20241216194119.3017792-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241216194119.3017792-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4PR03CA0159.namprd03.prod.outlook.com
 (2603:10b6:303:8d::14) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|MN2PR11MB4534:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bd544d7-562b-49d0-bfd4-08dd1e19990c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rV+czkfojcrHtEwZ1PvtfgWwsTL54femOnWI1+NHhyb1Mvul0eLSc+FylhLW?=
 =?us-ascii?Q?cg9G+KuviE5jDL7Owdu0LXIchlwmS6bGjigxXsWW9cph9H+KK7GPS7Uy1Jjn?=
 =?us-ascii?Q?FsXSPHE5BE3iqjDkPEwK/9hjEXkxTnLhlSH2qIHiYlV4OOjcFfjuGDZOnyRB?=
 =?us-ascii?Q?YbRpEg+B5tRJAQoFIdwfnLneGQtu3n4gp0NirYpW4ZoWi6AdeyNjofcJC34g?=
 =?us-ascii?Q?vIMKv/xcoXpnx00YSAQLbSWpJihVMaIdQMcr/d63O6hPHO6xRP28/w6aVSwM?=
 =?us-ascii?Q?qr4RKGZQa51RRJJwHSJLvs1HKChaeMGXyLKoj+NwfVvH56NScx06KUFnAMT/?=
 =?us-ascii?Q?HZ+n18I5NP7NVxI3zOZH4+djrH/ZU4KUs+Czre+u/JIALHQSllkXNBWHgQ+X?=
 =?us-ascii?Q?jmTpRInMtFwE99me24ISDEJCL0uu6HuxOxeBhByCY7FkbC+GR1SmhefGN5Uz?=
 =?us-ascii?Q?X8C0aYJGh3M1SE0XWQnW2hptlSjpJ6sr3/kcNih259N/Wj9lJD9YPrnSfi9i?=
 =?us-ascii?Q?SYlIjgQgE+VGPqtPfB2bEsPoeLZiBiTBAFDQs1akwWD6cM8r3QmuItB/doCb?=
 =?us-ascii?Q?S/Orse+JvjVmVfGfzMymoJND8PNvNeZzG0ULycGccRlm0YTonmcnPJ7L4oWm?=
 =?us-ascii?Q?Cm7atbkhH8Vm4akyfPa76E9uebG8+IKeO/EEyqeCppMVsE9X28c/t1iBT57d?=
 =?us-ascii?Q?d8c0EVtgEPTZ4n32nCuuE2By9LYqOAEptkMOyQhnyY91qbQQ4DbkXcojaHdu?=
 =?us-ascii?Q?0pJBg5X1rTJX3K6WjBwvPpaG4M1FZr8FoKSUIp4ztlitaPhYMtPzkEXE84TE?=
 =?us-ascii?Q?lmaPKrSwJ/Sz7pI3vIpVSzJQ2K5Bh2hFmInBjEvq8F/x3HtUmwYq0/bUTz2x?=
 =?us-ascii?Q?4KkHEMbRZp8x04fOlcbm+58wd4lTjESKqY1ZomDuI8ROb44cRZuWq5jdt6aw?=
 =?us-ascii?Q?y+t+/hXgxBfjm+hGAqeaJa9IBnNgHTeqr6YVkx1taHzGlpJ5KZfUQVSw2Wi5?=
 =?us-ascii?Q?BzSTPm31Y2BsN5R+oqYGISSIqe6zuMLsuKMVtj9LjLre/lxhJgfn8WfiuCr6?=
 =?us-ascii?Q?8RxRqNpavTM3VB4IazoXSqOxGuVJY7Ic6ndYkx3MbLJg9+jj9cCYBvMUoan6?=
 =?us-ascii?Q?Bqc3Rq7KYsiBiVkZVkxTjEI5H0SNPn9eMVw9d+ABzPh2vGUe++GzNc++ifVK?=
 =?us-ascii?Q?mpKkIMXYpw3MjtMnNzXII/qcIlXekVNr1M8sVOv/isY7m/APuPX+K/nqvJt7?=
 =?us-ascii?Q?ZrbC32KXK5W8WxMBG20DyABsf3gYixlFc8xCB57c3Qq2GLgCNde1pkLVFlHF?=
 =?us-ascii?Q?qqrm+KGiKxaL56Umdg+5BugW00C1aWkzoVJOPgq8BmLUk/k+Yo2qiKdd2URq?=
 =?us-ascii?Q?GpyQrTqFNOftfi4uOGg0qI4tDlVe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ca9nikVcbXssJeWaVUYI1ukxV+/dHPso0CqbyIhazrg/64IuzLlhcIAFH+Jn?=
 =?us-ascii?Q?8H0sOuAfbaB3z5PFdkWRFRGVoC47g01U9gM+6adklh0/xj5g03vUSjLb7BaX?=
 =?us-ascii?Q?lo2EVNSnxI9bMUQ13JcTgbJk4ODLqkJjAd5Fp2vQ7PaXD5QawxMFeXHFh0Fs?=
 =?us-ascii?Q?fBDNLekL6d7y/BCnrfR22Oup3Pu9ivZONZ8nANmFhG7YWCHV5o8aJJmKTXkF?=
 =?us-ascii?Q?/NsDK5+DUfOKtPfJdmhCJL8AgaHmahBBQw/M4hxgr9dmYJwQimZowjdRdhOx?=
 =?us-ascii?Q?Fu631xI2xLD/idWgHdivk6L5GVXR74g9BhMmFOoAkjla8/nRN8N5dtzHio/A?=
 =?us-ascii?Q?MTX2e+DPmGbVTg3wpCzGNZ6loF/iFXqU6dsbQPoDGN4YTHrb+TYH13qHrdmT?=
 =?us-ascii?Q?nday23b9H2/nsYst9Jz4tLsIwX9dsNj3MYNS91c2tiuzGbtCSVohitrmVfWA?=
 =?us-ascii?Q?HA7tIQfiAwsOcPNVvbXuo0wUq2TpHOdUSqP7bl8J2v0HLS6K6o2Q/lw50v0/?=
 =?us-ascii?Q?bOVvwcatuaM7qXBJSP+SvaC/hWkLestOYggjqwygjTpuIVGLm3EqaHFKMpth?=
 =?us-ascii?Q?ns0AEm9F5FBk20PHrhVFrcVQNw2MJ1l8pdEDF402JX9kbVJ8NG4vGFW3BE72?=
 =?us-ascii?Q?xt7Y0jdwn1TcNholNyVlaNb+v2heNLRZX+ugZS3TJEVxwCxxWduyISFiusKj?=
 =?us-ascii?Q?s+TUn+Evafp20jO96zWThB8pi6nrujnNTy5omEXCM1EkU3Jkrv8KSc9Colfc?=
 =?us-ascii?Q?e6PBA+Y2ytTT5NqU/tZoQTzff9tJgrBgBDtYdk34rdMg6L032TcMDz/yoYL0?=
 =?us-ascii?Q?0/ck6gm96vR7zaQrsyw7oZGa22r+rev28/R+7seMgTnZcsk7vG9R/1PgOfHM?=
 =?us-ascii?Q?/SrzWFvIKzhyQwmnckbFiWJiQV9G+Tb982n+NKe1vNBji35AehCFQeyv4W/Q?=
 =?us-ascii?Q?ul626tMiyefR2KKOqfbEhGf2RHRUNPy4s9hjuSnsEGKNrcRxkqaO+Uq8F0N+?=
 =?us-ascii?Q?EKv2lC/C2A1wt8tMeLi8EuE4OlpLx4Vi+h4Qlaz3u3To/z5e3Zn3G8k9dmWf?=
 =?us-ascii?Q?Zho2Aj8kIZqh7Vxsqw+gzJS4/LjGP7dwBscaojvd8BGttYwHT+Dswo3ckaSX?=
 =?us-ascii?Q?5ZeLKgH+N6abzd02qwlUE797iyuCoSyUt2JUJ8TIqhl9O8CgeCI6uU+4LXnq?=
 =?us-ascii?Q?zNzEDJSG2FYsOY3+xoEFWjYpyop473c8SVH7pu3nl0sEX4ogkTVsACRBMdgy?=
 =?us-ascii?Q?D610BiPtxV1QyWJ/Kf31U6ITL5IQYJhxJX1Y5wQX6KcUFer0zByDUAMs03p9?=
 =?us-ascii?Q?Qrrw3jchZE+GsDfQdWO6UiSe8g38PXtyiJwCkvIkrgibSEx29ijLQIEzm5Ml?=
 =?us-ascii?Q?0WmqvZmoKwSjgki5CllN08mf0lCfpkZREtP7UnxuYdGuz2GHt9DOkGE5UOuO?=
 =?us-ascii?Q?I0R+rBHsPdEOlmj5n/++F6Uv6ykxcBLuyg17skOSJ6QSO8EcwTd7EIoYmWK+?=
 =?us-ascii?Q?6ArvcspHCvymdF5AeBnIqOckNjLeR86roWFMw8ClcZGsa+lL65AtgwJPgwiO?=
 =?us-ascii?Q?bsrWeGGDqqgO8zljlc24R7pKPSm1aTjjc2GzxEepg6wa72h/eBnuUWpBxWC/?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd544d7-562b-49d0-bfd4-08dd1e19990c
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 21:35:44.9191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I9uPmsdRZttrXPNRpm/Trz2M/cqJY4donKepYFl9yQihSzeg9gIPPcs2L1FabynCGCGeN9GNQkzCoZXf6gHvWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4534
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

On Mon, Dec 16, 2024 at 11:41:19AM -0800, Vinay Belgaumkar wrote:
> FORCEWAKE_ALL is not needed when we are trying to read the cur_freq,
> we just need to wake up the GT domain. We also do not need a force wake
> to for a H2G query to obtain min frequency.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 26 +++++++-------------------
>  1 file changed, 7 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index e8b9faeaef64..5f9828ffc19c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -421,8 +421,8 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
>  	 * GuC SLPC plays with cur freq request when GuCRC is enabled
>  	 * Block RC6 for a more reliable read.
>  	 */
> -	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT)) {
>  		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  		return -ETIMEDOUT;
>  	}
> @@ -481,10 +481,10 @@ u32 xe_guc_pc_get_rpn_freq(struct xe_guc_pc *pc)
>   */
>  int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
>  {
> -	struct xe_gt *gt = pc_to_gt(pc);
> -	unsigned int fw_ref;
>  	int ret;
>  
> +	xe_device_assert_mem_access(pc_to_xe(pc));
> +
>  	mutex_lock(&pc->freq_lock);
>  	if (!pc->freq_ready) {
>  		/* Might be in the middle of a gt reset */
> @@ -492,24 +492,12 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
>  		goto out;
>  	}
>  
> -	/*
> -	 * GuC SLPC plays with min freq request when GuCRC is enabled
> -	 * Block RC6 for a more reliable read.
> -	 */
> -	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> -		ret = -ETIMEDOUT;
> -		goto fw;
> -	}
> -
>  	ret = pc_action_query_task_state(pc);
>  	if (ret)
> -		goto fw;
> +		goto out;
>  
>  	*freq = pc_get_min_freq(pc);
>  
> -fw:
> -	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  out:
>  	mutex_unlock(&pc->freq_lock);
>  	return ret;
> @@ -969,8 +957,8 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  
>  	xe_gt_assert(gt, xe_device_uc_enabled(xe));
>  
> -	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT)) {
>  		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  		return -ETIMEDOUT;
>  	}
> -- 
> 2.38.1
> 
