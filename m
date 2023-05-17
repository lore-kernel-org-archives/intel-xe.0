Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7568C77B75
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 09:34:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD6D10E3D3;
	Wed, 17 May 2023 09:34:08 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21F210E3D3
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 09:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684316047; x=1715852047;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to:content-transfer-encoding;
 bh=6b19gpCKbCkyjGSx9IRgcSEXGbSFX2i4dHfliT72wpM=;
 b=Jcjzf/gaB1gfeNa24WzARlbFuFqTfb8GLmzUNFROic/0HfCPF8+9yv/P
 3L67clWtucKaz8yFsZXNOV68ZL9U2dBrplJfVYL8SgHZdzFMBzr6GYusS
 LWrxGUpYPv6rvGrxGFBBfiYn3OUJAq1kmo7d+pDNCWaAeB8PwIb+mgLsS
 NN1bq+87/FWZyne86Ey3Ah/eIyADOcseQEod4SJr/x9NUdXnp3Zp8kez0
 QSgdpuB6+wdzwm7Sm1K+AFTBi4K0Oa05qQTQ1vlz2An6qWZS6wlmrKpEE
 ZUVci1mnNF/W5X3vglu1jwjRJCU6SnT4P/j+mmWbh+rtaUOpaupRzRncq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="354881596"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="354881596"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 02:34:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="701684746"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="701684746"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga002.jf.intel.com with ESMTP; 17 May 2023 02:33:58 -0700
Received: from [10.249.142.110] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.142.110])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 353FB12580;
 Wed, 17 May 2023 10:33:57 +0100 (IST)
Message-ID: <82fdb2c9-ccdb-5b43-ee49-98bbf8c380f3@intel.com>
Date: Wed, 17 May 2023 11:33:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.1
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-27-matthew.d.roper@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20230511034722.1929038-27-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 26/26] drm/xe: Clarify source of GT log
 messages
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 11.05.2023 05:47, Matt Roper wrote:
> The various functions in xe_gt.h can print a lot of important error and
> information messages; ensure that we always include the GT ID in those
> prints for clarity.
> 
> In the future we may want to place the new macros in a dedicated header
> like we've done in i915.  For now we're just using them within this one
> file, so including them at the top of the .c is fine.

series with this functionality [1] is already waiting for review/merge

[1] https://patchwork.freedesktop.org/series/117642/

> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 52 ++++++++++++++++++--------------------
>  1 file changed, 25 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 2a3457fb97fa..edcb8ccde346 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -42,6 +42,11 @@
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
>  
> +#define gt_info(_gt, _fmt, ...) \
> +	drm_info(&gt_to_xe(_gt)->drm, "GT%u (Tile%u): " _fmt, (_gt)->info.id, gt_to_tile(_gt)->id, ##__VA_ARGS__)
> +#define gt_err(_gt, _fmt, ...) \
> +	drm_err(&gt_to_xe(_gt)->drm, "GT%u (Tile%u): " _fmt, (_gt)->info.id, gt_to_tile(_gt)->id, ##__VA_ARGS__)
> +
>  struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>  {
>  	struct xe_gt *gt;
> @@ -193,16 +198,16 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  				     hwe, ENGINE_FLAG_WA);
>  		if (IS_ERR(e)) {
>  			err = PTR_ERR(e);
> -			drm_err(&xe->drm, "gt%d, hwe %s, xe_engine_create,e failed=%d",
> -				gt->info.id, hwe->name, err);
> +			gt_err(gt, "hwe %s, xe_engine_create,e failed=%d",
> +			       hwe->name, err);
>  			goto put_vm;
>  		}
>  
>  		/* Prime golden LRC with known good state */
>  		err = emit_wa_job(gt, e);
>  		if (err) {
> -			drm_err(&xe->drm, "gt%d, hwe %s, guc_id=%d, emit_wa_job,e failed=%d",
> -				gt->info.id, hwe->name, e->guc->id, err);
> +			gt_err(gt, "hwe %s, guc_id=%d, emit_wa_job,e failed=%d",
> +				hwe->name, e->guc->id, err);
>  			goto put_engine;
>  		}
>  
> @@ -210,24 +215,24 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  					 1, hwe, ENGINE_FLAG_WA);
>  		if (IS_ERR(nop_e)) {
>  			err = PTR_ERR(nop_e);
> -			drm_err(&xe->drm, "gt%d, hwe %s, xe_engine_create,nop_e failed=%d",
> -				gt->info.id, hwe->name, err);
> +			gt_err(gt, "hwe %s, xe_engine_create,nop_e failed=%d",
> +				hwe->name, err);
>  			goto put_engine;
>  		}
>  
>  		/* Switch to different LRC */
>  		err = emit_nop_job(gt, nop_e);
>  		if (err) {
> -			drm_err(&xe->drm, "gt%d, hwe %s, guc_id=%d, emit_nop_job,nop_e failed=%d",
> -				gt->info.id, hwe->name, nop_e->guc->id, err);
> +			gt_err(gt, "hwe %s, guc_id=%d, emit_nop_job,nop_e failed=%d",
> +				hwe->name, nop_e->guc->id, err);
>  			goto put_nop_e;
>  		}
>  
>  		/* Reload golden LRC to record the effect of any indirect W/A */
>  		err = emit_nop_job(gt, e);
>  		if (err) {
> -			drm_err(&xe->drm, "gt%d, hwe %s, guc_id=%d, emit_nop_job,e failed=%d",
> -				gt->info.id, hwe->name, e->guc->id, err);
> +			gt_err(gt, "hwe %s, guc_id=%d, emit_nop_job,e failed=%d",
> +				hwe->name, e->guc->id, err);
>  			goto put_nop_e;
>  		}
>  
> @@ -443,15 +448,13 @@ int xe_gt_init(struct xe_gt *gt)
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
> +		gt_err(gt, "reset failed to clear GRDOM_FULL\n");
>  
>  	return err;
>  }
> @@ -494,14 +497,13 @@ static int do_gt_restart(struct xe_gt *gt)
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
> +	gt_info(gt, "reset started\n");
>  
>  	xe_gt_sanitize(gt);
>  
> @@ -530,7 +532,7 @@ static int gt_reset(struct xe_gt *gt)
>  	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	XE_WARN_ON(err);
>  
> -	drm_info(&xe->drm, "GT reset done\n");
> +	gt_info(gt, "reset done\n");
>  
>  	return 0;
>  
> @@ -539,7 +541,7 @@ static int gt_reset(struct xe_gt *gt)
>  err_msg:
>  	XE_WARN_ON(xe_uc_start(&gt->uc));
>  	xe_device_mem_access_put(gt_to_xe(gt));
> -	drm_err(&xe->drm, "GT reset failed, err=%d\n", err);
> +	gt_err(gt, "reset failed, err=%d\n", err);
>  
>  	return err;
>  }
> @@ -553,15 +555,13 @@ static void gt_reset_worker(struct work_struct *w)
>  
>  void xe_gt_reset_async(struct xe_gt *gt)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
> -
> -	drm_info(&xe->drm, "Try GT reset\n");
> +	gt_info(gt, "Try GT reset\n");
>  
>  	/* Don't do a reset while one is already in flight */
>  	if (xe_uc_reset_prepare(&gt->uc))
>  		return;
>  
> -	drm_info(&xe->drm, "Doing GT reset\n");
> +	gt_info(gt, "Doing GT reset\n");
>  	queue_work(gt->ordered_wq, &gt->reset.worker);
>  }
>  
> @@ -578,7 +578,6 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>  
>  int xe_gt_suspend(struct xe_gt *gt)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
>  	/* For now suspend/resume is only allowed with GuC */
> @@ -598,7 +597,7 @@ int xe_gt_suspend(struct xe_gt *gt)
>  
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> -	drm_info(&xe->drm, "GT suspended\n");
> +	gt_info(gt, "suspended\n");
>  
>  	return 0;
>  
> @@ -606,14 +605,13 @@ int xe_gt_suspend(struct xe_gt *gt)
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  err_msg:
>  	xe_device_mem_access_put(gt_to_xe(gt));
> -	drm_err(&xe->drm, "GT suspend failed: %d\n", err);
> +	gt_err(gt, "suspend failed: %d\n", err);
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
> @@ -627,7 +625,7 @@ int xe_gt_resume(struct xe_gt *gt)
>  
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> -	drm_info(&xe->drm, "GT resumed\n");
> +	gt_info(gt, "resumed\n");
>  
>  	return 0;
>  
> @@ -635,7 +633,7 @@ int xe_gt_resume(struct xe_gt *gt)
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  err_msg:
>  	xe_device_mem_access_put(gt_to_xe(gt));
> -	drm_err(&xe->drm, "GT resume failed: %d\n", err);
> +	gt_err(gt, "resume failed: %d\n", err);
>  
>  	return err;
>  }
