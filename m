Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4D860A2605
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 12:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EofktGYX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1AC110E40B;
	Tue, 27 Oct 2026 12:42:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD9A10E40B
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 12:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793104939; x=1824640939;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=NMEa5vWU4ZlNJLykssghl9O3s6Ml6pgdhRGqV7VPbts=;
 b=EofktGYXXZJqhklz0WdIAtoHHhE+ceb17RN3HF0G98bNdt0bXPhQaA8S
 RVe21M1VpOr/jh7rVrYJCKpsKlMe7tEakjLi3GXJRqSr+2aUHABKzvGjQ
 B7Ju6GOEQtV8sO42o5a/UDLnPZX8zEkF8SRlPhcbez8ViVTHiA0za+DfE
 eJXRndLM44lOMsI7+63OkikLnHACbFXYJAe90BrKyilG9tE/fqbun2r//
 +/HmQ1ZqM34W6uvqDgS7vViUN755l0yGxIzxG+OBEzmE4qPPyRgA3csjP
 9obz5J6R6abVLTI8juxcJvvQiu3Oq2LQHweimuqLl+Dy3N7zbdfsgJ6Hv g==;
X-CSE-ConnectionGUID: 2Vmk2BsVSWyxbsXldP0q4g==
X-CSE-MsgGUID: mRI1HDDAQN2GVNVZaqwdzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1790041"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1790041"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 05:42:18 -0700
X-CSE-ConnectionGUID: dSeO7xJfQMOp0jxELMjmdw==
X-CSE-MsgGUID: QgWc/OjfSbaLYded+0PQLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4556012"
Received: from abityuts-desk1.ger.corp.intel.com (HELO [10.245.244.18])
 ([10.245.244.18])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 05:42:16 -0700
Message-ID: <bfb62b44-5fcb-4a41-8dc8-c917d9687d28@intel.com>
Date: Tue, 27 Oct 2026 12:42:13 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/sa: make suballocator waits uninterruptible
From: Matthew Auld <matthew.auld@intel.com>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
References: <20261022174058.226432-4-matthew.auld@intel.com>
 <20261022174058.226432-5-matthew.auld@intel.com>
 <45831f6088cde19e2885cbbde52574da8a595e18.camel@linux.intel.com>
 <3c39fc90-de66-44a6-936e-06a69219f7af@intel.com>
Content-Language: en-GB
In-Reply-To: <3c39fc90-de66-44a6-936e-06a69219f7af@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/10/2026 10:32, Matthew Auld wrote:
> Hi,
> 
> On 22/10/2026 19:29, Thomas Hellström wrote:
>> Hi, Matt
>>
>> On Thu, 2026-10-22 at 18:41 +0100, Matthew Auld wrote:
>>> Large BO clears and copies in xe_migrate_clear() and
>>> xe_migrate_copy()
>>> are split into multiple passes, each needing a batchbuffer from the
>>> fixed size kernel bb pool. Once the pool fills up, __xe_sa_bo_new()
>>> waits interruptibly for space, so a pending signal (e.g. Xorg's 5ms
>>> SIGALRM smart-scheduler timer) makes it fail mid-loop with -
>>> ERESTARTSYS.
>>> The partial progress is then thrown away and the restarted ioctl
>>> starts
>>> again from byte 0, including the memory allocation, which can
>>> livelock
>>> if the signal arrives faster than the whole operation completes. In
>>> the
>>> shrinker path the same error also aborts the shrinker walk, even
>>> though
>>> ctx->interruptible is false.
>>>
>>> Being interruptible here doesn't seem to buy much anyway: on error
>>> the loop already waits uninterruptibly for all submitted passes
>>> before
>>> returning. So just make the suballocator waits uninterruptible,
>>> matching
>>> amdgpu and radeon. The other users (page reclaim from a kworker, and
>>> the
>>> GuC buffer cache) shouldn't really see any meaningful change.
>>
>> This is a deviation from the "make all waits possible interruptible".
>> One might argue that user-space that interrupts kernel work with a 5ms
>> time only to restart it again and again is not well-behaving and
>> continously shoots itself in the foot.
> 
> Maybe. This is the xserver, so I assume this is very old and not some 
> new thing. I feel like even in this situation the kernel should be able 
> to make some forward progress in the ioctl.
> 
>>
>> Given our pipelining abilities, isn't there a risk that we delay signal
>> delivery with up to 10s?
> 
> At least for the copy/clear, it looks like there is already an 
> uninterruptible wait on the err path if fence != NULL, which we trigger 
> on a signal.
> 
>>
>> In the worst case, is there a way we can periodically at least check
>> for pending signals or perhaps increase the sa bo size so that it
>> doesn't block on a single large buffer?
> 
> Other idea is to expose the intr, and then maybe plumb down the ctx- 
>  >interruptible somehow, which would then cover the shrinker case and 
> maybe other places like that which explicitly asked for that? For the 
> clear case (gem_create) maybe we check if the fence != NULL first and 
> then set intr accordingly? If we have a pending signal it would bail if 
> we have not started GPU clearing yet, but if we have started then we try 
> to finish? The error path will currently do an uninterruptible wait 
> anyway, and that one could be a lot worse for a big buffer, since it 
> drains ALL prior jobs, instead of just waiting for the oldest bb. And 
> here it might be that we got right to the tail end of the clears but we 
> got a signal, so we throw away all of that work.
> 
> Increasing the sa bo is also an option (maybe both). Although I guess 
> there will likely still be something too big, and I guess we might still 
> see issues if the pool is still busy with other pending work?

Some more thoughts. Since Matt nuked the vm_bind GPU path, I don't think 
there is much contention on the reserved bcs any more since there is 
just one migrate queue (?), so maybe we can also:

1. Bump the VRAM clear + identity path. 8M is maybe very pessimistic 
now? Maybe we could push a lot more work per MEM_SET + page mode here? 
This could also give more perf, with a lot fewer jobs for 1G+ buffers. I 
have seen llama.py with 5G+ gemma model use 1G+ buffer on my BMG, for 
example.

2. Maybe also pack more work per-bb, at least for identity? Each new bb 
eats up a bunch of padding for pre-fetch etc.

> 
>>
>> /Thomas
>>
>>>
>>> Assisted-by: LLM
>>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9644
>>> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
>>> GPUs")
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: <stable@vger.kernel.org> # v6.12+
>>> ---
>>>   drivers/gpu/drm/xe/xe_sa.c | 5 +++--
>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
>>> index f32045f40b7a..d9c2b28b08c2 100644
>>> --- a/drivers/gpu/drm/xe/xe_sa.c
>>> +++ b/drivers/gpu/drm/xe/xe_sa.c
>>> @@ -165,7 +165,8 @@ void xe_sa_bo_sync_shadow(struct drm_suballoc
>>> *sa_bo)
>>>    * @size: number of bytes we want to suballocate
>>>    * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL.
>>>    *
>>> - * Try to make a suballocation of size @size.
>>> + * Try to make a suballocation of size @size. Any waits for space
>>> are
>>> + * uninterruptible.
>>>    *
>>>    * Return: a &drm_suballoc, or an ERR_PTR.
>>>    */
>>> @@ -178,7 +179,7 @@ struct drm_suballoc *__xe_sa_bo_new(struct
>>> xe_sa_manager *sa_manager, u32 size,
>>>       if (size > sa_manager->base.size)
>>>           return ERR_PTR(-ENOBUFS);
>>> -    return drm_suballoc_new(&sa_manager->base, size, gfp, true,
>>> 0);
>>> +    return drm_suballoc_new(&sa_manager->base, size, gfp, false,
>>> 0);
>>>   }
>>>   /**
> 

