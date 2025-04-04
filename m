Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24ADC3601A
	for <intel-xe@archiver.kernel.org>; Fri,  4 Apr 2025 15:45:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58A4A10E246;
	Fri,  4 Apr 2025 15:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mRARH+Gz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 344AF10E03A
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Apr 2025 15:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743781500; x=1775317500;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WuYHkz8wrK5TF2xeusPozwEcwZAW2Mj1RBLedirRh9s=;
 b=mRARH+GzfxAybP9TvZkLkJurzRcvzi2t08C7tB+w9nhSMKN2OqNCeEHa
 oNhZvGhgaQZkwb75WbnSNoDM0fNFhElwiS6MznWJ2gdOvxfeMgX0/t5CB
 rHvRJPAf1aXj8OUq16sK9G5uZO/Z/NSvGw5KdEpmDZN4kKfhGEDVLX6Ej
 AzaLczQWsoDGSwIKpXFMxh/zYq2ERY1FuYTEtGZeqVmln4FCSuco3ViNL
 GkbF8qxoLlXrfEUfdRffWRAGGvuO3u+phnkAy0fnaQBB58tV4UX3+oiLZ
 EScT0KwvofwemDHZLLshw7RHWW9AZWIRf0Jie5YwDlsxKYiWQziiCqGgC w==;
X-CSE-ConnectionGUID: rnRYOAqURYubi82tSDK8mA==
X-CSE-MsgGUID: 46j/Q469TVm0byMPBwr6QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="55859788"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="55859788"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 08:45:00 -0700
X-CSE-ConnectionGUID: Fj8QeozfQamPOBdJ/jy41A==
X-CSE-MsgGUID: awmIN73EQOePZsM86wKGug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="132545430"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 04 Apr 2025 08:44:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Apr 2025 18:44:56 +0300
Date: Fri, 4 Apr 2025 18:44:56 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v5 05/16] drm/xe/xelp: Quiesce memory traffic before
 invalidating auxccs
Message-ID: <Z-_-ePLbnbZOALEN@intel.com>
References: <20250403190317.6064-1-tvrtko.ursulin@igalia.com>
 <20250403190317.6064-6-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250403190317.6064-6-tvrtko.ursulin@igalia.com>
X-Patchwork-Hint: comment
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

On Thu, Apr 03, 2025 at 08:03:05PM +0100, Tvrtko Ursulin wrote:
> According to i915 before invalidating auxccs we must quiesce the memory
> traffic by an extra flush.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c       | 14 ++++++++++----
>  drivers/gpu/drm/xe/xe_ring_ops_types.h |  2 +-
>  2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 61295f93ffb7..3f075dd36c86 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -172,7 +172,8 @@ static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
>  	return i;
>  }
>  
> -static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
> +static int emit_render_cache_flush(struct xe_sched_job *job, bool flush_l3,
> +				   u32 *dw, int i)
>  {
>  	struct xe_gt *gt = job->q->gt;
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -204,7 +205,7 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
>  	 * deals with Protected Memory which is not needed for
>  	 * AUX CCS invalidation and lead to unwanted side effects.
>  	 */
> -	if (GRAPHICS_VERx100(xe) < 1270)
> +	if (flush_l3 && GRAPHICS_VERx100(xe) < 1270)
>  		flags |= PIPE_CONTROL_FLUSH_L3;
>  
>  	if (lacks_render)
> @@ -370,10 +371,15 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  	struct xe_gt *gt = job->q->gt;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
> +	const bool aux_ccs = has_aux_ccs(xe);
>  	u32 mask_flags = 0;
>  
>  	i = emit_copy_timestamp(lrc, dw, i);
>  
> +	/* hsdes: 1809175790 */
> +	if (aux_ccs)
> +		i = emit_render_cache_flush(job, 0, dw, i);

s/0/false/

> +
>  	dw[i++] = preparser_disable(true);
>  	if (lacks_render)
>  		mask_flags = PIPE_CONTROL_3D_ARCH_FLAGS;
> @@ -384,7 +390,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  	i = emit_pipe_invalidate(mask_flags, job->ring_ops_flush_tlb, dw, i);
>  
>  	/* hsdes: 1809175790 */
> -	if (has_aux_ccs(xe))
> +	if (aux_ccs)
>  		i = emit_aux_table_inv(gt, CCS_AUX_INV, dw, i);
>  
>  	dw[i++] = preparser_disable(false);
> @@ -394,7 +400,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  
>  	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
>  
> -	i = emit_render_cache_flush(job, dw, i);
> +	i = emit_render_cache_flush(job, true, dw, i);
>  
>  	if (job->user_fence.used)
>  		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> index d7e3e150a9a5..477dc7defd72 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
> +++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> @@ -8,7 +8,7 @@
>  
>  struct xe_sched_job;
>  
> -#define MAX_JOB_SIZE_DW 58
> +#define MAX_JOB_SIZE_DW 70
>  #define MAX_JOB_SIZE_BYTES (MAX_JOB_SIZE_DW * 4)
>  
>  /**
> -- 
> 2.48.0

-- 
Ville Syrjälä
Intel
