Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F5AC5475B
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 17:48:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4F1897FB;
	Tue, 20 Feb 2024 17:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kOwsUR5t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C8E897FB
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 17:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708451329; x=1739987329;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=fpEU/r8WT06sPu4w1tws7nj3PhLRMkgzUnC5RgutUF8=;
 b=kOwsUR5tW4KI/ssffi6chBXWNagCsk7A8sAP+pbl5Y5nV+4ctouc6vza
 /cLDYDz/YXsuvQEq59v5nrlh0RJCZIKUkaox/Ve7sFAAK82APzPrAXYkX
 KnQq2DhF0ix2wrn2eHKiyM5gCDwkp0JBbaJfcmvmOVfnHuIoBP7uxHFUI
 uRn+W9NlAMcCn7zAECEIwpaaKZvAEuHyaG4ZnBtGqiyTEtwy1JGosmBCf
 bt4qBvai0VfeCCo5KqEGBs7uZwbRFGwBzoyDDkx7ED9IBbboVGu9IcwKk
 RDbkWrY2pol+qKMIjyBMjM4CXkOH8srm5Z+dcGnJmE6+UbtrjgHfP4h04 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2432692"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2432692"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 09:48:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="35622615"
Received: from jleijten-mobl.ger.corp.intel.com (HELO [10.252.22.45])
 ([10.252.22.45])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 09:48:47 -0800
Message-ID: <d80b30a4-cdc0-467e-9f8a-6ee6fdcb056a@intel.com>
Date: Tue, 20 Feb 2024 17:48:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [RFC 19/34] drm/xe: Remove pm_runtime lockdep
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-20-rodrigo.vivi@intel.com>
 <fc63da97-8aee-4027-a723-723ef7ac9567@intel.com> <Zc6UlCthcR61eI4y@intel.com>
Content-Language: en-GB
In-Reply-To: <Zc6UlCthcR61eI4y@intel.com>
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

On 15/02/2024 22:47, Rodrigo Vivi wrote:
> On Mon, Feb 05, 2024 at 11:54:45AM +0000, Matthew Auld wrote:
>> On 26/01/2024 20:30, Rodrigo Vivi wrote:
>>> This lockdep was initially designed for the mem_access,
>>> where the mem_access needed to run the resume sync from
>>> the innerbounds and count the references.
>>>
>>> With the runtime moving to the outer bounds of the driver
>>> and the mem_access replaced by the pure rpm get/put
>>> references, it is no longer needed and it is in a matter
>>
>> We are also calling it in workers like invalidation_fence_work_func(),
>> xe_sched_process_msg_work() etc. It is still quite easy to deadlock with
>> that.
>>
>>> of fact just splatting may false positives as the following:
>>
>> Yeah, calling invalidation_fence_work_func() directly in the callers context
>> is a false positive since ioctl has the rpm ref. But what about calling that
>> in the async case where invalidation_fence_work_func() is only called when
>> the in-fence signals? We are sure that is safe? It should be simple to fix
>> the false positive here, no? If we just delete all the annotations we get
>> zero help from lockdep for the more complicated cases. Also IIRC lockdep
>> doesn't show you every splat once it triggers once, so who knows what else
>> is lurking and whether that is also false positive?
>>
>>>
>>>                  -> #1 (xe_pm_runtime_lockdep_map){+.+.}-{0:0}:
>>> [  384.778761]        xe_pm_runtime_get+0xa3/0x100 [xe]
>>> [  384.783871]        invalidation_fence_work_func+0x7f/0x2b0 [xe]
>>> [  384.789942]        invalidation_fence_init+0x8c2/0xce0 [xe]
>>> [  384.795671]        __xe_pt_unbind_vma+0x4a7/0x1be0 [xe]
>>> [  384.801050]        xe_vm_unbind+0x22f/0xc70 [xe]
>>> [  384.805821]        __xe_vma_op_execute+0xc67/0x1af0 [xe]
>>> [  384.811286]        xe_vm_bind_ioctl+0x3a36/0x66c0 [xe]
>>> [  384.816579]        drm_ioctl_kernel+0x14a/0x2c0
>>> [  384.821132]        drm_ioctl+0x4c6/0xab0
>>> [  384.825073]        xe_drm_ioctl+0xa1/0xe0 [xe]
>>> [  384.829651]        __x64_sys_ioctl+0x130/0x1a0
>>> [  384.834115]        do_syscall_64+0x5c/0xe0
>>> [  384.838232]        entry_SYSCALL_64_after_hwframe+0x6e/0x76
>>> [  384.843829]
>>>                  -> #0 (reservation_ww_class_mutex){+.+.}-{4:4}:
>>> [  384.850911]        __lock_acquire+0x3261/0x6330
>>> [  384.855462]        lock_acquire+0x19b/0x4d0
>>> [  384.859666]        __ww_mutex_lock.constprop.0+0x1d8/0x3500
>>> [  384.865263]        ww_mutex_lock+0x38/0x150
>>> [  384.869465]        xe_bo_lock+0x41/0x70 [xe]
>>> [  384.873869]        xe_bo_evict_all+0x7ad/0xa40 [xe]
>>> [  384.878883]        xe_pm_runtime_suspend+0x297/0x340 [xe]
>>> [  384.884431]        xe_pci_runtime_suspend+0x3b/0x1e0 [xe]
>>> [  384.889975]        pci_pm_runtime_suspend+0x168/0x540
>>> [  384.895052]        __rpm_callback+0xa9/0x390
>>> [  384.899343]        rpm_callback+0x1aa/0x210
>>> [  384.903543]        rpm_suspend+0x2ea/0x14c0
>>> [  384.907746]        pm_runtime_work+0x133/0x170
>>> [  384.912213]        process_one_work+0x73b/0x1230
>>> [  384.916853]        worker_thread+0x726/0x1320
>>> [  384.921237]        kthread+0x2ee/0x3d0
>>> [  384.925005]        ret_from_fork+0x2d/0x70
>>> [  384.929120]        ret_from_fork_asm+0x1b/0x30
>>> [  384.933585]
>>>                  other info that might help us debug this:
>>>
>>> [  384.941625]  Possible unsafe locking scenario:
>>>
>>> [  384.947572]        CPU0                    CPU1
>>> [  384.952123]        ----                    ----
>>> [  384.956676]   lock(xe_pm_runtime_lockdep_map);
>>> [  384.961140]                                lock(reservation_ww_class_mutex);
>>> [  384.968220]                                lock(xe_pm_runtime_lockdep_map);
>>> [  384.975214]   lock(reservation_ww_class_mutex);
>>> [  384.979765]
>>>                   *** DEADLOCK ***
>>>
>>> In a matter of fact, there's actually a third lock that is not
>>> in this picture:
>>> spin_lock_irq(&dev->power.lock);
>>> and INIT_WORK(&dev->power.work, pm_runtime_work);
>>>
>>> The pm_callback_task will ensure that there's no recursive
>>> calls of the resume function and it will increase the
>>> reference counter anyway.
>>>
>>> Then, the pm_runtime workqueue and spin locks will avoid that
>>> any resume and suspend operations happens in parallel with
>>> other resume and suspend operations.
>>>
>>> With that, the only thing that we are actually doing here is
>>> to wrongly train the lockdep, basically saying that we will
>>> acquire some locks on resume and on suspend concurrently,
>>> entirely ignoring its serialization and protection.
>>>
>>> The above scenario is simply not possible because there's
>>> a serialization with the spin_lock_irq(&dev->power.lock)
>>> before each operation. However we are telling the lockep
>>> that the lock(xe_pm_runtime_lockdep_map) occurs before
>>> the &dev->power.lock and lockdep is not capable to see
>>> that other protection.
>>
>> Can you share some more info here? AFAIK dev->power.lock is an RPM core lock
>> that protects internal state like transitioning between ACTIVE, SUSPENDING,
>> RESUMING etc. It is never held when calling any of our rpm callbacks, so it
>> should never factor in to xe_pm_runtime_lockdep_map.
>>
>> The overall thing should look like this:
>>
>> xe_rpm_get:
>>      lock_map_acquire(&xe_pm_runtime_lockdep_map);
>>      lock_map_release(&xe_pm_runtime_lockdep_map);
>>      .....
>>      RPM core grabs dev->power.lock
>>
>> rpm resume callback: (RPM has dropped dev->power.lock)
> 
>                         ^ this is exactly the problem.
> RPM doesn't drop the dev->power.lock while the callback
> is called. it relaxes while waiting for other transaction
> to finish, but it is hold by the time it gets to the callback.

AFAICT it is never held from the context that is calling the resume or 
suspend callback (spinlock would be very limiting otherwise), and it ofc 
can't be held while sleeping, like when "waiting for other 
transactions". Note that the "waiting for other transactions" thing is 
exactly what lockdep doesn't understand by itself (there are no 
annotations for waitqueue AFAIK), which is part of what the xe_pm 
annotations here help with...

> 
>>      lock_map_acquire(&xe_pm_runtime_lockdep_map);
>>      ....do resume stuff
>>      lock_map_release(&xe_pm_runtime_lockdep_map);
>>
>> rpm suspend callback: (RPM has dropped dev->power.lock)
>>      lock_map_acquire(&xe_pm_runtime_lockdep_map);
>>      .....do suspend stuff
>>      lock_map_release(&xe_pm_runtime_lockdep_map);
>>
>>>
>>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_pm.c | 55 --------------------------------------
>>>    1 file changed, 55 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>>> index 86bf225dba02..f49e449d9fb7 100644
>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>> @@ -67,12 +67,6 @@
>>>     */
>>> -#ifdef CONFIG_LOCKDEP
>>> -struct lockdep_map xe_pm_runtime_lockdep_map = {
>>> -	.name = "xe_pm_runtime_lockdep_map"
>>> -};
>>> -#endif
>>> -
>>>    /**
>>>     * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 / S0->S2idle
>>>     * @xe: xe device instance
>>> @@ -291,29 +285,6 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>>    	/* Disable access_ongoing asserts and prevent recursive pm calls */
>>>    	xe_pm_write_callback_task(xe, current);
>>> -	/*
>>> -	 * The actual xe_pm_runtime_put() is always async underneath, so
>>> -	 * exactly where that is called should makes no difference to us. However
>>> -	 * we still need to be very careful with the locks that this callback
>>> -	 * acquires and the locks that are acquired and held by any callers of
>>> -	 * xe_runtime_pm_get(). We already have the matching annotation
>>> -	 * on that side, but we also need it here. For example lockdep should be
>>> -	 * able to tell us if the following scenario is in theory possible:
>>> -	 *
>>> -	 * CPU0                          | CPU1 (kworker)
>>> -	 * lock(A)                       |
>>> -	 *                               | xe_pm_runtime_suspend()
>>> -	 *                               |      lock(A)
>>> -	 * xe_pm_runtime_get()           |
>>> -	 *
>>> -	 * This will clearly deadlock since rpm core needs to wait for
>>> -	 * xe_pm_runtime_suspend() to complete, but here we are holding lock(A)
>>> -	 * on CPU0 which prevents CPU1 making forward progress.  With the
>>> -	 * annotation here and in xe_pm_runtime_get() lockdep will see
>>> -	 * the potential lock inversion and give us a nice splat.
>>> -	 */
>>> -	lock_map_acquire(&xe_pm_runtime_lockdep_map);
>>> -
>>>    	/*
>>>    	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
>>>    	 * also checks and delets bo entry from user fault list.
>>> @@ -341,7 +312,6 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>>    	if (xe->d3cold.allowed)
>>>    		xe_display_pm_runtime_suspend(xe);
>>>    out:
>>> -	lock_map_release(&xe_pm_runtime_lockdep_map);
>>>    	xe_pm_write_callback_task(xe, NULL);
>>>    	return err;
>>>    }
>>> @@ -361,8 +331,6 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>>    	/* Disable access_ongoing asserts and prevent recursive pm calls */
>>>    	xe_pm_write_callback_task(xe, current);
>>> -	lock_map_acquire(&xe_pm_runtime_lockdep_map);
>>> -
>>>    	/*
>>>    	 * It can be possible that xe has allowed d3cold but other pcie devices
>>>    	 * in gfx card soc would have blocked d3cold, therefore card has not
>>> @@ -400,31 +368,10 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>>    			goto out;
>>>    	}
>>>    out:
>>> -	lock_map_release(&xe_pm_runtime_lockdep_map);
>>>    	xe_pm_write_callback_task(xe, NULL);
>>>    	return err;
>>>    }
>>> -/*
>>> - * For places where resume is synchronous it can be quite easy to deadlock
>>> - * if we are not careful. Also in practice it might be quite timing
>>> - * sensitive to ever see the 0 -> 1 transition with the callers locks
>>> - * held, so deadlocks might exist but are hard for lockdep to ever see.
>>> - * With this in mind, help lockdep learn about the potentially scary
>>> - * stuff that can happen inside the runtime_resume callback by acquiring
>>> - * a dummy lock (it doesn't protect anything and gets compiled out on
>>> - * non-debug builds).  Lockdep then only needs to see the
>>> - * xe_pm_runtime_lockdep_map -> runtime_resume callback once, and then can
>>> - * hopefully validate all the (callers_locks) -> xe_pm_runtime_lockdep_map.
>>> - * For example if the (callers_locks) are ever grabbed in the
>>> - * runtime_resume callback, lockdep should give us a nice splat.
>>> - */
>>> -static void pm_runtime_lockdep_training(void)
>>> -{
>>> -	lock_map_acquire(&xe_pm_runtime_lockdep_map);
>>> -	lock_map_release(&xe_pm_runtime_lockdep_map);
>>> -}
>>> -
>>>    /**
>>>     * xe_pm_runtime_get - Get a runtime_pm reference and resume synchronously
>>>     * @xe: xe device instance
>>> @@ -436,7 +383,6 @@ void xe_pm_runtime_get(struct xe_device *xe)
>>>    	if (xe_pm_read_callback_task(xe) == current)
>>>    		return;
>>> -	pm_runtime_lockdep_training();
>>>    	pm_runtime_resume(xe->drm.dev);
>>>    }
>>> @@ -466,7 +412,6 @@ int xe_pm_runtime_get_sync(struct xe_device *xe)
>>>    	if (WARN_ON(xe_pm_read_callback_task(xe) == current))
>>>    		return -ELOOP;
>>> -	pm_runtime_lockdep_training();
>>>    	return pm_runtime_get_sync(xe->drm.dev);
>>>    }
