Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392EBC3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 12:22:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02C110E5AC;
	Tue, 23 Jul 2024 12:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h0gSNpYG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA9110E5AC
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 12:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721737369; x=1753273369;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8mavhsK7qrgg10XkBWrey2YUmg2znvtlGIdKs5mGzMo=;
 b=h0gSNpYGOfDpehbgJYpYoLo7OhwMKfxnTulD/xqjfqNJG1Yiow5xgn8V
 mj1rmlgFRaeMrMoSSK3FzY0EdYwEzdsJAHStp+Myh53ikG+8uVcMJTP19
 a+NxTWPM5erj+su5p7gRP8Wz7IUpwA24hOCQXVMDyaA7bZL6iKoSbttf+
 LRlDBNFBm6O0cX2vf2/RZSdB9wE8NqBb3hvJar/0d4uahkrJDXascCBiK
 LueHi8AJRRgUPWkGChrJi2jklMhs2ND7ryoBGt6R71bPD2qU9wckYdYMR
 1hdfcuMBOzKA/8BTksGl4li7VxWHKItsrhrUSeWD6YnD04Fvtu9pb7E0f Q==;
X-CSE-ConnectionGUID: 5tStHRR8QcOXkxVlnfof9g==
X-CSE-MsgGUID: EMKLeE0hSsqePM+U63faTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="29975950"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="29975950"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 05:22:48 -0700
X-CSE-ConnectionGUID: Ooj+RzdDRzKnhyzIZoNGZQ==
X-CSE-MsgGUID: YnVmbe3xTWOaGWu9osg2jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="52103326"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 23 Jul 2024 05:22:45 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id CC96A28774;
 Tue, 23 Jul 2024 13:22:43 +0100 (IST)
Message-ID: <9ecd36c8-b880-4097-a6ae-27e786b15497@intel.com>
Date: Tue, 23 Jul 2024 14:22:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Add sent and recv counters for tlb
 invalidations
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
References: <20240723111610.21564-1-nirmoy.das@intel.com>
 <20240723111610.21564-2-nirmoy.das@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240723111610.21564-2-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 23.07.2024 13:16, Nirmoy Das wrote:
> Add counters for TLB invalidation sent, receive requests which
> then could be query as sysfs files from userspace.

s/sysfs/debugfs ?

> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 37 +++++++++++++++------
>  drivers/gpu/drm/xe/xe_gt_types.h            |  4 +++
>  2 files changed, 30 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 481d83d07367..f84717c1aafa 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -37,8 +37,11 @@ static long tlb_timeout_jiffies(struct xe_gt *gt)
>  }
>  
>  static void
> -__invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
> +__invalidation_fence_signal(struct xe_gt *gt,
> +			    struct xe_gt_tlb_invalidation_fence *fence,
> +			    bool failed)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
>  	bool stack = test_bit(FENCE_STACK_BIT, &fence->base.flags);
>  
>  	trace_xe_gt_tlb_invalidation_fence_signal(xe, fence);
> @@ -46,13 +49,19 @@ __invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_
>  	dma_fence_signal(&fence->base);
>  	if (!stack)
>  		dma_fence_put(&fence->base);
> +
> +	/* Only increment the counter when tlb inval is done successfully */
> +	if (!failed)
> +		atomic64_inc(&gt->tlb_invalidation.received_count);
>  }
>  
>  static void
> -invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
> +invalidation_fence_signal(struct xe_gt *gt,
> +			  struct xe_gt_tlb_invalidation_fence *fence,
> +			  bool failed)
>  {
>  	list_del(&fence->link);
> -	__invalidation_fence_signal(xe, fence);
> +	__invalidation_fence_signal(gt, fence, failed);
>  }
>  
>  static void xe_gt_tlb_fence_timeout(struct work_struct *work)
> @@ -76,7 +85,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>  			  fence->seqno, gt->tlb_invalidation.seqno_recv);
>  
>  		fence->base.error = -ETIME;
> -		invalidation_fence_signal(xe, fence);
> +		invalidation_fence_signal(gt, fence, true);
>  	}
>  	if (!list_empty(&gt->tlb_invalidation.pending_fences))
>  		queue_delayed_work(system_wq,
> @@ -102,6 +111,8 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
>  	spin_lock_init(&gt->tlb_invalidation.lock);
>  	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
>  			  xe_gt_tlb_fence_timeout);
> +	atomic64_set(&gt->tlb_invalidation.sent_count, 0);
> +	atomic64_set(&gt->tlb_invalidation.received_count, 0);
>  
>  	return 0;
>  }
> @@ -140,7 +151,9 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
>  
>  	list_for_each_entry_safe(fence, next,
>  				 &gt->tlb_invalidation.pending_fences, link)
> -		invalidation_fence_signal(gt_to_xe(gt), fence);
> +		invalidation_fence_signal(gt, fence, false);
> +	atomic64_set(&gt->tlb_invalidation.sent_count, 0);
> +	atomic64_set(&gt->tlb_invalidation.received_count, 0);

hmm, any TLB invalidation timeouts/errors, which would make
received_count != sent_count, should trigger a GT reset, which in turn
will reset those counters, so under which condition you expect those two
stats being not equal? is it just during the waiting for some ack?

maybe better/cleaner option would be to track/display number of TLB
invalidation requests in flight ?

>  	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
>  	mutex_unlock(&gt->uc.guc.ct.lock);
>  }
> @@ -182,7 +195,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>  	action[1] = seqno;
>  	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
>  				    G2H_LEN_DW_TLB_INVALIDATE, 1);
> -	if (!ret && fence) {
> +	if (!ret) {
>  		spin_lock_irq(&gt->tlb_invalidation.pending_lock);
>  		/*
>  		 * We haven't actually published the TLB fence as per
> @@ -191,7 +204,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>  		 * we can just go ahead and signal the fence here.
>  		 */
>  		if (tlb_invalidation_seqno_past(gt, seqno)) {
> -			__invalidation_fence_signal(xe, fence);
> +			__invalidation_fence_signal(gt, fence, false);
>  		} else {
>  			fence->invalidation_time = ktime_get();
>  			list_add_tail(&fence->link,
> @@ -203,14 +216,16 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>  						   tlb_timeout_jiffies(gt));
>  		}
>  		spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
> -	} else if (ret < 0 && fence) {
> -		__invalidation_fence_signal(xe, fence);
> +	} else if (ret < 0) {
> +		__invalidation_fence_signal(gt, fence, true);
>  	}
>  	if (!ret) {
>  		gt->tlb_invalidation.seqno = (gt->tlb_invalidation.seqno + 1) %
>  			TLB_INVALIDATION_SEQNO_MAX;
>  		if (!gt->tlb_invalidation.seqno)
>  			gt->tlb_invalidation.seqno = 1;
> +
> +		atomic64_inc(&gt->tlb_invalidation.sent_count);
>  	}
>  	mutex_unlock(&guc->ct.lock);
>  
> @@ -321,7 +336,7 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
>  
>  	/* Execlists not supported */
>  	if (gt_to_xe(gt)->info.force_execlist) {
> -		__invalidation_fence_signal(xe, fence);
> +		__invalidation_fence_signal(gt, fence, true);
>  		return 0;
>  	}
>  
> @@ -455,7 +470,7 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  		if (!tlb_invalidation_seqno_past(gt, fence->seqno))
>  			break;
>  
> -		invalidation_fence_signal(xe, fence);
> +		invalidation_fence_signal(gt, fence, false);
>  	}
>  
>  	if (!list_empty(&gt->tlb_invalidation.pending_fences))
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index ef68c4a92972..130d9f5cb5c2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -199,6 +199,10 @@ struct xe_gt {
>  		struct delayed_work fence_tdr;
>  		/** @tlb_invalidation.lock: protects TLB invalidation fences */
>  		spinlock_t lock;
> +		/** @tlb_invalidation.sent_count: counter for sent TLB inval requests */
> +		atomic64_t sent_count;
> +		/** @tlb_invalidation.received_count: counter for received TLB inval requestes */
> +		atomic64_t received_count;
>  	} tlb_invalidation;
>  
>  	/**
