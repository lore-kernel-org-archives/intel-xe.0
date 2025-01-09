Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08189E77197
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 05:20:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95A910E2BA;
	Thu,  9 Jan 2025 05:19:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KARY1vAF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA6910E2BA
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jan 2025 05:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736399998; x=1767935998;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nZWNMiqEO5uyXvZif4210iU+zlVcNCsXPA9QYCufdU0=;
 b=KARY1vAFmZw6Iv450mHAJ8pCF42l5XuPY/WYtNfjL2bp3nuP1U7qCG37
 zIao9930EGrVOcT155r6t8kYFnmgYECk5fQphOVCXWmDroZhsAtjD1WI5
 Po5LjCwE4VOOHwzq7LVjRH8BbXQ5ZfVUcNqdHLFB5bx1JsvgCWK/qtA5Z
 v3CsuZyYRht6BsyZE8FsKwHAbUbM4FcCG/h/QKBaIerSskubWtgpTFwaz
 t4qsKEKWm/xYULPiQKp2EtSXeIoxoHL84wrvAEJzbGrdzcjgrHw7r0+Kx
 vMU7z0M00cnYLmbjflhYBT2HQ+ZkDo7apyRUBSsXYpvpvV+H/PGgLvZbr g==;
X-CSE-ConnectionGUID: f0Fa5JkYQomPL28tJ1ukaQ==
X-CSE-MsgGUID: eYxCwgiTQTOyiuYVJ+rDlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47220151"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="47220151"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 21:19:58 -0800
X-CSE-ConnectionGUID: rpbB2moGSqKuYTgKHX9x1g==
X-CSE-MsgGUID: KL1OkryuRLm5Af9BVEehUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="134139554"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.111.77])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 21:19:57 -0800
Date: Wed, 8 Jan 2025 23:19:52 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, 
 intel-xe@lists.freedesktop.org, stable@vger.kernel.org
Subject: Re: [PATCH] drm/xe/client: Better correlate exec_queue and GT
 timestamps
Message-ID: <ngkbkvqre4d4hvaiwtqcm7oz76b3wcbuzq3ueoazjd7ff3luym@lrjlwmac2mf7>
References: <20241212173432.1244440-1-lucas.demarchi@intel.com>
 <Z2SGzHYsJ+CRoF9p@orsosgc001>
 <wdcrw3du2ssykmsrda3mvwjhreengeovwasikmixdiowqsfnwj@lsputsgtmha4>
 <Z2YMiTq5P81dmjVH@orsosgc001>
 <7bvt3larl4sobadx57a255cvu7i5lkjpt2tdxa4baa324v6va6@ijl7gzqjh7qo>
 <jamrxboal2ppniepfxpq5uzksd2v35ypymo7irt56oewcan5vh@zxmofyra5ruz>
 <Z39Vo5FEZsapkQaA@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z39Vo5FEZsapkQaA@lstrano-desk.jf.intel.com>
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

On Wed, Jan 08, 2025 at 08:50:43PM -0800, Matthew Brost wrote:
>On Sat, Jan 04, 2025 at 01:19:59AM -0600, Lucas De Marchi wrote:
>> On Fri, Dec 20, 2024 at 06:42:09PM -0600, Lucas De Marchi wrote:
>> > On Fri, Dec 20, 2024 at 04:32:09PM -0800, Umesh Nerlige Ramappa wrote:
>> > > On Fri, Dec 20, 2024 at 12:32:16PM -0600, Lucas De Marchi wrote:
>> > > > On Thu, Dec 19, 2024 at 12:49:16PM -0800, Umesh Nerlige Ramappa wrote:
>> > > > > On Thu, Dec 12, 2024 at 09:34:32AM -0800, Lucas De Marchi wrote:
>> > > > > > This partially reverts commit fe4f5d4b6616 ("drm/xe: Clean up VM / exec
>> > > > > > queue file lock usage."). While it's desired to have the mutex to
>> > > > > > protect only the reference to the exec queue, getting and dropping each
>> > > > > > mutex and then later getting the GPU timestamp, doesn't produce a
>> > > > > > correct result: it introduces multiple opportunities for the task to be
>> > > > > > scheduled out and thus wrecking havoc the deltas reported to userspace.
>> > > > > >
>> > > > > > Also, to better correlate the timestamp from the exec queues with the
>> > > > > > GPU, disable preemption so they can be updated without allowing the task
>> > > > > > to be scheduled out. We leave interrupts enabled as that shouldn't be
>> > > > > > enough disturbance for the deltas to matter to userspace.
>> > > > >
>> > > > > Like I said in the past, this is not trivial to solve and I
>> > > > > would hate to add anything in the KMD to do so.
>> > > >
>> > > > I think the best we can do in the kernel side is to try to guarantee the
>> > > > correlated counters are sampled together... And that is already very
>> > > > good per my tests. Also, it'd not only be good from a testing
>> > > > perspective, but for any userspace trying to make sense of the 2
>> > > > counters.
>> > > >
>> > > > Note that this is not much different from how e.g. perf samples group
>> > > > events:
>> > > >
>> > > > 	The unit of scheduling in perf is not an individual event, but rather an
>> > > > 	event group, which may contain one or more events (potentially on
>> > > > 	different PMUs). The notion of an event group is useful for ensuring
>> > > > 	that a set of mathematically related events are all simultaneously
>> > > > 	measured for the same period of time. For example, the number of L1
>> > > > 	cache misses should not be larger than the number of L2 cache accesses.
>> > > > 	Otherwise, it may happen that the events get multiplexed and their
>> > > > 	measurements would no longer be comparable, making the analysis more
>> > > > 	difficult.
>> > > >
>> > > > See __perf_event_read() that will call pmu->read() on all sibling events
>> > > > while disabling preemption:
>> > > >
>> > > > 	perf_event_read()
>> > > > 	{
>> > > > 		...
>> > > > 		preempt_disable();
>> > > > 		event_cpu = __perf_event_read_cpu(event, event_cpu);
>> > > > 		...
>> > > > 		(void)smp_call_function_single(event_cpu, __perf_event_read, &data, 1);
>> > > > 		preempt_enable();
>> > > > 		...
>> > > > 	}
>> > > >
>> > > > so... at least there's prior art for that... for the same reason that
>> > > > userspace should see the values sampled together.
>> > >
>> > > Well, I have used the preempt_disable/enable when fixing some
>> > > selftest (i915), but was not happy that there were still some rare
>> > > failures. If reducing error rates is the intention, then it's fine.
>> > > In my mind, the issue still exists and once in a while we would end
>> > > up assessing such a failure. Maybe, in addition, fixing up the IGTs
>> > > like you suggest below is a worthwhile option.
>
>IMO, we should strive to avoid using low-level calls like
>preempt_disable and preempt_enable, as they lead to unmaintainable
>nonsense, as seen in the i915.
>
>Sure, in Umesh's example, this is pretty clear and not an unreasonable
>usage. However, I’m more concerned that this sets a precedent in Xe that
>doing this is acceptable.

each such usage needs to be carefully reviewed, but there are cases
in which it's useful and we shouldn't ban it. In my early reply on
wdcrw3du2ssykmsrda3mvwjhreengeovwasikmixdiowqsfnwj@lsputsgtmha4  I even
showed how the same construct is used by perf when reading counters
that should be sampled together.

I will post a new version, but I will delay in a week or so merging it.
That's because I want to check the result of the other patch series that
changes the test in igt and afaics should give all green results all the
time: https://patchwork.freedesktop.org/series/143204/

Lucas De Marchi

>
>Not a blocker, just expressing concerns.
>
>Matt
>
>> >
>> > for me this fix is not targeted at tests, even if it improves them a
>> > lot. It's more for consistent userspace behavior.
>> >
>> > >
>> > > >
>> > > > >
>> > > > > For IGT, why not just take 4 samples for the measurement
>> > > > > (separate out the 2 counters)
>> > > > >
>> > > > > 1. get gt timestamp in the first sample
>> > > > > 2. get run ticks in the second sample
>> > > > > 3. get run ticks in the third sample
>> > > > > 4. get gt timestamp in the fourth sample
>> > > > >
>> > > > > Rely on 1 and 4 for gt timestamp delta and on 2 and 3 for
>> > > > > run ticks delta.
>> > > >
>> > > > this won't fix it for the general case: you get rid of the > 100% case,
>> > > > you make the < 100% much worse.
>> > >
>> > > yeah, that's quite possible.
>> > >
>> > > >
>> > > > For a testing perspective I think the non-flaky solution is to stop
>> > > > calculating percentages and rather check that the execution timestamp
>> > > > recorded by the GPU very closely matches (minus gpu scheduling delays)
>> > > > the one we got via fdinfo once the fence signals and we wait for the job
>> > > > completion.
>> > >
>> > > Agree, we should change how we validate the counters in IGT.
>> >
>> > I have a wip patch to cleanup and submit to igt. I will submit it soon.
>>
>> Just submitted that as the last patch in the series:
>> https://lore.kernel.org/igt-dev/20250104071548.737612-8-lucas.demarchi@intel.com/T/#u
>>
>> but I'd also like to apply this one in the kernel and still looking for
>> a review.
>>
>> thanks
>> Lucas De Marchi
