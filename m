Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9217EDF161
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 13:27:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F7810E2F4;
	Fri, 13 Feb 2026 13:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RqkYxAGM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA6510E2F1
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 13:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770989266; x=1802525266;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ND+CX52VNYQAFqKy0CuAaERApgzra2XZE1634QnulZg=;
 b=RqkYxAGMNuopDqPbxgFtDqV3KG5ZNMcziUpxueLMirjLW0hcVDiDPyxQ
 fwNwSQ2mCtzqg4MeFMGj9CO3ZUBP4PxXp8gmkyqN7frx1/5YMDHzXNpSx
 LtEGU9SZwwg/q8kRxvWu2gUGCihvuKcvM79yIHvcwjoriDJdjb5A/Rizs
 RNO+InEEHlnlECy/+B3xiuclhbMAC7TTDlyqBevTlFSDjhHRwnkipS3gE
 XeK76/GivzD51OTg0rvOwBBb0BfGmS2QFkw0umMQOdBhvgjYft6rJbAL3
 Bv2XOtUu1EzKNAXxCNR04NAlVzwkTAN1rPvl4xcFEDSO6Kj+5hDsdyfyK w==;
X-CSE-ConnectionGUID: oZxauF8fToiIUzLwZpOHSw==
X-CSE-MsgGUID: JjtlH/b2SrWV44aXX5koWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72066440"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72066440"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 05:27:46 -0800
X-CSE-ConnectionGUID: 7XYxU8GSQPOvo6vO7+BjCg==
X-CSE-MsgGUID: nLZVTTG8RI+q3WbMyJdBbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="217395243"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.47])
 ([10.245.244.47])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 05:27:44 -0800
Message-ID: <13ef6a14-ce90-4bd9-bfb0-abbf182a76a1@intel.com>
Date: Fri, 13 Feb 2026 13:27:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/xe3p_lpg: flush userptr/shrinker bo cachelines
 manually
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "Mrozek, Michal" <michal.mrozek@intel.com>,
 "Souza, Jose" <jose.souza@intel.com>
References: <20260210125120.1329411-5-tejas.upadhyay@intel.com>
 <20260210125120.1329411-6-tejas.upadhyay@intel.com>
 <20260210210525.GC4694@mdroper-desk1.amr.corp.intel.com>
 <aYvHCeTd5pOFo2p5@lstrano-desk.jf.intel.com>
 <SJ1PR11MB6204CD2B54AD51B175F96F298163A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <20260211211125.GL4694@mdroper-desk1.amr.corp.intel.com>
 <9848ee6e-a026-46d9-87e1-fa4a2f8a57d2@intel.com>
 <SJ1PR11MB62041354C501EB4F02D78E628161A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <SJ1PR11MB62041354C501EB4F02D78E628161A@SJ1PR11MB6204.namprd11.prod.outlook.com>
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

On 13/02/2026 11:17, Upadhyay, Tejas wrote:
> + Michal
> 
>> -----Original Message-----
>> From: Auld, Matthew <matthew.auld@intel.com>
>> Sent: 12 February 2026 15:24
>> To: Roper, Matthew D <matthew.d.roper@intel.com>; Upadhyay, Tejas
>> <tejas.upadhyay@intel.com>
>> Cc: Brost, Matthew <matthew.brost@intel.com>; intel-
>> xe@lists.freedesktop.org; thomas.hellstrom@linux.intel.com
>> Subject: Re: [PATCH 1/3] drm/xe/xe3p_lpg: flush userptr/shrinker bo
>> cachelines manually
>>
>> On 11/02/2026 21:11, Matt Roper wrote:
>>> On Wed, Feb 11, 2026 at 07:06:05PM +0000, Upadhyay, Tejas wrote:
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: Brost, Matthew <matthew.brost@intel.com>
>>>>> Sent: 11 February 2026 05:32
>>>>> To: Roper, Matthew D <matthew.d.roper@intel.com>
>>>>> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>>>>> xe@lists.freedesktop.org; Auld, Matthew <matthew.auld@intel.com>;
>>>>> thomas.hellstrom@linux.intel.com
>>>>> Subject: Re: [PATCH 1/3] drm/xe/xe3p_lpg: flush userptr/shrinker bo
>>>>> cachelines manually
>>>>>
>>>>> On Tue, Feb 10, 2026 at 01:05:25PM -0800, Matt Roper wrote:
>>>>>> On Tue, Feb 10, 2026 at 06:21:22PM +0530, Tejas Upadhyay wrote:
>>>>>>> "eXtended Architecture" (XA) tagged memory—memory shared
>> between
>>>>> the
>>>>>>> CPU and GPU
>>>>>>
>>>>>> I'm pretty sure this expansion of "XA" is wrong; where are you
>>>>>> seeing this definition?  Everything in the bspec indicates that XA
>>>>>> means "wb
>>>>>> - transient app" (similar to how "XD" is 'wb - transient display").
>>>>>> I'm not sure why exactly they picked "X" to refer to transient in
>>>>>> both of these cases, but I've never seen any documentation that
>>>>>> refers to it as "extended."
>>>>>>
>>>>>>> is treated differently from other GPU memory when the Media engine
>>>>>>> is
>>>>> power-gated.
>>>>>>>
>>>>>>> XA is *always* flushed, like at the end-of-submssion (and maybe
>>>>>>> other
>>>>>>
>>>>>> I assume you're referring to the fact that the driver performs
>>>>>> flushes at the end of submission (via PIPE_CONTROL or MI_FLUSH_DW),
>>>>>> and that depending on other state/optimizations in the system,
>>>>>> those flushes may flush the entire device cache, or may only flush
>>>>>> the subset of cache data that is not marked as transient.  The way
>>>>>> you worded this was confusing since it makes it sound like cache
>>>>>> flushes happen automatically somewhere in hardware/firmware.
>>>>>>
>>>>>>> places), just that internally as an optimisation hw doesn't need
>>>>>>> to make that a full flush (which will also include XA) when Media
>>>>>>> is off/powergated, since it doesn't need to worry about GT caches
>>>>>>> vs Media coherency, and only CPU vs GPU coherency, so can make
>>>>>>> that flush a targeted XA flush, since stuff tagged with XA now
>>>>>>> means it's shared with the CPU. The main implication is that we
>>>>>>> now need to somehow flush non-XA before freeing system memory
>>>>>>> pages, otherwise dirty cachelines could be flushed after the free
>>>>>>> (like if Media suddenly turns on and does a full flush)
>>>>>>
>>>>>> This description seems really confusing.  My understanding is that
>>>>>> marking something as wb-transient-app indicates that it might be
>>>>>> accessed by something other than our graphics/media IP (i.e.,
>>>>>> accessed from the CPU, exported to another device, etc.), so
>>>>>> transient data truly does need to be flushed at the points in the
>>>>>> driver where a flush typically happens.
>>>>>>
>>>>>> However when something is _not_ transient, then either:
>>>>>>    - it's "private" to the GPU and only our graphics/media IP will be
>>>>>>      accessing it
>>>>>>    - it's bound with a coherent PAT index so that outside observers like
>>>>>>      the CPU can snoop the device cache, even when the cache hasn't been
>>>>>>      flushed
>>>>>>
>>>>>> If media is not active, then there's really no need to include
>>>>>> non-transient data when an device cache flush happens since there's
>>>>>> no real need for the data to get to RAM.  So that enables an
>>>>>> optimization (which comes in your next patch), that allows flushes
>>>>>> to only operate on the subset of the device cache tagged as "transient" if
>> media is idle.
>>>>
>>>> But what If we have stale non-XA marked pages for userptr, and that
>>>> object moves out and at the same time media comes back, will end up
>>>> in full flush and flush the stale entry to RAM.
>>>
>>> What makes userptr special here?  During general, active usage,
>>> userptr would be data that's accessible by the CPU, so it needs to
>>> either be transient (so CPU can see the data in RAM after explicit
>>> flushes) or it needs to be using a coherent PAT (so that the CPU can
>>> just snoop the GPU cache).  If you marked userptr as both non-XA and
>>> non-coherent, then that sounds likely to be a userspace bug (and
>>> probably something we can catch and reject as an invalid case on any
>>> Xe3p or later platforms that support this) since the CPU wouldn't have
>>> any reliable way of seeing GPU updates.
>>>
>>> If something happens that changes the GTT mapping of an object, then
>>> doesn't that already trigger a TLB invalidation when necessary in the
>>> driver today?  It was my understanding that "heavy" TLB invalidations
>>> wait for data values to be globally observable before starting, so I
>>> think that would ensure that any non-XA data makes it to RAM before
>>> any binding changes, object, destruction, etc.?  Is there something
>>> special about userptr that makes that case more of a problem?
>>>
>>> I just found bspec page 74635 which gives an overview of the various
>>> flush and invalidate cases, and I don't see anything there that makes
>>> it obvious to me that userptr would be special.
>>>
>>>
>>>>
>>>>>>
>>>>>> As you said, we eventually do want to force a flush of the
>>>>>> non-transient data as well once we're freeing the underlying pages.
>>>>>> So how do we do that?  It's not clear to me how the changes below
>>>>>> are accomplishing that.  Is there a way to explicitly request a
>>>>>> full device cache flush (ignoring the transient vs non-transient tagging)?
>>>>>> Since the GuC handles the optimization in the next patch (toggling
>>>>>> whether flushes are full flushes vs non-transient flushes depending
>>>>>> on whether media is active), I thought there might be some kind of
>>>>>> GuC interface to request "please do one full flush now, even if media is
>> idle."
>>>>>>
>>>>>
>>>>> I’m not an expert here by any means, but everything above from Matt
>>>>> seems like valid concerns. Thomas also raised some concerns in the
>>>>> two previous revisions; again I’m not an expert, but reading through
>>>>> those, it doesn’t really seem like he received proper answers to his
>> questions.
>>>>
>>>> Its forcing flush via tlb invalidation PPC flag under xe_invalidate_vma( ).
>>>
>>> By the way, what is "PPC?"  It seems like it's another new synonym for
>>> the device cache?  It's already really confusing that some of our
>>> hardware docs use a mix of both "L2" and "L3" to refer to the same
>>> device cache for historical reasons...
>>
>> Private-physical-cache. It's just what hw side calls the device side
>> l2/l3 on newer igpu (I think LNL+). I assume it is quite different from the
>> implemetation on dgpu, from HW pov, which is maybe why is has a special
>> name. On dgpu they just refer to it as plain l2/l3, not PPC. On dgpu there is
>> also additional SMRO (system-memory-read-only) device cache, which I
>> assume is caching reads over pci to system memory from GPU side, but that
>> gets flushed at the usual places, like end of submission etc. Setting the PPC bit
>> on Guc TLB inval will only flush SMRO on dgpu.
> 
> I had conversation with Michal and also had confirmation from Jose about their usage of pat_index for userptr, just summarising it below :
> 
> UMD Compute, with userptr :
> - Uses pat_index 19 (which is App-transient(XA) and 1Way-coh)
> - Flushing :  will be taken care by app-transient ability in HW if media is off, if media is on full flush anyways will happen.
> 
> Mesa, with userptr:
> - Use 2way-coh
> - Flushing : 2 way Coherency will take care
> 
> With above understanding it seems we can drop this patch as its not needed, instead we need to have new patch to validate if right pat-index coherency is used and if not used reject the request.

I think that only resolves the userptr side. We still need something for 
eviction/shriker path with normal BOs, which this patch was also trying 
to address, right?

> 
> Tejas
>>
>>>
>>>
>>> Matt
>>>
>>>>
>>>>>
>>>>> A couple of comments below.
>>>>>
>>>>>>
>>>>>> Matt
>>>>>>
>>>>>>>
>>>>>>> V2(MattA): Expand commit description
>>>>>>>
>>>>>>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/xe/xe_bo.c      |  3 ++-
>>>>>>>    drivers/gpu/drm/xe/xe_device.c  | 23 +++++++++++++++++++++++
>>>>>>> drivers/gpu/drm/xe/xe_device.h  |  1 +
>>>>>>> drivers/gpu/drm/xe/xe_userptr.c |  3 ++-
>>>>>>>    4 files changed, 28 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c
>>>>>>> b/drivers/gpu/drm/xe/xe_bo.c index e9180b01a4e4..4455886b211e
>>>>>>> 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>>>>>> @@ -689,7 +689,8 @@ static int xe_bo_trigger_rebind(struct
>>>>>>> xe_device *xe, struct xe_bo *bo,
>>>>>>>
>>>>>>>    		if (!xe_vm_in_fault_mode(vm)) {
>>>>>>>    			drm_gpuvm_bo_evict(vm_bo, true);
>>>>>>> -			continue;
>>>>>>> +			if (!xe_device_needs_cache_flush(xe))
>>>>>>> +				continue;
>>>>>
>>>>> This will trigger a TLB invalidation (and I assume a cache flush)
>>>>> every time we move or free memory in the 3D stack if it has a
>>>>> binding. It also performs a synchronous wait on the BO being idle.
>>>>> Both of these are very expensive operations. I can’t imagine the
>>>>> granularity we want here is to do this on every move/free with bindings.
>>>>>
>>>>> Also, for LR compute with preempt fences, we would trigger the
>>>>> preempt fences during the wait, so a TLB invalidation after this
>>>>> seems unnecessary, though perhaps the cache flush is still required?
>>>>>
>>>>> I think this needs a bit more explanation, because without knowing a
>>>>> lot about the exact requirements, the implementation does not look
>> correct.
>>>>
>>>> The thing is that we are trying to solve problem with userptr with non-XA
>> pat, consider if that BO got moved while media is not active. As soon as media
>> will come back active, stale cached entries of that object will be flushed as part
>> of full flush , which may corrupt things.
>>>> There was thinking that with this patch we would at least solve the problem
>> of corruption and later when page_reclamation feature comes in will help in
>> performance as well. But now when page reclamation feature is merged earlier
>> and it tightly coupled with bind/unbind some cases like discussed above
>> (which are not doing unbind immediately on move/free) are missed in
>> reclamation.
>>>>
>>>> So thought was to let this solution go in with little perf hit and discuss with
>> page reclamation owner to come with cleaner solution together.
>>>>
>>>> Tejas
>>>>>
>>>>>>>    		}
>>>>>>>
>>>>>>>    		if (!idle) {
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>>>>>>> b/drivers/gpu/drm/xe/xe_device.c index
>> 743c18e0c580..da2abed94bc0
>>>>>>> 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>>>>> @@ -1097,6 +1097,29 @@ static void tdf_request_sync(struct
>>>>>>> xe_device
>>>>> *xe)
>>>>>>>    	}
>>>>>>>    }
>>>>>>>
>>>>>>> +/**
>>>>>>> + * xe_device_needs_cache_flush - Whether the cache needs to be
>>>>>>> +flushed
>>>>>>> + * @xe: The device to check.
>>>>>>> + *
>>>>>>> + * Return: true if the device needs cache flush, false otherwise.
>>>>>>> + */
>>>>>>> +bool xe_device_needs_cache_flush(struct xe_device *xe) {
>>>>>>> +	/* XA is *always* flushed, like at the end-of-submssion (and
>>>>>>> +maybe
>>>>> other
>>>>>>> +	 * places), just that internally as an optimisation hw doesn't
>>>>>>> +need to
>>>>> make
>>>>>>> +	 * that a full flush (which will also include XA) when Media is
>>>>>>> +	 * off/powergated, since it doesn't need to worry about GT
>>>>>>> +caches vs
>>>>> Media
>>>>>>> +	 * coherency, and only CPU vs GPU coherency, so can make that
>>>>>>> +flush
>>>>> a
>>>>>>> +	 * targeted XA flush, since stuff tagged with XA now means it's
>>>>>>> +shared
>>>>> with
>>>>>>> +	 * the CPU. The main implication is that we now need to somehow
>>>>> flush non-XA before
>>>>>>> +	 * freeing system memory pages, otherwise dirty cachelines could
>>>>>>> +be
>>>>> flushed after the free
>>>>>>> +	 * (like if Media suddenly turns on and does a full flush)
>>>>>>> +	 */
>>>>>>> +	if (GRAPHICS_VER(xe) >= 35 && !IS_DGFX(xe))
>>>>>>> +		return true;
>>>>>>> +	return false;
>>>>>>> +}
>>>>>>> +
>>>>>>>    void xe_device_l2_flush(struct xe_device *xe)  {
>>>>>>>    	struct xe_gt *gt;
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_device.h
>>>>>>> b/drivers/gpu/drm/xe/xe_device.h index
>> 39464650533b..baf386e0e037
>>>>>>> 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_device.h
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_device.h
>>>>>>> @@ -184,6 +184,7 @@ void xe_device_snapshot_print(struct
>> xe_device
>>>>>>> *xe, struct drm_printer *p);
>>>>>>>    u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
>>>>>>>    u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64
>>>>>>> address);
>>>>>>>
>>>>>>> +bool xe_device_needs_cache_flush(struct xe_device *xe);
>>>>>>>    void xe_device_td_flush(struct xe_device *xe);  void
>>>>>>> xe_device_l2_flush(struct xe_device *xe);
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_userptr.c
>>>>>>> b/drivers/gpu/drm/xe/xe_userptr.c index
>> e120323c43bc..b435ea7f9b66
>>>>>>> 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_userptr.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_userptr.c
>>>>>>> @@ -114,7 +114,8 @@ static void __vma_userptr_invalidate(struct
>>>>>>> xe_vm
>>>>> *vm, struct xe_userptr_vma *uv
>>>>>>>    				    false, MAX_SCHEDULE_TIMEOUT);
>>>>>>>    	XE_WARN_ON(err <= 0);
>>>>>>>
>>>>>>> -	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
>>>>>>> +	if ((xe_vm_in_fault_mode(vm) || xe_device_needs_cache_flush(vm-
>>>>>> xe)) &&
>>>>>>> +	    userptr->initial_bind) {
>>>>>
>>>>> Same concern with the LR preempt fence as above — the hardware will
>>>>> be interrupted via preempt fences, so it doesn’t seem necessary to
>>>>> invalidate the TLBs but perhaps we need a cflush and TLB
>>>>> invalidation is the mechanism for that too?
>>>>>
>>>>> Matt
>>>>>
>>>>>>>    		err = xe_vm_invalidate_vma(vma);
>>>>>>>    		XE_WARN_ON(err);
>>>>>>>    	}
>>>>>>> --
>>>>>>> 2.52.0
>>>>>>>
>>>>>>
>>>>>> --
>>>>>> Matt Roper
>>>>>> Graphics Software Engineer
>>>>>> Linux GPU Platform Enablement
>>>>>> Intel Corporation
>>>
> 

