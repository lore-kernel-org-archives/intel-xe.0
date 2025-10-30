Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6881CCF9E3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 20:00:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAF610EA12;
	Thu, 30 Oct 2025 20:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="LMugjHnC";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07EDB10EA12
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 20:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1761854430;
 bh=7edbos4kieWV8q9JijTMkgHCBUWIcn7V8RtXL9ouD2w=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=LMugjHnCevnnJ77b5Vi67Qj+9lhNRaXjXpDPQZPV1W+qzlZSe9uvZ8ZAefVuMovx6
 zSLHWAo4R1tbQp2DsGa2vOD+GMyEOg/XjwNKTCr3FWde/Zh/oIbcdRlBDBBCWH3z0q
 IVLBg0yIRY6QlMvtbOcrFYK3JLo5YGV2cKkze71X5Al4CKzFVMzSgvfkx6jEEJHrni
 G+MA6ho6h8HfrdSLD/t75NmZP77QFRgB3LCb6yJfWgdC2i9Ys6AF2U+iQBK9i+Kiy6
 rDNLTRPlgwKDCVKnCeMOt/h2fL7sfE9yJ7pnSLj71lzv9M+1G7fNNK69Sw08AUCWHQ
 Ct3i/PUkHRCGw==
Message-ID: <411769c1-d90c-418b-bd3d-30ed434d6285@lankhorst.se>
Date: Thu, 30 Oct 2025 21:00:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [FOR CI 8/8] drm/i915/display: Use intel_de_write_fw in
 intel_pipe_fastset
To: Gustavo Sousa <gustavo.sousa@intel.com>, intel-xe@lists.freedesktop.org
References: <20251030184710.359870-1-dev@lankhorst.se>
 <20251030184710.359870-9-dev@lankhorst.se>
 <176185045446.3303.6205563147139756281@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <176185045446.3303.6205563147139756281@intel.com>
Content-Type: text/plain; charset=UTF-8
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

Hey,

Den 2025-10-30 kl. 19:54, skrev Gustavo Sousa:
> Quoting Maarten Lankhorst (2025-10-30 15:47:10-03:00)
>> intel_set_pipe_src_size(), hsw_set_linetime_wm(),
>> intel_cpu_transcoder_set_m1_n1() and intel_set_transcoder_timings_lrr()
>> are called from an atomic context on PREEMPT_RT, and should be using the
>> _fw functions.
>>
>> Again noticed when trying to disable preemption in vblank evasion:
>> <3> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
>> <3> in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1505, name: kms_cursor_lega
>> <3> preempt_count: 1, expected: 0
>> <3> RCU nest depth: 0, expected: 0
>> <4> 4 locks held by kms_cursor_lega/1505:
>> <4>  #0: ffffc90003c6f988 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_mode_atomic_ioctl+0x13b/0xe90
>> <4>  #1: ffffc90003c6f9b0 (crtc_ww_class_mutex){+.+.}-{3:3}, at: drm_mode_atomic_ioctl+0x13b/0xe90
>> <4>  #2: ffff888135b838b8 (&intel_dp->psr.lock){+.+.}-{3:3}, at: intel_psr_lock+0xc5/0xf0 [xe]
>> <4>  #3: ffff88812607bbc0 (&wl->lock){+.+.}-{2:2}, at: intel_dmc_wl_get+0x3c/0x140 [xe]
>> <4> CPU: 6 UID: 0 PID: 1505 Comm: kms_cursor_lega Tainted: G     U              6.18.0-rc3-lgci-xe-xe-pw-156729v1+ #1 PREEMPT_{RT,(lazy)}
>> <4> Tainted: [U]=USER
>> <4> Hardware name: Intel Corporation Panther Lake Client Platform/PTL-UH LP5 T3 RVP1, BIOS PTLPFWI1.R00.3383.D02.2509240621 09/24/2025
>> <4> Call Trace:
>> <4>  <TASK>
>> <4>  dump_stack_lvl+0xc1/0xf0
>> <4>  dump_stack+0x10/0x20
>> <4>  __might_resched+0x174/0x260
>> <4>  rt_spin_lock+0x63/0x200
>> <4>  ? intel_dmc_wl_get+0x3c/0x140 [xe]
>> <4>  intel_dmc_wl_get+0x3c/0x140 [xe]
> 
> Isn't the real problem reported here that we are using a regular
> spinlock for DMC wakelock instead of a raw spinlock?

Regardless whether it is, we should be using the _fw variant here.
The idea of the pipe_start/end() sections are that all relevant locks are taken,
and then complete as deterministically as possible. That's a lot easier when all
locks are taken in advance. If the wakelock was needed, it needed to be taken
before entering the critical section between pipe_start/pipe_end

You're pointing out the related problem that the DMC wakelock implementation is
incorrect right now.

I believe that too, but we should aim for a better solution. The DMC wakelock
implementation should not hide the fact it exists, instead it should be
acquired explicitly like the xe_force_wake_get/put() implementation.

This may be a bit of work, but it will be more deterministic than the implicit
api used in i915.

For correctness we could validate and print a debug error if the DMC wakelock
was not taken.

intel_de_read() can still optionally validate that the DMC wakelock was taken for
ranges that need it if debuggig is enabled, but we should aim to remove the
current spinlock/refcount implementation.

Kind regards,
~Maarten Lankhorst
