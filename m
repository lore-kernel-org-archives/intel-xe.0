Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616E4D64097
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 22:32:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1867E10E29E;
	Fri,  8 Nov 2024 22:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ApDv/wEH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F2E10E29E
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 22:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731105171; x=1762641171;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XW9EsHVSiFgIh5G0OJzfb4QZfiIhIuun9WgtcGJoWb8=;
 b=ApDv/wEH7Wjn4LKUaCwZXPn+8gfu1gcZ389PNWHbAKdFEhhjV2Wur1jU
 EJhXCTcqdcezy1NextM/gxkYx4Fubif2nyov4w4oU7HFAWoli9zPjzv+I
 jw/3I4ny9DYJz/zz8zdVG1LZodZR1FpRpXYvYQ7KD0qwkhVYUE7ZWNOmq
 crMskZSXgpNm2t8xVCom6sftEcrInQv+6pUS5gO5Aa5HKd9+taqvi7QdU
 0kEF6uXHLelIt2+DA7px74bMIJqys+5zsNpa2LsjIVmygY5+WjfRpc/Pq
 eCtsukh8cqyMY+RseoE7agSclya8J66CoutXLDARhaqJdZJS/u4rJpxsp w==;
X-CSE-ConnectionGUID: orOgmajmRku74zpEJ+DeBg==
X-CSE-MsgGUID: Lt+6c8MKS/26xbrzriHhsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="41627025"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="41627025"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 14:32:51 -0800
X-CSE-ConnectionGUID: h17YJYbrTGmT0Kwljxzk5g==
X-CSE-MsgGUID: iVGwjhQXSX2b4VPppKeqBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="90310217"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 14:32:51 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 14:32:50 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 14:32:50 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 14:32:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h819OXPuge81fOoGJ7seTFmDgRHdYb+iJI083+zqGLiLrVwItr1HzeAoY8fKsscegrDtjYkxNbgcxZd1787CA4qmm1qvogTFuP4DzZQWi2rJPqvfmSaNlV1J3+7fWxUi79Cu29qSjcrJbfQunOAy3vx0aYj8zwlLW6/PeWdYRzfUlXhHNykscyQzmzdwdvSVkfxxJaKWfrXiQKZYbhvkPrRRcrdRyRQLA0DSd37+Yis6V2MItZJYfJVe7IIvyyM9hQJwOqEnAJgcIja9FhRyAHGO0MwaviSrCG1L8ytazidJ7MkIdlNpwQ6aLaRrm633ogPycPaph2cA6QP/ejJ2Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8+MNLGQGblIvQCsR5O3XBqzXG10jLWlN9nMmfaIZWs=;
 b=H6pDO/Ctrclzn5Kuv2pLjGI4nyWsTDRb3H8sBoNUvVuxYo7LXwJx2WXn4yqMLgN024gDVkdT6I1kWbF4ap9pK58jLxDEh5HXh7ClmQnbMen/89LJZ+hPfo6pZVb2h47vR7Jt+YrSYeFs8UWEU8O2IrhiyBgQyfiq4buyd8Tap0UZv/7WCM6cAmmVHcq/pZvA0mqhkp+Xxhc9cKhG0oBq/d8DtJKpHuhS/qO0GA2aouhYeq314jVyDwq/IewIwcFFyVo0f42IaScxVYVPUzTOQTXuWr2wLHzGHFTYDjTzqe/gx7L3ojRq5u8re4YLYxXE5xn/fKQdqRWUdTXvTDaTyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MN2PR11MB4646.namprd11.prod.outlook.com (2603:10b6:208:264::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22; Fri, 8 Nov
 2024 22:32:44 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Fri, 8 Nov 2024
 22:32:44 +0000
Date: Fri, 8 Nov 2024 17:32:41 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/pmu: Add GT C6 events
Message-ID: <Zy6RiQtCjTcSDTsw@intel.com>
References: <20241108181512.3461481-1-vinay.belgaumkar@intel.com>
 <20241108181512.3461481-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241108181512.3461481-3-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4P222CA0016.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::21) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MN2PR11MB4646:EE_
X-MS-Office365-Filtering-Correlation-Id: 934affce-ebab-4650-8ea9-08dd004543a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EX9UinlsyN4Hl6UOZWM6Kit8amXRUWBWB1izy9DbLQ0p4XPaEmjMhNYbqB3Y?=
 =?us-ascii?Q?P9lFesJH1XtZOaVYfuF/bTm4noS7Fe3LWK6TiEUecL0+v7glKKVOMy9P8/hs?=
 =?us-ascii?Q?S4DQPLCeVX5kL7kBLf0S6FFUs9Q6lQ3sDdyXlnDd9oBCuPk7oUsjHe/ShAdl?=
 =?us-ascii?Q?/4I0x3JjySsOnBrTZR/JOQNhTPMnSftMYfm0ykx6Y/ocDczG7FmIp356+U7W?=
 =?us-ascii?Q?hDrDxmhLLxDgTMLmCtPc900Cp7adNZJoqhS8SYOPnAL66PMP7VjJ3bV2+O8G?=
 =?us-ascii?Q?kdIFbUTCXIQxk+0nCqvz3F3BzFzRBPRPAzuhKOvyByMPRp0yaa9WoGZ0JqNc?=
 =?us-ascii?Q?esg0ypTJFMRGDDveoM0zSZnivVkD8NuagTvNfTSEmfwXW9ksk9IRfZAz9wT6?=
 =?us-ascii?Q?EgckQPCpehseMlqqKmKv/8QWbtIRQWLl2UD1NXO2YIDGjrd8nGiWAJGrGOYS?=
 =?us-ascii?Q?TMSUZDCU5rI2ynOyyg0PASRyEGjXTwAQGyN4oatEHf6iCeAyRER0xU0/uw7u?=
 =?us-ascii?Q?FV5aarq9317bFxVxwqLIgVSNzyaupViKzQ9MyRZo32ECRyh/DJc67gz53pwy?=
 =?us-ascii?Q?Lzqc6vtexBM/WPaWrnP+7RUuReiR/1agCGgXBFVW5unnXCOsj3Jk5xs7DOPB?=
 =?us-ascii?Q?O1Ua74g/kpnd7o1FZrGi+kRhMjTUy8lRM4Nem0rgQbni81XhQeZK0XmCAVEa?=
 =?us-ascii?Q?5UJKXMFexeI6aXpf6KE9nw1vak4YCS5NKZ6QEcToyrtUW+1zcxjj3oVjEqwI?=
 =?us-ascii?Q?X2KBxTVnn5s4Ff14zEplUJ1X0aZv96LKssrveAVtVEfv/voEluQ5aD0D/0Sx?=
 =?us-ascii?Q?eFj+Et7LsVcXKpEdfF6g87CcgYRLDsey8YBVxSNkwx5Ze3s2dokDX0X2XrYS?=
 =?us-ascii?Q?t1cQ+iKGEqWnYj+X8djuo4yTWrDjpIzJYekSBAmwAtT4dC3FYMAVVGFtGmaa?=
 =?us-ascii?Q?9VTfuL+51f4W58Pq2v5BrzR55akyy0NdUI4enJXkzeSZNYijbmIgcYElmKj3?=
 =?us-ascii?Q?JAXm6iKwKYeA1D/kIE2GAH3csNYVcYwibogWSnPL9iqr8IuoYVKpsyOTfttc?=
 =?us-ascii?Q?P6YQclbY4eyjeqHoN7B4bFrffz4SaopPtu+Kb7iqk2g2OjhCtj46/7a++Yco?=
 =?us-ascii?Q?pY4vL6ekQlOhwLyvPscz2WSidpWLTqI54TUKsbUSmiuIxa3wO0DuSWK2Vv6D?=
 =?us-ascii?Q?Jg6ZkoytC3shDXRwEsp0ki/IVosvpVhpEjggN6F9Qtq+xIlZBJnYmZSRpnLK?=
 =?us-ascii?Q?U7jp9jLZA/N1WyUSRw3bQ+V8kv+ICnqGl5TbtuvYdqksSlfsOyVuMsKWz46B?=
 =?us-ascii?Q?a4onaqZFKRSG5s4g1+6mEbEQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Soqt2bczT0OVRtK90Yuui2R2e1xWn58s7lcjKH0E41AXMvfBccjT/LOj940y?=
 =?us-ascii?Q?uaWRuE7NTiM2sgUAWKw7+OscVdrgNTh5p95FdUm4YZH36bjGs2Wu6lPvqWV5?=
 =?us-ascii?Q?WXx6Dpw5pdq4fRlNYSDXpyXgTpGWRaF8sOxCwOE8HsGgo6RxwAa97gl0PGBN?=
 =?us-ascii?Q?8Ek57RrunuS0SyI+ZPXiuZ4eFqUKyJBvwbrQZ6y6Mmcx5ncAyqHJTkTuYtZk?=
 =?us-ascii?Q?uPo4cjH943rZzuFGUnU9b1k9797uMykMGH1IJnabnL6OUlo4mvmebU2ne9+j?=
 =?us-ascii?Q?cB0xZhrvXwor4Do8eeSGvZc+XPfzIbYF1Kjl79D2UJwnqphzsZvZY2XI6oLE?=
 =?us-ascii?Q?AdOhhF/vBm1zquU73rsBiM4vacRqhTU/fkjTuRzDYs4Iv31x+OfoJGe5YwgO?=
 =?us-ascii?Q?rlAogqCsMzUb4r/BQg4icr7mhHSFg2O9VoBIO2Q9afldoAdw5x4rGND3Ttb2?=
 =?us-ascii?Q?A4D+jHvK3in7Xu8zBUNsHLJ75LDmry9SgJZkih7trD7b+5ucFApkTEXDV1I5?=
 =?us-ascii?Q?RPdV63XfC3YZE2Q/dWLGillPjXhe/0UCFGWgPVjR/Jc3DpZmKirH41wIoidU?=
 =?us-ascii?Q?f8xeOd6hpCVDHfK+nZnUqpWzCs94Yk8+2IHPDHLgLZ5FkQRswwm2ljrKGaus?=
 =?us-ascii?Q?1d+BE3ZAIYNlJPJhLEIH6eXZwRcThKYCg8xWxsTZfl0IPdo2lIEr+30ZeDfU?=
 =?us-ascii?Q?T/8VgnQaCrtICfKD0E0pLhq5gCoIqfi/teX1Fb+ZzKMSjeYq8sAeuDurZbBR?=
 =?us-ascii?Q?sjeivTEQwBPH5MK/OyDCZlE+tiOxSnD1tzDoktgrlX09+hKfO8vRf+0P+4TY?=
 =?us-ascii?Q?/qwztkWLkjYuTk9OkNwWwqSl86K7FkkAas+QUpqzeJ8fzo00aG6iNa076KJW?=
 =?us-ascii?Q?nbpuO6ZyWI5PehsoiE0H+RkcjyLuQ5tCuVMXJ28NwU4WwSP+tkGou69g7kUM?=
 =?us-ascii?Q?ivmIOb+T2mvR8OLabBDDDtVpJQji+bhTIhZPjkGhnP75/d5R8CipV1n4N2hT?=
 =?us-ascii?Q?nUKDs3cmXDRZFYeJ8m7O7/lo3LlPxwIrPcfwriZUpRq54sA9d3FJp2hsdLsN?=
 =?us-ascii?Q?gsOkD00xxbT7/+yHNdYQkzLx+43v8OLcX1290kKzK0/6VAhc6tUWKJv827fk?=
 =?us-ascii?Q?ONjoo+DkHvUE+mEc2XVWZVaiL+dAusd5qeh8jWHqcUdJ3YSq1du4DNrqLZUR?=
 =?us-ascii?Q?r8MDUj+GxLmyNdZJ4AyaLX9pkf/HGjx5G358OtNUWl+H2f/0yQFjs2z61B4B?=
 =?us-ascii?Q?3NT38KPlINZwM0cpab1YEmFZyaaOAjFU5x39MOO2BMmc5MGXWyxpvRjx5hdL?=
 =?us-ascii?Q?0qrCWbSnMHViasHVxDNpUxngGS2wW+Omi7+/XtX6C0wGIeBLdW4zDix4BYxI?=
 =?us-ascii?Q?V0/nkzTodxSCdss6CyPiokck17D7/0lVwPiltOrURKuVyYJoKwEtvzcuobfG?=
 =?us-ascii?Q?76CCZM0Ua5KeVD68lCgxdToCW6Lha8YKds7Lou6ThDX91uJ7E2qyn1Y1lVsx?=
 =?us-ascii?Q?D0+HCX8CnBzrBeV+5FMRmyqHy3YBCgukCFb4E+GwG7rC9NRlhHOV15XvYpV4?=
 =?us-ascii?Q?8SUakFJ1dUI4MKY/EtRFLkr3F+KZTyL6t/8p+Uf1fQUMeZJsEvIr1LZJ/yQ7?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 934affce-ebab-4650-8ea9-08dd004543a9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 22:32:44.6311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /mSiqp4L/p/sMbEc/TbyjzhSXJrxw5uPUfkUS/JSynQwmTvetCSoEPTvghqZntVDW298hHSHuDLxg6arhI/wPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4646
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

On Fri, Nov 08, 2024 at 10:15:11AM -0800, Vinay Belgaumkar wrote:
> Provide a PMU interface for GT C6 residency counters. The implementation
> is ported over from the i915 PMU code. Residency is provided in units of
> ms(like sysfs entry in - /sys/class/drm/card0/device/tile0/gt0/gtidle).
> 
> Sample usage and output-
> 
> $ perf list | grep rc6
> 
>   xe_0000_00_02.0/rc6-residency-gt0/                 [Kernel PMU event]
>   xe_0000_00_02.0/rc6-residency-gt1/                 [Kernel PMU event]
> 
> $ perf stat -e xe_0000_00_02.0/rc6-residency-gt0/
> 
>   Performance counter stats for 'system wide':
> 
>               1907 ms   xe/rc6-residency-gt0/
>        1.907581788 seconds time elapsed
> 
> v2: Checkpatch fix, move timer code to next patch
> v3: Fix kunit issue
> v4: Fix for locking issue, fix review comments (Riana)
> v5: Add xe_pmu_disable() function to reset enable_count
> 

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c        |   2 +
>  drivers/gpu/drm/xe/xe_gt_idle.c   |  17 ++-
>  drivers/gpu/drm/xe/xe_gt_idle.h   |   1 +
>  drivers/gpu/drm/xe/xe_pmu.c       | 220 +++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_pmu.h       |   2 +
>  drivers/gpu/drm/xe/xe_pmu_types.h |  63 +++++++++
>  6 files changed, 299 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index d6744be01a68..fd18bbce99da 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -877,6 +877,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>  
>  	xe_gt_idle_disable_pg(gt);
>  
> +	xe_pmu_suspend(gt);
> +
>  	xe_gt_disable_host_l2_vram(gt);
>  
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index fd80afeef56a..47b5696c7137 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -275,18 +275,25 @@ static ssize_t idle_status_show(struct device *dev,
>  }
>  static DEVICE_ATTR_RO(idle_status);
>  
> +u64 xe_gt_idle_residency(struct xe_gt_idle *gtidle)
> +{
> +	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
> +
> +	return get_residency_ms(gtidle, gtidle->idle_residency(pc));
> +}
> +
>  static ssize_t idle_residency_ms_show(struct device *dev,
>  				      struct device_attribute *attr, char *buff)
>  {
>  	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
> -	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
>  	u64 residency;
>  
> -	xe_pm_runtime_get(pc_to_xe(pc));
> -	residency = gtidle->idle_residency(pc);
> -	xe_pm_runtime_put(pc_to_xe(pc));
> +	xe_pm_runtime_get(gt_to_xe(gt));
> +	residency = xe_gt_idle_residency(gtidle);
> +	xe_pm_runtime_put(gt_to_xe(gt));
>  
> -	return sysfs_emit(buff, "%llu\n", get_residency_ms(gtidle, residency));
> +	return sysfs_emit(buff, "%llu\n", residency);
>  }
>  static DEVICE_ATTR_RO(idle_residency_ms);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
> index 4455a6501cb0..795a02c9d89c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
> @@ -17,5 +17,6 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt);
>  void xe_gt_idle_enable_pg(struct xe_gt *gt);
>  void xe_gt_idle_disable_pg(struct xe_gt *gt);
>  int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
> +u64 xe_gt_idle_residency(struct xe_gt_idle *gtidle);
>  
>  #endif /* _XE_GT_IDLE_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index 7ce66c022e27..80d78628006e 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -11,8 +11,11 @@
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt_clock.h"
> +#include "xe_gt_idle.h"
> +#include "xe_guc_pc.h"
>  #include "xe_mmio.h"
>  #include "xe_macros.h"
> +#include "xe_module.h"
>  #include "xe_pm.h"
>  
>  /**
> @@ -22,6 +25,8 @@
>  static cpumask_t xe_pmu_cpumask;
>  static unsigned int xe_pmu_target_cpu = -1;
>  
> +#define FREQUENCY 200
> +
>  /**
>   * DOC: Xe PMU (Performance Monitoring Unit)
>   *
> @@ -31,7 +36,9 @@ static unsigned int xe_pmu_target_cpu = -1;
>   * Example commands to list/record supported perf events-
>   *
>   * $ ls -ld /sys/bus/event_source/devices/xe_*
> - * $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/events/
> + * $ lrwxrwxrwx 1 root root 0 Oct 25 00:19  /sys/bus/event_source/devices/xe_0000_03_00.0 ->
> + *                                                           ../../../devices/xe_0000_03_00.0
> + * $ ls /sys/bus/event_source/devices/xe_0000_03_00.0/events/
>   *
>   * You can also use the perf tool to grep for a certain event-
>   * $ perf list | grep rc6
> @@ -39,8 +46,30 @@ static unsigned int xe_pmu_target_cpu = -1;
>   * To list a specific event at regular intervals-
>   * $ perf stat -e <event_name> -I <interval>
>   *
> + * For RC6, following command will give GT residency per second-
> + * $ perf stat -e xe_0000_03_00.0/rc6-residency-gt0/ -I 1000
> + * #           time             counts unit events
> + *      1.001153792               1002 ms   xe_0000_03_00.0/rc6-residency-gt0/
> + *      2.008338100               1007 ms   xe_0000_03_00.0/rc6-residency-gt0/
> + *      3.009887054               1002 ms   xe_0000_03_00.0/rc6-residency-gt0/
> + *      4.011383318               1001 ms   xe_0000_03_00.0/rc6-residency-gt0/
> + *
> + * To verify this matches with sysfs values of rc6, you can run following command-
> + * $ for i in {1..10} ; do cat /sys/class/drm/card0/device/tile0/gt0/gtidle/idle_residency_ms;
> + *   sleep 1; done
> + *      2348877
> + *      2349901
> + *      2350917
> + *      2352945
> + *
> + * Each value is roughly a 1000ms increment here as well. This is expected GT residency when idle.
>   */
>  
> +static struct xe_pmu *event_to_pmu(struct perf_event *event)
> +{
> +	return container_of(event->pmu, struct xe_pmu, base);
> +}
> +
>  static unsigned int config_gt_id(const u64 config)
>  {
>  	return config >> __XE_PMU_GT_SHIFT;
> @@ -51,6 +80,35 @@ static u64 config_counter(const u64 config)
>  	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>  }
>  
> +static unsigned int other_bit(const u64 config)
> +{
> +	unsigned int val;
> +
> +	switch (config_counter(config)) {
> +	case XE_PMU_RC6_RESIDENCY:
> +		val = __XE_PMU_RC6_RESIDENCY_ENABLED;
> +		break;
> +	default:
> +		/*
> +		 * Events that do not require sampling, or tracking state
> +		 * transitions between enabled and disabled can be ignored.
> +		 */
> +		return -1;
> +	}
> +
> +	return config_gt_id(config) * __XE_PMU_TRACKED_EVENT_COUNT + val;
> +}
> +
> +static unsigned int config_bit(const u64 config)
> +{
> +	return other_bit(config);
> +}
> +
> +static unsigned int event_bit(struct perf_event *event)
> +{
> +	return config_bit(event->attr.config);
> +}
> +
>  static void xe_pmu_event_destroy(struct perf_event *event)
>  {
>  	struct xe_device *xe =
> @@ -70,6 +128,10 @@ config_status(struct xe_device *xe, u64 config)
>  		return -ENOENT;
>  
>  	switch (config_counter(config)) {
> +	case XE_PMU_RC6_RESIDENCY:
> +		if (xe->info.skip_guc_pc)
> +			return -ENODEV;
> +		break;
>  	default:
>  		return -ENOENT;
>  	}
> @@ -116,6 +178,63 @@ static int xe_pmu_event_init(struct perf_event *event)
>  	return 0;
>  }
>  
> +static inline s64 ktime_since_raw(const ktime_t kt)
> +{
> +	return ktime_to_ms(ktime_sub(ktime_get_raw(), kt));
> +}
> +
> +static u64 read_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample)
> +{
> +	return pmu->event_sample[gt_id][sample].cur;
> +}
> +
> +static void
> +store_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample, u64 val)
> +{
> +	pmu->event_sample[gt_id][sample].cur = val;
> +}
> +
> +static u64 get_rc6(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	const unsigned int gt_id = gt->info.id;
> +	struct xe_pmu *pmu = &xe->pmu;
> +	bool device_awake;
> +	unsigned long flags;
> +	u64 val;
> +
> +	device_awake = xe_pm_runtime_get_if_active(xe);
> +	if (device_awake) {
> +		val = xe_gt_idle_residency(&gt->gtidle);
> +		xe_pm_runtime_put(xe);
> +	}
> +
> +	spin_lock_irqsave(&pmu->lock, flags);
> +
> +	if (device_awake) {
> +		store_sample(pmu, gt_id, __XE_SAMPLE_RC6, val);
> +	} else {
> +		/*
> +		 * We think we are runtime suspended.
> +		 *
> +		 * Report the delta from when the device was suspended to now,
> +		 * on top of the last known real value, as the approximated RC6
> +		 * counter value.
> +		 */
> +		val = ktime_since_raw(pmu->sleep_last[gt_id]);
> +		val += read_sample(pmu, gt_id, __XE_SAMPLE_RC6);
> +	}
> +
> +	if (val < read_sample(pmu, gt_id, __XE_SAMPLE_RC6_LAST_REPORTED))
> +		val = read_sample(pmu, gt_id, __XE_SAMPLE_RC6_LAST_REPORTED);
> +	else
> +		store_sample(pmu, gt_id, __XE_SAMPLE_RC6_LAST_REPORTED, val);
> +
> +	spin_unlock_irqrestore(&pmu->lock, flags);
> +
> +	return val;
> +}
> +
>  static u64 __xe_pmu_event_read(struct perf_event *event)
>  {
>  	struct xe_device *xe =
> @@ -126,6 +245,9 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>  	u64 val = 0;
>  
>  	switch (config_counter(config)) {
> +	case XE_PMU_RC6_RESIDENCY:
> +		val = get_rc6(gt);
> +		break;
>  	default:
>  		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>  	}
> @@ -157,6 +279,28 @@ static void xe_pmu_event_read(struct perf_event *event)
>  
>  static void xe_pmu_enable(struct perf_event *event)
>  {
> +	struct xe_pmu *pmu = event_to_pmu(event);
> +	const unsigned int bit = event_bit(event);
> +	unsigned long flags;
> +
> +	if (bit == -1)
> +		goto update;
> +
> +	spin_lock_irqsave(&pmu->lock, flags);
> +
> +	/*
> +	 * Update the bitmask of enabled events and increment
> +	 * the event reference counter.
> +	 */
> +	BUILD_BUG_ON(ARRAY_SIZE(pmu->enable_count) != XE_PMU_MASK_BITS);
> +	XE_WARN_ON(bit >= ARRAY_SIZE(pmu->enable_count));
> +	XE_WARN_ON(pmu->enable_count[bit] == ~0);
> +
> +	pmu->enable |= BIT(bit);
> +	pmu->enable_count[bit]++;
> +
> +	spin_unlock_irqrestore(&pmu->lock, flags);
> +update:
>  	/*
>  	 * Store the current counter value so we can report the correct delta
>  	 * for all listeners. Even when the event was already enabled and has
> @@ -165,6 +309,31 @@ static void xe_pmu_enable(struct perf_event *event)
>  	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
>  }
>  
> +static void xe_pmu_disable(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +	const unsigned int bit = event_bit(event);
> +	unsigned long flags;
> +
> +	if (bit == -1)
> +		return;
> +
> +	spin_lock_irqsave(&pmu->lock, flags);
> +
> +	XE_WARN_ON(bit >= ARRAY_SIZE(pmu->enable_count));
> +	XE_WARN_ON(pmu->enable_count[bit] == 0);
> +	/*
> +	 * Decrement the reference count and clear the enabled
> +	 * bitmask when the last listener on an event goes away.
> +	 */
> +	if (--pmu->enable_count[bit] == 0)
> +		pmu->enable &= ~BIT(bit);
> +
> +	spin_unlock_irqrestore(&pmu->lock, flags);
> +}
> +
>  static void xe_pmu_event_start(struct perf_event *event, int flags)
>  {
>  	struct xe_device *xe =
> @@ -190,6 +359,8 @@ static void xe_pmu_event_stop(struct perf_event *event, int flags)
>  	if (flags & PERF_EF_UPDATE)
>  		xe_pmu_event_read(event);
>  
> +	xe_pmu_disable(event);
> +
>  out:
>  	event->hw.state = PERF_HES_STOPPED;
>  }
> @@ -291,6 +462,7 @@ create_event_attributes(struct xe_pmu *pmu)
>  		const char *name;
>  		const char *unit;
>  	} events[] = {
> +		__event(0, "rc6-residency", "ms"),
>  	};
>  
>  	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
> @@ -477,6 +649,32 @@ static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
>  	cpuhp_state_remove_instance(cpuhp_state, &pmu->cpuhp.node);
>  }
>  
> +static void store_rc6_residency(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	store_sample(pmu, gt->info.id, __XE_SAMPLE_RC6,
> +		     xe_gt_idle_residency(&gt->gtidle));
> +	pmu->sleep_last[gt->info.id] = ktime_get_raw();
> +}
> +
> +/**
> + * xe_pmu_suspend() - Save residency count before suspend
> + */
> +void xe_pmu_suspend(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (!pmu->base.event_init)
> +		return;
> +
> +	spin_lock_irq(&pmu->lock);
> +	store_rc6_residency(gt);
> +	spin_unlock_irq(&pmu->lock);
> +}
> +
>  /**
>   * xe_pmu_unregister() - Remove/cleanup PMU registration
>   */
> @@ -497,6 +695,24 @@ void xe_pmu_unregister(void *arg)
>  	free_event_attributes(pmu);
>  }
>  
> +static void init_rc6(struct xe_pmu *pmu)
> +{
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	struct xe_gt *gt;
> +	unsigned int j;
> +
> +	for_each_gt(gt, xe, j) {
> +		xe_pm_runtime_get(xe);
> +		u64 val = xe_gt_idle_residency(&gt->gtidle);
> +
> +		store_sample(pmu, j, __XE_SAMPLE_RC6, val);
> +		store_sample(pmu, j, __XE_SAMPLE_RC6_LAST_REPORTED,
> +			     val);
> +		pmu->sleep_last[j] = ktime_get_raw();
> +		xe_pm_runtime_put(xe);
> +	}
> +}
> +
>  /**
>   * xe_pmu_register() - Define basic PMU properties for Xe and add event callbacks.
>   *
> @@ -531,6 +747,8 @@ void xe_pmu_register(struct xe_pmu *pmu)
>  	if (!pmu->events_attr_group.attrs)
>  		goto err_name;
>  
> +	init_rc6(pmu);
> +
>  	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
>  					GFP_KERNEL);
>  	if (!pmu->base.attr_groups)
> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
> index d07e5dfdfec0..17f5a8d7d45c 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.h
> +++ b/drivers/gpu/drm/xe/xe_pmu.h
> @@ -15,11 +15,13 @@ int xe_pmu_init(void);
>  void xe_pmu_exit(void);
>  void xe_pmu_register(struct xe_pmu *pmu);
>  void xe_pmu_unregister(void *arg);
> +void xe_pmu_suspend(struct xe_gt *gt);
>  #else
>  static inline int xe_pmu_init(void) { return 0; }
>  static inline void xe_pmu_exit(void) {}
>  static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>  static inline void xe_pmu_unregister(void *arg) {}
> +static inline void xe_pmu_suspend(struct xe_gt *gt) {}
>  #endif
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
> index 4da96b8fadd1..59d7718c59ce 100644
> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
> @@ -10,6 +10,8 @@
>  #include <linux/spinlock_types.h>
>  
>  enum {
> +	__XE_SAMPLE_RC6,
> +	__XE_SAMPLE_RC6_LAST_REPORTED,
>  	__XE_NUM_PMU_SAMPLERS
>  };
>  
> @@ -23,6 +25,32 @@ enum {
>  #define ___XE_PMU_OTHER(gt, x) \
>  	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>  
> +#define __XE_PMU_OTHER(x) ___XE_PMU_OTHER(0, x)
> +
> +#define XE_PMU_RC6_RESIDENCY                    __XE_PMU_OTHER(0)
> +#define __XE_PMU_RC6_RESIDENCY(gt)              ___XE_PMU_OTHER(gt, 0)
> +
> +/**
> + * Non-engine events that we need to track enabled-disabled transition and
> + * current state.
> + */
> +enum xe_pmu_tracked_events {
> +	__XE_PMU_RC6_RESIDENCY_ENABLED,
> +	__XE_PMU_TRACKED_EVENT_COUNT, /* count marker */
> +};
> +
> +/**
> + * How many different events we track in the global PMU mask.
> + *
> + * It is also used to know to needed number of event reference counters.
> + */
> +#define XE_PMU_MASK_BITS \
> +	(XE_PMU_MAX_GT * __XE_PMU_TRACKED_EVENT_COUNT)
> +
> +struct xe_pmu_sample {
> +	u64 cur;
> +};
> +
>  struct xe_pmu {
>  	/**
>  	 * @cpuhp: Struct used for CPU hotplug handling.
> @@ -65,6 +93,41 @@ struct xe_pmu {
>  	 * @pmu_attr: Memory block holding device attributes.
>  	 */
>  	void *pmu_attr;
> +
> +	/**
> +	 * @enable: Bitmask of specific enabled events.
> +	 *
> +	 * For some events we need to track their state and do some internal
> +	 * house keeping.
> +	 *
> +	 * Each engine event sampler type and event listed in enum
> +	 * i915_pmu_tracked_events gets a bit in this field.
> +	 *
> +	 * Low bits are engine samplers and other events continue from there.
> +	 */
> +	u32 enable;
> +
> +	/**
> +	 * @enable_count: Reference counter for enabled events.
> +	 *
> +	 * Array indices are mapped in the same way as bits in the @enable field
> +	 * and they are used to control sampling on/off when multiple clients
> +	 * are using the PMU API.
> +	 */
> +	unsigned int enable_count[XE_PMU_MASK_BITS];
> +	/**
> +	 * @sample: Current and previous (raw) counters for sampling events.
> +	 *
> +	 * These counters are updated from the i915 PMU sampling timer.
> +	 *
> +	 * Only global counters are held here, while the per-engine ones are in
> +	 * struct intel_engine_cs.
> +	 */
> +	struct xe_pmu_sample event_sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
> +	/**
> +	 * @sleep_last: Last time GT parked for RC6 estimation.
> +	 */
> +	ktime_t sleep_last[XE_PMU_MAX_GT];
>  };
>  
>  #endif
> -- 
> 2.38.1
> 
