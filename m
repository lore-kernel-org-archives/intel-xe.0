Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2306CCE8E73
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 13:11:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E831910E936;
	Thu, 24 Oct 2024 13:11:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iXJWZG8H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92DA510E936
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 13:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729775469; x=1761311469;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oQanZdyFXkISv/c1I50S4opiv7QVz6ADGtvl3RgYRos=;
 b=iXJWZG8Hc5vlHth1LiG3foEjI9gVksf8LH5u8AcnnTClW1nY8oxykmJs
 VC4/E7XbR0ZMSW5v59w2d21GqB5ZKTkIwMAn16Ebeqkbvwr3+1fqoHaNw
 xPzMXRWtshoSB40vE1J+aw1n2gCOi6T/2sYp2mceAU+ody+yovmaQAooU
 k6TtyDy05OfTDr1BmlqpShSufXkfFQ6jEx0TP1RivM3CgT8ORfBinuSMe
 nkUYjRGxi2Hvt1g45RM8Rs/n9Q8z36vfrxq31WfU2ORoAMz85cM1/0MQg
 ZJtyhxbXEeDRl+uB0vGGCrCwyPx9N6WPOjvtad9ef4NFNmnSpnYaZ1Rs9 A==;
X-CSE-ConnectionGUID: yy8Mai2KSD6bOYuHeYOVJg==
X-CSE-MsgGUID: BpZMCxQFTcaU4SLnGcewPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="28860208"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="28860208"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 06:11:08 -0700
X-CSE-ConnectionGUID: r0IFqfP2SQa4jbH21PUfcQ==
X-CSE-MsgGUID: A081CyPwSs+hg4NNaJhOUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="81402636"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.216])
 ([10.245.245.216])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 06:11:06 -0700
Message-ID: <63a1062f-56b9-4367-92fa-0ef0dd235adc@intel.com>
Date: Thu, 24 Oct 2024 14:11:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc/tlb: Flush g2h worker in case of tlb timeout
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 Nirmoy Das <nirmoy.das@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Anshuman Gupta <Anshuman.Gupta@intel.com>
References: <20241023151343.3463640-1-nirmoy.das@intel.com>
 <20af74cb-1ade-4f75-b73c-7e75b3651a00@intel.com>
 <6179d84e-a746-467e-a0ef-a04567dc0554@linux.intel.com>
 <24bebfeb-ffee-4c3a-8ab2-5ca76d086e59@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <24bebfeb-ffee-4c3a-8ab2-5ca76d086e59@intel.com>
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

On 24/10/2024 14:00, Nilawar, Badal wrote:
> 
> 
> On 24-10-2024 15:47, Nirmoy Das wrote:
>>
>> On 10/24/2024 12:02 PM, Nilawar, Badal wrote:
>>>
>>>
>>> On 23-10-2024 20:43, Nirmoy Das wrote:
>>>> Flush the g2h worker explicitly if TLB timeout happens which is
>>>> observed on LNL and that points recent scheduling issue with E-cores.
>>>> This is similar to the recent fix:
>>>> commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
>>>> response timeout") and should be removed once there is E core
>>>> scheduling fix.
>>>>
>>>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2687
>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 9 +++++++++
>>>>    1 file changed, 9 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c 
>>>> b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>> index 773de1f08db9..2c327dccbd74 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>> @@ -72,6 +72,15 @@ static void xe_gt_tlb_fence_timeout(struct 
>>>> work_struct *work)
>>>>        struct xe_device *xe = gt_to_xe(gt);
>>>>        struct xe_gt_tlb_invalidation_fence *fence, *next;
>>>>    +    /*
>>>> +     * This is analogous to e51527233804 ("drm/xe/guc/ct: Flush g2h 
>>>> worker
>>>> +     * in case of g2h response timeout")
>>>> +     *
>>>> +     * TODO: Drop this change once workqueue scheduling delay issue is
>>>> +     * fixed on LNL Hybrid CPU.
>>>> +     */
>>>> +    flush_work(&gt->uc.guc.ct.g2h_worker);
>>>
>>> I didn't get the idea of flushing g2h worker here. Moreover AFAIK tlb 
>>> invalidation is handled in fast path xe_guc_ct_fast_path i.e. in IRQ 
>>> handler itself. Is this change solving the issue.
>>
>> AFAIU g2h worker can also handle TLB_INVALIDATION_DONE message from 
>> GuC(process_g2h_msg). This indeed fixes the issue from me for LNL.
> 
> Agreed, it does handle in the slow path as well, but upon receiving an 
> IRQ, it will be managed in the fast path.
> So I suspect this is a case of an G2H interrupt miss rather than a G2H 
> worker delay due to the efficient cores in LNL.
> For now, this change can proceed as it is helping out, but considering 
> the possibility of an interrupt miss, I suggest debugging from that 
> perspective.
> In another thread, Himal mentioned that this issue is also observed on 
> BMG, which strengthens the possibility of an G2H interrupt miss.

Note that we currently still process the G2H events in-order, so if 
there is something earlier in the queue that can't be safely processed 
in the irq then we leave it to the worker to handle. So we might get an 
irq for the tlb invalidation completion and yet be unable to process it 
in the irq.

> 
> Regards,
> Badal
> 
>>
>>
>> Regards,
>>
>> Nirmoy
>>
>>>
>>> static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
>>> {
>>>          if (!xe_guc_ct_enabled(ct))
>>>                  return;
>>>
>>>          wake_up_all(&ct->wq);
>>>          queue_work(ct->g2h_wq, &ct->g2h_worker);
>>>          xe_guc_ct_fast_path(ct);
>>> }
>>>
>>> Regards,
>>> Badal
>>>
>>>> +
>>>>        spin_lock_irq(&gt->tlb_invalidation.pending_lock);
>>>>        list_for_each_entry_safe(fence, next,
>>>>                     &gt->tlb_invalidation.pending_fences, link) {
>>>
> 
