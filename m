Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9433C48BEB
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 17:29:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9958A10E02B;
	Wed, 21 Feb 2024 17:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dnmGZDlT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F413210E02B
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 17:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708536583; x=1740072583;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=MGCG0yau5bLFgte3GplBWORteV3KDu5VLSK5gQ2bTS8=;
 b=dnmGZDlTK1uqmYXCDnseOjPoDPm1sj5kUBI5NNIByIMiyf7liGWvERoK
 V3Yy2gRV78d9Tig1nnX+lrNOVs3j44SKsJ1KBELyN/d5BJELyIlg5Ae1p
 p/6n7p0I27yeSbAbHkDiTCv1iSuZe+Khe15xWAnZm4dFtxGmbHSTgVEqZ
 zQFVx6tJ25K9irRAQbniiS/JzN7dlohVnzOXykY5qqlV4EDa0X0OpoOMS
 Jqpqxwm0SH7y8Ru5BYsLvMUCvp2HTMV5apW/xidAdTCrrKQ8kFjJTUkcq
 1FjnAyLeTASvRfz9F/UmxBzwscl+6mT+8HebeZvcRPf0H0h/lie5R4buC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13333449"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; d="scan'208";a="13333449"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 09:29:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="5165707"
Received: from dgarbuz-mobl1.ger.corp.intel.com (HELO [10.251.221.53])
 ([10.251.221.53])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 09:29:42 -0800
Message-ID: <0aa41720-7cae-42d3-94c1-f4fed0cf7ec4@linux.intel.com>
Date: Wed, 21 Feb 2024 18:29:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 9/9] drm/xe: Implement capture of HWSP and HWCTX
Content-Language: en-US
To: "Souza, Jose" <jose.souza@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240221133024.898315-1-maarten.lankhorst@linux.intel.com>
 <20240221133024.898315-9-maarten.lankhorst@linux.intel.com>
 <4b7b0b06c6599e7796cbdcc43f2be5843a2b993c.camel@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <4b7b0b06c6599e7796cbdcc43f2be5843a2b993c.camel@intel.com>
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

Hey,

On 2024-02-21 18:26, Souza, Jose wrote:
> On Wed, 2024-02-21 at 14:30 +0100, Maarten Lankhorst wrote:
>> Capture both the HWSP and the HW ctx page to allow easier replaying of
>> error dumps for debugging.
> 
> This patch is causing this:
> 
> [  831.459199] xe 0000:00:02.0: [drm] Timedout job: seqno=338, guc_id=4, flags=0x10
> [  831.459911] irq event stamp: 31052
> 
> [  831.459947] hardirqs last  enabled at (31051): [<ffffffff81d2edba>] _raw_spin_unlock_irqrestore+0x4a/0x70
> [  831.459959] ======================================================
> [  831.459997] hardirqs last disabled at (31052): [<ffffffff81150014>] queue_work_node+0x74/0xb0
> [  831.460025] WARNING: possible circular locking dependency detected
> [  831.460059] softirqs last  enabled at (30876): [<ffffffff81131982>] irq_exit_rcu+0x82/0xe0
> [  831.460085] 6.8.0-rc5-zeh-xe+ #1233 Not tainted
> [  831.460120] softirqs last disabled at (30867): [<ffffffff81131982>] irq_exit_rcu+0x82/0xe0
> [  831.460142] ------------------------------------------------------
> [  831.460207] kworker/u16:6/1404 is trying to acquire lock:
> [  831.460233] ffffffff827742e0 (fs_reclaim){+.+.}-{0:0}, at: kmalloc_trace+0x4d/0x300
> [  831.460285]
>                 but task is already holding lock:
> [  831.460321] ffffffff827face0 (dma_fence_map){++++}-{0:0}, at: xe_devcoredump+0x125/0x2d0 [xe]
> [  831.460427]
>                 which lock already depends on the new lock.
> 
> [  831.460482]
>                 the existing dependency chain (in reverse order) is:
> [  831.460523]
>                 -> #2 (dma_fence_map){++++}-{0:0}:
> [  831.460563]        __dma_fence_might_wait+0x39/0xb0
> [  831.460593]        dma_resv_lockdep+0x1b5/0x300
> [  831.460615]        do_one_initcall+0x53/0x240
> [  831.460638]        kernel_init_freeable+0x188/0x2e0
> [  831.460664]        kernel_init+0x11/0x190
> [  831.460687]        ret_from_fork+0x28/0x40
> [  831.460716]        ret_from_fork_asm+0x11/0x20
> [  831.460743]
>                 -> #1 (mmu_notifier_invalidate_range_start){+.+.}-{0:0}:
> [  831.460805]        fs_reclaim_acquire+0x68/0xd0
> [  831.460832]        kmalloc_trace+0x4d/0x300
> [  831.460855]        __kthread_create_worker+0x2a/0xc0
> [  831.460882]        kthread_create_worker+0x58/0x70
> [  831.460905]        workqueue_init+0x16/0x2a0
> [  831.460937]        kernel_init_freeable+0x59/0x2e0
> [  831.460967]        kernel_init+0x11/0x190
> [  831.460990]        ret_from_fork+0x28/0x40
> [  831.461021]        ret_from_fork_asm+0x11/0x20
> [  831.461054]
>                 -> #0 (fs_reclaim){+.+.}-{0:0}:
> [  831.461091]        __lock_acquire+0x1735/0x28f0
> [  831.461114]        lock_acquire+0xd3/0x2d0
> [  831.461133]        fs_reclaim_acquire+0x99/0xd0
> [  831.461159]        kmalloc_trace+0x4d/0x300
> [  831.461183]        xe_lrc_snapshot_capture+0x2c/0x3b0 [xe]
> [  831.461292]        xe_guc_exec_queue_snapshot_capture+0xe3/0x3b0 [xe]
> [  831.461404]        xe_devcoredump+0x190/0x2d0 [xe]
> [  831.461500]        guc_exec_queue_timedout_job+0x98/0x5a0 [xe]
> [  831.461611]        drm_sched_job_timedout+0x77/0xe0 [gpu_sched]
> [  831.461653]        process_one_work+0x1f4/0x4d0
> [  831.461681]        worker_thread+0x1d8/0x3c0
> [  831.461705]        kthread+0xfb/0x130
> [  831.461726]        ret_from_fork+0x28/0x40
> [  831.461750]        ret_from_fork_asm+0x11/0x20
> [  831.461778]
>                 other info that might help us debug this:
> 
> [  831.461839] Chain exists of:
>                   fs_reclaim --> mmu_notifier_invalidate_range_start --> dma_fence_map
> 
> [  831.461923]  Possible unsafe locking scenario:
> 
> [  831.463506]        CPU0                    CPU1
> [  831.464888]        ----                    ----
> [  831.466256]   rlock(dma_fence_map);
> [  831.467594]                                lock(mmu_notifier_invalidate_range_start);
> [  831.469009]                                lock(dma_fence_map);
> [  831.470355]   lock(fs_reclaim);
> [  831.471696]
>                  *** DEADLOCK ***
> 
> [  831.475615] 3 locks held by kworker/u16:6/1404:
> [  831.477056]  #0: ffff88812fc4d138 ((wq_completion)gt-ordered-wq){+.+.}-{0:0}, at: process_one_work+0x18d/0x4d0
> [  831.478585]  #1: ffffc90002663e58 ((work_completion)(&(&sched->work_tdr)->work)){+.+.}-{0:0}, at: process_one_work+0x18d/0x4d0
> [  831.479767]  #2: ffffffff827face0 (dma_fence_map){++++}-{0:0}, at: xe_devcoredump+0x125/0x2d0 [xe]
> [  831.481022]
>                 stack backtrace:
> [  831.483548] CPU: 5 PID: 1404 Comm: kworker/u16:6 Not tainted 6.8.0-rc5-zeh-xe+ #1233
> [  831.484844] Hardware name: Dell Inc. Latitude 5420/01M3M4, BIOS 1.27.0 03/17/2023
> [  831.486119] Workqueue: gt-ordered-wq drm_sched_job_timedout [gpu_sched]
> [  831.487346] Call Trace:
> [  831.488767]  <TASK>
> [  831.490214]  dump_stack_lvl+0x58/0xb0
> [  831.491550]  check_noncircular+0x158/0x170
> [  831.493027]  ? lockdep_hardirqs_on+0xbf/0x130
> [  831.494468]  __lock_acquire+0x1735/0x28f0
> [  831.495811]  lock_acquire+0xd3/0x2d0
> [  831.497157]  ? kmalloc_trace+0x4d/0x300
> [  831.498465]  ? xe_guc_exec_queue_snapshot_capture+0xae/0x3b0 [xe]
> [  831.499826]  fs_reclaim_acquire+0x99/0xd0
> [  831.501187]  ? kmalloc_trace+0x4d/0x300
> [  831.502452]  kmalloc_trace+0x4d/0x300
> [  831.503770]  ? __kmalloc_large_node+0x129/0x170
> [  831.505192]  ? xe_lrc_snapshot_capture+0x2c/0x3b0 [xe]
> [  831.506551]  ? xe_lrc_snapshot_capture+0x2c/0x3b0 [xe]
> [  831.507954]  xe_lrc_snapshot_capture+0x2c/0x3b0 [xe]
> [  831.509365]  ? rcu_is_watching+0xd/0x40
> [  831.510658]  ? __kmalloc+0x2bd/0x400
> [  831.511906]  xe_guc_exec_queue_snapshot_capture+0xe3/0x3b0 [xe]
> [  831.513303]  xe_devcoredump+0x190/0x2d0 [xe]
> [  831.514652]  guc_exec_queue_timedout_job+0x98/0x5a0 [xe]
> [  831.516059]  drm_sched_job_timedout+0x77/0xe0 [gpu_sched]
> [  831.517354]  ? process_one_work+0x18d/0x4d0
> [  831.518608]  process_one_work+0x1f4/0x4d0
> [  831.519916]  worker_thread+0x1d8/0x3c0
> [  831.521251]  ? rescuer_thread+0x390/0x390
> [  831.522547]  kthread+0xfb/0x130
> [  831.523715]  ? kthread_complete_and_exit+0x20/0x20
> [  831.524867]  ret_from_fork+0x28/0x40
> [  831.525939]  ? kthread_complete_and_exit+0x20/0x20
> [  831.527159]  ret_from_fork_asm+0x11/0x20
> [  831.528283]  </TASK>
> [  831.529699] xe 0000:00:02.0: [drm] Xe device coredump has been created
> [  831.531196] xe 0000:00:02.0: [drm] Check your /sys/class/drm/card0/device/devcoredump/data
> [  831.532863] xe 0000:00:02.0: [drm] Timedout job: seqno=339, guc_id=4, flags=0x11

In 7/9 I accidentally used GFP_KERNEL instead of GFP_ATOMIC.

+	struct xe_lrc_snapshot *snapshot = kmalloc(sizeof(*snapshot), GFP_KERNEL);

Can you change this to GFP_ATOMIC and see if those warnings go away?

Cheers,
~Maarten

