Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5152DC6FD1F
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 12:18:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB8E10E930;
	Wed, 22 Mar 2023 12:18:07 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487EE10E930
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Mar 2023 12:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679487485; x=1711023485;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xdGVYWSOr3zgv88BE9hGQx3RloFc9BOHCKOd9HAuUEQ=;
 b=edHVqRHGWr4WCfGtKBjT03/zyVlX8QxJ7NkV0c7X2gPjtNybyVh4BzYu
 GrGmnJBoNpxcYXTufloQrrhUDJS+bYNo7LkM4JcxDiqqtUS/YbFTCqMjw
 MuL/F0SgGdKersWoBHOSJwPp48bcPKNC51qeJ58CgfxGmrucoCuQdR0+i
 2DK1xNEUaXFsZMNOUZKsB3e7bKGWHwSnItJVMW/k3HzdHUSAef7IZTDXb
 rCuUko3F9TK7XJwIev9dQUk2CrlneuUG4EMDOPhASoC3Wa2oVLSpdkHA8
 vWFmch6koj5LNH1Z/rTjEB1hb6wd+EUv/omgXyMo8cM4+8/mtX69u4vSE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="425484321"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="425484321"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 05:18:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="675240933"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="675240933"
Received: from mryzhov-mobl2.ger.corp.intel.com (HELO [10.251.222.140])
 ([10.251.222.140])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 05:18:03 -0700
Message-ID: <69993c89-ad7b-4742-d126-a29213649a1e@linux.intel.com>
Date: Wed, 22 Mar 2023 13:18:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20230317002221.211065-1-matthew.brost@intel.com>
 <f85589d5-b3ac-89c8-6a24-9c51d10d3710@linux.intel.com>
 <ZBnAdXk4+Idtg9lo@DUT025-TGLU.fm.intel.com> <ZBoeHi82lpK+w0vg@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <ZBoeHi82lpK+w0vg@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix locking in CT fast path
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

Hey,

On 2023-03-21 22:14, Rodrigo Vivi wrote:
> On Tue, Mar 21, 2023 at 02:34:29PM +0000, Matthew Brost wrote:
>> On Tue, Mar 21, 2023 at 01:25:51PM +0100, Maarten Lankhorst wrote:
>>> Hey,
>>>
>>> I'm afraid this is not allowed, you can't take a mutex in an irq handler, not even a trylock.
>>>
>>>  From Documentation/locking/mutex-design.rst:
>>>
>>> The mutex subsystem checks and enforces the following rules:
>>> ...
>>>      - Mutexes may not be used in hardware or software interrupt
>>>        contexts such as tasklets and timers.
>>>
>> I wasn't aware of this byr DOC makes it clear this isn;t allowed.
>>
>>> Lockdep will likely still splat too as a result.
>>>
>> Lockdep is happy which is very odd since clearly this isn't allowed per
>> the DOC.
> This is strange... in general it is loud when you try mutex inside irq.
> some .config missing? or maybe the trylock itself misleading lockdep?!
It's not allowed because of PREEMPT_RT, which is upstream. The mutex is 
swapped with a PI-mutex, and if the irq is triggered from idle, anyone 
may boost the idle task.
>> Anyways, I'm thinking your atomic fix is needed
> Yes, this is becoming un-avoidable. I would prefer some lock than atomic.
> Maybe a spinlock?
> Or we need to be really sure that there won't be any race where we end
> with an access before the wakeup.
>
> The runtime_pm doc even suggest that all the memory accesses should be
> serialized instead of what we are trying to do currently with the
> mem_access. Thoughts on if it is possible to serialize them on our cases?
>
> check for the 'foo_' examples at Documentation/power/runtime_pm.txt

I think the current xe_device_mem() is possibly too generic. We should 
check for what usecases the workaround is required, and we could use 
several mechanisms to prevent the need for 1 all-encompassing workaround 
implementation.

For example runtime pm could be used for jobs and job completion, which 
makes most sense there, same probably for active mmapings.

By looking at them separately, it might be possible to come up with 
something more suitable and granular.

~Maarten

>> but likely also need a
>> follow on to this patch as well something like:
>>
>> xe_device_mem_access_get_if_active();
> hmmm... I didn't want to grow the mem_access into an rpm wrapper for all
> cases like we ended up in i915... but this might be unavoidable for this
> case...
>
>> do CT fast path...
>> xe_device_mem_access_put_async();
>>
>> The key being we can't sleep but also can't power down access to the
>> VRAM when the CT fast path is executing.
>>
>> Matt
>>
>>> Cheers,
>>> ~Maarten
>>>
>>> On 2023-03-17 01:22, Matthew Brost wrote:
>>>> We can't sleep in the CT fast but need to ensure we can access VRAM. Use
>>>> a trylock + reference counter check to ensure safe access to VRAM, if
>>>> either check fails, fall back to slow path.
>>>>
>>>> VLK-45296
>>>>
>>>> Signed-off-by: Matthew Brost<matthew.brost@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_device.h |  9 ++++++++-
>>>>    drivers/gpu/drm/xe/xe_guc_ct.c | 11 ++++++++++-
>>>>    2 files changed, 18 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>>>> index 25c5087f5aad..0cc4f52098a1 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device.h
>>>> +++ b/drivers/gpu/drm/xe/xe_device.h
>>>> @@ -95,12 +95,19 @@ static inline void xe_device_assert_mem_access(struct xe_device *xe)
>>>>    	XE_WARN_ON(!xe->mem_access.ref);
>>>>    }
>>>> +static inline bool __xe_device_mem_access_ongoing(struct xe_device *xe)
>>>> +{
>>>> +	lockdep_assert_held(&xe->mem_access.lock);
>>>> +
>>>> +	return xe->mem_access.ref;
>>>> +}
>>>> +
>>>>    static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
>>>>    {
>>>>    	bool ret;
>>>>    	mutex_lock(&xe->mem_access.lock);
>>>> -	ret = xe->mem_access.ref;
>>>> +	ret = __xe_device_mem_access_ongoing(xe);
>>>>    	mutex_unlock(&xe->mem_access.lock);
>>>>    	return ret;
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> index e5ed9022a0a2..bba0ef21c9e5 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> @@ -1030,9 +1030,15 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
>>>>    	struct xe_device *xe = ct_to_xe(ct);
>>>>    	int len;
>>>> -	if (!xe_device_in_fault_mode(xe) || !xe_device_mem_access_ongoing(xe))
>>>> +	if (!xe_device_in_fault_mode(xe))
>>>>    		return;
>>>> +	if (!mutex_trylock(&xe->mem_access.lock))
>>>> +		return;
>>>> +
>>>> +	if (!__xe_device_mem_access_ongoing(xe))
>>>> +		goto unlock;
>>>> +
>>>>    	spin_lock(&ct->fast_lock);
>>>>    	do {
>>>>    		len = g2h_read(ct, ct->fast_msg, true);
>>>> @@ -1040,6 +1046,9 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
>>>>    			g2h_fast_path(ct, ct->fast_msg, len);
>>>>    	} while (len > 0);
>>>>    	spin_unlock(&ct->fast_lock);
>>>> +
>>>> +unlock:
>>>> +	mutex_unlock(&xe->mem_access.lock);
>>>>    }
>>>>    /* Returns less than zero on error, 0 on done, 1 on more available */
