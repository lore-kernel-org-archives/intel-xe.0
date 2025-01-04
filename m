Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A856BE77188
	for <intel-xe@archiver.kernel.org>; Sat,  4 Jan 2025 07:20:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6182F10E0C8;
	Sat,  4 Jan 2025 07:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VlTq27vq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300AA10E0C8
 for <intel-xe@lists.freedesktop.org>; Sat,  4 Jan 2025 07:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735975206; x=1767511206;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1wJJKmjS5umCABm6Goxeyjj7FjPU3ZKUhTI3lyi/VpE=;
 b=VlTq27vqkB/Fh49prsRkYaq2iH2LZnaTh2NlBlSQi2CJeaxGKHoYLUek
 CA8K6rsJldLEDyLj4Qxfl7JXuaD3nknn8DGxzYeWNX/UDP5RAkAEMxihs
 TQQF+1A4HyTNaun9eLha54NKf2md7HvC28sOCvb+OBCKUA9yUJICBlOmX
 465nRqjrP1JTsVxT+5AvaDY/LQNr3eWi40+XAkbx2V+jtVR5mTOCiR3vH
 IURudUnGg80rAPTkTgwy1RdFzs1twiDyHU1QtXSUUNUTzZ5og2YxoxXJw
 BsRHBODAtkJnQyUO3FYXuczuhOOW1xv2p1a6Rec0DyOnhEY1D7xa+K2Qo g==;
X-CSE-ConnectionGUID: 0U2ufkaHQAGiDlUo3AazfQ==
X-CSE-MsgGUID: 7PSSTkkuT8uCflR8VmFEOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="23806786"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; d="scan'208";a="23806786"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 23:20:06 -0800
X-CSE-ConnectionGUID: EGz4RfmLSCKUVdcEIxjh7g==
X-CSE-MsgGUID: aFvnHJtUTlqgRbhhv2ccRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; d="scan'208";a="102442703"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.22])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 23:20:05 -0800
Date: Sat, 4 Jan 2025 01:19:59 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com, 
 stable@vger.kernel.org
Subject: Re: [PATCH] drm/xe/client: Better correlate exec_queue and GT
 timestamps
Message-ID: <jamrxboal2ppniepfxpq5uzksd2v35ypymo7irt56oewcan5vh@zxmofyra5ruz>
References: <20241212173432.1244440-1-lucas.demarchi@intel.com>
 <Z2SGzHYsJ+CRoF9p@orsosgc001>
 <wdcrw3du2ssykmsrda3mvwjhreengeovwasikmixdiowqsfnwj@lsputsgtmha4>
 <Z2YMiTq5P81dmjVH@orsosgc001>
 <7bvt3larl4sobadx57a255cvu7i5lkjpt2tdxa4baa324v6va6@ijl7gzqjh7qo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <7bvt3larl4sobadx57a255cvu7i5lkjpt2tdxa4baa324v6va6@ijl7gzqjh7qo>
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

On Fri, Dec 20, 2024 at 06:42:09PM -0600, Lucas De Marchi wrote:
>On Fri, Dec 20, 2024 at 04:32:09PM -0800, Umesh Nerlige Ramappa wrote:
>>On Fri, Dec 20, 2024 at 12:32:16PM -0600, Lucas De Marchi wrote:
>>>On Thu, Dec 19, 2024 at 12:49:16PM -0800, Umesh Nerlige Ramappa wrote:
>>>>On Thu, Dec 12, 2024 at 09:34:32AM -0800, Lucas De Marchi wrote:
>>>>>This partially reverts commit fe4f5d4b6616 ("drm/xe: Clean up VM / exec
>>>>>queue file lock usage."). While it's desired to have the mutex to
>>>>>protect only the reference to the exec queue, getting and dropping each
>>>>>mutex and then later getting the GPU timestamp, doesn't produce a
>>>>>correct result: it introduces multiple opportunities for the task to be
>>>>>scheduled out and thus wrecking havoc the deltas reported to userspace.
>>>>>
>>>>>Also, to better correlate the timestamp from the exec queues with the
>>>>>GPU, disable preemption so they can be updated without allowing the task
>>>>>to be scheduled out. We leave interrupts enabled as that shouldn't be
>>>>>enough disturbance for the deltas to matter to userspace.
>>>>
>>>>Like I said in the past, this is not trivial to solve and I 
>>>>would hate to add anything in the KMD to do so.
>>>
>>>I think the best we can do in the kernel side is to try to guarantee the
>>>correlated counters are sampled together... And that is already very
>>>good per my tests. Also, it'd not only be good from a testing
>>>perspective, but for any userspace trying to make sense of the 2
>>>counters.
>>>
>>>Note that this is not much different from how e.g. perf samples group
>>>events:
>>>
>>>	The unit of scheduling in perf is not an individual event, but rather an
>>>	event group, which may contain one or more events (potentially on
>>>	different PMUs). The notion of an event group is useful for ensuring
>>>	that a set of mathematically related events are all simultaneously
>>>	measured for the same period of time. For example, the number of L1
>>>	cache misses should not be larger than the number of L2 cache accesses.
>>>	Otherwise, it may happen that the events get multiplexed and their
>>>	measurements would no longer be comparable, making the analysis more
>>>	difficult.
>>>
>>>See __perf_event_read() that will call pmu->read() on all sibling events
>>>while disabling preemption:
>>>
>>>	perf_event_read()
>>>	{
>>>		...
>>>		preempt_disable();
>>>		event_cpu = __perf_event_read_cpu(event, event_cpu);
>>>		...
>>>		(void)smp_call_function_single(event_cpu, __perf_event_read, &data, 1);
>>>		preempt_enable();
>>>		...
>>>	}
>>>
>>>so... at least there's prior art for that... for the same reason that
>>>userspace should see the values sampled together.
>>
>>Well, I have used the preempt_disable/enable when fixing some 
>>selftest (i915), but was not happy that there were still some rare 
>>failures. If reducing error rates is the intention, then it's fine. 
>>In my mind, the issue still exists and once in a while we would end 
>>up assessing such a failure. Maybe, in addition, fixing up the IGTs 
>>like you suggest below is a worthwhile option.
>
>for me this fix is not targeted at tests, even if it improves them a
>lot. It's more for consistent userspace behavior.
>
>>
>>>
>>>>
>>>>For IGT, why not just take 4 samples for the measurement 
>>>>(separate out the 2 counters)
>>>>
>>>>1. get gt timestamp in the first sample
>>>>2. get run ticks in the second sample
>>>>3. get run ticks in the third sample
>>>>4. get gt timestamp in the fourth sample
>>>>
>>>>Rely on 1 and 4 for gt timestamp delta and on 2 and 3 for run 
>>>>ticks delta.
>>>
>>>this won't fix it for the general case: you get rid of the > 100% case,
>>>you make the < 100% much worse.
>>
>>yeah, that's quite possible.
>>
>>>
>>>For a testing perspective I think the non-flaky solution is to stop
>>>calculating percentages and rather check that the execution timestamp
>>>recorded by the GPU very closely matches (minus gpu scheduling delays)
>>>the one we got via fdinfo once the fence signals and we wait for the job
>>>completion.
>>
>>Agree, we should change how we validate the counters in IGT.
>
>I have a wip patch to cleanup and submit to igt. I will submit it soon.

Just submitted that as the last patch in the series:
https://lore.kernel.org/igt-dev/20250104071548.737612-8-lucas.demarchi@intel.com/T/#u

but I'd also like to apply this one in the kernel and still looking for
a review.

thanks
Lucas De Marchi
