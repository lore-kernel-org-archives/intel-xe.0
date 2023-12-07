Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FEDC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 12:01:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C30810E885;
	Thu,  7 Dec 2023 12:01:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FCFD10E885
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 12:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701950508; x=1733486508;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4SM8Y4BdZydtGUTZlUHfUGfAYd4puZBNNpdTba5KcRI=;
 b=ZsCJ1qefgLrbtwyqypelWlrERKGxYhh8c5TMfIqtAWpkX2acPUn+NpDP
 yyMKX1pbtfHVpBWDIRte63l8UyJohAo5DbpLVoIfgLO60rnuGKYD1pVL1
 ukYSMMJwmR8o5pNOpeyyEZHM8lDIFJefGYorv5x2OCu7ZX7ZKSeJRyhTI
 9EceJnbXHuwR6c6h0V1hxAQ0kMpCkiWoEMlflvCrXYbcCGAn0zifBnY2w
 p4zeeBAAJXgdpxNXCBikhQ/R/QtPp9KbypfWYNWxQeYhbndP05HrCT+Kh
 2OoSrYAibxMCirwQqBjSngghdP9Gs/uuwweACHGU1jUJ2JxcFDRCZOV5H w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="391391648"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="391391648"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 04:01:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="915554997"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="915554997"
Received: from jpoulsen-mobl.ger.corp.intel.com (HELO [10.249.254.234])
 ([10.249.254.234])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 04:01:46 -0800
Message-ID: <7fe7d21d-77fc-6163-47d2-944906974cdb@linux.intel.com>
Date: Thu, 7 Dec 2023 13:01:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-xe] LLC configurating, mmap and bo cache management
 questions
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <02c74379-6513-40cc-a195-c4eeb7a7fd79@linux.intel.com>
 <c16bc9f7bd18f531136ebbcf6504d497db9a793a.camel@intel.com>
 <eaa44445-21e2-4b9f-95a0-6b7395203900@linux.intel.com>
 <36e0e059e0f74ca7c55b2647658456fabe26420d.camel@intel.com>
 <2990cd86-7238-4ea9-a9aa-5ab624bea572@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <2990cd86-7238-4ea9-a9aa-5ab624bea572@linux.intel.com>
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>, "Santa,
 Carlos" <carlos.santa@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 12/7/23 12:11, Tvrtko Ursulin wrote:
>
> On 06/12/2023 11:46, Hellstrom, Thomas wrote:
>> Hi, Tvrtko.
>>
>> On Wed, 2023-12-06 at 10:58 +0000, Tvrtko Ursulin wrote:
>>>
>>> Hi Thomas,
>>>
>>> On 06/12/2023 08:26, Hellstrom, Thomas wrote:
>>>> On Tue, 2023-12-05 at 14:19 +0000, Tvrtko Ursulin wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> We are working on adding xe support to ChromeOS minigbm and have
>>>>> a
>>>>> couple questions.
>>>>>
>>>>> If I follow things correctly with xe mmap caching mode is fixed
>>>>> to
>>>>> object caching modes set at bo create. For framebuffers it will
>>>>> be WC
>>>>> and for the rest userspace can choose WB or WC via
>>>>> drm_xe_gem_create->cpu_caching. (Unless discrete, when WB cannot
>>>>> be
>>>>> used
>>>>> at all.)
>>>>>
>>>>> AFAICT minigbm basically cares about two transition points. Lets
>>>>> call
>>>>> them CPU access begin and end.
>>>>>
>>>>> 1)
>>>>> When a bo is mmapped it wants to invalidate the cache, which
>>>>> looks to
>>>>> be
>>>>> about making sure all GPU writes have landed to the backing
>>>>> store. In
>>>>> the i915 world that translates to the set_domain ioctl.
>>>>>
>>>>> What is the uapi for this with xe, or it is somehow guaranteed to
>>>>> not
>>>>> be
>>>>> needed?
>>>>
>>>> Signalling a user-fence or dma-fence obtained as an out-fence from
>>>> an
>>>> exec call will guarantee GPU caches are flushed. Currently I don't
>>>> think there is anything like gem wait in the uAPI, although Matt is
>>>> just about to add functionality to wait on all outstanding work on
>>>> an
>>>> exec_queue.
>>>
>>> Problem I see is there are no execs or therefore fences in the
>>> minigbm
>>> ABI. It's just buffers, created or imported, CPU access and some
>>> other
>>> stuff.
>>>
>>> And it is quite extensively used in the OS so I assume it has to work
>>> (I
>>> mean the invalidation/flushing was not put in there for no reason),
>>> in
>>> other words, where the i915 backend today does
>>> DRM_I915_GEM_SET_DOMAIN
>>> on "cpu access begin", which is buffer based, I am not clear how to
>>> implement that with xe.
>>>
>>> For the outstanding work you mention, since you say it is about
>>> exec_queue, I assume again it will not work purely with buffers? If
>>> so
>>> it probably won't be useful for minigbm.
>>>
>>> Also if I look at all the other minigbm backends, I see a mix of
>>> behaviours:
>>>
>>>    * msm and vc4 appear to not concern themselves with any of this.
>>>
>>>    * rockchip appears to be doing full bounce buffering via memcpy on
>>> CPU
>>> access begin/end.
>>>
>>>    * i915 and amdgpu respectively use
>>> DRM_I915_GEM_SET_DOMAIN/DRM_AMDGPU_GEM_WAIT_IDLE (also buffer based,
>>> not
>>> execution queue). Andgpu curiously does not do any flushing on CPU
>>> access end.
>>>
>>> Digging into git history, both DRM_I915_GEM_SET_DOMAIN on CPU access
>>> begin and clflushing on end were added to fix various CTS test
>>> failures.
>>> So I guess we could also wait and see what happens there. If those or
>>> some will be failing with xe too then propose adding some new uapi.
>>> Or
>>> if manual testing will start reporting visual corruption in the UI
>>> elements or such.
>>
>> Indeed it sounds like we'd need a DRM_XE_GEM_WAIT_IDLE, similar to
>> AMDGPU for this use-case. I'll bring that up for discussion.
>
> Thanks!
>
>>>>> 2)
>>>>> When a bo is unmapped, or CPU access finished, it wants to flush
>>>>> the
>>>>> CPU
>>>>> caches. That is /almost/ completely a CPU operation, where it
>>>>> just
>>>>> needs
>>>>> to either clflush or invalidate the WC buffer respectively, if
>>>>> not
>>>>> the
>>>>> fact that clflush can be skipped on platforms with LLC.
>>>>>
>>>>> I did not see an equivalent of an I915_PARAM_HAS_LLC in xe? Did I
>>>>> miss
>>>>> it or what it is the plan for querying this detail?
>>>>
>>>> XeKMD is generally coherent, except if UMD selects a GPU PAT index
>>>> with
>>>> limited coherency together with WB instead of WC memory. In that
>>>> case,
>>>> UMD is responsible for doing the needed CLFLUSH-ing, whereas KMD
>>>> only
>>>> ensures initial clearing of the pages is CLFLUSHED for security
>>>> reasons.
>>>>
>>>> I'm not 100% sure if UMD can actually select WB with limited
>>>> coherency
>>>> PAT index in the initial uAPI revision, but Matthew has received
>>>> requests for that so any additional input here on performance
>>>> implications is appreciated.
>>>>
>>>> The thinking here is otherwise that GPU PAT indices with limited
>>>> coherency should be used together with WC memory in the same
>>>> situations
>>>> as VRAM/LMEM is used on DGFX.
>>>
>>> Hm okay, this would be the VM BIND side of things which deals with
>>> GPU
>>> PATs. From the CPU side it is just CPU caching modes implicitly
>>> selected
>>> via DRM_XE_GEM_CPU_CACHING_WB/WC.
>>>
>>> The question about the analogue of I915_PARAM_HAS_LLC was AFAIU about
>>> a
>>> performance optimisation where UMD is deciding whether it is okay to
>>> skip issuing clflush for the mapped bo if DRM_XE_GEM_CPU_CACHING_WB
>>> was
>>> used. (If DRM_XE_GEM_CPU_CACHING_WC was used it obviously only needs
>>> to
>>> flush the write combine buffer.)
>>>
>>> Looking at what Mesa is doing it appears it is not using
>>> I915_PARAM_HAS_LLC but has its own device info tables. So I guess
>>> minigbm xe backend will have to do the same if xe will not provide
>>> the
>>> analogue query.
>>
>> IMO clflushing in this case should never be needed, (Again, similar to
>> AMD). Whatever renders from / to those buffers should make sure they
>> are clflushed before or while accessing them. How is a rendering API
>> made aware of these bos? Are they imported using drm prime?
>
> Yes they can be imported via drm prime. It's a quite a huge code base 
> with a few abstractions and quite hard to figure out all possible 
> paths. There are gbm_bo_map paths in the host and vm compositors (Exo 
> and Sommelier), Skia library, camera pipeline, maybe more.
>
> You mean specifically on the "cpu access end" part of the story 
> flushing would never be needed? Regardless of llc and !llc, wb or wc 
> mappings, imported or native buffer? What mechanism would next in the 
> pipeline (after CPU access) use to ensure the flush?
>
Currently we're not supporting any older !LLC hardware, and with newer 
!LLC hardware, we're only allowing at least 1-way coherency with 
dma-bufs, meaning the GPU will acquire the cache line when accessing the 
bo. If the bo is not a dma-buf, and the GPU wants to access it in 
non-coherent mode, we're currently enforcing WC cpu-mappings.

So:
igfx with shared LLC: Not a problem (always coherent)
dgfx: Not a problem (always coherent)
newer igfx WO shared LLC (KMD is enforcing coherent access).

Now this may of course, as mentions, have performance implications 
compared to previous igfx solutions, depending on how it all is written, 
but should have similar performance characteristics as dgfx. If we want 
to change this and relax the coherency enforcement and resort to 
CLFLUSHes again,  could UMD communicate the need for this in the same 
way it communicates the format of the gbm_bos?

/Thomas

> Regards,
>
> Tvrtko
