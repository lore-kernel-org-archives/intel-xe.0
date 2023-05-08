Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEEFC77B7F
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 21:41:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F2B10E308;
	Mon,  8 May 2023 21:41:35 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F8F10E308
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 21:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683582094; x=1715118094;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ypuHbUZDvZBSc7tx2sbQApQ+RC/9uGI0Rnp3ECuEMx8=;
 b=Xwr3kQqBsF3wDdaEmico4oNR/htbvKg38j6VW0VSI18onjihhmzTAuUK
 jCVH1NUqqrS7lHkGVKzO2MNapI/6m36pG/3K5w9N+D9dMQu5XTMClZw+G
 ka2xQ4F8HbYFjdk11ij11dZy46px7dAOPlcKExzn+15oFnr2DELxhiW2I
 jmSDr6opp9LKwr67s7QqSOvhTkHRZZi59O2nNOJZXpE295v57C7NCCwNJ
 Bd/5FTRUEygIw++dYjFgFUl/VwNiyteTk+tN3w0zft4HF4uUDetv55X7o
 8614ikI44N/1Eyl+NG7H0uXyFuiIdIjq9Fljx5zv21hAds8rLjGCf8TA3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="436082507"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="436082507"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 14:41:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="731441942"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="731441942"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.38.126])
 ([10.252.38.126])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 14:41:32 -0700
Message-ID: <9bea8260-8865-f862-7f2f-a2ae90d01ef5@linux.intel.com>
Date: Mon, 8 May 2023 23:41:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@kernel.org>, Nirmoy Das <nirmoy.das@intel.com>
References: <20230505133433.9642-1-nirmoy.das@intel.com>
 <ZFUI3YyB87jY899o@rdvivi-mobl4>
 <edb8a4d0-99ab-0d4c-d866-e6e6e94cd472@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <edb8a4d0-99ab-0d4c-d866-e6e6e94cd472@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Print GT info on TLB inv failure
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


On 5/8/2023 11:10 PM, Michal Wajdeczko wrote:
>
> On 05.05.2023 15:47, Rodrigo Vivi wrote:
>> On Fri, May 05, 2023 at 03:34:33PM +0200, Nirmoy Das wrote:
>>> Print GT info on TLB inv failure for better debugbility.
>>>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>
>>> ---
>>>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>> index 604f189dbd70..9e7fe8d9bca4 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>> @@ -34,8 +34,8 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>>>   			break;
>>>   
>>>   		trace_xe_gt_tlb_invalidation_fence_timeout(fence);
>>> -		drm_err(&gt_to_xe(gt)->drm, "TLB invalidation fence timeout, seqno=%d",
>>> -			fence->seqno);
>>> +		drm_err(&gt_to_xe(gt)->drm, "gt%d: TLB invalidation fence timeout, seqno=%d",
>>> +			gt->info.id, fence->seqno);
>>>   
>>>   		list_del(&fence->link);
>>>   		fence->base.error = -ETIME;
>>> @@ -285,8 +285,8 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
>>>   				 tlb_invalidation_seqno_past(gt, seqno),
>>>   				 TLB_TIMEOUT);
>>>   	if (!ret) {
>>> -		drm_err(&xe->drm, "TLB invalidation time'd out, seqno=%d, recv=%d\n",
>>> -			seqno, gt->tlb_invalidation.seqno_recv);
>>> +		drm_err(&xe->drm, "gt%d: TLB invalidation time'd out, seqno=%d, recv=%d\n",
>>> +			gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
> as a reminder, there is pending series with gt log wrappers [1] that
> could be used also here to avoid manual addition of "gt%u" prefix


Agreed, this will be useful.


> [1] https://patchwork.freedesktop.org/series/115083/
>
>>>   		return -ETIME;
>>>   	}
>>>   
>>> -- 
>>> 2.39.0
>>>
