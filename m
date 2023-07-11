Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EA3EB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jul 2023 11:06:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8FE910E370;
	Tue, 11 Jul 2023 11:06:36 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA1D10E36F
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jul 2023 11:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689073594; x=1720609594;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rrey3QqgkhYj9xVaCLayofFoeS2/g8iSZjgRgXKbG5Q=;
 b=HlSYYSabwkkXG3nJ/CizAYmP9MAaQ+yd1r/Ug8JnjYl1K6ed2UPIFIk+
 l9Ux5KmvmAdXNBZs40aQ0Dm1D6CtClArT5o9M0qoE0StfR7NlKs+2VBnw
 abzFNgO3mWox91CnhdNzVRVnJ+nUlYqGLGKmnMkKepQOhu+x35P+C3Zgf
 qnjNJf9akhHwyu4PZMFHn2IDDIpJ6ncwiKN/iLo8UBi1+kYZcfnAWDu6d
 Yl/uZ5qDMlhqo/d4i4buDCPv5AgJOR0jJZLyzZ3te5Xf+Ml2rW3CT4gSi
 /V0ie/ldb3g/xKj9RrWi8OXIzrACR9QzEoIrvgM/vJX5Byfj8GC2mZmE9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="368089151"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="368089151"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 04:06:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="724405354"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="724405354"
Received: from dmendyk-mobl2.ger.corp.intel.com (HELO [10.252.12.20])
 ([10.252.12.20])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 04:06:05 -0700
Message-ID: <530dcec4-4b0f-f453-e780-327d99de41b4@intel.com>
Date: Tue, 11 Jul 2023 12:06:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Content-Language: en-GB
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230626105037.43780-15-matthew.auld@intel.com>
 <20230626105037.43780-16-matthew.auld@intel.com>
 <ea61756e-0dec-244e-d47e-0fe199061686@intel.com>
 <60fe1fd9-b9f8-3196-c43e-cace0c397f1b@intel.com>
 <69fb61e4-49e6-9809-6e9a-ee8a3f398959@intel.com>
 <c4812731-7dfe-a198-72a5-5cedc5e8deed@intel.com>
 <CY5PR11MB62113C3D0743F82D588805889531A@CY5PR11MB6211.namprd11.prod.outlook.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <CY5PR11MB62113C3D0743F82D588805889531A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v12 01/13] drm/xe: fix
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 11/07/2023 10:00, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Auld, Matthew <matthew.auld@intel.com>
>> Sent: Tuesday, July 4, 2023 9:30 PM
>> To: Gupta, Anshuman <anshuman.gupta@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Thomas Hellström
>> <thomas.hellstrom@linux.intel.com>; Brost, Matthew
>> <matthew.brost@intel.com>
>> Subject: Re: [PATCH v12 01/13] drm/xe: fix xe_device_mem_access_get() races
>>
>> On 04/07/2023 16:29, Gupta, Anshuman wrote:
>>>
>>>
>>> On 7/4/2023 4:55 PM, Matthew Auld wrote:
>>>> On 30/06/2023 16:22, Gupta, Anshuman wrote:
>>>>>
>>>>>
>>>>> On 6/26/2023 4:20 PM, Matthew Auld wrote:
>>>>>> It looks like there is at least one race here, given that the
>>>>>> pm_runtime_suspended() check looks to return false if we are in the
>>>>>> process of suspending the device (RPM_SUSPENDING vs
>> RPM_SUSPENDED).
>>>>>> We later also do xe_pm_runtime_get_if_active(), but since the
>>>>>> device is suspending or has now suspended, this doesn't do anything either.
>>>>>> Following from this we can potentially return from
>>>>>> xe_device_mem_access_get() with the device suspended or about to
>>>>>> be, leading to broken behaviour.
>>>>>>
>>>>>> Attempt to fix this by always grabbing the runtime ref when our
>>>>>> internal ref transitions from 0 -> 1. The hard part is then dealing
>>>>>> with the runtime_pm callbacks also calling
>>>>>> xe_device_mem_access_get() and deadlocking, which the
>>>>>> pm_runtime_suspended() check prevented.
>>>>>>
>>>>>> v2:
>>>>>>    - ct->lock looks to be primed with fs_reclaim, so holding that
>>>>>> and then
>>>>>>      allocating memory will cause lockdep to complain. Now that we
>>>>>>      unconditionally grab the mem_access.lock around
>>>>>> mem_access_{get,put}, we
>>>>>>      need to change the ordering wrt to grabbing the ct->lock, since
>>>>>> some of
>>>>>>      the runtime_pm routines can allocate memory (or at least that's
>>>>>> what
>>>>>>      lockdep seems to suggest). Hopefully not a big deal.  It might
>>>>>> be that
>>>>>>      there were already issues with this, just that the atomics
>>>>>> where
>>>>>>      "hiding" the potential issues.
>>>>>> v3:
>>>>>>    - Use Thomas Hellström' idea with tracking the active task that
>>>>>> is
>>>>>>      executing in the resume or suspend callback, in order to avoid
>>>>>>      recursive resume/suspend calls deadlocking on itself.
>>>>>>    - Split the ct->lock change.
>>>>>> v4:
>>>>>>    - Add smb_mb() around accessing the pm_callback_task for extra
>>>>>> safety.
>>>>>>      (Thomas Hellström)
>>>>>> v5:
>>>>>>    - Clarify the kernel-doc for the mem_access.lock, given that it
>>>>>> is quite
>>>>>>      strange in what it protects (data vs code). The real motivation
>>>>>> is to
>>>>>>      aid lockdep. (Rodrigo Vivi)
>>>>>> v6:
>>>>>>    - Split out the lock change. We still want this as a lockdep aid
>>>>>> but
>>>>>>      only for the xe_device_mem_access_get() path. Sticking a lock
>>>>>> on the
>>>>>>      put() looks be a no-go, also the runtime_put() there is always
>>>>>> async.
>>>>>>    - Now that the lock is gone move to atomics and rely on the pm
>>>>>> code
>>>>>>      serialising multiple callers on the 0 -> 1 transition.
>>>>>>    - g2h_worker_func() looks to be the next issue, given that
>>>>>>      suspend-resume callbacks are using CT, so try to handle that.
>>>>>> v7:
>>>>>>    - Add xe_device_mem_access_get_if_ongoing(), and use it in
>>>>>>      g2h_worker_func().
>>>>>>
>>>>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/258
>>>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/xe/xe_device.c       | 58
>>>>>> +++++++++++++++++++-----
>>>>>>    drivers/gpu/drm/xe/xe_device.h       | 12 ++---
>>>>>>    drivers/gpu/drm/xe/xe_device_types.h |  6 +++
>>>>>>    drivers/gpu/drm/xe/xe_guc_ct.c       | 34 +++++++++++++-
>>>>>>    drivers/gpu/drm/xe/xe_pm.c           | 66
>>>>>> +++++++++++++++++++---------
>>>>>>    drivers/gpu/drm/xe/xe_pm.h           |  3 +-
>>>>>>    6 files changed, 134 insertions(+), 45 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>>>>>> b/drivers/gpu/drm/xe/xe_device.c index c7985af85a53..1dc552da434f
>>>>>> 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>>>> @@ -411,27 +411,61 @@ u32 xe_device_ccs_bytes(struct xe_device *xe,
>>>>>> u64 size)
>>>>>>            DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0;
>>>>>>    }
>>>>>> +bool xe_device_mem_access_ongoing(struct xe_device *xe) {
>>>>>> +    if (xe_pm_read_callback_task(xe) != NULL)
>>>>>> +        return true;
>>>>>> +
>>>>>> +    return atomic_read(&xe->mem_access.ref); }
>>>>>> +
>>>>>> +void xe_device_assert_mem_access(struct xe_device *xe) {
>>>>>> +    XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
>>>>>> +}
>>>>>> +
>>>>>> +bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe) {
>>>>>> +    return atomic_inc_not_zero(&xe->mem_access.ref);
>>>>>> +}
>>>>>> +
>>>>>>    void xe_device_mem_access_get(struct xe_device *xe)
>>>>>>    {
>>>>>> -    bool resumed = xe_pm_runtime_resume_if_suspended(xe);
>>>>>> -    int ref = atomic_inc_return(&xe->mem_access.ref);
>>>>>> +    /*
>>>>>> +     * This looks racy, but should be fine since the
>>>>>> pm_callback_task only
>>>>>> +     * transitions from NULL -> current (and back to NULL again),
>>>>>> during the
>>>>>> +     * runtime_resume() or runtime_suspend() callbacks, for which
>>>>>> there can
>>>>>> +     * only be a single one running for our device. We only need
>>>>>> +to
>>>>>> prevent
>>>>>> +     * recursively calling the runtime_get or runtime_put from
>>>>>> +those
>>>>>> +     * callbacks, as well as preventing triggering any
>>>>>> +access_ongoing
>>>>>> +     * asserts.
>>>>>> +     */
>>>>> two runtime_suspend() can run in parallel for two different pci
>>>>> device those worker thread pooled by pm_wq workqueue, it is not
>>>>> guaranteed that tast_struct will be different for two worker spawned
>>>>> by same pm_wq ?
>>>>
>>>> IIUC we only use pm_wq for the async put(). If somehow tast_struct
>>>> can be the same for different workers when using pm_wq (I'm not sure
>>>> tbh), then I think it's fine since all put() must be balanced with a
>>>> get(), and all get() are handled directly in the caller (not pm_wq)
>>>> since it's non-async, and must first wait for any running callback.
>>> Agree with that.
>>>>
>>>>>
>>>>>> +    if (xe_pm_read_callback_task(xe) == current)
>>>>>> +        return;
>>>>>> -    if (ref == 1)
>>>>>> -        xe->mem_access.hold_rpm = xe_pm_runtime_get_if_active(xe);
>>>>>> +    if (!atomic_inc_not_zero(&xe->mem_access.ref)) {
>>>>>> +        bool hold_rpm = xe_pm_runtime_resume_and_get(xe);
>>>>>> +        int ref;
>>>>>> -    /* The usage counter increased if device was immediately
>>>>>> resumed */
>>>>>> -    if (resumed)
>>>>>> -        xe_pm_runtime_put(xe);
>>>>>> -
>>>>>> -    XE_WARN_ON(ref == S32_MAX);
>>>>>> +        ref = atomic_inc_return(&xe->mem_access.ref);
>>>>>> +        if (ref == 1)
>>>>>> +            xe->mem_access.hold_rpm = hold_rpm;
>>>>>> +        else
>>>>>> +            xe_pm_runtime_put(xe);
>>> AFAIU above is not possible ?
>>
>> Do you mean the xe_pm_runtime_put() part? On the 0 -> 1 transition we just
>> always call xe_pm_runtime_resume_and_get(). That serialises multiple callers
>> such that exactly one runs our rpm resume callback and the rest all block waiting
>> for it to transition into RPM_ACTIVE. However once we return from
>> xe_pm_runtime_resume_and_get() there are potentially several different callers
>> holding an rpm ref. We only need the one rpm ref for our needs, so we simply
>> drop the rest here keeping the one that first incremented the ref.
> Thanks for explanation.
> I am still not clear with how are we handling case of error return by xe_pm_runtime_resume_and_get() ?
> If one of two simultaneous call of xe_device_mem_access_get() fails at xe_pm_runtime_resume_and_get()
> then it drops the rpm ref of other passed call as well ?


I guess we could do something like:

-               if (ref == 1)
+               if (ref == 1 && hold_rpm)
                         xe->mem_access.hold_rpm = hold_rpm;
-               else
+               else if (hold_rpm)
                         xe_pm_runtime_put(xe);

Or we can just always grab the rpm:

-       if (!atomic_inc_not_zero(&xe->mem_access.ref)) {
-               bool hold_rpm = xe_pm_runtime_resume_and_get(xe);
-               int ref;
-
-               ref = atomic_inc_return(&xe->mem_access.ref);
-               if (ref == 1)
-                       xe->mem_access.hold_rpm = hold_rpm;
-               else
-                       xe_pm_runtime_put(xe);
-       } else {
-               XE_WARN_ON(atomic_read(&xe->mem_access.ref) == S32_MAX);
-       }
+       xe_pm_runtime_resume_and_get(xe);
+       ref = atomic_inc_return(&xe->mem_access.ref);
+       XE_WARN_ON(ref == S32_MAX);

         lock_map_release(&xe_device_mem_access_lockdep_map);
  }
@@ -489,8 +480,7 @@ void xe_device_mem_access_put(struct xe_device *xe)
                 return;

         ref = atomic_dec_return(&xe->mem_access.ref);
-       if (ref == 0 && xe->mem_access.hold_rpm)
-               xe_pm_runtime_put(xe);
+       xe_pm_runtime_put(xe);


And then also remove hold_rpm stuff. But either way there is still the 
big issue of what to do if the rpm get fails. If it fails as you say, 
the driver is still broken even with the above.

> That eventually provide access to PCI bar without RPM protection.
> We should also check returned value from xe_pm_runtime_resume_and_get() before calling
> xe_pm_runtime_put() as pm_runtime_resume_and_get() also drops the device usage count on
> error case.

So do we already know how we want to handle such failures from callers 
pov? Currently there is no return value for xe_device_mem_access_get(), 
so caller currently has zero clue, and any device access will be end 
badly anyway. But I wasn't really trying to solve that in this series.

Do we just want to return an error if access_get fails? If so handling 
the above becomes quite simple, with something like the following in 
xe_device_mem_access_get():

+       if (!xe_pm_runtime_resume_and_get(xe))
+               return false;

> Br,
> Anshuman Gupta.
>>
>>>>>> +    } else {
>>>>>> +        XE_WARN_ON(atomic_read(&xe->mem_access.ref) == S32_MAX);
>>>>>> +    }
>>>>>>    }
>>>>>>    void xe_device_mem_access_put(struct xe_device *xe)
>>>>>>    {
>>>>>> -    bool hold = xe->mem_access.hold_rpm;
>>>>>> -    int ref = atomic_dec_return(&xe->mem_access.ref);
>>>>>> +    int ref;
>>>>>> -    if (!ref && hold)
>>>>>> +    if (xe_pm_read_callback_task(xe) == current)
>>>>>> +        return;
>>>>>> +
>>>>>> +    ref = atomic_dec_return(&xe->mem_access.ref);
>>>>>> +    if (ref == 0 && xe->mem_access.hold_rpm)
>>>>>>            xe_pm_runtime_put(xe);
>>>>>>        XE_WARN_ON(ref < 0);
>>>>> /snip
>>>>>> +
>>>>>>    int xe_pm_runtime_suspend(struct xe_device *xe)
>>>>>>    {
>>>>>>        struct xe_gt *gt;
>>>>>>        u8 id;
>>>>>> -    int err;
>>>>>> +    int err = 0;
>>>>>> +
>>>>>> +    if (xe->d3cold_allowed && xe_device_mem_access_ongoing(xe))
>>>>>> +        return -EBUSY;
>>>>> Not related to this patch but We should return -EBUSY even for d3hot
>>>>> as well.
>>>>
>>>> Looking at this again, access_ongoing is always going to be false
>>>> here, right? On the 0 -> 1 transition we always do full sync pm get
>>>> before increment mem_access.ref, so not sure if this check actually
>>>> does anything.
>>> I belive this is paranoid check against any unbalanced put.
>>> Br,
>>> Anshuman Gupta.
>>>>
>>>>> Br,
>>>>> Anshuman Gupta
>>>>>> +
>>>>>> +    /* Disable access_ongoing asserts and prevent recursive pm
>>>>>> calls */
>>>>>> +    xe_pm_write_callback_task(xe, current);
>>>>>>        if (xe->d3cold_allowed) {
>>>>>> -        if (xe_device_mem_access_ongoing(xe))
>>>>>> -            return -EBUSY;
>>>>>> -
>>>>>>            err = xe_bo_evict_all(xe);
>>>>>>            if (err)
>>>>>> -            return err;
>>>>>> +            goto out;
>>>>>>        }
>>>>>>        for_each_gt(gt, xe, id) {
>>>>>>            err = xe_gt_suspend(gt);
>>>>>>            if (err)
>>>>>> -            return err;
>>>>>> +            goto out;
>>>>>>        }
>>>>>>        xe_irq_suspend(xe);
>>>>>> -
>>>>>> -    return 0;
>>>>>> +out:
>>>>>> +    xe_pm_write_callback_task(xe, NULL);
>>>>>> +    return err;
>>>>>>    }
>>>>>>    int xe_pm_runtime_resume(struct xe_device *xe)
>>>>>>    {
>>>>>>        struct xe_gt *gt;
>>>>>>        u8 id;
>>>>>> -    int err;
>>>>>> +    int err = 0;
>>>>>> +
>>>>>> +    /* Disable access_ongoing asserts and prevent recursive pm
>>>>>> calls */
>>>>>> +    xe_pm_write_callback_task(xe, current);
>>>>>>        if (xe->d3cold_allowed) {
>>>>>>            for_each_gt(gt, xe, id) {
>>>>>>                err = xe_pcode_init(gt);
>>>>>>                if (err)
>>>>>> -                return err;
>>>>>> +                goto out;
>>>>>>            }
>>>>>>            /*
>>>>>> @@ -182,7 +210,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>>>>>             */
>>>>>>            err = xe_bo_restore_kernel(xe);
>>>>>>            if (err)
>>>>>> -            return err;
>>>>>> +            goto out;
>>>>>>        }
>>>>>>        xe_irq_resume(xe);
>>>>>> @@ -193,10 +221,11 @@ int xe_pm_runtime_resume(struct xe_device
>>>>>> *xe)
>>>>>>        if (xe->d3cold_allowed) {
>>>>>>            err = xe_bo_restore_user(xe);
>>>>>>            if (err)
>>>>>> -            return err;
>>>>>> +            goto out;
>>>>>>        }
>>>>>> -
>>>>>> -    return 0;
>>>>>> +out:
>>>>>> +    xe_pm_write_callback_task(xe, NULL);
>>>>>> +    return err;
>>>>>>    }
>>>>>>    int xe_pm_runtime_get(struct xe_device *xe) @@ -210,14 +239,9 @@
>>>>>> int xe_pm_runtime_put(struct xe_device *xe)
>>>>>>        return pm_runtime_put_autosuspend(xe->drm.dev);
>>>>>>    }
>>>>>> -/* Return true if resume operation happened and usage count was
>>>>>> increased */ -bool xe_pm_runtime_resume_if_suspended(struct
>>>>>> xe_device *xe)
>>>>>> +bool xe_pm_runtime_resume_and_get(struct xe_device *xe)
>>>>>>    {
>>>>>> -    /* In case we are suspended we need to immediately wake up */
>>>>>> -    if (pm_runtime_suspended(xe->drm.dev))
>>>>>> -        return !pm_runtime_resume_and_get(xe->drm.dev);
>>>>>> -
>>>>>> -    return false;
>>>>>> +    return !pm_runtime_resume_and_get(xe->drm.dev);
>>>>>>    }
>>>>>>    int xe_pm_runtime_get_if_active(struct xe_device *xe) diff --git
>>>>>> a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h index
>>>>>> 6a885585f653..e92c508d44b9 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_pm.h
>>>>>> +++ b/drivers/gpu/drm/xe/xe_pm.h
>>>>>> @@ -19,7 +19,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe);
>>>>>>    int xe_pm_runtime_resume(struct xe_device *xe);
>>>>>>    int xe_pm_runtime_get(struct xe_device *xe);
>>>>>>    int xe_pm_runtime_put(struct xe_device *xe); -bool
>>>>>> xe_pm_runtime_resume_if_suspended(struct xe_device *xe);
>>>>>> +bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
>>>>>>    int xe_pm_runtime_get_if_active(struct xe_device *xe);
>>>>>> +struct task_struct *xe_pm_read_callback_task(struct xe_device
>>>>>> +*xe);
>>>>>>    #endif
