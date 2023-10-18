Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34514CDB482
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 20:19:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54E210E027;
	Wed, 18 Oct 2023 20:19:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20DEB10E027
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 20:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697660367; x=1729196367;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4+4eLIi1zpoE3h8cNKqUQRXrA+U5eH/C739EP3O0N9M=;
 b=OXj+I8kgkG2xSixikl8aqg7EyUvS47/D0a6VAjIsm/56SRLtS4j/W77l
 KzRZmEZVeTx2Tl+nYV8HDY7lRM2zeZw8QMImNTID3LblBh5OzadKgzMAk
 HN9FslNbbyGlQrSqTNck8JWFy2KTM852nr6LnJVyd2BEgUKY+SA1vyDIR
 fuGLJyg+DEli/5FMns09h1Mqb6JbRRUkPkl4fFrxgfB3XxmHnu0BJD705
 mnhPN6HsclSxS6TvuScAjg4vXiYq8sUx/0dMe0Q9jDR3RePVoffBdzgBi
 dve5+BcJK7GQOnowrfF0426LbOiuDHMRuN+wcKWwcMHjNzyC6Rxdr++Ba w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="417213306"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="417213306"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 13:19:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="900469980"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="900469980"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmsmga001.fm.intel.com with ESMTP; 18 Oct 2023 13:17:18 -0700
Received: from [10.249.159.61] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.159.61])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 56FF6332B4;
 Wed, 18 Oct 2023 21:19:21 +0100 (IST)
Message-ID: <0708d310-78dc-4fb2-9510-8368a11c694c@intel.com>
Date: Wed, 18 Oct 2023 22:19:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
References: <20231018103603.1814906-1-tejas.upadhyay@intel.com>
 <20231018103603.1814906-3-tejas.upadhyay@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20231018103603.1814906-3-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH V8 2/2] drm/xe: Update counter for low level
 driver errors
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
Cc: Vishwanathapura@freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 18.10.2023 12:36, Tejas Upadhyay wrote:
> we added a low level driver error counter and incrementing on
> each occurrence. Focus is on errors that are not functionally
> affecting the system and might otherwise go unnoticed and cause
> power/performance regressions, so checking for the error
> counters should help.
> 
> Importantly the intention is not to go adding new error checks,
> but to make sure the existing important error conditions are
> propagated in terms of counter under respective categories like
> below :
> Under GT:
> gt_guc_communication,
> gt_engine_other,
> gt_other
> 
> Under Tile:
> gtt,
> interrupt

you are naming these categories here in lowercase, but in the code
they are uppercase, is it expected ?

nit: you may want to use some bullets when listing categories

> 
> TODO: Currently this is just a counting of errors, later these
> counters will be reported through netlink interface when it is
> implemented and ready.

Q: is there a solid requirement that each incremented error counter
should have related *ERROR* in dmesg ? asking as maybe there is no point
in merging message to counter update into one function.

then you will just add report_driver_error() in selected places without
touching existing logs.

> 
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
>  drivers/gpu/drm/xe/xe_gt.c                  | 26 +++++++++++-
>  drivers/gpu/drm/xe/xe_gt.h                  |  3 +-
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 13 +++---
>  drivers/gpu/drm/xe/xe_guc.c                 | 15 ++++---
>  drivers/gpu/drm/xe/xe_guc_ct.c              | 44 +++++++++++----------
>  drivers/gpu/drm/xe/xe_guc_pc.c              | 12 ++++--
>  drivers/gpu/drm/xe/xe_guc_submit.c          | 11 ++++--
>  drivers/gpu/drm/xe/xe_irq.c                 |  6 ++-
>  drivers/gpu/drm/xe/xe_reg_sr.c              | 22 +++++------
>  drivers/gpu/drm/xe/xe_tile.c                | 28 +++++++++++--
>  drivers/gpu/drm/xe/xe_tile.h                |  3 +-
>  11 files changed, 125 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 3c13f41ec21a..993f2a9240ae 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -48,23 +48,45 @@
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
>  
> +static const char *const xe_gt_drv_err_to_str[] = {
> +	[XE_GT_DRV_ERR_GUC_COMM] = "GUC COMMUNICATION",
> +	[XE_GT_DRV_ERR_ENGINE] = "ENGINE OTHER",
> +	[XE_GT_DRV_ERR_OTHERS] = "GT OTHER"
> +};
> +
>  /**
>   * xe_gt_report_driver_error - Count driver error for gt
>   * @gt: GT to count error for
>   * @err: enum error type
> + * @fmt: debug message format to print error
> + * @...: variable args to print error
>   *
>   * Increment the driver error counter in respective error
>   * category for this GT.
>   *
> - * Returns void.
> + * Return: void.

this should be fixed in previous patch 1/2

>   */
>  void xe_gt_report_driver_error(struct xe_gt *gt,
> -			       const enum xe_gt_drv_err_type err)
> +			       const enum xe_gt_drv_err_type err,
> +			       const char *fmt, ...)

in patch 1/2 you just introduced this function without any use
now in patch 2/2 you are changing function signature
maybe better do that in one shot ?

>  {
> +	struct va_format vaf;
> +	va_list args;
> +
> +	BUILD_BUG_ON(ARRAY_SIZE(xe_gt_drv_err_to_str) !=
> +		     __XE_GT_DRV_ERR_MAX);
> +
>  	xe_gt_assert(gt, err >= 0);
>  	xe_gt_assert(gt, err < __XE_GT_DRV_ERR_MAX);
>  	WRITE_ONCE(gt->drv_err_cnt[err],
>  		   READ_ONCE(gt->drv_err_cnt[err]) + 1);
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	xe_gt_err(gt, "[%s] %pV\n", xe_gt_drv_err_to_str[err], &vaf);
> +	va_end(args);
>  }
>  
>  struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 9442d615042f..efd83707b367 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -68,6 +68,7 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
>  }
>  
>  void xe_gt_report_driver_error(struct xe_gt *gt,
> -			       const enum xe_gt_drv_err_type err);
> +			       const enum xe_gt_drv_err_type err,
> +			       const char *fmt, ...);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index bd6005b9d498..770ed7df8389 100644
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
> +					    "gt%d: TLB invalidation fence timeout, seqno=%d recv=%d",
> +					    gt->info.id, fence->seqno,
> +					    gt->tlb_invalidation.seqno_recv);

IIRC, HW TLB invalidation timeouts shall be treated as fatal errors.

So either our timeout is too short, or GuC is not reporting HW errors.
While support for GUC2HOST_NOTIFY_FATAL_ERROR = 0x6fff is still WIP, I'm
still not convinced that this error here falls into "power/performance"
category that you want to track.

nit: elsewhere we are using "GT%u" not "gt%d"

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
> +					    "gt%d: TLB invalidation time'd out, seqno=%d, recv=%d\n",
> +					    gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
>  		return -ETIME;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 84f0b5488783..c40d0cc46293 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -663,8 +663,9 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  			     50000, &reply, false);
>  	if (ret) {
>  timeout:
> -		drm_err(&xe->drm, "mmio request %#x: no reply %#x\n",
> -			request[0], reply);
> +		xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_GUC_COMM,
> +					  "mmio request %#x: no reply %#x\n",
> +					  request[0], reply);

"no reply" (and other errors from the GuC over MMIO) usually means we
can't proceed with driver load and we end with wedged/failed probe.

are you sure that such fatal "GuC comm" errors are related to
"power/perf" domain that you to monitor?

>  		return ret;
>  	}
>  
> @@ -697,16 +698,18 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  		u32 hint = FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, header);
>  		u32 error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, header);
>  
> -		drm_err(&xe->drm, "mmio request %#x: failure %#x/%#x\n",
> -			request[0], error, hint);
> +		xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_GUC_COMM,
> +					  "mmio request %#x: failure %#x/%#x\n",
> +					  request[0], error, hint);
>  		return -ENXIO;
>  	}
>  
>  	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) !=
>  	    GUC_HXG_TYPE_RESPONSE_SUCCESS) {
>  proto:
> -		drm_err(&xe->drm, "mmio request %#x: unexpected reply %#x\n",
> -			request[0], header);
> +		xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_GUC_COMM,
> +					  "mmio request %#x: unexpected reply %#x\n",
> +					  request[0], header);
>  		return -EPROTO;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 8b686c8b3339..1615f4e3c01e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -732,8 +732,9 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  
>  	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
>  	if (!ret) {
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
> +					  "G2H channel broken on read, origin=%d, reset required\n",
> +					  origin);
>  		ct->ctbs.g2h.info.broken = true;

errors like this (and few below) will cause GuC/GT reset.
shouldn't you track those resets instead ?

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
> +					  "G2H channel broken on read, type=%d, reset required\n",
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
> +					  "unexpected action 0x%04x\n",
> +					  action);
>  	}
>  
>  	if (ret)
> -		drm_err(&xe->drm, "action 0x%04x failed processing, ret=%d\n",
> -			action, ret);
> +		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM,
> +					  "action 0x%04x failed processing, ret=%d\n",
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
> +					  "G2H channel broken on read, avail=%d, len=%d, reset required\n",
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
> +					  "action 0x%04x failed processing, ret=%d\n",
> +					  action, ret);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index d9375d1d582f..7ae7e310b8c4 100644
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
> +		if (ret != -EDEADLK)

can you put comment here why EDEADLK is treated differently ?

> +			xe_gt_report_driver_error(pc_to_gt(pc), XE_GT_DRV_ERR_GUC_COMM,
> +						  "GuC PC set param failed: %pe",
> +						  ERR_PTR(ret));
> +		else
> +			drm_err(&pc_to_xe(pc)->drm, "GuC PC set param failed: %pe",
> +				ERR_PTR(ret));

nit: there is xe_gt_err() that might be better to use here (will include
GT%u in the message)

> +	}
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 870dc5c532fa..d9e24b7cf0e4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1497,13 +1497,15 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
>  	struct xe_exec_queue *q;
>  
>  	if (unlikely(guc_id >= GUC_ID_MAX)) {
> -		drm_err(&xe->drm, "Invalid guc_id %u", guc_id);
> +		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM,
> +					  "Invalid guc_id %u", guc_id);
>  		return NULL;
>  	}
>  
>  	q = xa_load(&guc->submission_state.exec_queue_lookup, guc_id);
>  	if (unlikely(!q)) {
> -		drm_err(&xe->drm, "Not engine present for guc_id %u", guc_id);
> +		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM,
> +					  "Not engine present for guc_id %u", guc_id);
>  		return NULL;

both above errors (and NULL) will result in -EPROTO returned to the CTB
layer, which likely will have another "report_error()"

shouldn't that be tracked only once (best in CTB layer I guess)

>  	}
>  
> @@ -1681,8 +1683,9 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
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
> index 61350ed32c61..487fe98abb55 100644
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
> +					    "INTR_IDENTITY_REG%u:%u 0x%08x not valid!\n",
> +					    bank, bit, ident);
>  		return 0;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 87adefb56024..9ee62ff209eb 100644
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
> +				  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
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
> +	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS, "Failed to apply, err=%d\n", err);
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
> +						  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
> +						  hwe->name, RING_MAX_NONPRIV_SLOTS);
>  			break;
>  		}
>  
> @@ -259,7 +259,7 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>  	return;
>  
>  err_force_wake:
> -	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
> +	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS, "Failed to apply, err=%d\n", err);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index b31dc63ea7c2..4ae56ee4b071 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -71,23 +71,45 @@
>   *  - MOCS and PAT programming
>   */
>  
> +static const char *const xe_tile_drv_err_to_str[] = {
> +	[XE_TILE_DRV_ERR_GTT] = "GTT",
> +	[XE_TILE_DRV_ERR_INTR] = "INTERRUPT"
> +};
> +
>  /**
>   * xe_tile_report_driver_error - Count driver error for tile
>   * @tile: Tile to count error for
> - * @err: enum error type
> + * @err: Enum error type
> + * @fmt: debug message format to print error
> + * @...: variable args to print error
>   *
>   * Increment the driver error counter in respective error
>   * category for this tile.
>   *
> - * Returns void.
> + * Return: void.

should be fixed in 1/2

>   */
>  void xe_tile_report_driver_error(struct xe_tile *tile,
> -				 const enum xe_tile_drv_err_type err)
> +				 const enum xe_tile_drv_err_type err,
> +				 const char *fmt, ...)
>  {
> +	struct va_format vaf;
> +	va_list args;
> +
> +	BUILD_BUG_ON(ARRAY_SIZE(xe_tile_drv_err_to_str) !=
> +		     __XE_TILE_DRV_ERR_MAX);
> +
>  	xe_assert(tile_to_xe(tile), err >= 0);
>  	xe_assert(tile_to_xe(tile), err < __XE_TILE_DRV_ERR_MAX);
>  	WRITE_ONCE(tile->drv_err_cnt[err],
>  		   READ_ONCE(tile->drv_err_cnt[err]) + 1);
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	drm_err(&tile->xe->drm, "TILE%u [%s] %pV",

hmm, maybe we should introduce family of xe_tile_printk() helpers to
make sure all our messages are consistent ? @Rodrigo

> +		tile->id, xe_tile_drv_err_to_str[err], &vaf);
> +	va_end(args);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
> index 092a6b17a97e..c79108fb9579 100644
> --- a/drivers/gpu/drm/xe/xe_tile.h
> +++ b/drivers/gpu/drm/xe/xe_tile.h
> @@ -15,6 +15,7 @@ int xe_tile_init_noalloc(struct xe_tile *tile);
>  
>  void xe_tile_migrate_wait(struct xe_tile *tile);
>  void xe_tile_report_driver_error(struct xe_tile *tile,
> -				 const enum xe_tile_drv_err_type err);
> +				 const enum xe_tile_drv_err_type err,
> +				 const char *fmt, ...);
>  
>  #endif
