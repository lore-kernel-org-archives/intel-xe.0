Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF28C0015E
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jul 2023 10:53:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDFCE10E22F;
	Mon, 17 Jul 2023 10:53:38 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0300910E22F
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jul 2023 10:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689591218; x=1721127218;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=1l6jR/u0lw9Lk6S9SlZfthWrSEEU9LKQLlylNgUW/+4=;
 b=YAsEzkTrLoa4smXifwPauNyu+Y2OGCWmshA0UZQyeL6N7Kc4hIPdYG0m
 uNUhYNUfSl3Yr6xt9svKNM/VgDSoUqbfcQywFOmXhpXC9EaEWQz1B3vDC
 crkX/cAjVyNJ3nSvYmOU5M8ULk7k3lHRaG+T28Icb6FSiXzs73iym1kEe
 unsGl36n9UIw9amiMsDVB7g+xqRWwTuc4xdMOf/gZcOHnAZ3qwJXKcxCa
 suOFNtk27NdFfPWT1OsvxFlSwUHGlOHbEt/SKpxsz959l30jSJf4uQYko
 STjM6g9H2Yg8cdTWrGZ+exWECNiPvvkjfI3URR76XpzCdVGsyka2Ojw+e A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="364774733"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="364774733"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 03:53:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="866706790"
Received: from kprutko-mobl3.ger.corp.intel.com (HELO [10.252.13.224])
 ([10.252.13.224])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 03:53:36 -0700
Message-ID: <fc9c04e1-61d9-0aa8-63a2-b76a5c973af6@intel.com>
Date: Mon, 17 Jul 2023 11:53:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
From: Matthew Auld <matthew.auld@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>
References: <20230713132244.459605-12-matthew.auld@intel.com>
 <20230713132244.459605-13-matthew.auld@intel.com>
 <CY5PR11MB6211EC2CB7C2E4F1F97BB8809534A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <ZLFq/DqDGii2mdVW@intel.com>
Content-Language: en-GB
In-Reply-To: <ZLFq/DqDGii2mdVW@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v13 01/10] drm/xe: fix
 xe_device_mem_access_get() races
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 14/07/2023 16:34, Rodrigo Vivi wrote:
> On Fri, Jul 14, 2023 at 01:04:51PM +0000, Gupta, Anshuman wrote:
>>
>>
>>> -----Original Message-----
>>> From: Auld, Matthew <matthew.auld@intel.com>
>>> Sent: Thursday, July 13, 2023 6:53 PM
>>> To: intel-xe@lists.freedesktop.org
>>> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Thomas Hellström
>>> <thomas.hellstrom@linux.intel.com>; Brost, Matthew
>>> <matthew.brost@intel.com>; Gupta, Anshuman
>>> <anshuman.gupta@intel.com>
>>> Subject: [PATCH v13 01/10] drm/xe: fix xe_device_mem_access_get() races
>>>
>>> It looks like there is at least one race here, given that the
>>> pm_runtime_suspended() check looks to return false if we are in the process
>>> of suspending the device (RPM_SUSPENDING vs RPM_SUSPENDED).  We
>>> later also do xe_pm_runtime_get_if_active(), but since the device is
>>> suspending or has now suspended, this doesn't do anything either.
>>> Following from this we can potentially return from
>>> xe_device_mem_access_get() with the device suspended or about to be,
>>> leading to broken behaviour.
>>>
>>> Attempt to fix this by always grabbing the runtime ref when our internal ref
>>> transitions from 0 -> 1. The hard part is then dealing with the runtime_pm
>>> callbacks also calling xe_device_mem_access_get() and deadlocking, which
>>> the pm_runtime_suspended() check prevented.
>>>
>>> v2:
>>>   - ct->lock looks to be primed with fs_reclaim, so holding that and then
>>>     allocating memory will cause lockdep to complain. Now that we
>>>     unconditionally grab the mem_access.lock around mem_access_{get,put},
>>> we
>>>     need to change the ordering wrt to grabbing the ct->lock, since some of
>>>     the runtime_pm routines can allocate memory (or at least that's what
>>>     lockdep seems to suggest). Hopefully not a big deal.  It might be that
>>>     there were already issues with this, just that the atomics where
>>>     "hiding" the potential issues.
>>> v3:
>>>   - Use Thomas Hellström' idea with tracking the active task that is
>>>     executing in the resume or suspend callback, in order to avoid
>>>     recursive resume/suspend calls deadlocking on itself.
>>>   - Split the ct->lock change.
>>> v4:
>>>   - Add smb_mb() around accessing the pm_callback_task for extra safety.
>>>     (Thomas Hellström)
>>> v5:
>>>   - Clarify the kernel-doc for the mem_access.lock, given that it is quite
>>>     strange in what it protects (data vs code). The real motivation is to
>>>     aid lockdep. (Rodrigo Vivi)
>>> v6:
>>>   - Split out the lock change. We still want this as a lockdep aid but
>>>     only for the xe_device_mem_access_get() path. Sticking a lock on the
>>>     put() looks be a no-go, also the runtime_put() there is always async.
>>>   - Now that the lock is gone move to atomics and rely on the pm code
>>>     serialising multiple callers on the 0 -> 1 transition.
>>>   - g2h_worker_func() looks to be the next issue, given that
>>>     suspend-resume callbacks are using CT, so try to handle that.
>>> v7:
>>>   - Add xe_device_mem_access_get_if_ongoing(), and use it in
>>>     g2h_worker_func().
>>> v8 (Anshuman):
>>>   - Just always grab the rpm, instead of just on the 0 -> 1 transition,
>>>     which is a lot clearer and simplifies the code quite a bit.
>>>
>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/258
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_device.c       | 61 +++++++++++++++++++------
>>>   drivers/gpu/drm/xe/xe_device.h       | 11 +----
>>>   drivers/gpu/drm/xe/xe_device_types.h |  8 +++-
>>>   drivers/gpu/drm/xe/xe_guc_ct.c       | 34 +++++++++++++-
>>>   drivers/gpu/drm/xe/xe_pm.c           | 68 ++++++++++++++++++----------
>>>   drivers/gpu/drm/xe/xe_pm.h           |  2 +-
>>>   6 files changed, 131 insertions(+), 53 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>>> b/drivers/gpu/drm/xe/xe_device.c index 42fedb267454..70f89869b8a6
>>> 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -412,33 +412,66 @@ u32 xe_device_ccs_bytes(struct xe_device *xe,
>>> u64 size)
>>>   		DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0;  }
>>>
>>> +bool xe_device_mem_access_ongoing(struct xe_device *xe) {
>>> +	if (xe_pm_read_callback_task(xe) != NULL)
>>> +		return true;
>>> +
>>> +	return atomic_read(&xe->mem_access.ref); }
>>> +
>>> +void xe_device_assert_mem_access(struct xe_device *xe) {
>>> +	XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
>>> +}
>>> +
>>>   bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe)  {
>>> -	return atomic_inc_not_zero(&xe->mem_access.ref);
>>> +	bool active;
>>> +
>>> +	if (xe_pm_read_callback_task(xe) == current)
>>> +		return true;
>>> +
>>> +	active = xe_pm_runtime_get_if_active(xe);
>>> +	if (active) {
>>> +		int ref = atomic_inc_return(&xe->mem_access.ref);
>>> +
>>> +		XE_WARN_ON(ref == S32_MAX);
>>> +	}
>>> +
>>> +	return active;
>>>   }
>>>
>>>   void xe_device_mem_access_get(struct xe_device *xe)  {
>>> -	bool resumed = xe_pm_runtime_resume_if_suspended(xe);
>>> -	int ref = atomic_inc_return(&xe->mem_access.ref);
>>> +	int ref;
>>>
>>> -	if (ref == 1)
>>> -		xe->mem_access.hold_rpm =
>>> xe_pm_runtime_get_if_active(xe);
>>> +	/*
>>> +	 * This looks racy, but should be fine since the pm_callback_task only
>>> +	 * transitions from NULL -> current (and back to NULL again), during
>>> the
>>> +	 * runtime_resume() or runtime_suspend() callbacks, for which
>>> there can
>>> +	 * only be a single one running for our device. We only need to
>>> prevent
>>> +	 * recursively calling the runtime_get or runtime_put from those
>>> +	 * callbacks, as well as preventing triggering any access_ongoing
>>> +	 * asserts.
>>> +	 */
>>> +	if (xe_pm_read_callback_task(xe) == current)
>>> +		return;
>>>
>>> -	/* The usage counter increased if device was immediately resumed
>>> */
>>> -	if (resumed)
>>> -		xe_pm_runtime_put(xe);
>>> -
>>> -	XE_WARN_ON(ref == S32_MAX);
>>> +	xe_pm_runtime_get(xe);
>>> +	ref = atomic_inc_return(&xe->mem_access.ref);
>>> +	XE_WARN_ON(atomic_read(&xe->mem_access.ref) == S32_MAX);
>>>   }
>>>
>>>   void xe_device_mem_access_put(struct xe_device *xe)  {
>>> -	bool hold = xe->mem_access.hold_rpm;
>>> -	int ref = atomic_dec_return(&xe->mem_access.ref);
>>> +	int ref;
>>>
>>> -	if (!ref && hold)
>>> -		xe_pm_runtime_put(xe);
>>> +	if (xe_pm_read_callback_task(xe) == current)
>>> +		return;
>>> +
>>> +	ref = atomic_dec_return(&xe->mem_access.ref);
>>> +	xe_pm_runtime_put(xe);
>>>
>>>   	XE_WARN_ON(ref < 0);
>>>   }
>>> diff --git a/drivers/gpu/drm/xe/xe_device.h
>>> b/drivers/gpu/drm/xe/xe_device.h index 8e01bbadb149..0ce0351d7d23
>>> 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.h
>>> +++ b/drivers/gpu/drm/xe/xe_device.h
>>> @@ -141,15 +141,8 @@ void xe_device_mem_access_get(struct xe_device
>>> *xe);  bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe);
>>> void xe_device_mem_access_put(struct xe_device *xe);
>>>
>>> -static inline bool xe_device_mem_access_ongoing(struct xe_device *xe) -{
>>> -	return atomic_read(&xe->mem_access.ref);
>>> -}
>>> -
>>> -static inline void xe_device_assert_mem_access(struct xe_device *xe) -{
>>> -	XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
>>> -}
>>> +void xe_device_assert_mem_access(struct xe_device *xe); bool
>>> +xe_device_mem_access_ongoing(struct xe_device *xe);
>>>
>>>   static inline bool xe_device_in_fault_mode(struct xe_device *xe)  { diff --git
>>> a/drivers/gpu/drm/xe/xe_device_types.h
>>> b/drivers/gpu/drm/xe/xe_device_types.h
>>> index 26a8de77138a..dcba8bb8f989 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -343,10 +343,14 @@ struct xe_device {
>>>   	struct {
>>>   		/** @ref: ref count of memory accesses */
>>>   		atomic_t ref;
>>> -		/** @hold_rpm: need to put rpm ref back at the end */
>>> -		bool hold_rpm;
>>>   	} mem_access;
>>>
>>> +	/**
>>> +	 * @pm_callback_task: Track the active task that is running in either
>>> +	 * the runtime_suspend or runtime_resume callbacks.
>>> +	 */
>>> +	struct task_struct *pm_callback_task;
>>> +
>>>   	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
>>>   	bool d3cold_allowed;
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
>>> b/drivers/gpu/drm/xe/xe_guc_ct.c index 9fb5fd4391d2..e7f7f9b1ce1c
>>> 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> @@ -19,6 +19,7 @@
>>>   #include "xe_guc.h"
>>>   #include "xe_guc_submit.h"
>>>   #include "xe_map.h"
>>> +#include "xe_pm.h"
>>>   #include "xe_trace.h"
>>>
>>>   /* Used when a CT send wants to block and / or receive data */ @@ -1091,9
>>> +1092,36 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)  static void
>>> g2h_worker_func(struct work_struct *w)  {
>>>   	struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct,
>>> g2h_worker);
>>> +	bool ongoing;
>>>   	int ret;
>>>
>>> -	xe_device_mem_access_get(ct_to_xe(ct));
>>> +	/*
>>> +	 * Normal users must always hold mem_access.ref around CT calls.
>>> However
>>> +	 * during the runtime pm callbacks we rely on CT to talk to the GuC,
>>> but
>>> +	 * at this stage we can't rely on mem_access.ref and even the
>>> +	 * callback_task will be different than current.  For such cases we just
>>> +	 * need to ensure we always process the responses from any
>>> blocking
>>> +	 * ct_send requests or where we otherwise expect some response
>>> when
>>> +	 * initiated from those callbacks (which will need to wait for the
>>> below
>>> +	 * dequeue_one_g2h()).  The dequeue_one_g2h() will gracefully fail
>>> if
>>> +	 * the device has suspended to the point that the CT communication
>>> has
>>> +	 * been disabled.
>>> +	 *
>>> +	 * If we are inside the runtime pm callback, we can be the only task
>>> +	 * still issuing CT requests (since that requires having the
>>> +	 * mem_access.ref).  It seems like it might in theory be possible to
>>> +	 * receive unsolicited events from the GuC just as we are
>>> +	 * suspending-resuming, but those will currently anyway be lost
>>> when
>>> +	 * eventually exiting from suspend, hence no need to wake up the
>>> device
>>> +	 * here. If we ever need something stronger than get_if_ongoing()
>>> then
>>> +	 * we need to be careful with blocking the pm callbacks from getting
>>> CT
>>> +	 * responses, if the worker here is blocked on those callbacks
>>> +	 * completing, creating a deadlock.
>>> +	 */
>>> +	ongoing = xe_device_mem_access_get_if_ongoing(ct_to_xe(ct));
>>> +	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)
>>> +		return;
>> Patch looks good tome me from runtime PM pov but i am not familiar with GuC CT flow,
>> I cannot provide RB specially for above code.
>> For runtime PM perspective.
>> Acked-by: Anshuman Gupta <anshuman.gupta@intel.com>

Thanks Anshuman.

> 
> My only take on this guc ct flow is that we should add a debug(warning?) msg
> in case we are skipping because !ongoing...

I suppose we could have some kind of debug print? Note that even with 
the existing full rpm get sync here the actual g2h read will still miss 
the actual event if the device is about to suspend AFAICT, since rpm get 
sync needs to wait for SUSPENDING -> SUSPEND and on actual GT suspend 
the CTB descriptors are reset so the g2h read won't see the event 
anyway. So I think if_active makes more sense here? I'm not sure if the 
CT disable path needs something extra to somehow ensure we don't miss 
such events.

Also just realised I missed adjusting the CT fast-path. Need to respin.

> 
> But this can be in a follow up.
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thanks.

> 
>> Regards,
>> Anshuman Gupta.
>>> +
>>>   	do {
>>>   		mutex_lock(&ct->lock);
>>>   		ret = dequeue_one_g2h(ct);
>>> @@ -1107,7 +1135,9 @@ static void g2h_worker_func(struct work_struct
>>> *w)
>>>   			kick_reset(ct);
>>>   		}
>>>   	} while (ret == 1);
>>> -	xe_device_mem_access_put(ct_to_xe(ct));
>>> +
>>> +	if (ongoing)
>>> +		xe_device_mem_access_put(ct_to_xe(ct));
>>>   }
>>>
>>>   static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb
>>> *ctb, diff --git a/drivers/gpu/drm/xe/xe_pm.c
>>> b/drivers/gpu/drm/xe/xe_pm.c index c7901f379aee..fe99820db2df 100644
>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>> @@ -137,43 +137,71 @@ void xe_pm_runtime_fini(struct xe_device *xe)
>>>   	pm_runtime_forbid(dev);
>>>   }
>>>
>>> +static void xe_pm_write_callback_task(struct xe_device *xe,
>>> +				      struct task_struct *task)
>>> +{
>>> +	WRITE_ONCE(xe->pm_callback_task, task);
>>> +
>>> +	/*
>>> +	 * Just in case it's somehow possible for our writes to be reordered to
>>> +	 * the extent that something else re-uses the task written in
>>> +	 * pm_callback_task. For example after returning from the callback,
>>> but
>>> +	 * before the reordered write that resets pm_callback_task back to
>>> NULL.
>>> +	 */
>>> +	smp_mb(); /* pairs with xe_pm_read_callback_task */ }
>>> +
>>> +struct task_struct *xe_pm_read_callback_task(struct xe_device *xe) {
>>> +	smp_mb(); /* pairs with xe_pm_write_callback_task */
>>> +
>>> +	return READ_ONCE(xe->pm_callback_task); }
>>> +
>>>   int xe_pm_runtime_suspend(struct xe_device *xe)  {
>>>   	struct xe_gt *gt;
>>>   	u8 id;
>>> -	int err;
>>> +	int err = 0;
>>> +
>>> +	if (xe->d3cold_allowed && xe_device_mem_access_ongoing(xe))
>>> +		return -EBUSY;
>>> +
>>> +	/* Disable access_ongoing asserts and prevent recursive pm calls */
>>> +	xe_pm_write_callback_task(xe, current);
>>>
>>>   	if (xe->d3cold_allowed) {
>>> -		if (xe_device_mem_access_ongoing(xe))
>>> -			return -EBUSY;
>>> -
>>>   		err = xe_bo_evict_all(xe);
>>>   		if (err)
>>> -			return err;
>>> +			goto out;
>>>   	}
>>>
>>>   	for_each_gt(gt, xe, id) {
>>>   		err = xe_gt_suspend(gt);
>>>   		if (err)
>>> -			return err;
>>> +			goto out;
>>>   	}
>>>
>>>   	xe_irq_suspend(xe);
>>> -
>>> -	return 0;
>>> +out:
>>> +	xe_pm_write_callback_task(xe, NULL);
>>> +	return err;
>>>   }
>>>
>>>   int xe_pm_runtime_resume(struct xe_device *xe)  {
>>>   	struct xe_gt *gt;
>>>   	u8 id;
>>> -	int err;
>>> +	int err = 0;
>>> +
>>> +	/* Disable access_ongoing asserts and prevent recursive pm calls */
>>> +	xe_pm_write_callback_task(xe, current);
>>>
>>>   	if (xe->d3cold_allowed) {
>>>   		for_each_gt(gt, xe, id) {
>>>   			err = xe_pcode_init(gt);
>>>   			if (err)
>>> -				return err;
>>> +				goto out;
>>>   		}
>>>
>>>   		/*
>>> @@ -182,7 +210,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>>   		 */
>>>   		err = xe_bo_restore_kernel(xe);
>>>   		if (err)
>>> -			return err;
>>> +			goto out;
>>>   	}
>>>
>>>   	xe_irq_resume(xe);
>>> @@ -193,10 +221,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>>   	if (xe->d3cold_allowed) {
>>>   		err = xe_bo_restore_user(xe);
>>>   		if (err)
>>> -			return err;
>>> +			goto out;
>>>   	}
>>> -
>>> -	return 0;
>>> +out:
>>> +	xe_pm_write_callback_task(xe, NULL);
>>> +	return err;
>>>   }
>>>
>>>   int xe_pm_runtime_get(struct xe_device *xe) @@ -210,19 +239,8 @@ int
>>> xe_pm_runtime_put(struct xe_device *xe)
>>>   	return pm_runtime_put_autosuspend(xe->drm.dev);
>>>   }
>>>
>>> -/* Return true if resume operation happened and usage count was
>>> increased */ -bool xe_pm_runtime_resume_if_suspended(struct xe_device
>>> *xe) -{
>>> -	/* In case we are suspended we need to immediately wake up */
>>> -	if (pm_runtime_suspended(xe->drm.dev))
>>> -		return !pm_runtime_resume_and_get(xe->drm.dev);
>>> -
>>> -	return false;
>>> -}
>>> -
>>>   int xe_pm_runtime_get_if_active(struct xe_device *xe)  {
>>> -	WARN_ON(pm_runtime_suspended(xe->drm.dev));
>>>   	return pm_runtime_get_if_active(xe->drm.dev, true);  }
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
>>> index 8418ee6faac5..da05556d9a6e 100644
>>> --- a/drivers/gpu/drm/xe/xe_pm.h
>>> +++ b/drivers/gpu/drm/xe/xe_pm.h
>>> @@ -19,8 +19,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe);  int
>>> xe_pm_runtime_resume(struct xe_device *xe);  int
>>> xe_pm_runtime_get(struct xe_device *xe);  int xe_pm_runtime_put(struct
>>> xe_device *xe); -bool xe_pm_runtime_resume_if_suspended(struct
>>> xe_device *xe);  int xe_pm_runtime_get_if_active(struct xe_device *xe);
>>> void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
>>> +struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
>>>
>>>   #endif
>>> --
>>> 2.41.0
>>
