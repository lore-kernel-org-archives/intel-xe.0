Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE68C0015E
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 01:23:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1B410E1A3;
	Fri, 28 Jul 2023 01:23:08 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FB410E1A3
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 01:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690507385; x=1722043385;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=G7XGfPnTuMVobM9MSiiplqS9OfgYBbIkf4+ENsRbPoo=;
 b=Oy2qsR6vIOTasXcfLfPp+UfuQCYfulWwD6UgyXjevpnLl+VTPOkydMyP
 jtEQqHJdEWLEnOAtP7uCSEV9lUJsyZokr8DDonZbb/valBZZPB2MDO7Fz
 vTeXuwGX9NJvxuxYivkCXUfC0x/IaSt9M4qGXLGSSsJ+Ztq9vKfef/ULk
 cJ2U9AkfqtzHWYEbKIfUXjOlQSe/YCQp1yX+ZqTA6xnsZy4WoieGRdo+4
 6Ks8fKoVFyEplMrqCuh1DeAx1KZGFahIDPjlX4PXXEG7sLnqQzpuNHl+a
 1yKNriIJ689FdaYsez2oqMz8smRudR/E9swBpyG1WI7Jq/rgUdMi/zFHE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="454841778"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="454841778"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 18:23:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="704337943"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="704337943"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 27 Jul 2023 18:23:03 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 18:23:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 18:23:03 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 18:23:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdsZTOZDiP8Z557uLL2p40hHn3jk8oFWJX4xtJyOu17Yi35DxGcZyUnj2+jdw0/NbgrHh1J7rmpJg9sRv0AEtXpXUR3rpy+RyqPnkJG0c092xLCREmTvGHI6e3S76cAKAS4L1/p7Zv2yY1sSh4flroGlo9U+STD9LuysXYbQYO722UO3zpR4nvO4bx7XUsfb9BCpgDB1qtQ6JW3sD0Ad9Yv2RIkhLz3EWYwbtFJnNSs+SllZ5UOoqyMxiWOJjClKR45ftAHo3YyP1PyeIddGNaETbXrAKd8VS5/Er6fk9sE5qNh9x52nMCe0vz608P+3SZJdX2gfhH8Dava5kMc7Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBgnHW02AfJIE5H/B7NC4IOR/99qPwJHl1Za3g6XvjU=;
 b=cU0I9/IhqjZhiYC41GSPoe/b9sepTO3RLhC9LQgpxS7UgeezMcKHU1GZz+UWL7zq0ogTqFWUlXaUJ0FXIMav6UAHrAi5TAbdncAPXwALsged9Yd2nHMjQtn354+DnzLprL8MGPKyPe6pkQyz/Xnd721jKwcMCor2Y9Wcrd4WwnA+9zA00syBL0uAOVW0s8jpmfYXqZmLBqltdpaYss3IzBIRFfwS5eBkoGd/5JZ0F2rerWr4vHSjkZHIgD3/G1co66ngsNoOjj8hPdg2KPTtXfMl8sYqINuoAHdH/tDonNBVOnNVWb8KoD/FH3QRx2Q9HuLgR5JScOACLrHhqYg70w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6229.namprd11.prod.outlook.com (2603:10b6:208:3c6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 01:23:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 01:23:00 +0000
Date: Fri, 28 Jul 2023 01:22:13 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <ZMMYRc1yzYnhF9Mq@DUT025-TGLU.fm.intel.com>
References: <20230727185945.401047-1-daniele.ceraolospurio@intel.com>
 <20230727185945.401047-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230727185945.401047-2-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BYAPR21CA0002.namprd21.prod.outlook.com
 (2603:10b6:a03:114::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6229:EE_
X-MS-Office365-Filtering-Correlation-Id: d157b1f8-9478-47e5-058e-08db8f092e96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s4tK4DxJbMdbjYaMT1tmJVHGnyVRVSvElIKtAcHNU8yMflTJBg7oTRQZDtknguL/R4uBy8bh+52VrW5K0pkQ9h0dUxGE7c8Vd56IV9ZwdKx9ifOL9h6P8EOlxGCxkLCg5iJUpse54qVPYFhaaSVKO5H+29Hhcvo0zILxjuUppBqdcY10zsXz3gW7TkusajtRqLCEDeSAZoXX+oZBMvZC+xwFdTh27UHEGj2R6qpVGVB9x2GGjTDA5P4m5WYHNv5wf5gMLtVI5u14o1l0hOSq5y5ap2qM9qf0dZeM1J8QBkuzd+l9iLd/5LUItUi5Si+/O6F0rSQzXEkdkOBonRWJmFgzmjZ9uclDft9jEbBWFVjvyTUgSMbdcIsHyhoxmFt+Aul5W8CT/HMMP767Az5ZLczVdBbNB40FBB3uoC4+OikrKaxyVJD5ort+fJyNlmC8rIvwQVmoGETRGnQwcfCWfdDf2xEQjb8p+StQVatUVzgcvoOPjAO+0XOmeXMryKz31kVvvlzRlhUpduMVsK5CZVLzjZpw/WaoLm0AkW2bAE4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(136003)(396003)(346002)(366004)(451199021)(2906002)(316002)(6862004)(8936002)(8676002)(5660300002)(44832011)(41300700001)(86362001)(6512007)(6486002)(6666004)(478600001)(82960400001)(26005)(6506007)(186003)(966005)(83380400001)(66946007)(38100700002)(66556008)(4326008)(66476007)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6J7zbMfXvtBlnN8Zrt06YQf7WKLFb1Nf4OYYjQiWcv/1FSlalPFGNRn1CEiT?=
 =?us-ascii?Q?sLG+f9ud+SqzQ4QyPp1sdpKL281dcrNM7XSM8qvV6dd7Phfz+tkQ/Co0ZZ6s?=
 =?us-ascii?Q?MSB8iRDJcUrY/kVOjvZ2YYKzTpWzedGU3o0/bfon67nigxVRYGaoOwYpmBnK?=
 =?us-ascii?Q?XVMvwd771ti5ZA8yGcBoabyiGTta1hRppy34fuzePsIJHNmWoEebR16qu880?=
 =?us-ascii?Q?bxHBP5XBFWs59rdUDlOBpaSjp+cqk8OpZmZt2avNi7y1TpYT8HqSs6MwtgGg?=
 =?us-ascii?Q?w8bRmZJrK+BB8f2xEVUrW9vgqyYXv6YEkp28hHaEna63P+MtjamGawB8jViF?=
 =?us-ascii?Q?royW8g+ZNhlL/2gQv+GAgjjh2QVI4+HCnk64VawxpeaHAsJV6ZxG5AW9UMFG?=
 =?us-ascii?Q?WQJClEeEmVhyhwVIgLTVPzeoUmJVwTsQ/+Eyd2qyOHEUVxpTe3bDXPMII7jY?=
 =?us-ascii?Q?AKG8JI2+aW3RMrwTFyi00i/xF7ZuVzPZWZAsx3Dl+eFn0pIf4HZgj3vGObia?=
 =?us-ascii?Q?oAI/T65DO4uyAh5L224aAZ083+WpBRV4nLmIWZAAb060Oql4S/Ram6iI23Nz?=
 =?us-ascii?Q?f+xDXVoXHbzObvwQ19aGcHonFI8AXcTZ0Sofy6mEOxyQpetFmK7WB01E4MbH?=
 =?us-ascii?Q?V4W5AKQzSSGmY20eRp56MyYicvzKIf8E/FA2e+vojYK56GTQgBckTQQ6TH75?=
 =?us-ascii?Q?G63P0GF7QJNQ8Q8cl9LerTPd9+fb9s1ulhr1DXPgGDrlnsexrRg/QEW8yVrx?=
 =?us-ascii?Q?TH8pvHRHQipu+TSnBwUu5V+U0rjtnaIkREDvZglJqYADzRAnL0t6hXi6SUYo?=
 =?us-ascii?Q?UV1nZIe+IGD7Njxuxw7wuisnht1F8EQ2kvvdm+81Bp4FgERFm3lSRohYR+2w?=
 =?us-ascii?Q?00edlCfJdCgZS+ODbEiRInRbvw7N92I1cW9zRit5Bvs681XX5lNvbeJjMhcQ?=
 =?us-ascii?Q?Nc1f8sFnHRZzJWtESdPd+ri2rNE7YZZ5lAxP4cy5Z4yPlPu1vqu9jrkFMSAA?=
 =?us-ascii?Q?YLPQLZEny8H8L6HB+YRi5s75VkZekmC09H15W4mioRsqnCKBj7qg/V75zzIV?=
 =?us-ascii?Q?UyJpjTOkMrYIlXFVwKcHfBtvLORyblsllflOLoY6Fcuk5CQ4C6zYMHkOnW14?=
 =?us-ascii?Q?kWI/9y/hEaGpkTzZ1Oa0drVaTs3qFWaClZzY+Kx0SgwzmutzCP6oCNhdfzm6?=
 =?us-ascii?Q?mu06Nt82p+dxXLCZMvY0WuO9BK52VC/em1A7uK4F8UGy8MZOEtA4rHX53DEB?=
 =?us-ascii?Q?iYha+/VeDE+kppvUNaw/6BL3yVQFPwDV4gurIAV2ecaEiEMK2lCSbzgm33lj?=
 =?us-ascii?Q?QxWooCVi2BIkElePwjhY3pd2IkspgU/LbSpWoPT5XaFZMKDGydiKSy2X5d9c?=
 =?us-ascii?Q?7JDsAJ7TE+KcRCA+7Y1FxUDXXZj27PivP2ooqXlRPQZIj81YsWYLqvSPGYqA?=
 =?us-ascii?Q?hDORDtmRnKK93LMLUY+Qzj/dVSh4cRUSfh7SIGYnO3IxM4KwsLrUu5l7i0lf?=
 =?us-ascii?Q?NlVOTKpdMdZ+sD2/mc4mx4MmL0u0YE/m/qHFXoteplUR9jf1mUr48ezlm7tE?=
 =?us-ascii?Q?XBRg09alnreLFtbMf1MSgQmJAEe1nC3FhNitEWi/u9rpCNbp/46Ik8JoR94e?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d157b1f8-9478-47e5-058e-08db8f092e96
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 01:23:00.3601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6NezH+uyw0q1N0iyU66qHWAYm0Nfm+yu8puFofxXsRBGhBw/GDQZzMBe44L7TN2LGvDAAg55mAhvy4URjNo0iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6229
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: fix submissions without vm
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

On Thu, Jul 27, 2023 at 11:59:43AM -0700, Daniele Ceraolo Spurio wrote:
> Kernel engines can submit privileged batches directly in GGTT, so they
> don't always need a vm. The submission front-end already supports
> creating and submitting jobs without a vm, but some parts of the
> back-end assume the vm is always there. Fix this by handling a lack of
> vm in the back-end as well.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

One nit below, with that fixed:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
>  drivers/gpu/drm/xe/xe_ring_ops.c   | 8 ++++----
>  drivers/gpu/drm/xe/xe_sched_job.c  | 3 +++
>  3 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 911d4965c27c..c5b265624344 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1128,7 +1128,7 @@ static int guc_engine_init(struct xe_engine *e)
>  	ge->engine = e;
>  	init_waitqueue_head(&ge->suspend_wait);
>  
> -	timeout = xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT : HZ * 5;
> +	timeout = e->vm && xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT : HZ * 5;
>  	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
>  			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
>  			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index cc278485908c..8e21c19cb041 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -212,7 +212,7 @@ static void __emit_job_gen12_copy(struct xe_sched_job *job, struct xe_lrc *lrc,
>  	u32 ppgtt_flag = get_ppgtt_flag(job);
>  	struct xe_vm *vm = job->engine->vm;
>  
> -	if (vm->batch_invalidate_tlb) {
> +	if (vm && vm->batch_invalidate_tlb) {
>  		dw[i++] = preparser_disable(true);
>  		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
>  					seqno, true, dw, i);
> @@ -270,13 +270,13 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>  			i = emit_aux_table_inv(gt, VE0_AUX_NV, dw, i);
>  	}
>  
> -	if (vm->batch_invalidate_tlb)
> +	if (vm && vm->batch_invalidate_tlb)
>  		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
>  					seqno, true, dw, i);
>  
>  	dw[i++] = preparser_disable(false);
>  
> -	if (!vm->batch_invalidate_tlb)
> +	if (!vm || !vm->batch_invalidate_tlb)
>  		i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
>  					seqno, dw, i);
>  
> @@ -315,7 +315,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  		mask_flags = PIPE_CONTROL_3D_ENGINE_FLAGS;
>  
>  	/* See __xe_pt_bind_vma() for a discussion on TLB invalidations. */
> -	i = emit_pipe_invalidate(mask_flags, vm->batch_invalidate_tlb, dw, i);
> +	i = emit_pipe_invalidate(mask_flags, vm && vm->batch_invalidate_tlb, dw, i);
>  
>  	/* hsdes: 1809175790 */
>  	if (has_aux_ccs(xe))
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index f581472cb391..e1af1f2a44c2 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -87,6 +87,9 @@ struct xe_sched_job *xe_sched_job_create(struct xe_engine *e,
>  	int i, j;
>  	u32 width;
>  
> +	/* only a kernel context can submit a vm-less job */
> +	XE_BUG_ON(!e->vm && !(e->flags & ENGINE_FLAG_KERNEL));
> +

The direction is to drop XE_BUG_ON and replace with XE_WARN_ON [1].

I'd do that in this patch.

Matt

[1] https://patchwork.freedesktop.org/patch/549682/?series=121439&rev=2

>  	/* Migration and kernel engines have their own locking */
>  	if (!(e->flags & (ENGINE_FLAG_KERNEL | ENGINE_FLAG_VM |
>  			  ENGINE_FLAG_WA))) {
> -- 
> 2.41.0
> 
