Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217A9EB64DC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 15:10:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B1E10E8B0;
	Fri, 14 Jul 2023 15:10:26 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4153B10E8B0
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 15:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689347424; x=1720883424;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TJHMLe4ulX5NUY0pztvsf2ERui7w0DWVzWeq+IHqB6w=;
 b=U8FkxaRgH96oDSDqgk1TZFR/MJhgIqWOgOBpul1pE95CRABTpSJHoUmm
 7x/2Zhrh9KkDIG6VSkmU8JhHhtaGNVzxlFRrK+Jf73ZaIVZzsFS6o6FZt
 orCTE71bZNPCECNZkiCYIuiHGny1wciW3y/Xn5gq8VJfIwY7lkOX2LTuV
 9F+PMk+gmc2FIZm0cujdqygUOKigiVWmtP3PEU8XPLPcue2rO2RXjZYt8
 YO8CaBUr3hDfOt4JNRTPOQOjDdI9eyZhiQ9Kx2XO6HRVt5QH5AbWaSlRG
 paM2ivx149q/oPEwtJ6rpkPRq9aP1ai3Wp+h3rGi3luRXVVAA/s9G24YM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="345091511"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="345091511"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 08:10:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="672722463"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="672722463"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 14 Jul 2023 08:10:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 08:10:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 14 Jul 2023 08:10:22 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 14 Jul 2023 08:10:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AxR5pwcrz0Fhc3qvwVGiJKNwlISQXfOzhcDJlskmIM2TZrz+tejMbPerORgmcMeBYwBp5d/WJR6SvChL1LlmI+bFfJvfGvxqPLFOSyyNHYPu3bGFdfPvhfGp3Lz7fOOabKEdUFIhuGFwMihH/d3vt6neWuBf/SgwlpOoKLM2YSnj+/QChgrT1AfBaIcqJSzC93FXxD5u2ocfwWz9mCmPA6uN+XQqEDMuJB0zzaHXmBPRMROb1bcTm7Z6ALEn4BuHqKvubqVmrPub/bi6rHSXorR8lcgHGaFyLmbMtD8rpYsrFKe70r2bTI/ROoqcqXvNJagsnMtnPeCq9XR73t9GVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFbLd0MxcNpeQefzPxq0rVnv3JIK6DcBarVJw1bsVDw=;
 b=Ik6yTk+7Gw/IZ4lbiB/FgddcZCJgTihvW79V0p0CVHg14WZ73RiKiQbaGmlh/oJtXOxDBY3eA07OnaV3COnkhsRP/SKCEW91uh0xDwUOovUnAtBq/Tl0/bTsMGQyYN4dLBwvKW0FKwd0CDpK7ccKP60YlIBK/P0jsWLlg8YMQydctOpKGXFBSoRyfuhJ4zqNJRbo5QZ2i9ExHneQXaERo0b9z4C7Xy33zfZmqt2I3T5y8eap/WitADH+V8tP6oCLm1M9IXoY4N68b2aR+n/OR2dsF8q8LkDnYj9CiPtF1WI7+ENYi0CJT/dVmXbXoL5XCrIDGlZc9OLz/5SMzD3ZRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA3PR11MB7485.namprd11.prod.outlook.com (2603:10b6:806:31c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 15:10:20 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227%5]) with mapi id 15.20.6544.024; Fri, 14 Jul 2023
 15:10:20 +0000
Date: Fri, 14 Jul 2023 11:10:15 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Message-ID: <ZLFlVyosnfu8dPe3@intel.com>
References: <20230714053008.1430254-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230714053008.1430254-1-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR05CA0149.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA3PR11MB7485:EE_
X-MS-Office365-Filtering-Correlation-Id: d579ea99-1278-4378-a63d-08db847c7049
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aYDiw+kJGfhL2CFhdhvUACI9NeCu/mbTRB8ty5NuEm/6t0+2OTFrG0vORlZtl4qDNGbCpPqZkPh+GRNCS3wiE/CcnHQU4cm3g6TDQV/JLicBu4gbtAlyB7TnVmtisoSlXgJGFyQFkFX8/GOjX2axC9ZO+DPI9pAQBBzH6uJjrYnTM0eCz76daO4LXrSmjLLhQ4qP5cI+5LcqIVXo3SUaxDcWEWPnnd0vRPAnZ02ARKSwH1jnIJGsw9Ib0zj0yUJ6QGeli6oWBAOMXvZnANYXQfeoj1/yPrCwFE3ta+VOI8AIXsIV5EZxO+xjfLXxjTQQUzrmm9nEMxqbFfdm4d0+3DFnjl1pUH/U1quMYBBVohZj99sqfDK512AHY8pDfFSD0YP10NW8+oyZrhhO/npZDCHhH0rAEbRF3olU3JlTPdLsY8RS8ahqvogg20xQyIECPBj4nuXB3S5L+13NNG4Nt6666kAu1iokcTvQDhqEo7HVc15Ds1oQ3n/KC+icCqV03HjKppJ42tVl9kZalAL205WzXZ2dvVKhVhOQSRmtzaCHm1pErzhDvJ+JV/U3gziy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(346002)(366004)(39860400002)(136003)(451199021)(6486002)(37006003)(6666004)(478600001)(2616005)(83380400001)(36756003)(86362001)(15650500001)(2906002)(186003)(26005)(6506007)(107886003)(6512007)(316002)(38100700002)(82960400001)(66556008)(66476007)(6636002)(4326008)(66946007)(41300700001)(8936002)(8676002)(6862004)(5660300002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xMmIesq5XTV1cnxrq6nX6eueE0GB6jq8z6qMUh1Y3ldyY9onJKWarKRAl1JC?=
 =?us-ascii?Q?cRas8Twl/IITOw/GZnWkNJOk/Ypis6BUDN5nucud760hUGZZB9ZFKXiK1GKk?=
 =?us-ascii?Q?I0j3p9KO2v8I4MsX7s/pCPeQ4HAB3DwJoS0u8+TszlzL8ojRcOcMrWyWv+NT?=
 =?us-ascii?Q?QFuTHlhQPgK6XUAkOpiJ9Ffv8vzRisQ0CeWVvY/dDZ6ekbLsC3pN4KSTosby?=
 =?us-ascii?Q?778B8uCUTw2iFJPCQcPdBa7jybcGfudJtSynbF7fxKc9rqmwcrFd0bTrOtzV?=
 =?us-ascii?Q?FSn6GErk011YAz+3DaZPoN9GivC9rrl5fJmlT+ydhENXKwi0sKlZVttFFoMP?=
 =?us-ascii?Q?B9nU6eaxvc3TaKcTLQmYoZ0WuurDytmS+cw2BlVVgU29IEL6xH6UHLlv3HzQ?=
 =?us-ascii?Q?mZwC3nbhe2OoXbO1RfibbVRqlRzgtfxqfr9PO/LSLPFvHzb3s7feoBDuJwC2?=
 =?us-ascii?Q?ntuMCs/qn2Q4nG5Qv/HSCaEu3yB53JQNKlWHyOM+T5lSoXGpRZDSbsZgnFB6?=
 =?us-ascii?Q?AyiqXfNRBE0PdJec2+6qpRHZgOWmr0w4uez0PxJjN31maglzCFteK6IaPavz?=
 =?us-ascii?Q?/Fo9FuxrbzvCY5YeNdFzhCDvaizFQDFnj7QKMjjI+alnGcCX3HPKnz8paql6?=
 =?us-ascii?Q?Gi1qvLp89ucsA1ArruL3K1kZXaZ5IyBz/DqfxI/a+ZXicyhh4ETCeUbDoram?=
 =?us-ascii?Q?af82fQvlTY9Q+EicLS4K1peLcWmg9wZ0zc+tkoGH9qWfwVXlAK9gnoVxvwMK?=
 =?us-ascii?Q?1Tjyg5glC0IuP7b16g0NXI6qmecc1lADG4rkyCKxMfagVQ/qXTyiYXssmZLG?=
 =?us-ascii?Q?QfVkPnNSFKQDjF+hlABJSMy4y+xTYtb32qFQUtTa8nLbk4UoG4Xn9XBGXMqa?=
 =?us-ascii?Q?8HhP88cPtwOmSQdkSBcVnWuCQO41ogq3hUiKKl28tQ+5eUFlIzBhmlMyrIZK?=
 =?us-ascii?Q?tPU6Ecd2bUdZvtF8ZwZ/e1XueleEl7JneU7qzo6hMmzWW1Pss9Z8PnFShr6v?=
 =?us-ascii?Q?crY3uD5pol/KqiEGo+hko7QbH/qpny56yOeDsyAvcgvJSB4bbX/9s3IH1znB?=
 =?us-ascii?Q?g47RhcnEv++9cq1/uLBnpXcwcB+DIXgk4kysRgF/fM+XoDLNlQhVqAjZ305Y?=
 =?us-ascii?Q?Y+mQexasy1f/XFS3KRi63AGLqSJzhYArpPOZvW3x/nMGBhno8yGl07cfcNYl?=
 =?us-ascii?Q?fUktld/khxVA/EwjpNsTldmffuL0vuEQHNiNm5PJqDJMDknEyCxnfR/Ryvkq?=
 =?us-ascii?Q?hhjjYhNKoG65YBsh2qjI9Rs0rY7K/REZCQVeqflry+0meUDRCit3Y8TKHumd?=
 =?us-ascii?Q?t5T1ErrT8Du6IXCfveA6WcVPMZX8VxVsuWDe5gJLx3/JXLudo4BuTL6f6Iyc?=
 =?us-ascii?Q?eQllrUr16q0sVXuCqOvaWvPC7vOfiNKq16Uo/9J1eKSBiFw8gW+3t9u0U25J?=
 =?us-ascii?Q?ba/lYlD519tImxCkDrDgI7NNAuFQZzQmeOIbVDsIR/dimHyxT1pd4RLH9VaC?=
 =?us-ascii?Q?JxrzZcqoLuZPujVQ2kV1JBpkZ5z/wPsz3GCWmRXQNA00G0TXwFpTNSIupbOs?=
 =?us-ascii?Q?10DMbwOtiHDugIw0Vx7eFbba75HYE9K97hK/esJYV7LEieA9Jn9bEoXOEksI?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d579ea99-1278-4378-a63d-08db847c7049
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 15:10:20.0675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8lp40AKoUD1QDVfbzqlkJ0Q5Btb75CLvatyT+ex7h9rzWSrpxf6Cf1qHKgE+mZ/cWe7verY4tNVRHBu38aVrgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7485
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3] drm/xe: remove gucrc disable from suspend
 path
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

On Fri, Jul 14, 2023 at 11:00:08AM +0530, Riana Tauro wrote:
> Currently GuCRC is disabled in suspend path for xe.
> Rc6 is a prerequiste to enable s0ix and
> should not be disabled for s2idle. There is no requirement
> to disable GuCRC for S3+.
> 
> Remove it from xe_guc_pc_stop, thus removing from suspend path.
> Retain the call in other places where xe_guc_pc_stop is
> called.
> 
> v2: add description and return statement to kernel-doc (Rodrigo)
> v3: update commit message (Rodrigo)

pushed, thanks

> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c     |  1 +
>  drivers/gpu/drm/xe/xe_guc_pc.c | 17 +++++++++++------
>  drivers/gpu/drm/xe/xe_guc_pc.h |  1 +
>  drivers/gpu/drm/xe/xe_uc.c     |  5 +++++
>  drivers/gpu/drm/xe/xe_uc.h     |  1 +
>  5 files changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index a21d44bfe9e8..b31ef2a8ff17 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -517,6 +517,7 @@ static int gt_reset(struct xe_gt *gt)
>  	if (err)
>  		goto err_msg;
>  
> +	xe_uc_gucrc_disable(&gt->uc);
>  	xe_uc_stop_prepare(&gt->uc);
>  	xe_gt_pagefault_reset(gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 3093cfeff0c2..9a7fae727dfa 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -730,7 +730,15 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
>  	return ret;
>  }
>  
> -static int pc_gucrc_disable(struct xe_guc_pc *pc)
> +/**
> + * xe_guc_pc_gucrc_disable - Disable GuC RC
> + * @pc: Xe_GuC_PC instance
> + *
> + * Disables GuC RC by taking control of RC6 back from GuC.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>  {
>  	struct xe_gt *gt = pc_to_gt(pc);
>  	int ret;
> @@ -827,7 +835,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  		goto out;
>  
>  	if (xe->info.platform == XE_PVC) {
> -		pc_gucrc_disable(pc);
> +		xe_guc_pc_gucrc_disable(pc);
>  		ret = 0;
>  		goto out;
>  	}
> @@ -850,10 +858,6 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
>  
>  	xe_device_mem_access_get(pc_to_xe(pc));
>  
> -	ret = pc_gucrc_disable(pc);
> -	if (ret)
> -		goto out;
> -
>  	mutex_lock(&pc->freq_lock);
>  	pc->freq_ready = false;
>  	mutex_unlock(&pc->freq_lock);
> @@ -876,6 +880,7 @@ static void pc_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_guc_pc *pc = arg;
>  
> +	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>  	XE_WARN_ON(xe_guc_pc_stop(pc));
>  	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
>  	xe_bo_unpin_map_no_vm(pc->bo);
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 370353a40a17..81833a53b3c9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -11,6 +11,7 @@
>  int xe_guc_pc_init(struct xe_guc_pc *pc);
>  int xe_guc_pc_start(struct xe_guc_pc *pc);
>  int xe_guc_pc_stop(struct xe_guc_pc *pc);
> +int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
>  
>  enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>  u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 70eabf567156..f8cbd292d6d0 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -176,6 +176,11 @@ int xe_uc_reset_prepare(struct xe_uc *uc)
>  	return xe_guc_reset_prepare(&uc->guc);
>  }
>  
> +void xe_uc_gucrc_disable(struct xe_uc *uc)
> +{
> +	XE_WARN_ON(xe_guc_pc_gucrc_disable(&uc->guc.pc));
> +}
> +
>  void xe_uc_stop_prepare(struct xe_uc *uc)
>  {
>  	xe_guc_stop_prepare(&uc->guc);
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index d6efc9ef00d3..42219b361df5 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -12,6 +12,7 @@ int xe_uc_init(struct xe_uc *uc);
>  int xe_uc_init_hwconfig(struct xe_uc *uc);
>  int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>  int xe_uc_init_hw(struct xe_uc *uc);
> +void xe_uc_gucrc_disable(struct xe_uc *uc);
>  int xe_uc_reset_prepare(struct xe_uc *uc);
>  void xe_uc_stop_prepare(struct xe_uc *uc);
>  int xe_uc_stop(struct xe_uc *uc);
> -- 
> 2.40.0
> 
