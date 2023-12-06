Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112F9C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 10:58:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28DD10E099;
	Wed,  6 Dec 2023 10:58:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE8CB10E099
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 10:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701860333; x=1733396333;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=x1/4EUGC6apyWlZICOINInE6C1HcMSxgqdZOn/SQpXg=;
 b=CVhWoljnzNfQJXZx45EjzGf112ftKG6hUPEuN+X5LNgVBdTW21Aymre6
 RnwCo3wnmQfX4tfiqyUUYgyebmIlZlKquoMDBhwN38jEH2+ZxIXp0F1ik
 IMjbIcTls0WrQi1tzA/Te7cBKOMppgoVPlyrOFdF6YjSO4o7Mn3hsd0eA
 bkE/QeIs6LQ3XIYMNRo7sijAnhETBtMyoo0f4QaZ0JgWX/cxOdWFnctUp
 mg8FHY3Cn/O7uJFLOmc5Xmhg+s3BK+/pcRTCx410xrCHcWEES8VLHHVUQ
 nGTe0ord8lyD61Zl6hFjl2+y1MJJrImcqCOWcQS5ON8WiDHtV6ZGh11L6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="391215439"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="391215439"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 02:58:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1018529082"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="1018529082"
Received: from kheary-mobl2.ger.corp.intel.com (HELO [10.213.214.231])
 ([10.213.214.231])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 02:58:53 -0800
Message-ID: <eaa44445-21e2-4b9f-95a0-6b7395203900@linux.intel.com>
Date: Wed, 6 Dec 2023 10:58:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <02c74379-6513-40cc-a195-c4eeb7a7fd79@linux.intel.com>
 <c16bc9f7bd18f531136ebbcf6504d497db9a793a.camel@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <c16bc9f7bd18f531136ebbcf6504d497db9a793a.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] LLC configurating,
 mmap and bo cache management questions
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


Hi Thomas,

On 06/12/2023 08:26, Hellstrom, Thomas wrote:
> On Tue, 2023-12-05 at 14:19 +0000, Tvrtko Ursulin wrote:
>>
>> Hi,
>>
>> We are working on adding xe support to ChromeOS minigbm and have a
>> couple questions.
>>
>> If I follow things correctly with xe mmap caching mode is fixed to
>> object caching modes set at bo create. For framebuffers it will be WC
>> and for the rest userspace can choose WB or WC via
>> drm_xe_gem_create->cpu_caching. (Unless discrete, when WB cannot be
>> used
>> at all.)
>>
>> AFAICT minigbm basically cares about two transition points. Lets call
>> them CPU access begin and end.
>>
>> 1)
>> When a bo is mmapped it wants to invalidate the cache, which looks to
>> be
>> about making sure all GPU writes have landed to the backing store. In
>> the i915 world that translates to the set_domain ioctl.
>>
>> What is the uapi for this with xe, or it is somehow guaranteed to not
>> be
>> needed?
> 
> Signalling a user-fence or dma-fence obtained as an out-fence from an
> exec call will guarantee GPU caches are flushed. Currently I don't
> think there is anything like gem wait in the uAPI, although Matt is
> just about to add functionality to wait on all outstanding work on an
> exec_queue.

Problem I see is there are no execs or therefore fences in the minigbm 
ABI. It's just buffers, created or imported, CPU access and some other 
stuff.

And it is quite extensively used in the OS so I assume it has to work (I 
mean the invalidation/flushing was not put in there for no reason), in 
other words, where the i915 backend today does DRM_I915_GEM_SET_DOMAIN 
on "cpu access begin", which is buffer based, I am not clear how to 
implement that with xe.

For the outstanding work you mention, since you say it is about 
exec_queue, I assume again it will not work purely with buffers? If so 
it probably won't be useful for minigbm.

Also if I look at all the other minigbm backends, I see a mix of behaviours:

  * msm and vc4 appear to not concern themselves with any of this.

  * rockchip appears to be doing full bounce buffering via memcpy on CPU 
access begin/end.

  * i915 and amdgpu respectively use 
DRM_I915_GEM_SET_DOMAIN/DRM_AMDGPU_GEM_WAIT_IDLE (also buffer based, not 
execution queue). Andgpu curiously does not do any flushing on CPU 
access end.

Digging into git history, both DRM_I915_GEM_SET_DOMAIN on CPU access 
begin and clflushing on end were added to fix various CTS test failures. 
So I guess we could also wait and see what happens there. If those or 
some will be failing with xe too then propose adding some new uapi. Or 
if manual testing will start reporting visual corruption in the UI 
elements or such.

>> 2)
>> When a bo is unmapped, or CPU access finished, it wants to flush the
>> CPU
>> caches. That is /almost/ completely a CPU operation, where it just
>> needs
>> to either clflush or invalidate the WC buffer respectively, if not
>> the
>> fact that clflush can be skipped on platforms with LLC.
>>
>> I did not see an equivalent of an I915_PARAM_HAS_LLC in xe? Did I
>> miss
>> it or what it is the plan for querying this detail?
> 
> XeKMD is generally coherent, except if UMD selects a GPU PAT index with
> limited coherency together with WB instead of WC memory. In that case,
> UMD is responsible for doing the needed CLFLUSH-ing, whereas KMD only
> ensures initial clearing of the pages is CLFLUSHED for security
> reasons.
> 
> I'm not 100% sure if UMD can actually select WB with limited coherency
> PAT index in the initial uAPI revision, but Matthew has received
> requests for that so any additional input here on performance
> implications is appreciated.
> 
> The thinking here is otherwise that GPU PAT indices with limited
> coherency should be used together with WC memory in the same situations
> as VRAM/LMEM is used on DGFX.

Hm okay, this would be the VM BIND side of things which deals with GPU 
PATs. From the CPU side it is just CPU caching modes implicitly selected 
via DRM_XE_GEM_CPU_CACHING_WB/WC.

The question about the analogue of I915_PARAM_HAS_LLC was AFAIU about a 
performance optimisation where UMD is deciding whether it is okay to 
skip issuing clflush for the mapped bo if DRM_XE_GEM_CPU_CACHING_WB was 
used. (If DRM_XE_GEM_CPU_CACHING_WC was used it obviously only needs to 
flush the write combine buffer.)

Looking at what Mesa is doing it appears it is not using 
I915_PARAM_HAS_LLC but has its own device info tables. So I guess 
minigbm xe backend will have to do the same if xe will not provide the 
analogue query.

Regards,

Tvrtko
