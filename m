Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C38CF34A9
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 15:10:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C286710E87A;
	Thu,  3 Oct 2024 15:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="crvCVqy9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD3C910E87A
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Oct 2024 15:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727968209; x=1759504209;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UU7LUfdOLd3/W+I0WCBJGiPrOYek/nwCsLWBetr+zvw=;
 b=crvCVqy9Bfte/rbsJntMXlI6/DntebrIqYvZFrpmSwv993hNc8EuSBnG
 57/XacZ3OSKjOpM0Pz3oFx0voSWxfG++Wqt8ot0kPKSb3WP45JQ3Gd1ih
 TjZnn7A3IogHKIyp9hH+hhtujJVu4tCAr+HVuIPS8fc43I0puEilaKGIf
 WsKUFqEhpOSlcN+g2Fwym4nDaSkpnJnsu8yr/QiB/ag/qzd2rCo+xN12Z
 jqxmAYevHvp4L4kJMjJDpw7pEwF8zCGhk9oEfu9b72vrAQY3ggZzcs9/b
 ptYe3NLdlGh4H5gyLMghhpm6yJLqWujl9GJSrR3rLuWKPPYPbkGGcorWy Q==;
X-CSE-ConnectionGUID: ZInLH3oLRZq3ITE3V4Mplg==
X-CSE-MsgGUID: Btq0rAqETRS431/5G4ZzMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="30043640"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="30043640"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 08:10:09 -0700
X-CSE-ConnectionGUID: E8Nfb1sZSeCkKrcnuVA96A==
X-CSE-MsgGUID: K1chnbvHTWio1LITFSIaKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="78792307"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.147])
 ([10.245.244.147])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 08:10:07 -0700
Message-ID: <6ce0a268-db69-4f40-9477-cc5b781c119b@intel.com>
Date: Thu, 3 Oct 2024 16:10:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Don't free job in TDR
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, paulo.r.zanoni@intel.com
References: <20241003001657.3517883-1-matthew.brost@intel.com>
 <20241003001657.3517883-3-matthew.brost@intel.com>
 <45633fc3-b1d8-4a64-b8db-0fda93ca79a5@intel.com>
 <Zv6ksODQwzVvfOw3@DUT025-TGLU.fm.intel.com>
 <abf18240-7105-491a-962b-3db2d84dc897@intel.com>
 <Zv6sE5PJYwkB8k+A@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <Zv6sE5PJYwkB8k+A@DUT025-TGLU.fm.intel.com>
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

On 03/10/2024 15:37, Matthew Brost wrote:
> On Thu, Oct 03, 2024 at 03:15:02PM +0100, Matthew Auld wrote:
>> On 03/10/2024 15:05, Matthew Brost wrote:
>>> On Thu, Oct 03, 2024 at 08:06:24AM +0100, Matthew Auld wrote:
>>>> On 03/10/2024 01:16, Matthew Brost wrote:
>>>>> Freeing job in TDR is not safe as TDR can pass the run_job thread
>>>>> resulting in UAF. It is only safe for free job to naturally be called by
>>>>> the scheduler. Rather free job in TDR, add to pending list.
>>>>
>>>> s/Rather free/Rather than free/
>>>> ?
>>>>
>>>
>>> Yes, will fix.
>>>
>>>>>
>>>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2811
>>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>>> Fixes: e275d61c5f3f ("drm/xe/guc: Handle timing out of signaled jobs gracefully")
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>
>>>> I think we still have the other issue with fence signalling in run_job.
>>>>
>>>
>>> I think this actually ok given free_job as owns a ref to job->fence and
>>> free_job now must run after run_job - that is why I didn't include this
>>> change in this patch. But I also agree a better design would be move the
>>> dma_fence_get from run_job to arm - I will do that in a follow up.
>>
>> Here I mean the race in run_job() itself, before we hand over the fence to
>> the scheduler. i.e do the dma_fence_get() before the submission part like
>> in: https://patchwork.freedesktop.org/patch/615249/?series=138921&rev=1.
>>
> 
> Yes, we ae talking about the same thing. I think this as is safe because
> in run_job we know at least 1 ref is still held by free_job which cannot
> be run until after run_job completes.

I don't see who else is holding a fence ref when we reach 
queue_run_job() for the first time other than dma_fence_init() and that 
pairs with the signaller side AFAICT, but maybe I'm blind.

Anyway, I agree we don't need to fix in this patch since it looks like a 
different issue.

> 
> Your patch is similar to what I suggest, but I think the cleanest
> implementation of this is move the dma_fence_get from run_job to
> xe_sched_job_arm which I'd like to do in a follow up.

Yup agree, that looked cleaner.

> 
> Matt
> 
>>>
>>> Matt
>>>
>>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>>>
>>>>> ---
>>>>>     drivers/gpu/drm/xe/xe_guc_submit.c | 7 +++++--
>>>>>     1 file changed, 5 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> index 80062e1d3f66..9ecd1661c1b5 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> @@ -1106,10 +1106,13 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>>>>     	/*
>>>>>     	 * TDR has fired before free job worker. Common if exec queue
>>>>> -	 * immediately closed after last fence signaled.
>>>>> +	 * immediately closed after last fence signaled. Add back to pending
>>>>> +	 * list so job can be freed and kick scheduler ensuring free job is not
>>>>> +	 * lost.
>>>>>     	 */
>>>>>     	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
>>>>> -		guc_exec_queue_free_job(drm_job);
>>>>> +		xe_sched_add_pending_job(sched, job);
>>>>> +		xe_sched_submission_start(sched);
>>>>>     		return DRM_GPU_SCHED_STAT_NOMINAL;
>>>>>     	}
