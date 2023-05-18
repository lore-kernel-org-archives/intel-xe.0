Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41407C77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 17:02:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E0410E36A;
	Thu, 18 May 2023 17:02:49 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B2910E36A
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 17:02:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6547C6509F;
 Thu, 18 May 2023 17:02:47 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id B70A7C433EF;
 Thu, 18 May 2023 17:02:44 +0000 (UTC)
Date: Thu, 18 May 2023 13:02:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <ZGZaMN02s1OVcqF4@rdvivi-mobl4>
References: <20230518134128.1072-1-michal.wajdeczko@intel.com>
 <20230518134128.1072-2-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230518134128.1072-2-michal.wajdeczko@intel.com>
Subject: Re: [Intel-xe] [PATCH v4 2/2] drm/xe: Use GT oriented log messages
 in xe_gt.c
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 18, 2023 at 03:41:28PM +0200, Michal Wajdeczko wrote:
> Replace generic log messages with ones dedicated for the GT.
> While around replace errno logs from plain %d to pretty %pe.
> 
> v2: rebased
> v3: unify errno logs
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.c | 49 +++++++++++++++++---------------------
>  1 file changed, 22 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index cbe063a40aca..80d42c7c7cfa 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -20,6 +20,7 @@
>  #include "xe_gt_clock.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_pagefault.h"
> +#include "xe_gt_printk.h"
>  #include "xe_gt_sysfs.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_gt_topology.h"
> @@ -239,16 +240,16 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  				     hwe, ENGINE_FLAG_WA);
>  		if (IS_ERR(e)) {
>  			err = PTR_ERR(e);
> -			drm_err(&xe->drm, "gt%d, hwe %s, xe_engine_create,e failed=%d",
> -				gt->info.id, hwe->name, err);
> +			xe_gt_err(gt, "hwe %s: xe_engine_create failed (%pe)\n",
> +				  hwe->name, e);
>  			goto put_vm;
>  		}
>  
>  		/* Prime golden LRC with known good state */
>  		err = emit_wa_job(gt, e);
>  		if (err) {
> -			drm_err(&xe->drm, "gt%d, hwe %s, guc_id=%d, emit_wa_job,e failed=%d",
> -				gt->info.id, hwe->name, e->guc->id, err);
> +			xe_gt_err(gt, "hwe %s: emit_wa_job failed (%pe) guc_id=%u\n",
> +				  hwe->name, ERR_PTR(err), e->guc->id);
>  			goto put_engine;
>  		}
>  
> @@ -256,24 +257,24 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  					 1, hwe, ENGINE_FLAG_WA);
>  		if (IS_ERR(nop_e)) {
>  			err = PTR_ERR(nop_e);
> -			drm_err(&xe->drm, "gt%d, hwe %s, xe_engine_create,nop_e failed=%d",
> -				gt->info.id, hwe->name, err);
> +			xe_gt_err(gt, "hwe %s: nop xe_engine_create failed (%pe)\n",
> +				  hwe->name, nop_e);
>  			goto put_engine;
>  		}
>  
>  		/* Switch to different LRC */
>  		err = emit_nop_job(gt, nop_e);
>  		if (err) {
> -			drm_err(&xe->drm, "gt%d, hwe %s, guc_id=%d, emit_nop_job,nop_e failed=%d",
> -				gt->info.id, hwe->name, nop_e->guc->id, err);
> +			xe_gt_err(gt, "hwe %s: nop emit_nop_job failed (%pe) guc_id=%u\n",
> +				  hwe->name, ERR_PTR(err), nop_e->guc->id);
>  			goto put_nop_e;
>  		}
>  
>  		/* Reload golden LRC to record the effect of any indirect W/A */
>  		err = emit_nop_job(gt, e);
>  		if (err) {
> -			drm_err(&xe->drm, "gt%d, hwe %s, guc_id=%d, emit_nop_job,e failed=%d",
> -				gt->info.id, hwe->name, e->guc->id, err);
> +			xe_gt_err(gt, "hwe %s: emit_nop_job failed (%pe) guc_id=%u\n",
> +				  hwe->name, ERR_PTR(err), e->guc->id);
>  			goto put_nop_e;
>  		}
>  
> @@ -541,15 +542,14 @@ int xe_gt_init(struct xe_gt *gt)
>  
>  static int do_gt_reset(struct xe_gt *gt)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
>  	xe_mmio_write32(gt, GDRST, GRDOM_FULL);
>  	err = xe_mmio_wait32(gt, GDRST, 0, GRDOM_FULL, 5000,
>  			     NULL, false);
>  	if (err)
> -		drm_err(&xe->drm,
> -			"GT reset failed to clear GEN11_GRDOM_FULL\n");
> +		xe_gt_err(gt, "failed to clear GEN11_GRDOM_FULL (%pe)\n",
> +			  ERR_PTR(err));
>  
>  	return err;
>  }
> @@ -592,14 +592,13 @@ static int do_gt_restart(struct xe_gt *gt)
>  
>  static int gt_reset(struct xe_gt *gt)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
>  	/* We only support GT resets with GuC submission */
>  	if (!xe_device_guc_submission_enabled(gt_to_xe(gt)))
>  		return -ENODEV;
>  
> -	drm_info(&xe->drm, "GT reset started\n");
> +	xe_gt_info(gt, "reset started\n");
>  
>  	xe_gt_sanitize(gt);
>  
> @@ -628,7 +627,7 @@ static int gt_reset(struct xe_gt *gt)
>  	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	XE_WARN_ON(err);
>  
> -	drm_info(&xe->drm, "GT reset done\n");
> +	xe_gt_info(gt, "reset done\n");
>  
>  	return 0;
>  
> @@ -637,7 +636,7 @@ static int gt_reset(struct xe_gt *gt)
>  err_msg:
>  	XE_WARN_ON(xe_uc_start(&gt->uc));
>  	xe_device_mem_access_put(gt_to_xe(gt));
> -	drm_err(&xe->drm, "GT reset failed, err=%d\n", err);
> +	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>  
>  	return err;
>  }
> @@ -651,15 +650,13 @@ static void gt_reset_worker(struct work_struct *w)
>  
>  void xe_gt_reset_async(struct xe_gt *gt)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
> -
> -	drm_info(&xe->drm, "Try GT reset\n");
> +	xe_gt_info(gt, "trying reset\n");
>  
>  	/* Don't do a reset while one is already in flight */
>  	if (xe_uc_reset_prepare(&gt->uc))
>  		return;
>  
> -	drm_info(&xe->drm, "Doing GT reset\n");
> +	xe_gt_info(gt, "reset queued\n");
>  	queue_work(gt->ordered_wq, &gt->reset.worker);
>  }
>  
> @@ -676,7 +673,6 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>  
>  int xe_gt_suspend(struct xe_gt *gt)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
>  	/* For now suspend/resume is only allowed with GuC */
> @@ -696,7 +692,7 @@ int xe_gt_suspend(struct xe_gt *gt)
>  
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> -	drm_info(&xe->drm, "GT suspended\n");
> +	xe_gt_info(gt, "suspended\n");
>  
>  	return 0;
>  
> @@ -704,14 +700,13 @@ int xe_gt_suspend(struct xe_gt *gt)
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  err_msg:
>  	xe_device_mem_access_put(gt_to_xe(gt));
> -	drm_err(&xe->drm, "GT suspend failed: %d\n", err);
> +	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
>  
>  	return err;
>  }
>  
>  int xe_gt_resume(struct xe_gt *gt)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
>  	xe_device_mem_access_get(gt_to_xe(gt));
> @@ -725,7 +720,7 @@ int xe_gt_resume(struct xe_gt *gt)
>  
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> -	drm_info(&xe->drm, "GT resumed\n");
> +	xe_gt_info(gt, "resumed\n");
>  
>  	return 0;
>  
> @@ -733,7 +728,7 @@ int xe_gt_resume(struct xe_gt *gt)
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  err_msg:
>  	xe_device_mem_access_put(gt_to_xe(gt));
> -	drm_err(&xe->drm, "GT resume failed: %d\n", err);
> +	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
>  
>  	return err;
>  }
> -- 
> 2.25.1
> 
