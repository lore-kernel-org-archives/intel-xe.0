Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3610AC25B6B
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 21:32:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50D610E075;
	Wed, 25 Oct 2023 21:32:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B805810E075
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 21:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698269555; x=1729805555;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=XTJToqLkljQhgMEWX0mKjIPIlf+AT5grd8b7dqV9Kmw=;
 b=chXKxxR07i250MgiffM4jEK3uzdaH5Az+kOASNPIt97NiKjGCqL2MvfT
 Mk6tDxJCJlGCmw9X26WytQOrFCjaAVmMVfSkE8T5x5tuXU39kkAu80Ejy
 qyz0b+QiqPsN3iU3jl3WqOBdiUXLZuqxN/6MWcggzh4meFQRUu6OXspUq
 REZjMamaP3bee1y5/hUtspCiosN8QhlOTPvDfSwzQgmOJK/zvZ2v4YzPk
 udfRT2EaLfNwJluP7XghyyaUgT+H00pStgIqJ/B+e4sd6vq++KKoeIoAE
 Y7q/905BkR9XVqVHoBOkQt5bQbUIHSAAYUT1XZPgfZQyfuxznSE7V3VGS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="473640536"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="473640536"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 14:32:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="932506877"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="932506877"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga005.jf.intel.com with ESMTP; 25 Oct 2023 14:32:31 -0700
Received: from [10.249.129.111] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.129.111])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 1D7DF3B831;
 Wed, 25 Oct 2023 22:32:29 +0100 (IST)
Message-ID: <0a4cd054-6541-4db6-9945-4388fd7220be@intel.com>
Date: Wed, 25 Oct 2023 23:32:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
References: <20231020100352.1974990-1-tejas.upadhyay@intel.com>
 <20231020100352.1974990-2-tejas.upadhyay@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20231020100352.1974990-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH V9 1/1] drm/xe: Introduce and update counter
 for low level driver errors
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



On 20.10.2023 12:03, Tejas Upadhyay wrote:
> we added a low level driver error counter and incrementing on

nit: "added" - stale comment ?

> each occurrence. Focus is on errors that are not functionally
> affecting the system and might otherwise go unnoticed and cause
> power/performance regressions, so checking for the error
> counters should help.
> 
> Importantly the intention is not to go adding new error checks,
> but to make sure the existing important error conditions are
> propagated in terms of counter under respective categories like
> below :
> - GT
>   - GUC COMMUNICATION
>   - ENGINE OTHER
>   - GT OTHER
> 
> - Tile
>   - GTT
>   - INTERRUPT
> 
> Currently this is just a counting of errors, later these
> counters will be reported through netlink interface when it is
> implemented and ready.
> 
> V9:
>   - Make one patch for API and counter update - Michal
>   - Remove counter from places where driver load will fail - Michal
>   - Remove extra \n from logging
>   - Improve commit message - Aravind/Michal
> V8:
>   - Correct missed ret value handling
> V7:
>   - removed double couting of err - Michal
> V6:
>   - move drm_err to gt and tile specific err API - Aravind
>   - Use GTT naming instead of GGTT - Aravind/Niranjana
> V5:
>   - Dump err_type in string format
> V4:
>   - dump err_type in drm_err log - Himal
> V2:
>   - Use modified APIs
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h        | 15 +++++++
>  drivers/gpu/drm/xe/xe_gt.c                  | 41 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt.h                  |  4 ++
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 13 +++---
>  drivers/gpu/drm/xe/xe_gt_types.h            | 17 ++++++++
>  drivers/gpu/drm/xe/xe_guc.c                 |  9 ++---
>  drivers/gpu/drm/xe/xe_guc_ct.c              | 44 +++++++++++----------
>  drivers/gpu/drm/xe/xe_guc_pc.c              | 12 ++++--
>  drivers/gpu/drm/xe/xe_guc_submit.c          |  5 ++-
>  drivers/gpu/drm/xe/xe_irq.c                 |  6 ++-
>  drivers/gpu/drm/xe/xe_reg_sr.c              | 22 +++++------
>  drivers/gpu/drm/xe/xe_tile.c                | 41 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tile.h                |  3 ++
>  13 files changed, 183 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 44d622d4cc3a..da88e69beeaf 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -61,6 +61,18 @@ struct xe_pat_ops;
>  		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
>  		 struct xe_tile * : (tile__)->xe)
>  
> +/** @enum xe_tile_drv_err_type

this doesn't look like a well formatted kernel-doc
same with enum values below

> + *  enum for different types of tile level errors in driver
> + */
> +enum xe_tile_drv_err_type {
> +	/* Error type for all PPGTT and GTT errors */
> +	XE_TILE_DRV_ERR_GTT,
> +	/* Interrupt errors */
> +	XE_TILE_DRV_ERR_INTR,
> +	/* Max defined error types, keep this last */

nit: better:

	/* private: number of defined error types, keep this last */

> +	__XE_TILE_DRV_ERR_MAX
> +};
> +
>  /**
>   * struct xe_mem_region - memory region structure
>   * This is used to describe a memory region in xe
> @@ -190,6 +202,9 @@ struct xe_tile {
>  
>  	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
>  	struct kobject *sysfs;
> +
> +	/** @drv_err_cnt: driver error counter for this tile */
> +	u32 drv_err_cnt[__XE_TILE_DRV_ERR_MAX];
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 74e1f47bd401..993f2a9240ae 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -48,6 +48,47 @@
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
>  
> +static const char *const xe_gt_drv_err_to_str[] = {
> +	[XE_GT_DRV_ERR_GUC_COMM] = "GUC COMMUNICATION",
> +	[XE_GT_DRV_ERR_ENGINE] = "ENGINE OTHER",
> +	[XE_GT_DRV_ERR_OTHERS] = "GT OTHER"
> +};
> +
> +/**
> + * xe_gt_report_driver_error - Count driver error for gt

s/gt/GT

> + * @gt: GT to count error for
> + * @err: enum error type
> + * @fmt: debug message format to print error
> + * @...: variable args to print error
> + *
> + * Increment the driver error counter in respective error
> + * category for this GT.
> + *
> + * Return: void.
> + */
> +void xe_gt_report_driver_error(struct xe_gt *gt,
> +			       const enum xe_gt_drv_err_type err,
> +			       const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	BUILD_BUG_ON(ARRAY_SIZE(xe_gt_drv_err_to_str) !=
> +		     __XE_GT_DRV_ERR_MAX);
> +
> +	xe_gt_assert(gt, err >= 0);
> +	xe_gt_assert(gt, err < __XE_GT_DRV_ERR_MAX);
> +	WRITE_ONCE(gt->drv_err_cnt[err],
> +		   READ_ONCE(gt->drv_err_cnt[err]) + 1);
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	xe_gt_err(gt, "[%s] %pV\n", xe_gt_drv_err_to_str[err], &vaf);
> +	va_end(args);
> +}
> +
>  struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>  {
>  	struct xe_gt *gt;
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index caded203a8a0..efd83707b367 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -67,4 +67,8 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
>  		hwe->instance == gt->usm.reserved_bcs_instance;
>  }
>  
> +void xe_gt_report_driver_error(struct xe_gt *gt,
> +			       const enum xe_gt_drv_err_type err,
> +			       const char *fmt, ...);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index bd6005b9d498..6af2f7b01f7b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -9,6 +9,7 @@
>  #include "xe_gt.h"
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
> +#include "xe_tile.h"
>  #include "xe_trace.h"
>  
>  #define TLB_TIMEOUT	(HZ / 4)
> @@ -35,8 +36,10 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>  			break;
>  
>  		trace_xe_gt_tlb_invalidation_fence_timeout(fence);
> -		drm_err(&gt_to_xe(gt)->drm, "gt%d: TLB invalidation fence timeout, seqno=%d recv=%d",
> -			gt->info.id, fence->seqno, gt->tlb_invalidation.seqno_recv);
> +		xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GTT,
> +					    "GT%u: TLB invalidation fence timeout, seqno=%d recv=%d",

this message

> +					    gt->info.id, fence->seqno,
> +					    gt->tlb_invalidation.seqno_recv);
>  
>  		list_del(&fence->link);
>  		fence->base.error = -ETIME;
> @@ -317,7 +320,6 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>   */
>  int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_guc *guc = &gt->uc.guc;
>  	int ret;
>  
> @@ -329,8 +331,9 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
>  				 tlb_invalidation_seqno_past(gt, seqno),
>  				 TLB_TIMEOUT);
>  	if (!ret) {
> -		drm_err(&xe->drm, "gt%d: TLB invalidation time'd out, seqno=%d, recv=%d\n",
> -			gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
> +		xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GTT,
> +					    "GT%u: TLB invalidation time'd out, seqno=%d, recv=%d",

and this message are about the same thing but are little different

can we print that from one place (using helper):

static void tlb_seqno_error(gt, seq)
{
	xe_tile_report_driver_error(
		gt_to_tile(gt),
		XE_TILE_DRV_ERR_GTT,
		"GT%u: TLB invalidation failed for seqno=%d,
		last received=%d",
		seqno,
		gt->tlb_invalidation.seqno_recv);
}

or at least unify the message?

> +					    gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
>  		return -ETIME;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index d3f2793684e2..6a6609162b3d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -24,6 +24,20 @@ enum xe_gt_type {
>  	XE_GT_TYPE_MEDIA,
>  };
>  
> +/** @enum xe_gt_drv_err_type
> + *  enum for different types of gt level errors in driver

ditto, not a proper kernel-doc

> + */
> +enum xe_gt_drv_err_type {
> +	/* Driver guc communication errors */
> +	XE_GT_DRV_ERR_GUC_COMM,
> +	/* Engine execution errors */
> +	XE_GT_DRV_ERR_ENGINE,
> +	/* Other errors like error during save/restore registers */
> +	XE_GT_DRV_ERR_OTHERS,
> +	/* Max defined error types, keep this last */
> +	__XE_GT_DRV_ERR_MAX
> +};
> +
>  #define XE_MAX_DSS_FUSE_REGS	3
>  #define XE_MAX_EU_FUSE_REGS	1
>  
> @@ -347,6 +361,9 @@ struct xe_gt {
>  		/** @oob: bitmap with active OOB workaroudns */
>  		unsigned long *oob;
>  	} wa_active;
> +
> +	/** @drv_err_cnt: driver error counter for this GT */
> +	u32 drv_err_cnt[__XE_GT_DRV_ERR_MAX];
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 84f0b5488783..aeb9cf814440 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -663,8 +663,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  			     50000, &reply, false);
>  	if (ret) {
>  timeout:
> -		drm_err(&xe->drm, "mmio request %#x: no reply %#x\n",
> -			request[0], reply);
> +		xe_gt_err(gt, "mmio request %#x: no reply %#x\n", request[0], reply);

good but unrelated change for this series

>  		return ret;
>  	}
>  
> @@ -697,16 +696,14 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  		u32 hint = FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, header);
>  		u32 error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, header);
>  
> -		drm_err(&xe->drm, "mmio request %#x: failure %#x/%#x\n",
> -			request[0], error, hint);
> +		xe_gt_err(gt, "mmio request %#x: failure %#x/%#x\n", request[0], error, hint);

ditto

>  		return -ENXIO;
>  	}
>  
>  	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) !=
>  	    GUC_HXG_TYPE_RESPONSE_SUCCESS) {
>  proto:
> -		drm_err(&xe->drm, "mmio request %#x: unexpected reply %#x\n",
> -			request[0], header);
> +		xe_gt_err(gt, "mmio request %#x: unexpected reply %#x\n", request[0], header);

ditto

>  		return -EPROTO;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 8b686c8b3339..52dddf23a3f7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -732,8 +732,9 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  
>  	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
>  	if (!ret) {

this

> -		drm_err(&xe->drm, "Timed out wait for G2H, fence %u, action %04x",
> -			g2h_fence.seqno, action[0]);
> +		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM,
> +					  "Timed out wait for G2H, fence %u, action %04x",
> +					  g2h_fence.seqno, action[0]);
>  		xa_erase_irq(&ct->fence_lookup, g2h_fence.seqno);
>  		return -ETIME;
>  	}
> @@ -744,8 +745,9 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  		goto retry;
>  	}
>  	if (g2h_fence.fail) {

and this are just two points where guc_ct_send_recv() prints the error
message on failure, but actually there are few more error returns that
were just not covered with any diagnostic message.

so maybe instead of partially covering only selected failures, better
option will be to report GUC_COMM_ERROR once at single exit point or at
the next level caller function (still inside CTB component) ?

	ret = guc_ct_send_recv(...)
	if (ret < 0)
		xe_gt_report_driver_error(ct_to_gt(ct),
			XE_GT_DRV_ERR_GUC_COMM,
			"CTB communication failed on send (%pe)",
			ERR_PTR(ret));
	return ret;

> -		drm_err(&xe->drm, "Send failed, action 0x%04x, error %d, hint %d",
> -			action[0], g2h_fence.error, g2h_fence.hint);
> +		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM,
> +					  "Send failed, action 0x%04x, error %d, hint %d",
> +					  action[0], g2h_fence.error, g2h_fence.hint);
>  		ret = -EIO;
>  	}
>  
> @@ -829,7 +831,6 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  
>  static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  {
> -	struct xe_device *xe = ct_to_xe(ct);
>  	u32 hxg, origin, type;
>  	int ret;
>  
> @@ -839,9 +840,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  
>  	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg);
>  	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
> -		drm_err(&xe->drm,
> -			"G2H channel broken on read, origin=%d, reset required\n",
> -			origin);
> +		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM,
> +					  "G2H channel broken on read, origin=%d, reset required",
> +					  origin);

CTB channel can be also broken on send, but error reporting was missing
there, so maybe again, one place to report all errors on read:

	ret = dequeue_one_g2h(...)
	if (ret < 0)
		xe_gt_report_driver_error(ct_to_gt(ct),
			XE_GT_DRV_ERR_GUC_COMM,
			"CTB communication failed on read (%pe)",
			ERR_PTR(ret));

>  		ct->ctbs.g2h.info.broken = true;
>  
>  		return -EPROTO;
> @@ -858,9 +859,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		ret = parse_g2h_response(ct, msg, len);
>  		break;
>  	default:
> -		drm_err(&xe->drm,
> -			"G2H channel broken on read, type=%d, reset required\n",
> -			type);
> +		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM,
> +					  "G2H channel broken on read, type=%d, reset required",

this was wrong message, it needs to be updated separately to

	"Unexpected G2H message type %#x\n",

also, I'm not sure that this warrants a reset, but that's other story

> +					  type);
>  		ct->ctbs.g2h.info.broken = true;
>  
>  		ret = -EOPNOTSUPP;
> @@ -871,7 +872,6 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  
>  static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  {
> -	struct xe_device *xe = ct_to_xe(ct);
>  	struct xe_guc *guc = ct_to_guc(ct);
>  	u32 action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1]);
>  	u32 *payload = msg + GUC_CTB_HXG_MSG_MIN_LEN;
> @@ -918,12 +918,15 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  							   adj_len);
>  		break;
>  	default:
> -		drm_err(&xe->drm, "unexpected action 0x%04x\n", action);
> +		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM,
> +					  "unexpected action 0x%04x",
> +					  action);

it seems that there is a bug here, we should have here -EOPNOTSUPP" so
it would fall into below error reporting, but as said above, maybe
better to have one place to report any error on read (we will avoid any
duplicate reports and also make sure to catch all issues)

>  	}
>  
>  	if (ret)
> -		drm_err(&xe->drm, "action 0x%04x failed processing, ret=%d\n",
> -			action, ret);
> +		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM,
> +					  "action 0x%04x failed processing, ret=%d",
> +					  action, ret);
>  
>  	return 0;
>  }
> @@ -957,9 +960,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  			   sizeof(u32));
>  	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
>  	if (len > avail) {
> -		drm_err(&xe->drm,
> -			"G2H channel broken on read, avail=%d, len=%d, reset required\n",
> -			avail, len);
> +		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM,
> +					  "G2H channel broken on read, avail=%d, len=%d, reset required",
> +					  avail, len);
>  		g2h->info.broken = true;
>  
>  		return -EPROTO;
> @@ -1027,8 +1030,9 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	}
>  
>  	if (ret)
> -		drm_err(&xe->drm, "action 0x%04x failed processing, ret=%d\n",
> -			action, ret);
> +		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM,
> +					  "action 0x%04x failed processing, ret=%d",
> +					  action, ret);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index d9375d1d582f..137c7ce44f47 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -218,9 +218,15 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
>  		return -EAGAIN;
>  
>  	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> -	if (ret)
> -		drm_err(&pc_to_xe(pc)->drm, "GuC PC set param failed: %pe",
> -			ERR_PTR(ret));
> +	if (ret) {
> +		/* GT reset already triggered due to deadlock, lets not report this error */
> +		if (ret != -EDEADLK)
> +			xe_gt_report_driver_error(pc_to_gt(pc), XE_GT_DRV_ERR_GUC_COMM,
> +						  "GuC PC set param failed: %pe",
> +						  ERR_PTR(ret));
> +		else
> +			xe_gt_err(pc_to_gt(pc), "GuC PC set param failed: %pe\n", ERR_PTR(ret));

this selective reporting makes things unreliable and error prone (ouch!)

note that you still didn't avoid duplication, as this error was reported
as xe_gt_report_driver_error("Send failed, action 0x%04x, ...")

IMO better to report GuC comm send/recv errors in one place (in CTB layer)

btw, since you care about "power/performance regressions" then maybe
errors from GUC_PC deserve it's own category for easier diagnostics ?

> +	}
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 870dc5c532fa..283832d518b1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1681,8 +1681,9 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
>  	reason = msg[2];
>  
>  	/* Unexpected failure of a hardware feature, log an actual error */
> -	drm_err(&xe->drm, "GuC engine reset request failed on %d:%d because 0x%08X",
> -		guc_class, instance, reason);
> +	xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_ENGINE,
> +				  "GuC engine reset request failed on %d:%d because 0x%08X",
> +				  guc_class, instance, reason);
>  
>  	xe_gt_reset_async(guc_to_gt(guc));
>  
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 61350ed32c61..2b20582b0425 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -18,6 +18,7 @@
>  #include "xe_guc.h"
>  #include "xe_hw_engine.h"
>  #include "xe_mmio.h"
> +#include "xe_tile.h"
>  
>  /*
>   * Interrupt registers for a unit are always consecutive and ordered
> @@ -227,8 +228,9 @@ gt_engine_identity(struct xe_device *xe,
>  		 !time_after32(local_clock() >> 10, timeout_ts));
>  
>  	if (unlikely(!(ident & INTR_DATA_VALID))) {
> -		drm_err(&xe->drm, "INTR_IDENTITY_REG%u:%u 0x%08x not valid!\n",
> -			bank, bit, ident);
> +		xe_tile_report_driver_error(gt_to_tile(mmio), XE_TILE_DRV_ERR_INTR,
> +					    "INTR_IDENTITY_REG%u:%u 0x%08x not valid!",
> +					    bank, bit, ident);
>  		return 0;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 87adefb56024..f2e20e10d927 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -125,12 +125,12 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>  	return 0;
>  
>  fail:
> -	xe_gt_err(gt,
> -		  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
> -		  idx, e->clr_bits, e->set_bits,
> -		  str_yes_no(e->reg.masked),
> -		  str_yes_no(e->reg.mcr),
> -		  ret);
> +	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS,
> +				  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d",
> +				  idx, e->clr_bits, e->set_bits,
> +				  str_yes_no(e->reg.masked),
> +				  str_yes_no(e->reg.mcr),
> +				  ret);
>  	reg_sr_inc_error(sr);
>  
>  	return ret;
> @@ -207,7 +207,7 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>  	return;
>  
>  err_force_wake:
> -	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
> +	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS, "Failed to apply, err=%d", err);
>  }
>  
>  void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
> @@ -234,9 +234,9 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>  	p = drm_debug_printer(KBUILD_MODNAME);
>  	xa_for_each(&sr->xa, reg, entry) {
>  		if (slot == RING_MAX_NONPRIV_SLOTS) {
> -			xe_gt_err(gt,
> -				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
> -				  hwe->name, RING_MAX_NONPRIV_SLOTS);
> +			xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_ENGINE,
> +						  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more",
> +						  hwe->name, RING_MAX_NONPRIV_SLOTS);
>  			break;
>  		}
>  
> @@ -259,7 +259,7 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>  	return;
>  
>  err_force_wake:
> -	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
> +	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS, "Failed to apply, err=%d", err);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 131752a57f65..364ec9628a41 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -71,6 +71,47 @@
>   *  - MOCS and PAT programming
>   */
>  
> +static const char *const xe_tile_drv_err_to_str[] = {
> +	[XE_TILE_DRV_ERR_GTT] = "GTT",
> +	[XE_TILE_DRV_ERR_INTR] = "INTERRUPT"
> +};
> +
> +/**
> + * xe_tile_report_driver_error - Count driver error for tile
> + * @tile: Tile to count error for
> + * @err: Enum error type
> + * @fmt: debug message format to print error
> + * @...: variable args to print error
> + *
> + * Increment the driver error counter in respective error
> + * category for this tile.
> + *
> + * Return: void.
> + */
> +void xe_tile_report_driver_error(struct xe_tile *tile,
> +				 const enum xe_tile_drv_err_type err,
> +				 const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	BUILD_BUG_ON(ARRAY_SIZE(xe_tile_drv_err_to_str) !=
> +		     __XE_TILE_DRV_ERR_MAX);
> +
> +	xe_assert(tile_to_xe(tile), err >= 0);
> +	xe_assert(tile_to_xe(tile), err < __XE_TILE_DRV_ERR_MAX);

you can use xe_tile_assert() here

> +	WRITE_ONCE(tile->drv_err_cnt[err],
> +		   READ_ONCE(tile->drv_err_cnt[err]) + 1);
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	drm_err(&tile->xe->drm, "TILE%u [%s] %pV\n",
> +		tile->id, xe_tile_drv_err_to_str[err], &vaf);
> +	va_end(args);
> +}
> +
>  /**
>   * xe_tile_alloc - Perform per-tile memory allocation
>   * @tile: Tile to perform allocations for
> diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
> index 782c47f8bd45..c79108fb9579 100644
> --- a/drivers/gpu/drm/xe/xe_tile.h
> +++ b/drivers/gpu/drm/xe/xe_tile.h
> @@ -14,5 +14,8 @@ int xe_tile_alloc(struct xe_tile *tile);
>  int xe_tile_init_noalloc(struct xe_tile *tile);
>  
>  void xe_tile_migrate_wait(struct xe_tile *tile);
> +void xe_tile_report_driver_error(struct xe_tile *tile,
> +				 const enum xe_tile_drv_err_type err,
> +				 const char *fmt, ...);
>  
>  #endif
