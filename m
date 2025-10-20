Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4693BCCD199
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 11:27:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD1610E29A;
	Mon, 20 Oct 2025 11:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bkai5TWL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD2F10E29A
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 11:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760959643; x=1792495643;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pAr0ZXZSnmRnB1ZfVJlAgChBBZmXuNXUY6DyLhHvQtg=;
 b=bkai5TWLyV7wAu4M2/xQ7upRCx7Hhy8KLEQggYjIp0XAJwKNqbFjyBLW
 Cl4lqywhIOXGmuiedwk55BOtH3yVGCj9UmkwTWHCMftw+RRcCiQ4Nh81J
 5PKUj+ydu2/ufoBWmzGqWKTz2B+Shp+VV5wV5eQ3AyFGVzKywv8oaDaV9
 Db4ScIKId96vR6ie23m9TOoFOwdN6SspgqYE66iQNzmkEfAfHctfQcvwi
 jkwkUatTsF1gIbGwlHq0hZ0WtpptOERDCgAoMAt+w4NRq+FzzHEnnl7v6
 rIPTrnyq6i4hihojqgixuVBGuBXeP1BL1qHbO/+D6DBSF3hpfutllTcO6 A==;
X-CSE-ConnectionGUID: Ke9RpEAxS3uKAg1/Wyf2UQ==
X-CSE-MsgGUID: s+0mT0rBSVmPBHZMbRpnEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74192880"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="74192880"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 04:27:23 -0700
X-CSE-ConnectionGUID: XCW61d9fRm22JFqSTZ7gug==
X-CSE-MsgGUID: 4JVDL0ETRGy1ZL/Diru2XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="187323323"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.58])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 04:27:21 -0700
Date: Mon, 20 Oct 2025 14:27:18 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v13 02/12] drm/xe/xelpg: Flush CCS when flushing caches
Message-ID: <aPYclqwPnyeSRIOY@intel.com>
References: <20251020075831.32818-1-tvrtko.ursulin@igalia.com>
 <20251020075831.32818-3-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020075831.32818-3-tvrtko.ursulin@igalia.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Mon, Oct 20, 2025 at 08:58:20AM +0100, Tvrtko Ursulin wrote:
> According to i915 PIPE_CONTROL0_CCS_FLUSH needs to be set when flushing
> render caches on gfx ip 12.70+.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/instructions/xe_gpu_commands.h | 1 +
>  drivers/gpu/drm/xe/xe_ring_ops.c                  | 7 ++++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> index 8cfcd3360896..78c0e87dbd37 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> @@ -43,6 +43,7 @@
>  
>  #define	  PIPE_CONTROL0_L3_READ_ONLY_CACHE_INVALIDATE	BIT(10)	/* gen12 */
>  #define	  PIPE_CONTROL0_HDC_PIPELINE_FLUSH		BIT(9)	/* gen12 */
> +#define   PIPE_CONTROL0_CCS_FLUSH                       BIT(13) /* MTL+ */

IIRC that thing exists already on dg2, but we don't use there for
whatever unknown reason.

It also doesn't help that bsepc calls DG2 12.7 as well, but for us
someone has invented the of 12.55 number that's never mentioned
in bspec AFAICS.

>  
>  #define   PIPE_CONTROL_COMMAND_CACHE_INVALIDATE		(1<<29)
>  #define   PIPE_CONTROL_TILE_CACHE_FLUSH			(1<<28)
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index ac0c6dcffe15..15fc4010a710 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -176,13 +176,18 @@ static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
>  static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
>  {
>  	struct xe_gt *gt = job->q->gt;
> +	struct xe_device *xe = gt_to_xe(gt);
>  	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
> +	u32 bit_group_0 = PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
>  	u32 flags;
>  
>  	if (XE_GT_WA(gt, 14016712196))
>  		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_DEPTH_CACHE_FLUSH,
>  				      LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
>  
> +	if (GRAPHICS_VERx100(xe) >= 1270)
> +		bit_group_0 |= PIPE_CONTROL0_CCS_FLUSH;
> +
>  	flags = (PIPE_CONTROL_CS_STALL |
>  		 PIPE_CONTROL_TILE_CACHE_FLUSH |
>  		 PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
> @@ -198,7 +203,7 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
>  	else if (job->q->class == XE_ENGINE_CLASS_COMPUTE)
>  		flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
>  
> -	return emit_pipe_control(dw, i, PIPE_CONTROL0_HDC_PIPELINE_FLUSH, flags, 0, 0);
> +	return emit_pipe_control(dw, i, bit_group_0, flags, 0, 0);
>  }
>  
>  static int emit_pipe_control_to_ring_end(struct xe_hw_engine *hwe, u32 *dw, int i)
> -- 
> 2.48.0

-- 
Ville Syrjälä
Intel
