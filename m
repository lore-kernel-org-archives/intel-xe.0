Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A59BC7EE22
	for <intel-xe@archiver.kernel.org>; Mon, 15 May 2023 09:22:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B55810E192;
	Mon, 15 May 2023 09:22:30 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F287210E192
 for <intel-xe@lists.freedesktop.org>; Mon, 15 May 2023 09:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684142548; x=1715678548;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9Mobc7WffQy2hj7rOfqMIy42hkAO0cgmugXQNFqJTw0=;
 b=LRvj/i8obmJLRC3nao0K+iaPCGDKrMJD5mZxuRhW2EsIrxIcWNq4D08Z
 NKQ4glYVt+KO6gPnQ53hnUWwWEon2iMyu+ABGbixrDRsyYzEakQsR2I9Y
 pu6QI1CZnd4Avd8GugFkutA5LWYLoAXIkTUQ1fKD6nid6BnuTSkakdrnE
 CkrAiDzEtlidkzQ/yS9G5SfGJsjmxg93Q3HBpWTixW3TtHdXCLjomLirl
 pTgiy0AuBQvb7N8sapBGpNguXrUKtULHzCR7/zKzoHlyDNmajfZyaUf96
 hLhpOgjQ9peRARVCRVvtZsAVkAitBwmRk/Ycro6aippGSh9i3dXDF7dfQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="414550424"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="414550424"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 02:22:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="875115896"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="875115896"
Received: from cstoita-mobl.ger.corp.intel.com (HELO [10.249.254.124])
 ([10.249.254.124])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 02:22:25 -0700
Message-ID: <0bbe5a45-e908-bbf0-a553-d9f09a9ab4f4@linux.intel.com>
Date: Mon, 15 May 2023 11:22:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@kernel.org>
References: <20230505153854.343944-1-matthew.auld@intel.com>
 <20230505153854.343944-2-matthew.auld@intel.com>
 <ZFUyhLPt8MmBi+A8@rdvivi-mobl4>
 <0a7f7d48-4423-1187-63d2-dfa6b85beba9@intel.com>
 <ZF5N/a1i34JNnN2x@rdvivi-mobl4>
 <5a00911c-626c-738d-e542-014923fa532d@intel.com>
 <6b7301da-c664-fe89-f4ed-64a390a37d9e@linux.intel.com>
 <09216a54-1a54-9300-2bc4-57e330da37bd@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <09216a54-1a54-9300-2bc4-57e330da37bd@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: fix xe_device_mem_access_get()
 race
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


On 5/15/23 11:04, Matthew Auld wrote:
> On 15/05/2023 09:44, Thomas Hellström wrote:
>> Hi, Matthew,
>>
>> On 5/12/23 17:56, Matthew Auld wrote:
>>> On 12/05/2023 15:32, Rodrigo Vivi wrote:
>>>> On Thu, May 11, 2023 at 12:43:36PM +0100, Matthew Auld wrote:
>>>>> On 05/05/2023 17:44, Rodrigo Vivi wrote:
>>>>>> On Fri, May 05, 2023 at 04:38:53PM +0100, Matthew Auld wrote:
>>>>>>> It looks like there is at least one race here, given that the
>>>>>>> pm_runtime_suspended() check looks to return false if we are in the
>>>>>>> process of suspending the device (RPM_SUSPENDING vs 
>>>>>>> RPM_SUSPENDED). We
>>>>>>> later also do xe_pm_runtime_get_if_active(), but since the 
>>>>>>> device is
>>>>>>> suspending or has now suspended, this doesn't do anything either.
>>>>>>> Following from this we can potentially return from
>>>>>>> xe_device_mem_access_get() with the device suspended or about to 
>>>>>>> be,
>>>>>>> leading to broken behaviour.
>>>>>>>
>>>>>>> Attempt to fix this by always grabbing the runtime ref when our 
>>>>>>> internal
>>>>>>> ref transitions from 0 -> 1, and then wrap the whole thing with 
>>>>>>> a lock
>>>>>>> to ensure callers are serialized.
>>>>>>>
>>>>>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/258
>>>>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/xe/xe_device.c       | 11 +++--------
>>>>>>>    drivers/gpu/drm/xe/xe_device_types.h |  5 ++++-
>>>>>>>    drivers/gpu/drm/xe/xe_pm.c           |  9 ++-------
>>>>>>>    drivers/gpu/drm/xe/xe_pm.h           |  2 +-
>>>>>>>    4 files changed, 10 insertions(+), 17 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c 
>>>>>>> b/drivers/gpu/drm/xe/xe_device.c
>>>>>>> index 01c497bcf9a5..0a18b41a0e1a 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>>>>> @@ -406,17 +406,12 @@ u32 xe_device_ccs_bytes(struct xe_device 
>>>>>>> *xe, u64 size)
>>>>>>>    void xe_device_mem_access_get(struct xe_device *xe)
>>>>>>>    {
>>>>>>> -    bool resumed = xe_pm_runtime_resume_if_suspended(xe);
>>>>>>> -
>>>>>>>        mutex_lock(&xe->mem_access.lock);
>>>>>>> -    if (xe->mem_access.ref++ == 0)
>>>>>>> -        xe->mem_access.hold_rpm = xe_pm_runtime_get_if_active(xe);
>>>>>>> +    if (xe->mem_access.ref == 0)
>>>>>>> +        xe->mem_access.hold_rpm = 
>>>>>>> xe_pm_runtime_resume_and_get(xe);
>>>>>>> +    xe->mem_access.ref++;
>>>>>>
>>>>>> my memory is good to the point that I have tried this before...
>>>>>> but not good enough to remember the issues that I got with this
>>>>>> approach :(
>>>>>
>>>>> Ok, it seems one big issue is around xe_pm_runtime_resume() et al. 
>>>>> The lock
>>>>> fixes all the races, but xe_pm_runtime_resume() seems to call
>>>>> xe_device_mem_access_{get,put}() in loads of places AFAICT, but 
>>>>> that is ofc
>>>>> going to deadlock if we introduce a lock, since we are inside the 
>>>>> callback.
>>>>> But I think even without that lock it will still deadlock, since the
>>>>> runtime_pm code will see that we are PM_RESUMING and wait for 
>>>>> itself. I'm
>>>>> guessing that explains why we had the conditional 
>>>>> pm_runtime_suspended() and
>>>>> if_active(), since that prevents triggering the runtime_pm from our
>>>>> callbacks (we will either be PM_SUSPENDING or PM_RESUMING),
>>>>
>>>> Yes, that was the goal.
>>>>
>>>>> but then we are
>>>>> ofc left with all the nasty races.
>>>>
>>>> :(
>>>>
>>>>> Any ideas? It seems like the
>>>>> resume/suspend callbacks should fundamentally never be calling
>>>>> xe_device_mem_access_{get,put}()?
>>>>
>>>> We probably need something like the pseudo code in the end of
>>>> Documentation/power/runtime_pm.rst
>>>
>>> IIUC that looks like a template for where you have lots of incoming 
>>> IO requests, and you want to process them in an async manner. But to 
>>> process the request you need to also keep the device awake and 
>>> ensure it has resumed, so here it makes sense to use the RPM_ASYNC 
>>> runtime_get. And then in the ->resume() callback it then has a 
>>> natural place to at some later point process the outstanding IO 
>>> requests.
>>>
>>> But for xe_device_mem_access_get() I don't think it can be async, 
>>> since we need to ensure the ->resume() callback has already 
>>> completed before returning to the caller. From the pov of 
>>> xe_device_mem_access_get() it doesn't know if it's being called from 
>>> ->resume() or some other normal path and yet it seems like it 
>>> somehow needs to differentiate them. I feel like either the 
>>> ->resume() should never have been allowed to call it in the first 
>>> place, or there needs to be some token that always gets passed around.
>>>
>>> But maybe I'm misunderstanding something here, or at least I'm not 
>>> currently seeing the connection with the pseudo code? Can you share 
>>> more?
>>
>> Some fly-by ideas here:
>>
>> With the variant we briefly discussed before, to only lock during 0-1 
>> and 1-0 transitions, using atomic_inc_not_zero() and 
>> atomic_add_unless() then the get() problem goes out of the way, but 
>> any recursive get() and put() during put()->suspend will then cause 
>> similar problems?
>
> Yeah, I was thinking something like that, but AFAICT the runtime_pm 
> code will see that it is already in a PM_RESUMING state and wait for 
> itself to exit from that state, which also deadlocks.

Ah, ok, yes everything except the recursive calls from resume() needs to 
wait for PM_RESUMING to work correctly?

>
>>
>> While a bit hacky, that could probably be solved having an
>>
>> xe_device::suspending_task set and cleared by the suspending task and 
>> then use
>>
>> if (xe->suspending_task == current)
>
> I didn't think of that tbh. Does seem hacky, but I think should work, 
> and perhaps fine for now?
>
Yes, I guess it has to be, at least until we come up with something better.

/Thomas


>>
>> to skip pm calls during suspend. Assuming of course that all 
>> suspend() task for a single device are never run concurrently.
>
> Yes, AFAICT only one resume or suspend callback can be running for a 
> device, until we exit from PM_SUSPENDING or PM_RESUMING.
>
>>
>> /Thomas
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>>> mutex_unlock(&xe->mem_access.lock);
>>>>>>> -    /* The usage counter increased if device was immediately 
>>>>>>> resumed */
>>>>>>> -    if (resumed)
>>>>>>> -        xe_pm_runtime_put(xe);
>>>>>>> -
>>>>>>>        XE_WARN_ON(xe->mem_access.ref == S32_MAX);
>>>>>>>    }
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>>>>>>> b/drivers/gpu/drm/xe/xe_device_types.h
>>>>>>> index 59462933f67a..9e37189d5745 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>>>>> @@ -256,7 +256,10 @@ struct xe_device {
>>>>>>>         * triggering additional actions when they occur.
>>>>>>>         */
>>>>>>>        struct {
>>>>>>> -        /** @lock: protect the ref count */
>>>>>>> +        /**
>>>>>>> +         * @lock: Serialize xe_device_mem_access users,
>>>>>>> +         * and protect the below internal state, like @ref.
>>>>>>> +         */
>>>>>>>            struct mutex lock;
>>>>>>>            /** @ref: ref count of memory accesses */
>>>>>>>            s32 ref;
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c 
>>>>>>> b/drivers/gpu/drm/xe/xe_pm.c
>>>>>>> index b7b57f10ba25..b2ffa001e6f7 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>>>>>> @@ -210,14 +210,9 @@ int xe_pm_runtime_put(struct xe_device *xe)
>>>>>>>        return pm_runtime_put_autosuspend(xe->drm.dev);
>>>>>>>    }
>>>>>>> -/* Return true if resume operation happened and usage count was 
>>>>>>> increased */
>>>>>>> -bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe)
>>>>>>> +bool xe_pm_runtime_resume_and_get(struct xe_device *xe)
>>>>>>>    {
>>>>>>> -    /* In case we are suspended we need to immediately wake up */
>>>>>>> -    if (pm_runtime_suspended(xe->drm.dev))
>>>>>>> -        return !pm_runtime_resume_and_get(xe->drm.dev);
>>>>>>> -
>>>>>>> -    return false;
>>>>>>> +    return !pm_runtime_resume_and_get(xe->drm.dev);
>>>>>>
>>>>>> now with similar name I feel strange that we are not aligned with 
>>>>>> their
>>>>>> return. Although I prefer our one...
>>>>>>
>>>>>> Anyway, the code is right... if you are testing and it is working 
>>>>>> well
>>>>>> let's move with this.
>>>>>>
>>>>>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>> (for the series)
>>>>>>
>>>>>> but let's get an Ack from Maarten since he was kept as author on 
>>>>>> patch 3
>>>>>> and it is modified from his merged one.
>>>>>>
>>>>>>>    }
>>>>>>>    int xe_pm_runtime_get_if_active(struct xe_device *xe)
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pm.h 
>>>>>>> b/drivers/gpu/drm/xe/xe_pm.h
>>>>>>> index 6a885585f653..1b4c15b5e71a 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_pm.h
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_pm.h
>>>>>>> @@ -19,7 +19,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe);
>>>>>>>    int xe_pm_runtime_resume(struct xe_device *xe);
>>>>>>>    int xe_pm_runtime_get(struct xe_device *xe);
>>>>>>>    int xe_pm_runtime_put(struct xe_device *xe);
>>>>>>> -bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe);
>>>>>>> +bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
>>>>>>>    int xe_pm_runtime_get_if_active(struct xe_device *xe);
>>>>>>>    #endif
>>>>>>> -- 
>>>>>>> 2.40.0
>>>>>>>
