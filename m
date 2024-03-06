Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFA5C54E41
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 16:04:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125C51132F7;
	Wed,  6 Mar 2024 16:04:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ctYQDBNe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB40D1132F7
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Mar 2024 16:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709741091; x=1741277091;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ujRM7SnCKNTdzhYFi4LWvH0/35OqqITMuCBaiAAkxZQ=;
 b=ctYQDBNeEAOYYsvcDVYsHT1zA9vdHywWzxPvIoEws2MNJ2AdKDaV6uiI
 5Eu6+Y4oS05nodIVZfGGvBCTP3A4syy/d+QLBNas7INvCmyF1EIl8S+cK
 U06rlGsrrnGYoYdv8gN0rCmAqvBKj1jT57VgzhufIcTNge80pUU1wZY8U
 uPyX9MiKW1U67DYe+OcsEef8Q3hcLyjmkIBy25Hp6Ex0QupTQcseG7Duh
 3KEBeApGH7UBFbEXmkACaW4bufHaG4xhhbiB2HuVyAzhVZ6wtBZy39yCC
 76eG37LPgcha5U60aJrdd2hl/AZshl2dqnU0RDFyS3S/yERVyRkkHvin+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4210261"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="4210261"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 08:04:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="14367466"
Received: from dawidzix-mobl1.ger.corp.intel.com (HELO [10.249.140.92])
 ([10.249.140.92])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 08:04:48 -0800
Message-ID: <efcfb623-3e2d-4a4a-bc79-b14b712f204c@intel.com>
Date: Wed, 6 Mar 2024 16:04:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] drm/xe: Move xe_irq runtime suspend and resume out of
 lockdep
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240304182154.42611-1-rodrigo.vivi@intel.com>
 <20240304182154.42611-4-rodrigo.vivi@intel.com>
 <13054dd0-51cd-4dd4-8b14-4587037acf2f@intel.com> <ZeegmIhyBz5aCwcm@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZeegmIhyBz5aCwcm@intel.com>
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

On 05/03/2024 22:45, Rodrigo Vivi wrote:
> On Tue, Mar 05, 2024 at 11:07:37AM +0000, Matthew Auld wrote:
>> On 04/03/2024 18:21, Rodrigo Vivi wrote:
>>> Now that mem_access xe_pm_runtime_lockdep_map was moved to protect all
>>> the sync resume calls lockdep is saying:
>>>
>>>    Possible unsafe locking scenario:
>>>
>>>          CPU0                    CPU1
>>>          ----                    ----
>>>     lock(xe_pm_runtime_lockdep_map);
>>>                                  lock(&power_domains->lock);
>>>                                  lock(xe_pm_runtime_lockdep_map);
>>>     lock(&power_domains->lock);
>>>
>>> -> #1 (xe_pm_runtime_lockdep_map){+.+.}-{0:0}:
>>>          xe_pm_runtime_resume_and_get+0x6a/0x190 [xe]
>>>          release_async_put_domains+0x26/0xa0 [xe]
>>>          intel_display_power_put_async_work+0xcb/0x1f0 [xe]
>>>
>>> -> #0 (&power_domains->lock){+.+.}-{4:4}:
>>>          __lock_acquire+0x3259/0x62c0
>>>          lock_acquire+0x19b/0x4c0
>>>          __mutex_lock+0x16b/0x1a10
>>>          intel_display_power_is_enabled+0x1f/0x40 [xe]
>>>          gen11_display_irq_reset+0x1f2/0xcc0 [xe]
>>>          xe_irq_reset+0x43d/0x1cb0 [xe]
>>>          xe_irq_resume+0x52/0x660 [xe]
>>>          xe_pm_runtime_resume+0x7d/0xdc0 [xe
>>>
>>> This is likely a false positive.
>>>
>>> This lockdep is created to protect races from the inner callers
>>
>> There is no real lock here so it doesn't protect anything AFAIK. It is just
>> about mapping the hidden dependencies between locks held when waking up the
>> device and locks acquired in the resume and suspend callbacks.
> 
> indeed a bad phrase. something like
> 'This lockdep is created to warn us if we are at risk of introducing inner callers"
> would make it better?

Yeah, or maybe something like:

"The lockdep annotations will warn if any lock held when potentially 
waking up the device, can also be acquired in either of the resume or 
suspend pm callbacks".

?

> 
>>
>>> of get-and-resume-sync that are within holding various memory access locks
>>> with the resume and suspend itself that can also be trying to grab these
>>> memory access locks.
>>>
>>> This is not the case here, for sure. The &power_domains->lock seems to be
>>> sufficient to protect any race and there's no counter part to get deadlocked
>>> with.
>>
>> What is meant by "race" here? The lockdep splat is saying that one or both
>> of the resume or suspend callbacks is grabbing some lock, but that same lock
>> is also held when potentially waking up the device. From lockdep POV that is
>> a potential deadlock.
> 
> The lock is &power_domains->lock only, that could be grabbed at both suspend
> and resume. But even though we are not trusting that only one of the operations
> can help simultaneously, what are the other lock that could be possibly be
> hold in a way to cause this theoretical deadlock?

I don't think there needs to be another lock here to deadlock. Also it 
should be completely fine that both the resume and suspend callbacks 
acquire that same lock. The issue is only when you are holding that same 
lock and then try to wake up the device synchronously. If that can 
actually happen we can hit deadlocks.

Simplest example would be A -> A deadlock:

lock(power->lock)
pm_get_sync()
    -> runtime_resume(xe)
      -> lock(power->lock)

A more nasty example with A -> B, B -> A deadlock (where did B come 
from???):

                           rpm-core worker
lock(power->lock)    |
                      | -> status = RPM_SUSPENDING
                      | -> runtime_suspend(xe)
                      |   -> lock(power->lock)
pm_get_sync()        |
   -> wait_for_worker |

The wait_for_worker is the waitqueue dance where it sees that 
runtime_status is RPM_SUSPENDING or RPM_RESUMING and then goes to sleep 
until the status changes to RPM_SUSPENDED or RPM_RESUMED. Once the 
worker completes it then wakes up the sleeper. But that wait_for_worker 
thing creates a dependency underneath. But here that wait dependency is 
hidden from lockdep AFAICT, since there is no actual lock acquisition 
happening. There is exactly one lock and two different contexts 
acquiring it, seems totally fine, so from lock acquisition pov there is 
no issue.

And yet it still deadlocks, since the rpm-core worker (or whatever is 
running the async suspend) is stuck trying to acquire lock(power->lock), 
but the other caller is already holding it and won't release it until 
the worker completes. And this is where the xe pm annotations helps by 
basically introducing a big-dumb-fake-lock to try to model the 
dependencies. The above then actually ends up looking like:

                           rpm-core worker
lock(power->lock)    |
                      | -> status = RPM_SUSPENDING
                      | -> runtime_suspend(xe)
                      |    map_acquire(pm)
                      |   -> lock(power->lock)
                      |
map_acquire(pm)      |
map_release(pm)      |
pm_get_sync()        |
  -> wait_for_worker  |

So what we actually have and what lockdep will easily see as potentially 
possible:

lock(power->lock) -> map_acquire(pm)
map_acquire(pm) -> lock(power->lock)

Which is now a simple locking inversion with A -> B, B -> A. But this is 
actually a bit silly example with lock(power->lock) since lockdep will 
see the simple A -> A, but point is there there might exist other locks 
that are only taken in the suspend callback, for example, and since 
suspend is usually always async and done from the rpm core worker I 
don't think lockdep will see the potential deadlocks without the xe pm 
annotations (comes back to the hidden wait_for_worker dependency).

The other thing worth mentioning is that all pm_get_sync() calls are 
assumed to be capable of waking up the device as per the xe pm 
annotations. The advantage is that we don't need to hit the full 
wake-up-the-entire-device slow path for every caller in a real run 
(probably not possible in single CI run). We instead just need to hit 
both pm callbacks once in a given CI run (very easy), to record the 
map_acquire(pm) -> locks-in-pm-callbacks dependencies. And then so long 
as we also hit every pm_get_sync() call site, which now doesn't need to 
actually wake the device up for real, we also then get the 
locks-held-when-waking-up-device -> map_acquire(pm), which should be 
enough for lockdep to find any clear locking inversions, like the above. 
With that we can have pretty high confidence we don't have any potential 
deadlocks. The disadvantage is potential false positives (like maybe in 
this patch), but when you consider that nasty A -> B, B -> A example, I 
think it is probably worth it IMO.

Also a good read here: 
https://blog.ffwll.ch/2020/08/lockdep-false-positives.html

> 
>>
>> If we are saying that it is impossible to actually wake up the device in
>> this particular case then can we rather make caller use _noresume() or
>> ifactive()?
> 
> I'm trying to avoid touching the i915-display runtime-pm code. :/
> 
> At some point I even thought about making all the i915-display bogus on xe
> and making the runtime_pm idle to check for display connected, but there
> are so many cases where the code take different decisions if runtime_pm
> is in-use vs not that it would complicate things a bit anyway.
> 
>>
>>>
>>> Also worth to mention that on i915, intel_display_power_put_async_work
>>> also gets and resume synchronously and the runtime pm get/put
>>> also resets the irq and that code was never problematic.
>>>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_pm.c | 7 +++++--
>>>    1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>>> index b534a194a9ef..919250e38ae0 100644
>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>> @@ -347,7 +347,10 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>>    			goto out;
>>>    	}
>>> +	lock_map_release(&xe_pm_runtime_lockdep_map);
>>>    	xe_irq_suspend(xe);
>>> +	xe_pm_write_callback_task(xe, NULL);
>>> +	return 0;
>>>    out:
>>>    	lock_map_release(&xe_pm_runtime_lockdep_map);
>>>    	xe_pm_write_callback_task(xe, NULL);
>>> @@ -369,6 +372,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>>    	/* Disable access_ongoing asserts and prevent recursive pm calls */
>>>    	xe_pm_write_callback_task(xe, current);
>>> +	xe_irq_resume(xe);
>>> +
>>>    	lock_map_acquire(&xe_pm_runtime_lockdep_map);
>>>    	/*
>>> @@ -395,8 +400,6 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>>    			goto out;
>>>    	}
>>> -	xe_irq_resume(xe);
>>> -
>>>    	for_each_gt(gt, xe, id)
>>>    		xe_gt_resume(gt);
