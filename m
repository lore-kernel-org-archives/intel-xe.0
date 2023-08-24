Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48950C3DA6F
	for <intel-xe@archiver.kernel.org>; Thu, 24 Aug 2023 19:38:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D770810E08A;
	Thu, 24 Aug 2023 19:38:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D11910E08A
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Aug 2023 19:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692905932; x=1724441932;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KCA01LNPTZECCkx6RpKZdFYiL1AbgIbKO/nZ/ZKUPuk=;
 b=fTVbjRLfpUgWAZgsnqZTcLtmHZLqoGS+O5KzLiBoueqs+b4HMQcTO4t6
 R4OzkNHHkbuF3gbAHzQFNLS1XMS5lj8gXpkj9m3gQuhewqdbwJsDnSZdS
 XP7FjzH5iXwqujjRY+E6uKkoDl9r8/1czNsGszdoiVvIMtjAxFGTJqOPJ
 0/TknrKmvO5IJwoF5Qv51LrF4u5ZGMDCNALXAgmtvaPDkA3ts7WaCEnGp
 L/ABW4awcQ4tzYunUGnuwbSXGC2xmzZXezXrOXbmQ5L01TxxXBQWt6Z81
 2vUBahmzryA74p1CTAysTTAOgYTAAlkXr3cHREOEgeY/fBU+N4v9MrolZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="374518026"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="374518026"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 12:38:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="880905277"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2023 12:38:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 12:38:39 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 12:38:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 12:38:39 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 24 Aug 2023 12:38:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYrDCiGUxWC+627hiObUceorrBUtt/Bo0l5xkLKSTR7XFAO9U+t9Daek7wL79DLjp1bXCcXJILpX11svISErAEoVfd5NVKEv8Y+F+Us7UNTVWKR1Ce/9AYPSH/60VQLo2k/ZxbdmbLuWc4ZqWXX+aBVy4X0Qri2aPsdcltHQxHiBF87TlFCkUReUkZQd4xXrxgNOQ0e4OLShJPCreIujkE4UjajH++UQFL2qWfq+KPCLx3R1H1dkjDn5fUgOvmt0ZAHYke/rMg72gx8BNr+tdlwbymbO5isZkNZcqu5xrdhAuOnY19nYoKayi9e2qA6zFn9y9cXijJTqDGCL6FBp2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOe3lGEzsuCBNepWfbBzZVK3KMGODKBvBkZhwULcnrA=;
 b=bRGdel7x6PV4/X4kMCo6UnB7DMK6VVfeF/usDET45edv9yYlfIZgBXQC1h9AeCM9MWBiYFjJBbgW9Luj7gkfUamgI0EGjxp5fVncLSfDX4f6amnE7u6/sNm5+ADfVJFe1+WosQugM2cZxGqoowwzDR0C/hlNPxwYAW/fGGKEQ/bVkBEQ1yvyJgcUl8sNeFuq/aHC2B2/QROY0KfaW1QowgfbJwC17nooLaXm4AeuOmXbbyKIGHxN5XbIu5FjBSUengEDBe9NNqs+RWr4FIicvTLvkBCxBt2hBd0rHaE6IDQ9x8n05VDPf2zLpNaXw5Y12dePxGlSCvuTYL5xym1mTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7854.namprd11.prod.outlook.com (2603:10b6:208:3f6::5)
 by CH3PR11MB7915.namprd11.prod.outlook.com (2603:10b6:610:12f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 19:38:36 +0000
Received: from IA1PR11MB7854.namprd11.prod.outlook.com
 ([fe80::c66d:c5f1:1ea6:74b7]) by IA1PR11MB7854.namprd11.prod.outlook.com
 ([fe80::c66d:c5f1:1ea6:74b7%5]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 19:38:36 +0000
Date: Thu, 24 Aug 2023 12:38:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230824193833.GY1529860@mdroper-desk1.amr.corp.intel.com>
References: <20230822203720.1005893-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230822203720.1005893-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0116.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::31) To IA1PR11MB7854.namprd11.prod.outlook.com
 (2603:10b6:208:3f6::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7854:EE_|CH3PR11MB7915:EE_
X-MS-Office365-Filtering-Correlation-Id: 45439393-00eb-471b-0dfa-08dba4d9b598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: INSXFaeltpgB1GozSBeWBthGcMmDUgxMVUSC1x/Mg5mup+NBWEakOtZ8e0GSW9eKhd7JdSo3PjQD4GyxL2R1jSWZuM9E7pjkKzwEiitMYS/3Haa7Gbew+EDyh1+rDPEufaKw3Jt8h5m6cOMv3htr7FfFL8f7IXp6ybJU0Mx41uMnX4xGNWnJBl+BWS6npxofzBbr+kYcMoKcqMPbb2gnFC0sGoSvuGb49mRfPReU1UH9kpkJXTj9KLncFr5wogKcvXGrCxTDJ2Oe2uWE/eM0E8bykIRY9wxBFKu3LnhKjfQ2ofgTvUUVNGM55f6xXqz/7E68jBxCePcXLmFagsj1BE1qkbEGIWO7cT8YJD6ntMimmu7rbGA9hX2B0/P5YdHHRGF4EhFKuWCLmPKtyYgpvdDPPxsS7wSCYdHLC7cblqdOJw8P98b70SXwNL0mdkm7Yu205gzDw1OqWxFml9q/sfEcdBmmiAEWg4L4aHAXXIJzDf1T8EZ6zGdOgVEoIxU9Ak1YtR7DlmYdtJB/Am/vo+G5TL39WtbvfSUy3j0xyCJx5katJVLcXiJ8r6FfDNXG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(136003)(39860400002)(366004)(186009)(451199024)(1800799009)(6512007)(26005)(83380400001)(1076003)(41300700001)(66946007)(66476007)(66556008)(2906002)(6636002)(316002)(5660300002)(4326008)(8936002)(8676002)(6862004)(478600001)(6486002)(6666004)(6506007)(82960400001)(86362001)(33656002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?veiO1iGkxD+zf/YzDqV3/R8Gpg4DnHbtB8F9z9cj7xWleW9wlOJYOQnE8/BH?=
 =?us-ascii?Q?dkGVyUI4gUsYe92yIuyKHv+iacVKsOOR5r7MH4fp1lWRpjvYesM4BqL+g4Eu?=
 =?us-ascii?Q?q5gM40zbhVYLCCKLmqj3V96K2W0mOWraGCMNMUghwIDJAVVj0xlUuX96EqVo?=
 =?us-ascii?Q?9uVYqUgI2EJYhJF09SJ7SqAMLih1nmQhjEmQ56/GJuklCqq85Urcbu4UMV/S?=
 =?us-ascii?Q?vr0qLlbmMIQhTL20cG+l/tdy70y9XM1gPFH8ejuyFhRwZCbS9/0L16i8GZ4o?=
 =?us-ascii?Q?GFUYHW6kuJLId2cFh5dK1GcW780MGXEf751tW67EkXlKCe2LoAH0vRH/OqVk?=
 =?us-ascii?Q?/K1wf95yOW+8wNSdbrk1Tvv7mpV4MW3y7Rj2v5O4Coq0U2kgQqQt4bDCj5MK?=
 =?us-ascii?Q?h1a5kLmp4XxjSkkYia//fchfoXx4IJc8nXxeH+zvfB4W0osT7KhM/4q2hwux?=
 =?us-ascii?Q?qg/ctZN8SuaG+HYHbUhQvRK8DkSg6j3hWtzNsfMlYz/l7osMxW3LY60Q9Q2w?=
 =?us-ascii?Q?BBIsY0xluGLW0lGVrOMJvWWUKUw/o0mM0i5zYA1yiMbrHASZx0I/LPK33TZU?=
 =?us-ascii?Q?296sgxZwRo/uGHBKhzKIl6RdP37oTrp5wka6VpRxIBq06SDPBxEGiXgA7Mz8?=
 =?us-ascii?Q?6Wc8xt5blkd/Xw3RuRJAErtyDKI/6WRC2psU7ZExSgK70pO1slFu6PPJCCIQ?=
 =?us-ascii?Q?rkq7fzbMlQeWRpKdPcONWeoedSsQZYeWQECJTfOJKdBW6C8wpJWOEUnzweSW?=
 =?us-ascii?Q?NaVfjukJ5c1fyIC9VqlWGVlb4BvUrvF+hPsVcrPJ0VcoTtjrbzKQ/E1cLB8n?=
 =?us-ascii?Q?QS+EYKeKt3mEEbyBm5TaqtnmVKwAWxSsefUNZN6sOCDKUvFRhf3NuppzHiRg?=
 =?us-ascii?Q?a6epp2CFDYu+Pw+M14iWD23IHV9p5gazhM3HlAhTYG5DEorsO7jKanBbHy2i?=
 =?us-ascii?Q?qJFh577Kz0z7qW2OmaMKiWt2A1TDkB+qRe9o52bItI2q7nviWxRkK6xIO/HE?=
 =?us-ascii?Q?4yZiBsUN8DBNMu+SKebRKlIQ1/NgKH2rkImx1nIb0m9oKXT3LXykQkah/O+A?=
 =?us-ascii?Q?1oTahxIXihYRXFi/sy3oxOa8XQ/wu2ocDz9N8mTe/slmh4cEAkDg3N392v+S?=
 =?us-ascii?Q?3K+sf+zCcQh3osUEpWPW1NYKOUao8Md5gzAdyg9SlqWalNWwOUu10oRsFG1p?=
 =?us-ascii?Q?H+icOxvA+mqeiHxof/nl+MjNlAdpR3JpTToLTCrPRmnqQVE/JweqcTcEF3t7?=
 =?us-ascii?Q?YmfFfNFSFAzzIqgoywZpyMZxmzRsfpxbZp5zdmYtdrSfDw/dYSsWOhb8K3ki?=
 =?us-ascii?Q?+3tyaxHxrwGbCnbCxi5WPy88G+RhzSXMEl+FWs5PaWYF0fgQzEW9RrGSOJ9D?=
 =?us-ascii?Q?2xcnWVDCdROwWveNEjepVBZ/x7D+ssYSvjYSS08eMOjji6UmrMLgbETAg7aq?=
 =?us-ascii?Q?msifbg8EBBOA32FkIxTAgRNDEnlr6MFZ2LLq2omQaHSzrgL/8xdpABelxQ9C?=
 =?us-ascii?Q?CTHm3HdHZHBEd2Qq4h05YqX6NoqY+C6BZW1v/zMKgkaf5j9yq7GAu50JEhCi?=
 =?us-ascii?Q?0I5WTTZ20D7hJ2SU1iKcDzKBlY1TDmtCOYIJY65j9cdekX2f9iCvWcTuCdPg?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45439393-00eb-471b-0dfa-08dba4d9b598
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 19:38:36.7062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iiSY8kCr6R2TLAHGr1Yl3Rwv1Yu+PcA0qpS/bpOgvfitOOyiEw/YkeOQjlsmlipsiGCxKMISNAwPope8l+uKmgEot4uwxkOSx0q1LyXW43U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7915
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/guc_pc: Replace platform check with
 IP version
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Aug 22, 2023 at 01:37:20PM -0700, Lucas De Marchi wrote:
> Instead of checking for MTL to decide what RPS registers to use, check
> for IP version, assuming new platforms will use the more recent
> functions rather than the oldest.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index c03bb58e7049..b01ac684d631 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -340,7 +340,7 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
>  	struct xe_gt *gt = pc_to_gt(pc);
>  	struct xe_device *xe = gt_to_xe(gt);
>  
> -	if (xe->info.platform == XE_METEORLAKE)
> +	if (GRAPHICS_VERx100(xe) >= 1270)
>  		mtl_update_rpe_value(pc);
>  	else
>  		tgl_update_rpe_value(pc);
> @@ -365,7 +365,7 @@ static ssize_t freq_act_show(struct device *dev,
>  	xe_device_mem_access_get(gt_to_xe(gt));
>  
>  	/* When in RC6, actual frequency reported will be 0. */
> -	if (xe->info.platform == XE_METEORLAKE) {
> +	if (GRAPHICS_VERx100(xe) >= 1270) {
>  		freq = xe_mmio_read32(gt, MTL_MIRROR_TARGET_WP1);
>  		freq = REG_FIELD_GET(MTL_CAGF_MASK, freq);
>  	} else {
> @@ -680,7 +680,7 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
>  	struct xe_gt *gt = pc_to_gt(pc);
>  	struct xe_device *xe = gt_to_xe(gt);
>  
> -	if (xe->info.platform == XE_METEORLAKE)
> +	if (GRAPHICS_VERx100(xe) >= 1270)
>  		mtl_init_fused_rp_values(pc);
>  	else
>  		tgl_init_fused_rp_values(pc);
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
