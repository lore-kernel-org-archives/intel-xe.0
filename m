Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC931C3DA63
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 09:20:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D41B10E567;
	Wed, 24 Jul 2024 09:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LW/mSWcv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A048710E612
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jul 2024 09:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721812823; x=1753348823;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hElO9YY/qo2yuqA8RxJfnfTjfTXxd9AXv5AYa2tSWNU=;
 b=LW/mSWcvc518NuMJNsBA0WT3yhyoJ0J/R0mD/vBsr3j3x8TAl5Kso2hK
 fUB+ZCE7f4Ox/5Hx3JDNLIzctKvpoNKFeVwXUGFP2nubDO1443bwJsY95
 WSTELxYVHVKcYGN5pcFF0WbtPh+olZuiq/298lz3qKJ6Rs2IFd6iH51p4
 vYSaNm/N7T04C7Dsb/ZA/4LHl8u8isRc62X8onMuOlgpzrekfLBeJr7F+
 7mZaFlB++lbcndPvg3BJaSAny4cXCutokDib7ajRAYCTDyYjII72pyg3w
 ZtRS0TIk8Z0HwXZg8jqL2QClh72C0ZeHD8U3I5sjhdgKwadaAtcjuPAXR g==;
X-CSE-ConnectionGUID: fi8Qd3NNRdyEJry8TdI6fQ==
X-CSE-MsgGUID: 3AEqbXZXSvSxQwQgJ4mUlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19617025"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="19617025"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 02:20:23 -0700
X-CSE-ConnectionGUID: Hqf3VL/CTlO5+JTST68uwQ==
X-CSE-MsgGUID: 0QNRTuyaTm2DZ4mIziou5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="83534488"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.38.191])
 ([10.246.38.191])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 02:20:21 -0700
Message-ID: <a7358792-6858-4681-807e-490d0765541d@linux.intel.com>
Date: Wed, 24 Jul 2024 11:20:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Add sent and recv counters for tlb
 invalidations
To: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
References: <20240723111610.21564-1-nirmoy.das@intel.com>
 <20240723111610.21564-2-nirmoy.das@intel.com>
 <9ecd36c8-b880-4097-a6ae-27e786b15497@intel.com>
 <51db88f1-79b1-44e9-9354-0f628069a64b@intel.com>
 <Zp/ZEeUAAepmpqs4@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <Zp/ZEeUAAepmpqs4@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 7/23/2024 6:23 PM, Matthew Brost wrote:
> On Tue, Jul 23, 2024 at 03:07:05PM +0200, Nirmoy Das wrote:
>> On 7/23/2024 2:22 PM, Michal Wajdeczko wrote:
>>> On 23.07.2024 13:16, Nirmoy Das wrote:
>>>> Add counters for TLB invalidation sent, receive requests which
>>>> then could be query as sysfs files from userspace.
>>> s/sysfs/debugfs ?
>>
>> I will fix it.
>>
> I think this debugfs then I think we certainly need to hide this
> implementation behind a Kconfig option as atomics have a non-zero
> execution cost.
>
> I'm thinking a generic DRM_XE_DEBUG_STATS or something.
>
> Then also with that, build generic stats layer which other code calls
> into and stats object which encapsulates all the stats.
>
> Fine with only having TLB invalidations to start but having the
> infrastructure to add more stats over time would be good.


Ok, I will give it a try and improve it with further suggestions.


Thanks,

Nirmoy

>
> Matt
>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 37 +++++++++++++++------
>>>>    drivers/gpu/drm/xe/xe_gt_types.h            |  4 +++
>>>>    2 files changed, 30 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>> index 481d83d07367..f84717c1aafa 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>> @@ -37,8 +37,11 @@ static long tlb_timeout_jiffies(struct xe_gt *gt)
>>>>    }
>>>>    static void
>>>> -__invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
>>>> +__invalidation_fence_signal(struct xe_gt *gt,
>>>> +			    struct xe_gt_tlb_invalidation_fence *fence,
>>>> +			    bool failed)
>>>>    {
>>>> +	struct xe_device *xe = gt_to_xe(gt);
>>>>    	bool stack = test_bit(FENCE_STACK_BIT, &fence->base.flags);
>>>>    	trace_xe_gt_tlb_invalidation_fence_signal(xe, fence);
>>>> @@ -46,13 +49,19 @@ __invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_
>>>>    	dma_fence_signal(&fence->base);
>>>>    	if (!stack)
>>>>    		dma_fence_put(&fence->base);
>>>> +
>>>> +	/* Only increment the counter when tlb inval is done successfully */
>>>> +	if (!failed)
>>>> +		atomic64_inc(&gt->tlb_invalidation.received_count);
>>>>    }
>>>>    static void
>>>> -invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
>>>> +invalidation_fence_signal(struct xe_gt *gt,
>>>> +			  struct xe_gt_tlb_invalidation_fence *fence,
>>>> +			  bool failed)
>>>>    {
>>>>    	list_del(&fence->link);
>>>> -	__invalidation_fence_signal(xe, fence);
>>>> +	__invalidation_fence_signal(gt, fence, failed);
>>>>    }
>>>>    static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>>>> @@ -76,7 +85,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>>>>    			  fence->seqno, gt->tlb_invalidation.seqno_recv);
>>>>    		fence->base.error = -ETIME;
>>>> -		invalidation_fence_signal(xe, fence);
>>>> +		invalidation_fence_signal(gt, fence, true);
>>>>    	}
>>>>    	if (!list_empty(&gt->tlb_invalidation.pending_fences))
>>>>    		queue_delayed_work(system_wq,
>>>> @@ -102,6 +111,8 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
>>>>    	spin_lock_init(&gt->tlb_invalidation.lock);
>>>>    	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
>>>>    			  xe_gt_tlb_fence_timeout);
>>>> +	atomic64_set(&gt->tlb_invalidation.sent_count, 0);
>>>> +	atomic64_set(&gt->tlb_invalidation.received_count, 0);
>>>>    	return 0;
>>>>    }
>>>> @@ -140,7 +151,9 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
>>>>    	list_for_each_entry_safe(fence, next,
>>>>    				 &gt->tlb_invalidation.pending_fences, link)
>>>> -		invalidation_fence_signal(gt_to_xe(gt), fence);
>>>> +		invalidation_fence_signal(gt, fence, false);
>>>> +	atomic64_set(&gt->tlb_invalidation.sent_count, 0);
>>>> +	atomic64_set(&gt->tlb_invalidation.received_count, 0);
>>> hmm, any TLB invalidation timeouts/errors, which would make
>>> received_count != sent_count, should trigger a GT reset, which in turn
>>> will reset those counters, so under which condition you expect those two
>>> stats being not equal?
>> We tolerate GGTT tlb inval timeouts without needed to do a GT reset,
>> probably we shouldn't? If not then, I agree that we can have
>>
>> a total sent counter  and another for inflight counter.
>>
>>
>>> is it just during the waiting for some ack?
>>>
>>> maybe better/cleaner option would be to track/display number of TLB
>>> invalidation requests in flight ?
>>
>> Request from Sai was about having total tlb inval sent counter and I think
>> inflight would be a bonus and should be useful for debugging.
>>
>>
>> Regards,
>>
>> Nirmoy
>>
>>>>    	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
>>>>    	mutex_unlock(&gt->uc.guc.ct.lock);
>>>>    }
>>>> @@ -182,7 +195,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>>>>    	action[1] = seqno;
>>>>    	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
>>>>    				    G2H_LEN_DW_TLB_INVALIDATE, 1);
>>>> -	if (!ret && fence) {
>>>> +	if (!ret) {
>>>>    		spin_lock_irq(&gt->tlb_invalidation.pending_lock);
>>>>    		/*
>>>>    		 * We haven't actually published the TLB fence as per
>>>> @@ -191,7 +204,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>>>>    		 * we can just go ahead and signal the fence here.
>>>>    		 */
>>>>    		if (tlb_invalidation_seqno_past(gt, seqno)) {
>>>> -			__invalidation_fence_signal(xe, fence);
>>>> +			__invalidation_fence_signal(gt, fence, false);
>>>>    		} else {
>>>>    			fence->invalidation_time = ktime_get();
>>>>    			list_add_tail(&fence->link,
>>>> @@ -203,14 +216,16 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>>>>    						   tlb_timeout_jiffies(gt));
>>>>    		}
>>>>    		spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
>>>> -	} else if (ret < 0 && fence) {
>>>> -		__invalidation_fence_signal(xe, fence);
>>>> +	} else if (ret < 0) {
>>>> +		__invalidation_fence_signal(gt, fence, true);
>>>>    	}
>>>>    	if (!ret) {
>>>>    		gt->tlb_invalidation.seqno = (gt->tlb_invalidation.seqno + 1) %
>>>>    			TLB_INVALIDATION_SEQNO_MAX;
>>>>    		if (!gt->tlb_invalidation.seqno)
>>>>    			gt->tlb_invalidation.seqno = 1;
>>>> +
>>>> +		atomic64_inc(&gt->tlb_invalidation.sent_count);
>>>>    	}
>>>>    	mutex_unlock(&guc->ct.lock);
>>>> @@ -321,7 +336,7 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
>>>>    	/* Execlists not supported */
>>>>    	if (gt_to_xe(gt)->info.force_execlist) {
>>>> -		__invalidation_fence_signal(xe, fence);
>>>> +		__invalidation_fence_signal(gt, fence, true);
>>>>    		return 0;
>>>>    	}
>>>> @@ -455,7 +470,7 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>>>    		if (!tlb_invalidation_seqno_past(gt, fence->seqno))
>>>>    			break;
>>>> -		invalidation_fence_signal(xe, fence);
>>>> +		invalidation_fence_signal(gt, fence, false);
>>>>    	}
>>>>    	if (!list_empty(&gt->tlb_invalidation.pending_fences))
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>>>> index ef68c4a92972..130d9f5cb5c2 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>>>> @@ -199,6 +199,10 @@ struct xe_gt {
>>>>    		struct delayed_work fence_tdr;
>>>>    		/** @tlb_invalidation.lock: protects TLB invalidation fences */
>>>>    		spinlock_t lock;
>>>> +		/** @tlb_invalidation.sent_count: counter for sent TLB inval requests */
>>>> +		atomic64_t sent_count;
>>>> +		/** @tlb_invalidation.received_count: counter for received TLB inval requestes */
>>>> +		atomic64_t received_count;
>>>>    	} tlb_invalidation;
>>>>    	/**
