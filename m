Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98711D59D82
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 18:41:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D6210E14D;
	Fri, 12 Dec 2025 18:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NRT6y3ei";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2770210E14D
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 18:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765564902; x=1797100902;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TfR+Kyge+ZB4QO48m/SaOn4ozhtQ+hCiscZGiWiD3Oc=;
 b=NRT6y3eiAslU9tMowth3YrJWtVoE5a+QxQ9+nZeLOHu2G5vFT4HgBlsa
 I02jo3nJ68Q4B+I47N3fu0TV7vHnTcdct1HVOE0ci+LXnl7FSyrZAwHIS
 Wj23MbPXiT0wbjsz4KQ6aTrLxWUM8Rdqtk1vf7fhqCFI+FHQpIDGdM3TC
 c0Aqa0e7qwxYF91E5GOAXA2ESX2uNBtGRNcDIjY3Pm0VAzZBZuCS1d1pp
 WAzGYJsE2w1YMPEFmZJpmg7EpHPs3m4P74RcS13xUTk7VpdiADHNqBc+u
 ajtK5L+cEyOwtEnGp61X5/pVKcOXH7ov0aJc7upU9q0DlIF4a2oGZyYwA g==;
X-CSE-ConnectionGUID: mQY5uT6LQkS0bvVBtvGnHw==
X-CSE-MsgGUID: 9HZYYPqtSqW881K5rhNXpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67456321"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="67456321"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 10:41:40 -0800
X-CSE-ConnectionGUID: NGAHCTlQQb6VjHUgCjM8+g==
X-CSE-MsgGUID: KKKKDKiUTF+xxbZbEh/alw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="197218733"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.106])
 ([10.245.245.106])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 10:41:39 -0800
Message-ID: <94cda006-0fc4-40e9-a34c-5c16ea7b1c58@linux.intel.com>
Date: Fri, 12 Dec 2025 19:41:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/xe: Wait on in-syncs when swicthing to dma-fence
 mode
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, francois.dugast@intel.com,
 michal.mrozek@intel.com
References: <20251211210032.1520113-1-matthew.brost@intel.com>
 <20251211210032.1520113-6-matthew.brost@intel.com>
 <97f524d334045e0819cee861e6e7d21598509424.camel@linux.intel.com>
 <aTxDwLgkmycUKk+S@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <aTxDwLgkmycUKk+S@lstrano-desk.jf.intel.com>
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


On 12/12/25 17:33, Matthew Brost wrote:
> On Fri, Dec 12, 2025 at 10:22:54AM +0100, Thomas Hellström wrote:
>> On Thu, 2025-12-11 at 13:00 -0800, Matthew Brost wrote:
>>> If a dma-fence submission has in-fences and pagefault queues are
>>> running
>>> work, there is little incentive to kick the pagefault queues off the
>>> hardware until the dma-fence submission is ready to run. Therefore,
>>> wait
>>> on the in-fences of the dma-fence submission before removing the
>>> pagefault queues from the hardware.
>>>
>>> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_exec.c            |  3 ++-
>>>   drivers/gpu/drm/xe/xe_hw_engine_group.c | 34 +++++++++++++++++++----
>>> --
>>>   drivers/gpu/drm/xe/xe_hw_engine_group.h |  4 ++-
>>>   drivers/gpu/drm/xe/xe_sync.c            | 14 ++++++++++
>>>   drivers/gpu/drm/xe/xe_sync.h            |  1 +
>>>   5 files changed, 46 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_exec.c
>>> b/drivers/gpu/drm/xe/xe_exec.c
>>> index 4d81210e41f5..5bc598ba6afa 100644
>>> --- a/drivers/gpu/drm/xe/xe_exec.c
>>> +++ b/drivers/gpu/drm/xe/xe_exec.c
>>> @@ -202,7 +202,8 @@ int xe_exec_ioctl(struct drm_device *dev, void
>>> *data, struct drm_file *file)
>>>   	mode = xe_hw_engine_group_find_exec_mode(q);
>>>   
>>>   	if (mode == EXEC_MODE_DMA_FENCE) {
>>> -		err = xe_hw_engine_group_get_mode(group, mode,
>>> &previous_mode);
>>> +		err = xe_hw_engine_group_get_mode(group, mode,
>>> &previous_mode,
>>> +						  syncs, num_syncs);
>>>   		if (err)
>>>   			goto err_syncs;
>>>   	}
>>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c
>>> b/drivers/gpu/drm/xe/xe_hw_engine_group.c
>>> index 4d9263a1a208..35966889c776 100644
>>> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
>>> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
>>> @@ -11,6 +11,7 @@
>>>   #include "xe_gt.h"
>>>   #include "xe_gt_stats.h"
>>>   #include "xe_hw_engine_group.h"
>>> +#include "xe_sync.h"
>>>   #include "xe_vm.h"
>>>   
>>>   static void
>>> @@ -21,7 +22,8 @@ hw_engine_group_resume_lr_jobs_func(struct
>>> work_struct *w)
>>>   	int err;
>>>   	enum xe_hw_engine_group_execution_mode previous_mode;
>>>   
>>> -	err = xe_hw_engine_group_get_mode(group, EXEC_MODE_LR,
>>> &previous_mode);
>>> +	err = xe_hw_engine_group_get_mode(group, EXEC_MODE_LR,
>>> &previous_mode,
>>> +					  NULL, 0);
>>>   	if (err)
>>>   		return;
>>>   
>>> @@ -192,20 +194,32 @@ void
>>> xe_hw_engine_group_resume_faulting_lr_jobs(struct xe_hw_engine_group
>>> *group
>>>    *
>>>    * Return: 0 on success, negative error code on error.
>>>    */
>>> -static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct
>>> xe_hw_engine_group *group)
>>> +static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct
>>> xe_hw_engine_group *group,
>>> +						       struct
>>> xe_sync_entry *syncs,
>>> +						       int
>>> num_syncs)
>>>   {
>>> -	int err;
>>> +	int err, i;
>>>   	struct xe_exec_queue *q;
>>>   	bool need_resume = false;
>>>   
>>>   	lockdep_assert_held_write(&group->mode_sem);
>>>   
>>>   	list_for_each_entry(q, &group->exec_queue_list,
>>> hw_engine_group_link) {
>>> +		bool idle_skip_suspend;
>>> +
>>>   		if (!xe_vm_in_fault_mode(q->vm))
>>>   			continue;
>>>   
>>>   		xe_gt_stats_incr(q->gt,
>>> XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT, 1);
>>> -		need_resume |= !xe_exec_queue_idle_skip_suspend(q);
>>> +
>>> +		idle_skip_suspend =
>>> xe_exec_queue_idle_skip_suspend(q);
>>> +
>>> +		if (!need_resume && !idle_skip_suspend && num_syncs)
>>> {
>>> +			for (i = 0; i < num_syncs; ++i)
>>> +				xe_sync_entry_wait(syncs + i);
>> Here we're in the write-locked mode, right? Ideally I think we should
>> just check for idle here and return a retry if not idle, and wait
>> outside of the locks. Perhaps also always wait if there are pf jobs
> I think waiting outside the lock would be okay. Let me try that. I also
> forgot that xe_sync_entry_wait needs to be interruptible too.
>
>> running on the engine group. Also we might want to include the other
>> implicit dependencies as well, like kernel fences.
>>
>> Although perhaps this is good enough for now, and this would be easier
>> implemented with a scheduler?
>>
This is pretty much exactly what I had in mind as well. I started to 
doubt, though, if the drm scheduler would be a good fit since the 
dma-fence jobs wouldn't necessarily be ordered, since they wouldn't have 
published their out-fences when in this "pre-scheduler". Also Joonas has 
mentioned at one point that pre-scheduling (like we already do, but this 
would be a more sophisticated version of) was disapproved by some arch 
or perhaps upstream decision at some historical point. We should find 
out exactly what that was all about before proceeding with this.

> This is a fairly large rework, and the likelihood of me personally
> having the bandwidth to implement this in the near future is low. Of
> course, if you want to take this on, I can provide guidance on the
> refactor.

My bandwidth for this is also zero ATM and up to end of January at least.

> So for now, let’s tweak things to something we can live with and perhaps
> write down plans for a long-term refactor.

Fully agree.

I think our backlog of nice cleanups and improvements like this is 
starting to grow so it would be good to have them documented in jiras 
and perhaps at a list which we can prioritze and have someone pick up 
when there is bandwidth.

Thanks,

Thomas



>
> Matt
>
>> /Thomas
>>
>>
>>> +		}
>>> +
>>> +		need_resume |= !idle_skip_suspend;
>>>   		q->ops->suspend(q);
>>>   	}
>>>   
>>> @@ -258,7 +272,8 @@ static int
>>> xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
>>>   	return 0;
>>>   }
>>>   
>>> -static int switch_mode(struct xe_hw_engine_group *group)
>>> +static int switch_mode(struct xe_hw_engine_group *group,
>>> +		       struct xe_sync_entry *syncs, int num_syncs)
>>>   {
>>>   	int err = 0;
>>>   	enum xe_hw_engine_group_execution_mode new_mode;
>>> @@ -268,7 +283,9 @@ static int switch_mode(struct xe_hw_engine_group
>>> *group)
>>>   	switch (group->cur_mode) {
>>>   	case EXEC_MODE_LR:
>>>   		new_mode = EXEC_MODE_DMA_FENCE;
>>> -		err =
>>> xe_hw_engine_group_suspend_faulting_lr_jobs(group);
>>> +		err =
>>> xe_hw_engine_group_suspend_faulting_lr_jobs(group,
>>> +								
>>> syncs,
>>> +								
>>> num_syncs);
>>>   		break;
>>>   	case EXEC_MODE_DMA_FENCE:
>>>   		new_mode = EXEC_MODE_LR;
>>> @@ -294,7 +311,8 @@ static int switch_mode(struct xe_hw_engine_group
>>> *group)
>>>    */
>>>   int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
>>>   				enum
>>> xe_hw_engine_group_execution_mode new_mode,
>>> -				enum
>>> xe_hw_engine_group_execution_mode *previous_mode)
>>> +				enum
>>> xe_hw_engine_group_execution_mode *previous_mode,
>>> +				struct xe_sync_entry *syncs, int
>>> num_syncs)
>>>   __acquires(&group->mode_sem)
>>>   {
>>>   	int err = down_read_interruptible(&group->mode_sem);
>>> @@ -311,7 +329,7 @@ __acquires(&group->mode_sem)
>>>   			return err;
>>>   
>>>   		if (new_mode != group->cur_mode) {
>>> -			err = switch_mode(group);
>>> +			err = switch_mode(group, syncs, num_syncs);
>>>   			if (err) {
>>>   				up_write(&group->mode_sem);
>>>   				return err;
>>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h
>>> b/drivers/gpu/drm/xe/xe_hw_engine_group.h
>>> index 797ee81acbf2..8b17ccd30b70 100644
>>> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.h
>>> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
>>> @@ -11,6 +11,7 @@
>>>   struct drm_device;
>>>   struct xe_exec_queue;
>>>   struct xe_gt;
>>> +struct xe_sync_entry;
>>>   
>>>   int xe_hw_engine_setup_groups(struct xe_gt *gt);
>>>   
>>> @@ -19,7 +20,8 @@ void xe_hw_engine_group_del_exec_queue(struct
>>> xe_hw_engine_group *group, struct
>>>   
>>>   int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
>>>   				enum
>>> xe_hw_engine_group_execution_mode new_mode,
>>> -				enum
>>> xe_hw_engine_group_execution_mode *previous_mode);
>>> +				enum
>>> xe_hw_engine_group_execution_mode *previous_mode,
>>> +				struct xe_sync_entry *syncs, int
>>> num_syncs);
>>>   void xe_hw_engine_group_put(struct xe_hw_engine_group *group);
>>>   
>>>   enum xe_hw_engine_group_execution_mode
>>> diff --git a/drivers/gpu/drm/xe/xe_sync.c
>>> b/drivers/gpu/drm/xe/xe_sync.c
>>> index 1fc4fa278b78..127e26129933 100644
>>> --- a/drivers/gpu/drm/xe/xe_sync.c
>>> +++ b/drivers/gpu/drm/xe/xe_sync.c
>>> @@ -228,6 +228,20 @@ int xe_sync_entry_add_deps(struct xe_sync_entry
>>> *sync, struct xe_sched_job *job)
>>>   	return 0;
>>>   }
>>>   
>>> +/**
>>> + * xe_sync_entry_wait() - Wait on in-sync
>>> + * @sync: Sync object
>>> + *
>>> + * If the sync is in an in-sync, wait on the sync to signal.
>>> + */
>>> +void xe_sync_entry_wait(struct xe_sync_entry *sync)
>>> +{
>>> +	if (sync->flags & DRM_XE_SYNC_FLAG_SIGNAL)
>>> +		return;
>>> +
>>> +	dma_fence_wait(sync->fence, false);
>>> +}
>>> +
>>>   void xe_sync_entry_signal(struct xe_sync_entry *sync, struct
>>> dma_fence *fence)
>>>   {
>>>   	if (!(sync->flags & DRM_XE_SYNC_FLAG_SIGNAL))
>>> diff --git a/drivers/gpu/drm/xe/xe_sync.h
>>> b/drivers/gpu/drm/xe/xe_sync.h
>>> index 51f2d803e977..1c08f9ed9001 100644
>>> --- a/drivers/gpu/drm/xe/xe_sync.h
>>> +++ b/drivers/gpu/drm/xe/xe_sync.h
>>> @@ -29,6 +29,7 @@ int xe_sync_entry_add_deps(struct xe_sync_entry
>>> *sync,
>>>   			   struct xe_sched_job *job);
>>>   void xe_sync_entry_signal(struct xe_sync_entry *sync,
>>>   			  struct dma_fence *fence);
>>> +void xe_sync_entry_wait(struct xe_sync_entry *sync);
>>>   void xe_sync_entry_cleanup(struct xe_sync_entry *sync);
>>>   struct dma_fence *
>>>   xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
