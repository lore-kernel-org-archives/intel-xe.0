Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F2BCAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 08:59:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128CC10E06F;
	Mon,  6 Oct 2025 08:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gCkrQc1u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DA410E06F
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 08:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759741174; x=1791277174;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6mzToAZguHBYC6Oc+vXoH8oznhx1lZB0mIfeJ1URt0Y=;
 b=gCkrQc1u+i/JXVzV5FdasISB1Ix3Vaa0RkrbtcKpKvSg7wQoDKcHsVME
 Z23rMXxE1DGiuEnLTAkIvuo0zDp4Hy9BAfxwjxPw1xotyYpGyTsFhRw+C
 KuJ9H0xemuDfsRsq6oRWaIZhJlxYbm+8L+y41J6IVgnxtCLiPp7NxHsYR
 vqSh5iaNu8chOliRkJ3H5mJDZiJ8lnrQyeSVRjZOaIY8oMJkohFYsBmvr
 3Q3YHEmlx9AVyl+fw/GmNCXI+L0LaEC0aPL9aTPoQo9xiq7SHSO7pgFlZ
 C4bsXO+sUxkOE56AvQpXvJrK2C5Z+OF/2ZojPgeQgQf8aneij1zXZPeAq g==;
X-CSE-ConnectionGUID: 2HQnRvCUQQaR6GIMMlIORQ==
X-CSE-MsgGUID: DUUmywVRR9qxBDlVUHJ5WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="64530289"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="64530289"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 01:59:34 -0700
X-CSE-ConnectionGUID: 0KWUkBqSTE6vJjHvWjHSgA==
X-CSE-MsgGUID: 2dL5URngR62tQYlBxqqJIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="180631537"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.52])
 ([10.245.245.52])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 01:59:33 -0700
Message-ID: <efa2dc2b-c143-474d-b3c8-4d78a2137ee9@intel.com>
Date: Mon, 6 Oct 2025 09:59:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/34] drm/xe: Don't change LRC ring head on job
 resubmission
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-9-matthew.brost@intel.com>
 <0f7ae66b-1272-4164-9b41-faac00f42f73@intel.com>
 <aOIBTgubs5rRHIvS@lstrano-desk.jf.intel.com>
 <aOIV4E8WqXnGF4AU@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <aOIV4E8WqXnGF4AU@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 05/10/2025 07:53, Matthew Brost wrote:
> On Sat, Oct 04, 2025 at 10:25:34PM -0700, Matthew Brost wrote:
>> On Thu, Oct 02, 2025 at 03:15:13PM +0100, Matthew Auld wrote:
>>> On 02/10/2025 06:53, Matthew Brost wrote:
>>>> Now that we save the job's head during submission, it's no longer
>>>> necessary to adjust the LRC ring head during resubmission. Instead, a
>>>> software-based adjustment of the tail will overwrite the old jobs in
>>>> place. For some odd reason, adjusting the LRC ring head didn't work on
>>>> parallel queues, which was causing issues in our CI.
>>>>
>>>> v6:
>>>>    - Also set LRC tail to head so queue is idle coming out of reset
>>>>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>> Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_guc_submit.c | 10 ++++++++--
>>>>    1 file changed, 8 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>> index 3a534d93505f..70306f902ba5 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>> @@ -2008,11 +2008,17 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
>>>>    	struct xe_gpu_scheduler *sched = &q->guc->sched;
>>>>    	if (!exec_queue_killed_or_banned_or_wedged(q)) {
>>>> +		struct xe_sched_job *job = xe_sched_first_pending_job(sched);
>>>>    		int i;
>>>>    		trace_xe_exec_queue_resubmit(q);
>>>> -		for (i = 0; i < q->width; ++i)
>>>> -			xe_lrc_set_ring_head(q->lrc[i], q->lrc[i]->ring.tail);
>>>> +		if (job) {
>>>> +			for (i = 0; i < q->width; ++i) {
>>>> +				q->lrc[i]->ring.tail = job->ptrs[i].head;
>>>> +				xe_lrc_set_ring_tail(q->lrc[i],
>>>> +						     xe_lrc_ring_head(q->lrc[i]));
>>>
>>> IIRC the sched pending_list stuff can also give back pending jobs that have
>>> completed on the hw, but are still kept pending until the final free_job()?
>>>
>>> Suppose we have a pending_list like:
>>>
>>> [pending/complete, pending/complete, actual pending kernel job that never
>>> completed/ran]
>>>
>>> IIUC the sw ring.tail will actually go backwards to the first pending
>>> free/complete job head in the pending_list, with the hw tail being reset to
>>> the current hw head here. But on the next submit the sw ring.tail is where
>>> the commands are emitted to, and on the next update
>>> of the hw tail it will be synced to the sw ring.tail? But if that happens
>>> won't we get hw tail < hw head (since we used the head of an already
>>> complete job for the sw tail), which will make the hw think there is a
>>> massive ring wrap, so it will execute garbage until it wraps back around to
>>> tail?
>>>
>>
>> Let me tweak this flow to use the skip_emit / last_replay flow
>> introduced later in series to avoid this issue.
>>
> 
> Actually this flow works just fine. The GuC state is completely lost
> during this flow - the context is not even registered. By the time
> contect is registered - the LRC head will be at the original postition
> of the first pending job and LRC tail will be at the end of the first
> job.

Can you share some more info here on the flow? I'm seeing LRC hw head 
being at the correct position, which must have moved past anything 
already completed by the hw, right? But here the sw lrc tail is being 
potentially moved backwards to the head of something already complete 
(the job we pick is pending but only because the free_job() has not run 
yet, so the job has already signalled/ran). Below when we do something 
like xe_sched_resubmit_jobs() the hw tail is then updated to the sw 
tail, but now we end up with hw tail < hw head?

Also the flow I'm thinking about here is forced suspend/resume.

> 
> Matt
> 
>> Matt
>>
>>>> +			}
>>>> +		}
>>>>    		xe_sched_resubmit_jobs(sched);
>>>>    	}
>>>

