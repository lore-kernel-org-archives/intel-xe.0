Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B45EB64D9
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 15:22:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7339F10E440;
	Thu,  6 Jul 2023 15:22:38 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0FC10E412
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 15:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688656956; x=1720192956;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DMcHnjxtnzoQ44xG3baHJ2LG3+TaDOrhwAdY3k7EzQY=;
 b=A+mbwYTuVG0ZeL8cNY4jXS821NieC8GZCU/jwFCh7kSx5jklIRMTIhT8
 os6zZiF0HFbuQqCXGcRStT8zUHl0MOHXrZREIqQZEsq4mfAxjmJPQro6J
 qz4lOMbeC4UibwJ3fPl1GnRx3c6sM1Ed8VqNWWpJkqqULUQ/G3upxfk1r
 /ClgdrKcTR7MqRtCUJ4D7l8OfiV0Qv3nj15E1pkK/4veymwcvRlFXMMSq
 5yrIMf9gSqO7GWeQ2yjNTs4xc8Bh9hI59tgeabNn9df/TXl3QuQP3mlHm
 hmwOXsOLdic/YOaGSm508ErEq2WJiQoh5cblX5QR6AGAD2c+1Qa6ZivfZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="366209518"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="366209518"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 08:22:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="1050130304"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="1050130304"
Received: from fmahon-mobl.ger.corp.intel.com (HELO [10.252.26.229])
 ([10.252.26.229])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 08:22:31 -0700
Message-ID: <3112f9f0-8b06-a2df-767c-02e907bb37ea@intel.com>
Date: Thu, 6 Jul 2023 16:22:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>
References: <20230705160602.237213-9-matthew.auld@intel.com>
 <20230705160602.237213-12-matthew.auld@intel.com>
 <ZKY8Bgldf5j5K2KC@DUT025-TGLU.fm.intel.com>
 <b8ba02aa-b916-3e61-c197-47b14ce71d7d@intel.com>
 <ZKbal3xBVGfJyX+D@DUT025-TGLU.fm.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZKbal3xBVGfJyX+D@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v4 3/7] drm/xe/tlb: increment next seqno
 after successful CT send
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 06/07/2023 16:15, Matthew Brost wrote:
> On Thu, Jul 06, 2023 at 10:42:37AM +0100, Matthew Auld wrote:
>> On 06/07/2023 04:59, Matthew Brost wrote:
>>> On Wed, Jul 05, 2023 at 05:06:06PM +0100, Matthew Auld wrote:
>>>> If we are in the middle of a GT reset or similar the CT might be
>>>> disabled, such that the CT send fails. However we already incremented
>>>> gt->tlb_invalidation.seqno which might lead to warnings, since we
>>>> effectively just skipped a seqno:
>>>>
>>>>       0000:00:02.0: drm_WARN_ON(expected_seqno != msg[0])
>>>>
>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: José Roberto de Souza <jose.souza@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 11 ++++++-----
>>>>    1 file changed, 6 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>> index 2fcb477604e2..b38da572d268 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>> @@ -124,10 +124,6 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>>>>    		trace_xe_gt_tlb_invalidation_fence_send(fence);
>>>>    	}
>>>>    	action[1] = seqno;
>>>> -	gt->tlb_invalidation.seqno = (gt->tlb_invalidation.seqno + 1) %
>>>> -		TLB_INVALIDATION_SEQNO_MAX;
>>>> -	if (!gt->tlb_invalidation.seqno)
>>>> -		gt->tlb_invalidation.seqno = 1;
>>>>    	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
>>>>    				    G2H_LEN_DW_TLB_INVALIDATE, 1);
>>>>    	if (!ret && fence) {
>>>> @@ -137,8 +133,13 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>>>>    					   &gt->tlb_invalidation.fence_tdr,
>>>>    					   TLB_TIMEOUT);
>>>>    	}
>>>> -	if (!ret)
>>>
>>> Do we now (after this entire series) have the another race where the
>>> below warn could fire as the CT fast path executes before we update the
>>> seqno value? Would it be better to just roll back the seqno on error?
>>
>> Ohh, so we do the CT send, we process the g2h message double quick on the
>> fast-path, before we even had a chance to add the fence to the list? I
>> missed that. Maybe easiest is just to sample seqno_recv here under the lock,
>> and signal the fence directly if the seqno was already written. Thanks for
>> catching that.
>>
> 
> Yep, that is a race is the later patches, in particular this snippet, right?
> 
>   	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
>   				    G2H_LEN_DW_TLB_INVALIDATE, 1);
>   	if (!ret && fence) {
> +		spin_lock_irq(&gt->tlb_invalidation.pending_lock);
>   		fence->invalidation_time = ktime_get();
> -		if (queue_work)
> +		list_add_tail(&fence->link,
> +			      &gt->tlb_invalidation.pending_fences);
> +
> +		if (list_is_singular(&gt->tlb_invalidation.pending_fences))
>   			queue_delayed_work(system_wq,
>   					   &gt->tlb_invalidation.fence_tdr,
>   					   TLB_TIMEOUT);
> +
> +		spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
> +	} else if (ret < 0 && fence) {
> +		trace_xe_gt_tlb_invalidation_fence_signal(fence);
> +		dma_fence_signal(&fence->base);
> +		dma_fence_put(&fence->base);
>   	}
> 
> So before the list_add_tail we should check the recv seqno and possibly
> signal the fence? That makes sense to me.

Yup, exactly that.

>   
>> I don't think there is any race with updating tlb_invalidation.seqno, the
>> receiver side only considers the seqno_recv. So not sure it matters where we
>> increment tlb_invalidation.seqno so long as we are under ct->lock and
>> ideally don't leave it incremented on error for the next user. I can do the
>> roll back instead if your prefer?
>>
> 
> Right, so this patch itself is actually fine. It patch #7 as discussed
> above that needs a fix.
> 
> Ok, with that:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thanks.

> 
>>>
>>> Matt
>>>
>>>> +	if (!ret) {
>>>> +		gt->tlb_invalidation.seqno = (gt->tlb_invalidation.seqno + 1) %
>>>> +			TLB_INVALIDATION_SEQNO_MAX;
>>>> +		if (!gt->tlb_invalidation.seqno)
>>>> +			gt->tlb_invalidation.seqno = 1;
>>>>    		ret = seqno;
>>>> +	}
>>>>    	if (ret < 0 && fence)
>>>>    		invalidation_fence_signal(fence);
>>>>    	mutex_unlock(&guc->ct.lock);
>>>> -- 
>>>> 2.41.0
>>>>
