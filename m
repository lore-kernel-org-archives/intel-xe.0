Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E078D3CCAB
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 09:45:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEAB810E83E;
	Fri, 16 Jan 2026 09:45:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FDop3mBG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B94710E838
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 09:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768556743; x=1800092743;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5zLxL5+eJ7Ong4BBCex4gNy5YF06JPw2tKKJrMl1o1U=;
 b=FDop3mBGn1TuamPIjBULTywupP2ac8rEasB6zlBxMuzFHNfTvHJttoio
 PNmvQVS3t1r21tw1IzUR63Z9UgGATJCKtFYykGb363xFc3eOnEgiiBHTw
 hjau2izQrJVcp6uzUsM8KdVeX2JRXQ4bfDyZx9MKuX8bro2eTTrNwCR9m
 C3JDDwHKUq6US9Drpy+x8ByEBObBrfx2yeiNX0cdvG1RS5R1WYXzer63r
 3muPcBEJraOB3HIJaZKFNMt/jQcKWLix9I1R1xeKdGygQ/x9ZvXWh0/ZZ
 JLFrkihRlg4sn0Rpz3oCLbaMg8pLeHIfNmiuSEOeTBJAx/qtmh+Np8Fos Q==;
X-CSE-ConnectionGUID: S4gF2RZGThCxJtGnHo3fng==
X-CSE-MsgGUID: BXNIMeUdS4C2aa6nTa7HoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80175722"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="80175722"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 01:45:42 -0800
X-CSE-ConnectionGUID: VB/a+nYKSrS52OrwhBSCqg==
X-CSE-MsgGUID: vzELrLqDRtGuVDf0QmPq4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="204815313"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.161])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 01:45:41 -0800
Date: Fri, 16 Jan 2026 10:45:39 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, 
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Carlos Santa <carlos.santa@intel.com>
Subject: Re: [PATCH] drm/xe: Do not preempt fence signaling CS instructions
Message-ID: <q4f6zwko4q6337m3ap244j6q3lfqqrkmlxq2l5ojgcbensliaf@yj7ndeqnrvuz>
References: <20260115004546.58060-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115004546.58060-1-matthew.brost@intel.com>
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

On Wed, Jan 14, 2026 at 04:45:46PM -0800, Matthew Brost wrote:
> If a batch buffer is complete, it makes little sense to preempt the
> fence signaling instructions in the ring, as the largest portion of the
> work (the batch buffer) is already done and fence signaling consists of
> only a few instructions. If these instructions are preempted, the GuC
> would need to perform a context switch just to signal the fence, which
> is costly and delays fence signaling. Avoid this scenario by disabling
> preemption immediately after the BB start instruction and re-enabling it
> after executing the fence signaling instructions.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Carlos Santa <carlos.santa@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index a1fd99f2d539..cd645ee400b9 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -282,6 +282,9 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
>  
>  	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
>  
> +	/* Don't preempt fence signaling */
> +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> +
>  	if (job->user_fence.used) {
>  		i = emit_flush_dw(dw, i);
>  		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
> @@ -347,6 +350,9 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>  
>  	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
>  
> +	/* Don't preempt fence signaling */
> +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> +
>  	if (job->user_fence.used) {
>  		i = emit_flush_dw(dw, i);
>  		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
> @@ -399,6 +405,9 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  
>  	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
>  
> +	/* Don't preempt fence signaling */
> +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> +

IGT tests which calls compute-walker, then bbe are asynchronous (don't
wait for completion, pipe-control is necessary to wait on
compute-walker).

May you try to put arb disable after emit_render_cache_flush?

--
Zbigniew

>  	i = emit_render_cache_flush(job, dw, i);
>  
>  	if (job->user_fence.used)
> -- 
> 2.34.1
> 
