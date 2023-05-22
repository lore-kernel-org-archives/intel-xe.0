Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6AFC7EE26
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 09:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F1810E297;
	Mon, 22 May 2023 09:49:51 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E77F10E297
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 09:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684748990; x=1716284990;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Q5lxuKiGNvJse4xsNPIe7eCja/YoR4I3ldal0/axxeY=;
 b=f3Rr5ks9pAOOjZmsZyN6SvIlfUXV8lqpuDS8npf9DiDBXBIMD+UupUAU
 LCcSZXwaly6s8Rq5pAHLU79Xp4vOnlXD+2SOo1RjFKMc9Ym+PBMCuIG2W
 ybWnYpwM81BwbibzbUdQFK2SLk2lbv/ir/a2cfrWY0MzfhD3JWGJNn5GX
 PHknOfRll1ihjR5Nimdu+wj4L6jHk/P1BAI8Iv6ad+aW+NUgsLnmL0+TO
 vSnJe5lAuKv9I3IBMjWAE/Z8+S8y6s3T20UloWkfKs0ET9pwiGA3r6fn3
 l/mIPcsy8/A7FB3vsIBkogo7oBmc0HfjPL/+bERo469XpBIukmUaSCr9b A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="381099860"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="381099860"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 02:49:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="768448386"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="768448386"
Received: from amigon-mobl.ger.corp.intel.com (HELO [10.249.128.230])
 ([10.249.128.230])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 02:49:47 -0700
Message-ID: <aad18624-b2e2-1fb5-d2d4-4c0e20ce28c7@intel.com>
Date: Mon, 22 May 2023 10:49:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
References: <20230517152244.348171-1-matthew.auld@intel.com>
 <20230517152244.348171-6-matthew.auld@intel.com>
 <ZGfbVBPvlTBKTTWa@rdvivi-mobl4>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZGfbVBPvlTBKTTWa@rdvivi-mobl4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v5 6/7] drm/xe: fix
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 19/05/2023 21:25, Rodrigo Vivi wrote:
> On Wed, May 17, 2023 at 04:22:43PM +0100, Matthew Auld wrote:
>> It looks like there is at least one race here, given that the
>> pm_runtime_suspended() check looks to return false if we are in the
>> process of suspending the device (RPM_SUSPENDING vs RPM_SUSPENDED).  We
>> later also do xe_pm_runtime_get_if_active(), but since the device is
>> suspending or has now suspended, this doesn't do anything either.
>> Following from this we can potentially return from
>> xe_device_mem_access_get() with the device suspended or about to be,
>> leading to broken behaviour.
>>
>> Attempt to fix this by always grabbing the runtime ref when our
>> internal ref transitions from 0 -> 1, and then wrap the whole thing with
>> a lock to ensure callers are serialized.
>>
>> v2:
>>   - ct->lock looks to be primed with fs_reclaim, so holding that and then
>>     allocating memory will cause lockdep to complain. Now that we
>>     unconditionally grab the mem_access.lock around mem_access_{get,put}, we
>>     need to change the ordering wrt to grabbing the ct->lock, since some of
>>     the runtime_pm routines can allocate memory (or at least that's what
>>     lockdep seems to suggest). Hopefully not a big deal.  It might be that
>>     there were already issues with this, just that the atomics where
>>     "hiding" the potential issues.
>> v3:
>>   - Use Thomas Hellström' idea with tracking the active task that is
>>     executing in the resume or suspend callback, in order to avoid
>>     recursive resume/suspend calls deadlocking on itself.
>>   - Split the ct->lock change.
> 
> The task == current is a very neat solution for this indeed! \o/
> 
>> v4:
>>   - Add smb_mb() around accessing the pm_callback_task for extra safety
>>     (Thomas Hellström)
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/258
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c       | 52 +++++++++++++++++++---
>>   drivers/gpu/drm/xe/xe_device.h       | 17 +------
>>   drivers/gpu/drm/xe/xe_device_types.h | 11 ++++-
>>   drivers/gpu/drm/xe/xe_pm.c           | 66 +++++++++++++++++++---------
>>   drivers/gpu/drm/xe/xe_pm.h           |  3 +-
>>   5 files changed, 104 insertions(+), 45 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index d0297ee432b2..55f974b1ee78 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -403,24 +403,62 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
>>   		DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0;
>>   }
>>   
>> +void xe_device_assert_mem_access(struct xe_device *xe)
>> +{
>> +	if (xe_pm_read_callback_task(xe) == current)
>> +		return;
>> +
>> +	XE_WARN_ON(!xe->mem_access.ref);
>> +}
>> +
>> +bool xe_device_mem_access_ongoing(struct xe_device *xe)
>> +{
>> +	bool ret;
>> +
>> +	if (xe_pm_read_callback_task(xe) == current)
>> +		return true;
>> +
>> +	mutex_lock(&xe->mem_access.lock);
>> +	ret = xe->mem_access.ref;
>> +	mutex_unlock(&xe->mem_access.lock);
>> +
>> +	return ret;
>> +}
>> +
>>   void xe_device_mem_access_get(struct xe_device *xe)
>>   {
>> -	bool resumed = xe_pm_runtime_resume_if_suspended(xe);
>> +	/*
>> +	 * This looks racy, but should be fine since the pm_callback_task only
>> +	 * transitions from NULL -> current (and back to NULL again), during the
>> +	 * runtime_resume() or runtime_suspend() callbacks, for which there can
>> +	 * only be a single one running for our device. We only need to prevent
>> +	 * recursively calling the runtime_get or runtime_put from those
>> +	 * callbacks, as well as preventing triggering any access_ongoing
>> +	 * asserts.
>> +	 */
>> +	if (xe_pm_read_callback_task(xe) == current)
>> +		return;
>>   
>> +	/*
>> +	 * It's possible to get rid of the mem_access.lock here, however lockdep
>> +	 * has an easier time digesting the mem_access.lock -> runtime_pm chain
>> +	 * (and any locks the caller is holding), on all transitions, and not
>> +	 * for example just on the 0 -> 1.
>> +	 */
>>   	mutex_lock(&xe->mem_access.lock);
>> -	if (xe->mem_access.ref++ == 0)
>> -		xe->mem_access.hold_rpm = xe_pm_runtime_get_if_active(xe);
>> +	if (xe->mem_access.ref == 0)
>> +		xe->mem_access.hold_rpm = xe_pm_runtime_resume_and_get(xe);
>> +	xe->mem_access.ref++;
>>   	mutex_unlock(&xe->mem_access.lock);
>>   
>> -	/* The usage counter increased if device was immediately resumed */
>> -	if (resumed)
>> -		xe_pm_runtime_put(xe);
>> -
>>   	XE_WARN_ON(xe->mem_access.ref == S32_MAX);
>>   }
>>   
>>   void xe_device_mem_access_put(struct xe_device *xe)
>>   {
>> +	if (xe_pm_read_callback_task(xe) == current)
>> +		return;
>> +
>>   	mutex_lock(&xe->mem_access.lock);
>>   	if (--xe->mem_access.ref == 0 && xe->mem_access.hold_rpm)
>>   		xe_pm_runtime_put(xe);
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index 9ab7e6134f89..64576ed9323e 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -90,21 +90,8 @@ static inline struct xe_force_wake * gt_to_fw(struct xe_gt *gt)
>>   void xe_device_mem_access_get(struct xe_device *xe);
>>   void xe_device_mem_access_put(struct xe_device *xe);
>>   
>> -static inline void xe_device_assert_mem_access(struct xe_device *xe)
>> -{
>> -	XE_WARN_ON(!xe->mem_access.ref);
>> -}
>> -
>> -static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
>> -{
>> -	bool ret;
>> -
>> -	mutex_lock(&xe->mem_access.lock);
>> -	ret = xe->mem_access.ref;
>> -	mutex_unlock(&xe->mem_access.lock);
>> -
>> -	return ret;
>> -}
>> +void xe_device_assert_mem_access(struct xe_device *xe);
>> +bool xe_device_mem_access_ongoing(struct xe_device *xe);
>>   
>>   static inline bool xe_device_in_fault_mode(struct xe_device *xe)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 0b6860156574..b0c69fcb4065 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -256,7 +256,10 @@ struct xe_device {
>>   	 * triggering additional actions when they occur.
>>   	 */
>>   	struct {
>> -		/** @lock: protect the ref count */
>> +		/**
>> +		 * @lock: Serialize xe_device_mem_access users,
>> +		 * and protect the below internal state, like @ref.
>> +		 */
> 
> We need to be careful here. Reading this comment makes me think if
> we are not getting into the anti-pattern of using the lock to protect
> the code instead of the data?

Yes, that is a good point.

> 
> With this in mind I was even wondering here if we could do this
> without the lock. maybe with some wait_for_completion kind of
> barrier?

Another version might look something like:

+       if (!atomic_inc_not_zero(xe->mem_access.ref)) {
+               hold_rpm = xe_pm_runtime_resume_and_get(xe);
+               ref = atomic_inc_return(&xe->mem_access.ref);
+               if (ref != 1)
+                       xe_pm_runtime_put(xe);
+               else
+                       xe->mem_access.hold_rpm = hold_rpm;
+       }

The resume_and_get() should serialize all the 0 -> 1 transitions, where 
one lucky caller will be running the ->resume callback and all the 
others will wait for it to exit the PM_RESUMING state. And then the 
caller that increments the mem_access.ref first keeps the actual ref.

> 
> But I know, in the end the effect is the same and we do need to
> ensure that the device is fully resumed before we proceed with
> any of them. And stopping everything is the sane way to protect
> the data. Any other magic we could be ending into anti-pattern of
> atomic for instance (like the one this series is fixing?!).

With the above it looks possible to drop the lock. However my current 
thinking is that with the explicit lock we should eventually see the 
locking order of access.lock -> resume(), such that lockdep is able to 
see all the stuff happening in the resume() callback, and any locks it 
might grab. And since we grab access.lock for all mem_access_get() 
callers it should understand that for all callers there might be 
(callers_locks) -> access.lock -> resume().

For example if we grab the ggtt.lock in the resume callback: access.lock 
-> resume() -> ggtt.lock. Lockdep should see that. If in another 
callchain we do ggtt.lock and call mem_access_get() we should get a 
lockdep splat, since it has already seen access.lock -> ggtt.lock.

Without the lock and just using the atomics it might hide such issues 
since lockdep might never see the ->resume callback being executed with 
the (callers_locks) held, since that only happens on the 0 -> 1 
transition, which might be very timing/workload/platform dependant. With 
the explicit lock we only need to see the 0 -> 1 transition once, and 
then lockdep can still verify all the (callers_locks) -> access.lock -> 
resume(), even though the ->resume() might not be called for every chain.

> 
> Besides, the runtime_pm documentation tells us "the PM core can't
> synchronize ->runtime_suspend() callbacks with the arrival of I/O requests.
> This synchronization must be handled by the driver, using its private lock.
> "

I think I/O request is talking about something else here. AFAICT the pm 
code will sync multiple callers, where PM_RESUMING or PM_SUSPENDING will 
make other callers wait (assuming not PM_ASYNC).

> 
> For this reason, let's go with this as is and we can improve or
> fix things on top later.
> 
> maybe with some adjustments in this doc comment and in the
> commit msg to reflect all that, but:

Yeah, the lock is only really for the serialisation but the pm code can 
already do that for us. So really it is just about "lockdep training 
wheels". Will fix.

> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thanks.

> 
>>   		struct mutex lock;
>>   		/** @ref: ref count of memory accesses */
>>   		s32 ref;
>> @@ -264,6 +267,12 @@ struct xe_device {
>>   		bool hold_rpm;
>>   	} mem_access;
>>   
>> +	/**
>> +	 * @pm_callback_task: Track the active task that is running in either
>> +	 * the runtime_suspend or runtime_resume callbacks.
>> +	 */
>> +	struct task_struct *pm_callback_task;
>> +
>>   	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
>>   	bool d3cold_allowed;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index b7b57f10ba25..29c8861e58a5 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -137,43 +137,71 @@ void xe_pm_runtime_fini(struct xe_device *xe)
>>   	pm_runtime_forbid(dev);
>>   }
>>   
>> +static void xe_pm_write_callback_task(struct xe_device *xe,
>> +				      struct task_struct *task)
>> +{
>> +	WRITE_ONCE(xe->pm_callback_task, task);
>> +
>> +	/*
>> +	 * Just in case it's somehow possible for our writes to be reordered to
>> +	 * the extent that something else re-uses the task written in
>> +	 * pm_callback_task. For example after returning from the callback, but
>> +	 * before the reordered write that resets pm_callback_task back to NULL.
>> +	 */
>> +	smp_mb(); /* pairs with xe_pm_read_callback_task */
>> +}
>> +
>> +struct task_struct *xe_pm_read_callback_task(struct xe_device *xe)
>> +{
>> +	smp_mb(); /* pairs with xe_pm_write_callback_task */
>> +
>> +	return READ_ONCE(xe->pm_callback_task);
>> +}
>> +
>>   int xe_pm_runtime_suspend(struct xe_device *xe)
>>   {
>>   	struct xe_gt *gt;
>>   	u8 id;
>> -	int err;
>> +	int err = 0;
>> +
>> +	if (xe->d3cold_allowed && xe_device_mem_access_ongoing(xe))
>> +		return -EBUSY;
>> +
>> +	/* Disable access_ongoing asserts and prevent recursive pm calls */
>> +	xe_pm_write_callback_task(xe, current);
>>   
>>   	if (xe->d3cold_allowed) {
>> -		if (xe_device_mem_access_ongoing(xe))
>> -			return -EBUSY;
>> -
>>   		err = xe_bo_evict_all(xe);
>>   		if (err)
>> -			return err;
>> +			goto out;
>>   	}
>>   
>>   	for_each_gt(gt, xe, id) {
>>   		err = xe_gt_suspend(gt);
>>   		if (err)
>> -			return err;
>> +			goto out;
>>   	}
>>   
>>   	xe_irq_suspend(xe);
>> -
>> -	return 0;
>> +out:
>> +	xe_pm_write_callback_task(xe, NULL);
>> +	return err;
>>   }
>>   
>>   int xe_pm_runtime_resume(struct xe_device *xe)
>>   {
>>   	struct xe_gt *gt;
>>   	u8 id;
>> -	int err;
>> +	int err = 0;
>> +
>> +	/* Disable access_ongoing asserts and prevent recursive pm calls */
>> +	xe_pm_write_callback_task(xe, current);
>>   
>>   	if (xe->d3cold_allowed) {
>>   		for_each_gt(gt, xe, id) {
>>   			err = xe_pcode_init(gt);
>>   			if (err)
>> -				return err;
>> +				goto out;
>>   		}
>>   
>>   		/*
>> @@ -182,7 +210,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>   		 */
>>   		err = xe_bo_restore_kernel(xe);
>>   		if (err)
>> -			return err;
>> +			goto out;
>>   	}
>>   
>>   	xe_irq_resume(xe);
>> @@ -193,10 +221,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>   	if (xe->d3cold_allowed) {
>>   		err = xe_bo_restore_user(xe);
>>   		if (err)
>> -			return err;
>> +			goto out;
>>   	}
>> -
>> -	return 0;
>> +out:
>> +	xe_pm_write_callback_task(xe, NULL);
>> +	return err;
>>   }
>>   
>>   int xe_pm_runtime_get(struct xe_device *xe)
>> @@ -210,14 +239,9 @@ int xe_pm_runtime_put(struct xe_device *xe)
>>   	return pm_runtime_put_autosuspend(xe->drm.dev);
>>   }
>>   
>> -/* Return true if resume operation happened and usage count was increased */
>> -bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe)
>> +bool xe_pm_runtime_resume_and_get(struct xe_device *xe)
>>   {
>> -	/* In case we are suspended we need to immediately wake up */
>> -	if (pm_runtime_suspended(xe->drm.dev))
>> -		return !pm_runtime_resume_and_get(xe->drm.dev);
>> -
>> -	return false;
>> +	return !pm_runtime_resume_and_get(xe->drm.dev);
>>   }
>>   
>>   int xe_pm_runtime_get_if_active(struct xe_device *xe)
>> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
>> index 6a885585f653..e92c508d44b9 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.h
>> +++ b/drivers/gpu/drm/xe/xe_pm.h
>> @@ -19,7 +19,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe);
>>   int xe_pm_runtime_resume(struct xe_device *xe);
>>   int xe_pm_runtime_get(struct xe_device *xe);
>>   int xe_pm_runtime_put(struct xe_device *xe);
>> -bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe);
>> +bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
>>   int xe_pm_runtime_get_if_active(struct xe_device *xe);
>> +struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
>>   
>>   #endif
>> -- 
>> 2.40.1
>>
