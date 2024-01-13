Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7B6C3DA79
	for <intel-xe@archiver.kernel.org>; Sat, 13 Jan 2024 01:12:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBDC610E066;
	Sat, 13 Jan 2024 01:12:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DB210E066
 for <intel-xe@lists.freedesktop.org>; Sat, 13 Jan 2024 01:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705108321; x=1736644321;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KFRne/zsAQ0BpL0z/WLFcjNh07T3wi57Ua1e3DHyTXE=;
 b=FsiQWzzieH/xxlEQYpxHUPx0FRl80kYcqD/tFH90VRlpWXXMhyVXIcEF
 toLbKvYq5w5dDFlYLvnA4pVcG6w8EfX+fug2KH/NkyyOOJjcv5TWUdkBA
 yudjnyNR9yPZIGXHe64ReuJ/HnANO4CTqy1XSDojtM+XQ7RijdR/TPxIc
 5Py4QpHIzE8MgFKOfXNTf7xpJ8LL8Je7cGLwlXbQ+G997uC6EUzDvdjXD
 +Vkb04lf8zL05x1JlLvwV9N9Oi+BeeGp5U3ssPDtvGAK1hFAv6TdiJ38t
 GNqEI5J0iCJrCi6B/cJyUIvSh2rh3DQb+S3Ek7/0nRDz6SB/tJDY37F0H w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="430500800"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; d="scan'208";a="430500800"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 17:11:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="817261284"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; d="scan'208";a="817261284"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jan 2024 17:11:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 17:11:57 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Jan 2024 17:11:57 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Jan 2024 17:11:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bc3K9Qndd5RUV2PJtj/e7q1eh2J3AmLp6yFvalBNu5XkJBU1mXA5yM05i3ostifFjauTZYyMlwzZtjfypO1hbYzi47VA9oGgLu0eiQPgfAe+frnvTB2ahEhIKI4OVH2P9H79Kc2f/rPW6LUgy+ZTEuWUpkFGm8w2+UC6aSbIEPhrGZcEJBPF39hEfG9gZww6UInVCCbxNralLqsHLM2xp42PR63wTblzOUr//fHOk4XrawFrNziwFh0whwB1fRkQ6SifxQ+qjjAJf/mHSGbMKzAWfoWKe632RauIcqM1+uGqYBEey5rO41zpC9nSDojCHv9f7cCAeWJ7SFS8S8vN2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8M585+IslcJIcz1mWrXZHbrxqApDGj848AuJtrMrAg=;
 b=M+a+YyqajRrrudPR4EBNkWWZlRja6KZJ9IzWc7fmngILUAes4EXMgDjdi4IntRYs4rBpYZCrrAY05SZ1aDNN+T0/h01LTJLiws+/bRNzh7DbXvv28dYbTVC8v8TCBcrrmlgtafbLrYoOUHqPL/bixbgX7ix8+ncVgpin2GUSs9C0xhrrnLk+Gmg4+9sZyfhOO3o6TTSCYyodlmrScxdj8OcKef4Zp8iziQa4nlVp0n8C0RhzIcamHC+iKH4mkW+ecZB0bzcRBS88Ffjp3kM9rEjxF9rkpx7Ei+erGg4wI67ACzCau13zziOarSFsPp7e56w0lFqwfTWg1ndwhNAGhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by SN7PR11MB6969.namprd11.prod.outlook.com (2603:10b6:806:2a9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Sat, 13 Jan
 2024 01:11:55 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::c59:e321:133a:3515]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::c59:e321:133a:3515%5]) with mapi id 15.20.7181.015; Sat, 13 Jan 2024
 01:11:55 +0000
Date: Fri, 12 Jan 2024 17:11:52 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 8/8] drm/xe/vf: Don't support MCR registers if VF
Message-ID: <20240113011152.GE45138@mdroper-desk1.amr.corp.intel.com>
References: <20240112152649.849-1-michal.wajdeczko@intel.com>
 <20240112152649.849-9-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240112152649.849-9-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0231.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::26) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|SN7PR11MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: 0758fdeb-19af-4de6-3ffd-08dc13d4a1f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fad/R8zV5Nua82pOMCFBR1v3spn3m3/7DN+b+8tkYz8zUhqKwAdzyuLx7VAOS6XLKkVfKxH14iXD+YuswniwPGGi+v283JRLHu+poBrCe0hI6zA/CjN3wSBJT/K9yuQP+wQNP9FPgv/4k0jgXylCsWd5+0ASY+EaKcCWDarODtOIYSeEFExvdd2y8nwRoJvDfBJrd6t8joB94AOhF2c/S2AdEywRp0/jA8FW0ccsEArhx4KuiHMKXikVDrIOjobDD3OC4F6dI0pt9Cv9gNOASOHnopZ8vcXxfyuX0Itw6QJ8gmKXARbb3zxd0QReMzE20j1dJ2+FPmxjLCjqTQJBpWaGweATeosAwWSPGb3zsZ80CpWlMC1dEwGbQuQURXsYotFvIlPqHQTHAGWis332MbYcpJQrsuUrUnPr+4NXIV4CC+yXkL8Y7du6A6vX/aWRQgtp5tBUsuzloF1HNnZC4qe80VEpNERO7hsLoJQs/WLNotr3XiKkunrEqC5tPVMmLuq8vPenY/XRkv/nlQbSrFkw6hUzgz+rQR353k+by5H1HSgP9rNd9f7IYzZKd5UR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(396003)(366004)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(26005)(107886003)(5660300002)(83380400001)(1076003)(38100700002)(316002)(2906002)(6862004)(6666004)(8676002)(8936002)(66946007)(4326008)(6506007)(6512007)(66476007)(6486002)(478600001)(66556008)(82960400001)(6636002)(41300700001)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xeu3854YIXv2a5QcU2ig0OACDXGLFUbJDacP8UagkRpPwIxRRAzVMX4DKOKh?=
 =?us-ascii?Q?7Aet9SDK4IziDPS272RYD58+xgJ3OUk3xonifdzChrf9Ll/c2KT7/v1nsubX?=
 =?us-ascii?Q?ToR70l8/qPuaBo0PbFQ0IKKRF7K5RR7NR8Vi4r3GnQ+9efpRBDg3CPTuDbmB?=
 =?us-ascii?Q?uNQiBW7e2iF+v6y9mWVVUy5J4wOQ0qtdfwkjzgV5sMt3Zq6hJazrRY4A3sLY?=
 =?us-ascii?Q?SWKBU6MRLGXO89AxQDbmgAaSiMZj6VrAVbBSV8M2oiO7TWeXjJ/2ingBENQW?=
 =?us-ascii?Q?c5PqoS+76evzwX0HFfUur2zAMd89nz8JCF4Z670l4UBZhY05hvw8X5vSB8iN?=
 =?us-ascii?Q?qYo0GTV/Q7rSeUmzoOJPpmR5CpzGi/vJbTIGERWWcg+rtDiAx2aOvUvfpfuF?=
 =?us-ascii?Q?iF2j3mXbnnv9EXXTuD8tjCVJqesfnTLI8lkXMJsdehpbDPpttNyOL3VSqWRI?=
 =?us-ascii?Q?2mtpLjPlgE9uZyZsqhDe2lv8EftmAdVvO6DhxqfxPn/Ap5x1kAjsJ1p9VkZh?=
 =?us-ascii?Q?a9xiHzT3vLgPN1gbPYBbHRaLs8LLOdlCuvOvHWDL86fT9QBUxO1+belNzCo2?=
 =?us-ascii?Q?ShbDSpnw2iIG2xlwGf6i9rNwuXmFQAihe60KWw/CmySCfrEckcGEg7yTqK55?=
 =?us-ascii?Q?BFO9onslKS5O1m38kqyvCAKP/jffoJ6zbdnUSR+FKTy+SeGIz687pO6vaphl?=
 =?us-ascii?Q?Kf3pxPZpUU9HsvH36rp5tGmDE8Mf8k+oLex3qUbY6MCctXom0Vph2HtyHY6F?=
 =?us-ascii?Q?+8lSpEgLhApV6toiW4JnVXehxVIJIDQoG9Qx9ssq4bUfDMPvLiuR4xDuUARR?=
 =?us-ascii?Q?NairJlqZAPbCzm/dBaSOld6XJq9z/9H1zdygIZaMHyHSfePHfT70i4/36WA0?=
 =?us-ascii?Q?RSGuMDZGFom/7+ppA7y3EWXBOIK0eEcJMrGIIZ4hqBFp7qOo9xnu0jsKFEM0?=
 =?us-ascii?Q?U/cSLrFiKhEqM3tNhhwPa8RyKDjzyh3r0U9bcZYHPuV9mGusuOplly0JOYbs?=
 =?us-ascii?Q?Mt/lrLTWhbhArjkCbPZsj0NQLsVo/R0ieS6xLjf2ZXse3wcCvs2KjgvgD6ax?=
 =?us-ascii?Q?NebQZj/xYed22eVYfRm2+cTDnfSFA+iPHrzBz84M3BIdGBvsZ5Loi/PkHq2K?=
 =?us-ascii?Q?wHdsiB+kxF/5RucBnhutkXg2Bm3NeXRDjCAUoA4tHKN2m90aTjcQWDRUkcz6?=
 =?us-ascii?Q?TrAgMPfwG+BdptX2Xdf0SKWTktoAZwh1uSo02IT2gPF9nJn0FB369jwR78R9?=
 =?us-ascii?Q?079Mj0g9JAMFZzgqqnivgYEOQCbbOEzsSMwsQNfmWfUdMxRTxCf+DGmsFyb+?=
 =?us-ascii?Q?sDhrdYsZ7bAJPV+VYVHmv3qxe0ZS2SEHfSdh5ryzEwKYwvGcO6Scmi+IbRmG?=
 =?us-ascii?Q?UCvRJQcnkuP3idx9zsiHmCEsBNaDurdc6ZYOClyP4N1t3HVYaDqkExCNbQIi?=
 =?us-ascii?Q?ZXo0ljz40slqZ0uoqRQ2bOTQgc/vqdvjGyWxCGrL/IF07+gBPUztW13NRfxE?=
 =?us-ascii?Q?+/wC8oPJsRvAusLXb3WyOvMttlbGp4r1JzV4tUGnlpNKjs82FrnOysXqRhjz?=
 =?us-ascii?Q?36QTNS2i0s1PA79HWPVWFmrpHxeCUyKCeuZ6RyBmVf536rsI8Zj+pR2KGJME?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0758fdeb-19af-4de6-3ffd-08dc13d4a1f4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2024 01:11:55.2139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wdSro8XOAI+KjEF0ykXuf+wpFgM83WU+NwofjB3MpZhfMbbG3uh9zAQtzwEwumEQU8lUwrDfueUAreNfLrMIJPtnBf2oKwBD6Yle72hcMM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6969
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jan 12, 2024 at 04:26:49PM +0100, Michal Wajdeczko wrote:
> VF drivers can't operate on MCR registers.  Make sure that driver
> is not trying to read nor write using any of MCR register.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

I can't find the right spot in the bspec that explains which limited
registers the a VF has access to, but I'm pretty sure the steering
control and semaphore registers aren't among them, which in turn makes
it impossible to use any of the other MCR registers properly either.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 77925b35cf8d..4e088a273535 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -10,6 +10,7 @@
>  #include "xe_gt_topology.h"
>  #include "xe_gt_types.h"
>  #include "xe_mmio.h"
> +#include "xe_sriov.h"
>  
>  /**
>   * DOC: GT Multicast/Replicated (MCR) Register Support
> @@ -38,6 +39,8 @@
>   * ``init_steering_*()`` functions is to apply the platform-specific rules for
>   * each MCR register type to identify a steering target that will select a
>   * non-terminated instance.
> + *
> + * MCR registers are not available on Virtual Function (VF).
>   */
>  
>  #define STEER_SEMAPHORE		XE_REG(0xFD0)
> @@ -352,6 +355,9 @@ void xe_gt_mcr_init(struct xe_gt *gt)
>  	BUILD_BUG_ON(IMPLICIT_STEERING + 1 != NUM_STEERING_TYPES);
>  	BUILD_BUG_ON(ARRAY_SIZE(xe_steering_types) != NUM_STEERING_TYPES);
>  
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
>  	spin_lock_init(&gt->mcr_lock);
>  
>  	if (gt->info.type == XE_GT_TYPE_MEDIA) {
> @@ -405,6 +411,9 @@ void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
>  	if (xe->info.platform == XE_DG2) {
>  		u32 steer_val = REG_FIELD_PREP(MCR_SLICE_MASK, 0) |
>  			REG_FIELD_PREP(MCR_SUBSLICE_MASK, 2);
> @@ -588,6 +597,8 @@ u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, struct xe_reg_mcr reg_mcr)
>  	u32 val;
>  	bool steer;
>  
> +	xe_gt_assert(gt, !IS_SRIOV_VF(gt_to_xe(gt)));
> +
>  	steer = xe_gt_mcr_get_nonterminated_steering(gt, reg_mcr,
>  						     &group, &instance);
>  
> @@ -619,6 +630,8 @@ u32 xe_gt_mcr_unicast_read(struct xe_gt *gt,
>  {
>  	u32 val;
>  
> +	xe_gt_assert(gt, !IS_SRIOV_VF(gt_to_xe(gt)));
> +
>  	mcr_lock(gt);
>  	val = rw_with_mcr_steering(gt, reg_mcr, MCR_OP_READ, group, instance, 0);
>  	mcr_unlock(gt);
> @@ -640,6 +653,8 @@ u32 xe_gt_mcr_unicast_read(struct xe_gt *gt,
>  void xe_gt_mcr_unicast_write(struct xe_gt *gt, struct xe_reg_mcr reg_mcr,
>  			     u32 value, int group, int instance)
>  {
> +	xe_gt_assert(gt, !IS_SRIOV_VF(gt_to_xe(gt)));
> +
>  	mcr_lock(gt);
>  	rw_with_mcr_steering(gt, reg_mcr, MCR_OP_WRITE, group, instance, value);
>  	mcr_unlock(gt);
> @@ -658,6 +673,8 @@ void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr reg_mcr,
>  {
>  	struct xe_reg reg = to_xe_reg(reg_mcr);
>  
> +	xe_gt_assert(gt, !IS_SRIOV_VF(gt_to_xe(gt)));
> +
>  	/*
>  	 * Synchronize with any unicast operations.  Once we have exclusive
>  	 * access, the MULTICAST bit should already be set, so there's no need
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
