Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49348C46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 18:40:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E834610E469;
	Tue,  9 Jan 2024 18:40:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2155510E469
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 18:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704825630; x=1736361630;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vNeirqIoQ4ZPqPIrCi/wv6uo7fywur0I2eVWUuQBIHI=;
 b=TaJLl9elOv587YmcYOPCpIZ8XFth8M6s5ayoESnsyp4QmsRTwggWu7q3
 pbK0J3xVXV4YL7+LFCPg+BTlrhX1cBBis8hI3e0iBImyykdy7d/hbdgHw
 If+Vl/7MnDuXGv4Brvc08JMIw0IGOgHb1TuCzJWhW0agHhMqZCs4vEuiF
 PMJqXfOuuHlb5g2i45UPc8Tu7HFE7dU/A+G6xOJdfvIhL8mabgHLuxYKu
 tI56ct2PTzzNmE0f9sngA2ME9GV4TTZKY/ubMgvOE8dpptGlY/23smeLf
 rfdPVETj7KiCgbKuUJCUSc5E/wXSrgFIACm7e++YoNUwd9KaK3bElXfXV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="402077728"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="402077728"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 10:40:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="955094278"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="955094278"
Received: from hmanning-mobl.ger.corp.intel.com (HELO [10.252.14.148])
 ([10.252.14.148])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 10:40:28 -0800
Message-ID: <55d3d461-908f-4787-8b38-0e36aa7cf7d9@intel.com>
Date: Tue, 9 Jan 2024 18:40:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 08/20] drm/xe: Runtime PM wake on every exec
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
 <20231228021232.2366249-9-rodrigo.vivi@intel.com>
 <11d0bf86-c011-4761-895f-8cce0a7e071c@intel.com> <ZZ2FYVEN1xzDQMVm@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZZ2FYVEN1xzDQMVm@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 09/01/2024 17:41, Rodrigo Vivi wrote:
> On Tue, Jan 09, 2024 at 11:24:34AM +0000, Matthew Auld wrote:
>> On 28/12/2023 02:12, Rodrigo Vivi wrote:
>>> Let's ensure our PCI device is awaken on every GT execution to
>>> the end of the execution.
>>> Let's increase the runtime_pm protection and start moving
>>> that to the outer bounds.
>>>
>>> Let's also remove the unnecessary mem_access get/put.
>>>
>>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_sched_job.c | 10 +++++-----
>>>    1 file changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
>>> index 01106a1156ad8..0b30ec77fc5ad 100644
>>> --- a/drivers/gpu/drm/xe/xe_sched_job.c
>>> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
>>> @@ -15,6 +15,7 @@
>>>    #include "xe_hw_fence.h"
>>>    #include "xe_lrc.h"
>>>    #include "xe_macros.h"
>>> +#include "xe_pm.h"
>>>    #include "xe_trace.h"
>>>    #include "xe_vm.h"
>>> @@ -67,6 +68,8 @@ static void job_free(struct xe_sched_job *job)
>>>    	struct xe_exec_queue *q = job->q;
>>>    	bool is_migration = xe_sched_job_is_migration(q);
>>> +	xe_pm_runtime_put(gt_to_xe(q->gt));
>>> +
>>>    	kmem_cache_free(xe_exec_queue_is_parallel(job->q) || is_migration ?
>>>    			xe_sched_job_parallel_slab : xe_sched_job_slab, job);
>>>    }
>>> @@ -86,6 +89,8 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>>>    	int i, j;
>>>    	u32 width;
>>> +	xe_pm_runtime_get(gt_to_xe(q->gt));
>>> +
>>
>> This seems way too deep in the call chain. If this actually wakes up the
>> device we will end up with all of the same d3cold deadlock issues. Like here
>> we are for sure holding stuff like dma-resv, but the rpm callbacks also want
>> to grab it. IMO this needs to be something like runtime_get_if_active(),
>> with the upper layers already ensuring device is awake (like ioctl), so here
>> we are just keeping it awake until the job is done. Or maybe this is how it
>> is by the end of the series?
> 
> we have 2 cases here, one that it is already awake by the ioctl and the
> other that is on the eviction preparation and that exit because of the
> 'current' task. So we should be good anyways, but you are right, maybe
> using the get_if_active is better here for clarity.

Yeah, looking at the code it is hard to know if the rpm get can actually 
wake up the device or not, or if waking up only happens in some tricky 
edge case or 1/1000 runs. That is also what is nice about the lockdep 
annotations, since we just assume that all rpm get calls can potentially 
wake the device up and lockdep knows exactly what locks are being held, 
and then so long as we have annotations in the rpm resume/suspend 
callback we can be reasonably sure we have no deadlocks, since it is 
just a question of code coverage, rather then actually needing to hit 
the 0 -> 1 transition for every caller on a real system in CI, which is 
kind of hard.

> 
>>
>>>    	/* only a kernel context can submit a vm-less job */
>>>    	XE_WARN_ON(!q->vm && !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
>>> @@ -155,9 +160,6 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>>>    	for (i = 0; i < width; ++i)
>>>    		job->batch_addr[i] = batch_addr[i];
>>> -	/* All other jobs require a VM to be open which has a ref */
>>> -	if (unlikely(q->flags & EXEC_QUEUE_FLAG_KERNEL))
>>> -		xe_device_mem_access_get(job_to_xe(job));
>>>    	xe_device_assert_mem_access(job_to_xe(job));
>>>    	trace_xe_sched_job_create(job);
>>> @@ -189,8 +191,6 @@ void xe_sched_job_destroy(struct kref *ref)
>>>    	struct xe_sched_job *job =
>>>    		container_of(ref, struct xe_sched_job, refcount);
>>> -	if (unlikely(job->q->flags & EXEC_QUEUE_FLAG_KERNEL))
>>> -		xe_device_mem_access_put(job_to_xe(job));
>>>    	xe_exec_queue_put(job->q);
>>>    	dma_fence_put(job->fence);
>>>    	drm_sched_job_cleanup(&job->drm);
