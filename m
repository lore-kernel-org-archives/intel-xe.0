Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BD2C2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 21:32:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E7810E65D;
	Tue,  9 Jul 2024 21:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jWvTeCgq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDD210E65D
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 21:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720560726; x=1752096726;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0xaCu/nGwOipwBHgWTNpiljo++cNw00Wyef1YJYPRVU=;
 b=jWvTeCgqg+fzl0knFhF5Xaxfz2MVlTjDXbsGcTnr/2bbbPh/2uivnZMs
 icOBtUpoGMt2ZX/tNsyw2aRM/c9zP52LRHraHpKWW1VOUGY6y/HB5UPFJ
 pfQYOjp7Uwy/rZAgNw2TKY5+nHkVXPWYAGWf8ysBJRbgPmSXfZ5TKa+fz
 G00avyW3nfaJEmx1wtmZ8b/RnEQTvonJtrZzX/qDI87kYIE4YOFU87ynJ
 Ak4RP9cA+AM4SlLVMa9imEVrqyxrv3kL5bTcGghq9NwUoDz5Az2+HEo/K
 GguHCbIuZO+o8DgAfdoZusCrxk0wEvX8UHBK/dQeYdf9Zm6ePPqogZe9g Q==;
X-CSE-ConnectionGUID: TLGPe0abS5iD5kEb9we9cg==
X-CSE-MsgGUID: 3Iu77EOLRGa90hq/n1CkIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="12461163"
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; d="scan'208";a="12461163"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 14:32:06 -0700
X-CSE-ConnectionGUID: ZOtW8slISlCdL7MkiYa1lw==
X-CSE-MsgGUID: Cs5zq/AzRNCifLt1rfMaNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; d="scan'208";a="47903364"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 09 Jul 2024 14:32:03 -0700
Received: from [10.246.34.68] (mwajdecz-MOBL.ger.corp.intel.com [10.246.34.68])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id CB7EF312EE;
 Tue,  9 Jul 2024 22:32:00 +0100 (IST)
Message-ID: <0fcfed77-b9d5-4716-8adc-d18569788c64@intel.com>
Date: Tue, 9 Jul 2024 23:31:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] drm/xe: Add xe_guc_tlb_invalidation layer
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com, farah.kassabri@intel.com
References: <20240708040331.766264-1-matthew.brost@intel.com>
 <20240708040331.766264-8-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240708040331.766264-8-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi Matt,

few nits (as usual)

On 08.07.2024 06:03, Matthew Brost wrote:
> Move GuC specific TLB invalidation into dedicated layer.
> 
> v2:
>  - Remove XXX comment
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 121 +--------------
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |   4 +-
>  .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |  13 ++
>  drivers/gpu/drm/xe/xe_gt_types.h              |   2 +
>  drivers/gpu/drm/xe/xe_guc_ct.c                |   2 +-
>  drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c  | 143 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h  |  18 +++
>  8 files changed, 186 insertions(+), 118 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 628c245c4822..21f4ddf1a946 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -83,6 +83,7 @@ xe-y += xe_bb.o \
>  	xe_guc_log.o \
>  	xe_guc_pc.o \
>  	xe_guc_submit.o \
> +	xe_guc_tlb_invalidation.o \
>  	xe_heci_gsc.o \
>  	xe_hw_engine.o \
>  	xe_hw_engine_class_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 79d1ed138db5..4b7b5f8205f9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -7,13 +7,12 @@
>  
>  #include "xe_gt_tlb_invalidation.h"
>  
> -#include "abi/guc_actions_abi.h"
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
>  #include "xe_gt_printk.h"
> -#include "xe_guc.h"
>  #include "xe_guc_ct.h"
> +#include "xe_guc_tlb_invalidation.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
>  #include "xe_trace.h"
> @@ -85,6 +84,7 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
>  	spin_lock_init(&gt->tlb_invalidation.fence_lock);
>  	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
>  			  xe_gt_tlb_fence_timeout);
> +	gt->tlb_invalidation.ops = xe_guc_tlb_invalidation_get_ops(&gt->uc.guc);

what about force_execlist=true mode ?

shouldn't we have nop_ops (or direct_ops) and let the GuC code replace
ops when selected/in use ?

>  
>  	return drmm_mutex_init(&gt_to_xe(gt)->drm,
>  			       &gt->tlb_invalidation.seqno_lock);
> @@ -157,97 +157,16 @@ static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
>  	return seqno_recv >= seqno;
>  }
>  
> -static int send_tlb_invalidation(struct xe_guc *guc, u32 *action, int len)
> -{
> -	struct xe_gt *gt = guc_to_gt(guc);
> -
> -	xe_gt_assert(gt, action[1]);	/* Seqno */
> -	lockdep_assert_held(&gt->tlb_invalidation.seqno_lock);
> -
> -	/*
> -	 * XXX: The seqno algorithm relies on TLB invalidation being processed
> -	 * in order which they currently are, if that changes the algorithm will
> -	 * need to be updated.
> -	 */
> -
> -	return xe_guc_ct_send(&guc->ct, action, len,
> -			      G2H_LEN_DW_TLB_INVALIDATE, 1);
> -}
> -
> -#define MAKE_INVAL_OP(type)	((type << XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
> -		XE_GUC_TLB_INVAL_MODE_HEAVY << XE_GUC_TLB_INVAL_MODE_SHIFT | \
> -		XE_GUC_TLB_INVAL_FLUSH_CACHE)
> -
>  static int send_tlb_invalidation_ggtt(struct xe_gt *gt, int seqno)
>  {
> -	u32 action[] = {
> -		XE_GUC_ACTION_TLB_INVALIDATION,
> -		seqno,
> -		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_GUC),
> -	};
> -
> -	return send_tlb_invalidation(&gt->uc.guc, action, ARRAY_SIZE(action));
> +	return gt->tlb_invalidation.ops->tlb_invalidation_ggtt(gt, seqno);
>  }
>  
>  static int send_tlb_invalidation_ppgtt(struct xe_gt *gt, u64 start, u64 end,
>  				       u32 asid, int seqno)
>  {
> -#define MAX_TLB_INVALIDATION_LEN	7
> -	u32 action[MAX_TLB_INVALIDATION_LEN];
> -	int len = 0;
> -
> -	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
> -	action[len++] = seqno;
> -	if (!gt_to_xe(gt)->info.has_range_tlb_invalidation) {
> -		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
> -	} else {
> -		u64 orig_start = start;
> -		u64 length = end - start;
> -		u64 align;
> -
> -		if (length < SZ_4K)
> -			length = SZ_4K;
> -
> -		/*
> -		 * We need to invalidate a higher granularity if start address
> -		 * is not aligned to length. When start is not aligned with
> -		 * length we need to find the length large enough to create an
> -		 * address mask covering the required range.
> -		 */
> -		align = roundup_pow_of_two(length);
> -		start = ALIGN_DOWN(start, align);
> -		end = ALIGN(end, align);
> -		length = align;
> -		while (start + length < end) {
> -			length <<= 1;
> -			start = ALIGN_DOWN(orig_start, length);
> -		}
> -
> -		/*
> -		 * Minimum invalidation size for a 2MB page that the hardware
> -		 * expects is 16MB
> -		 */
> -		if (length >= SZ_2M) {
> -			length = max_t(u64, SZ_16M, length);
> -			start = ALIGN_DOWN(orig_start, length);
> -		}
> -
> -		xe_gt_assert(gt, length >= SZ_4K);
> -		xe_gt_assert(gt, is_power_of_2(length));
> -		xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M) - 1,
> -						    ilog2(SZ_2M) + 1)));
> -		xe_gt_assert(gt, IS_ALIGNED(start, length));
> -
> -		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
> -		action[len++] = asid;
> -		action[len++] = lower_32_bits(start);
> -		action[len++] = upper_32_bits(start);
> -		action[len++] = ilog2(length) - ilog2(SZ_4K);
> -	}
> -
> -	xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
> -
> -	return send_tlb_invalidation(&gt->uc.guc, action, len);
> +	return gt->tlb_invalidation.ops->tlb_invalidation_ppgtt(gt, start, end,
> +								asid, seqno);
>  }
>  
>  static void xe_gt_tlb_invalidation_fence_prep(struct xe_gt *gt,
> @@ -278,10 +197,6 @@ static void xe_gt_tlb_invalidation_fence_prep(struct xe_gt *gt,
>  		gt->tlb_invalidation.seqno = 1;
>  }
>  
> -#define MAKE_INVAL_OP(type)	((type << XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
> -		XE_GUC_TLB_INVAL_MODE_HEAVY << XE_GUC_TLB_INVAL_MODE_SHIFT | \
> -		XE_GUC_TLB_INVAL_FLUSH_CACHE)
> -
>  static int __xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt,
>  					 struct xe_gt_tlb_invalidation_fence *fence)
>  {
> @@ -420,7 +335,7 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>   *
>   * Update recv seqno, signal any GT TLB invalidation fences, and restart TDR
>   */
> -static void xe_gt_tlb_invalidation_done_handler(struct xe_gt *gt, int seqno)
> +void xe_gt_tlb_invalidation_done_handler(struct xe_gt *gt, int seqno)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_gt_tlb_invalidation_fence *fence, *next;
> @@ -469,30 +384,6 @@ static void xe_gt_tlb_invalidation_done_handler(struct xe_gt *gt, int seqno)
>  	spin_unlock_irqrestore(&gt->tlb_invalidation.pending_lock, flags);
>  }
>  
> -/**
> - * xe_guc_tlb_invalidation_done_handler - TLB invalidation done handler
> - * @guc: guc
> - * @msg: message indicating TLB invalidation done
> - * @len: length of message
> - *
> - * Parse seqno of TLB invalidation, wake any waiters for seqno, and signal any
> - * invalidation fences for seqno. Algorithm for this depends on seqno being
> - * received in-order and asserts this assumption.
> - *
> - * Return: 0 on success, -EPROTO for malformed messages.
> - */
> -int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> -{
> -	struct xe_gt *gt = guc_to_gt(guc);
> -
> -	if (unlikely(len != 1))
> -		return -EPROTO;
> -
> -	xe_gt_tlb_invalidation_done_handler(gt, msg[0]);
> -
> -	return 0;
> -}
> -
>  static const char *
>  invalidation_fence_get_driver_name(struct dma_fence *dma_fence)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> index cbf49b3d0265..ee532ad64aac 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> @@ -11,7 +11,6 @@
>  #include "xe_gt_tlb_invalidation_types.h"
>  
>  struct xe_gt;
> -struct xe_guc;
>  struct xe_vma;
>  
>  int xe_gt_tlb_invalidation_init(struct xe_gt *gt);
> @@ -23,11 +22,12 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>  int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
>  				 struct xe_gt_tlb_invalidation_fence *fence,
>  				 u64 start, u64 end, u32 asid);
> -int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  
>  void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
>  				       struct xe_gt_tlb_invalidation_fence *fence);
>  
> +void xe_gt_tlb_invalidation_done_handler(struct xe_gt *gt, int seqno);
> +
>  static inline void
>  xe_gt_tlb_invalidation_fence_wait(struct xe_gt_tlb_invalidation_fence *fence)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
> index 934c828efe31..1abb8692d14b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
> @@ -8,6 +8,8 @@
>  
>  #include <linux/dma-fence.h>
>  
> +struct xe_gt;
> +
>  /**
>   * struct xe_gt_tlb_invalidation_fence - XE GT TLB invalidation fence
>   *
> @@ -25,4 +27,15 @@ struct xe_gt_tlb_invalidation_fence {
>  	ktime_t invalidation_time;
>  };
>  
> +/**
> + * struct xe_gt_tlb_invalidation_ops - Xe GT TLB invalidation operations
> + */
> +struct xe_gt_tlb_invalidation_ops {
> +	/** @tlb_invalidation_ggtt: TLB invalidation GGTT */
> +	int (*tlb_invalidation_ggtt)(struct xe_gt *gt, int seqno);
> +	/** @tlb_invalidation_ppgtt: TLB invalidation PPGTT */
> +	int (*tlb_invalidation_ppgtt)(struct xe_gt *gt, u64 start, u64 end,
> +				      u32 asid, int seqno);

do we need full "tlb_invalidation" prefix here ?
maybe just:

	int (*ggtt)(struct xe_gt *gt, int seqno);
	int (*ppgtt)(struct xe_gt *gt, u64 start, u64 end,

as this will used like:

	return gt->tlb_invalidation.ops->ggtt(gt, seqno);
or
	return gt->tlb_invalidation.ops->ppgtt(gt, start, end,...


> +};
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index fb280f058cdc..4b9740a68457 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -169,6 +169,8 @@ struct xe_gt {
>  
>  	/** @tlb_invalidation: TLB invalidation state */
>  	struct {
> +		/** @tlb_invalidation.ops: TLB invalidation ops */
> +		const struct xe_gt_tlb_invalidation_ops *ops;
>  		/** @tlb_invalidation.seqno_lock: TLB invalidation seqno lock */
>  		struct mutex seqno_lock;
>  		/**
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 7d2e937da1d8..b09423590f62 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -23,10 +23,10 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_sriov_pf_control.h"
>  #include "xe_gt_sriov_pf_monitor.h"
> -#include "xe_gt_tlb_invalidation.h"
>  #include "xe_guc.h"
>  #include "xe_guc_relay.h"
>  #include "xe_guc_submit.h"
> +#include "xe_guc_tlb_invalidation.h"
>  #include "xe_map.h"
>  #include "xe_pm.h"
>  #include "xe_trace_guc.h"
> diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c
> new file mode 100644
> index 000000000000..b6fd61bb77ba
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c
> @@ -0,0 +1,143 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include "abi/guc_actions_abi.h"
> +
> +#include "xe_assert.h"
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_printk.h"
> +#include "xe_gt_tlb_invalidation.h"
> +#include "xe_guc.h"
> +#include "xe_guc_ct.h"
> +#include "xe_guc_tlb_invalidation.h"
> +
> +static int send_tlb_invalidation(struct xe_guc *guc, u32 *action, int len)

const u32 *action

and len should be unsigned

> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +
> +	xe_gt_assert(gt, action[1]);	/* Seqno */

it would be nice to have that "1" as part of the GuC ABI,
maybe at least as:

#define H2G_TLB_INVALIDATE_MSG_1_SEQNO	GUC_HXG_REQUEST_MSG_n_DATAn

xe_gt_assert(gt, FIELD_GET(H2G_TLB_INVALIDATE_MSG_1_SEQNO, action[1]);

> +	lockdep_assert_held(&gt->tlb_invalidation.seqno_lock);
> +
> +	return xe_guc_ct_send(&guc->ct, action, len,
> +			      G2H_LEN_DW_TLB_INVALIDATE, 1);
> +}
> +
> +#define MAKE_INVAL_OP(type)	((type << XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
> +		XE_GUC_TLB_INVAL_MODE_HEAVY << XE_GUC_TLB_INVAL_MODE_SHIFT | \
> +		XE_GUC_TLB_INVAL_FLUSH_CACHE)

maybe it's time to convert SHIFT-based GuC ABI definitions into
mask-based and use FIELD_PREP as we do elsewhere

> +
> +static int send_tlb_invalidation_ggtt(struct xe_gt *gt, int seqno)

shouldn't we take "guc" instead of "gt" ? see below

> +{
> +	u32 action[] = {
> +		XE_GUC_ACTION_TLB_INVALIDATION,
> +		seqno,
> +		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_GUC),
> +	};
> +
> +	return send_tlb_invalidation(&gt->uc.guc, action, ARRAY_SIZE(action));
> +}
> +
> +static int send_tlb_invalidation_ppgtt(struct xe_gt *gt, u64 start, u64 end,
> +				       u32 asid, int seqno)
> +{
> +#define MAX_TLB_INVALIDATION_LEN	7

this should be defined as part of the GuC ABI

> +	u32 action[MAX_TLB_INVALIDATION_LEN];
> +	int len = 0;
> +
> +	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
> +	action[len++] = seqno;
> +	if (!gt_to_xe(gt)->info.has_range_tlb_invalidation) {
> +		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
> +	} else {
> +		u64 orig_start = start;
> +		u64 length = end - start;
> +		u64 align;
> +
> +		if (length < SZ_4K)
> +			length = SZ_4K;
> +
> +		/*
> +		 * We need to invalidate a higher granularity if start address
> +		 * is not aligned to length. When start is not aligned with
> +		 * length we need to find the length large enough to create an
> +		 * address mask covering the required range.
> +		 */
> +		align = roundup_pow_of_two(length);
> +		start = ALIGN_DOWN(start, align);
> +		end = ALIGN(end, align);
> +		length = align;
> +		while (start + length < end) {
> +			length <<= 1;
> +			start = ALIGN_DOWN(orig_start, length);
> +		}
> +
> +		/*
> +		 * Minimum invalidation size for a 2MB page that the hardware
> +		 * expects is 16MB
> +		 */
> +		if (length >= SZ_2M) {
> +			length = max_t(u64, SZ_16M, length);
> +			start = ALIGN_DOWN(orig_start, length);
> +		}
> +
> +		xe_gt_assert(gt, length >= SZ_4K);
> +		xe_gt_assert(gt, is_power_of_2(length));
> +		xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M) - 1,
> +						    ilog2(SZ_2M) + 1)));
> +		xe_gt_assert(gt, IS_ALIGNED(start, length));
> +
> +		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
> +		action[len++] = asid;
> +		action[len++] = lower_32_bits(start);
> +		action[len++] = upper_32_bits(start);
> +		action[len++] = ilog2(length) - ilog2(SZ_4K);
> +	}
> +
> +	xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
> +
> +	return send_tlb_invalidation(&gt->uc.guc, action, len);
> +}
> +
> +static const struct xe_gt_tlb_invalidation_ops guc_tlb_invalidation_ops = {
> +	.tlb_invalidation_ppgtt = send_tlb_invalidation_ppgtt,
> +	.tlb_invalidation_ggtt = send_tlb_invalidation_ggtt,
> +};

maybe it's overkill, but what about using the following code layout:

// pure GuC code
static int guc_send_tlb_invalidation(guc, action, len)
{
}

// pure GuC code
static int guc_send_tlb_invalidation_ggtt(guc, seqno)
{
	return guc_send_tlb_invalidation(guc, ...);
}

// ops glue code
static int tlb_invalidation_ggtt_by_guc(gt, seqno)
{
	return guc_send_tlb_invalidation_ggtt(guc, ...);
}

const struct xe_gt_tlb_invalidation_ops guc_tlb_invalidation_ops = {
	.ggtt = tlb_invalidation_ggtt_by_guc,
};


> +
> +/**
> + * xe_guc_tlb_invalidation_get_ops - Get Guc TLB invalidation ops
> + * @guc: guc
> + *
> + * Return: xe_gt_tlb_invalidation_ops for GuC TLB invalidation
> + */
> +const struct xe_gt_tlb_invalidation_ops*
> +xe_guc_tlb_invalidation_get_ops(struct xe_guc *guc)

since we don't use "guc" here and don't have any logic behind this
function, so maybe easier/cleaner would be just to expose ops directly
in the header as:

extern const struct xe_gt_tlb_invalidation_ops guc_tlb_invalidation_ops;

or since we may want to postpone GuC ops registration until we know we
will use the GuC, expose function in xe_gt_tlb_invalidation.h:

void xe_gt_tlb_invalidation_set_ops(
	struct xe_gt *gt,
	const struct xe_gt_tlb_invalidation_ops *ops);

> +{
> +	return &guc_tlb_invalidation_ops;
> +}
> +
> +/**
> + * xe_guc_tlb_invalidation_done_handler - GuC TLB invalidation done handler
> + * @guc: guc
> + * @msg: message indicating TLB invalidation done
> + * @len: length of message
> + *
> + * Parse seqno of TLB invalidation, 

only this part seems to be valid, all below belongs more to the
description of the xe_gt_tlb_invalidation_done_handler() that maybe we
should explicitly refer to ?

> wake any waiters for seqno, and signal any
> + * invalidation fences for seqno. Algorithm for this depends on seqno being
> + * received in-order and asserts this assumption.
> + *
> + * Return: 0 on success, -EPROTO for malformed messages.
> + */
> +int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +
> +	if (unlikely(len != 1))

this magic "1" should be part of the GuC ABI

> +		return -EPROTO;
> +
> +	xe_gt_tlb_invalidation_done_handler(gt, msg[0]);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h
> new file mode 100644
> index 000000000000..44408aae6955
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_TLB_INVALIDATION_H_
> +#define _XE_GUC_TLB_INVALIDATION_H_
> +
> +struct xe_guc;

forward decls should be _after_ any includes

> +
> +#include <linux/types.h>
> +
> +const struct xe_gt_tlb_invalidation_ops*
> +xe_guc_tlb_invalidation_get_ops(struct xe_guc *guc);
> +
> +int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
> +
> +#endif	/* _XE_GUC_TLB_INVALIDATION_H_ */

IIRC in Xe we don't use decorations for closing #endif of include guard
