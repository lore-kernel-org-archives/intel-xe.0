Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68831C48260
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 14:42:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DEA210E741;
	Tue, 13 Feb 2024 14:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WmSOKKvm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063FF10E741
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 14:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707835341; x=1739371341;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=g8p6HbO0MSclH4iunj9HBx2NX914jSonN7EvDw/Wk9g=;
 b=WmSOKKvmWONlwAHtcv9xhk8wEPyKD+SzBWWD6yYrR3/vuXD9ctjLrILy
 CeZv3QDbhQfE/85Je1s/Hfe3Uuya4qVCsGmgn8/2fFl9exhJc8ZhtuRtK
 xEZjJVnWvqyNlcOkxNed6auzn9X6njak7ZKy+zOFbb8j1tUXDItqxOGJg
 BrkIpExPJG82exU5MzdXNrJzju4D9w6kPDY4riCLPCwCO63vOn5VoaHO2
 udkqMQRZAeP/I7q6hXxF/0BLLJJvGn4FK+XOdQ7RpnX1jTWXdXKS9N4L+
 0pk0Zx5u0Dx958DrLNH0v5w227tRw4K9Y9vWhFW987JQBCoEnUwPaazQ6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="24316172"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; d="scan'208";a="24316172"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 06:42:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="935362949"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; d="scan'208";a="935362949"
Received: from smatua-mobl.ger.corp.intel.com (HELO [10.252.44.71])
 ([10.252.44.71])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 06:42:02 -0800
Message-ID: <9da6faeb-7835-4274-8cd3-15964c3b7e7b@linux.intel.com>
Date: Tue, 13 Feb 2024 15:41:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3.1] drm/xe: Implement VM snapshot support for BO's and
 userptr
Content-Language: en-US
To: "Souza, Jose" <jose.souza@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240202224052.848867-4-maarten.lankhorst@linux.intel.com>
 <20240202224514.855946-1-maarten.lankhorst@linux.intel.com>
 <41fa06d2fa3c3de1fe09b1cbdea9745dec9e8424.camel@intel.com>
 <f628596857eea80d877e64a73d4162058cf26b01.camel@intel.com>
 <9aecff32333d8a0a533bc17ffe24577a44f7eed4.camel@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <9aecff32333d8a0a533bc17ffe24577a44f7eed4.camel@intel.com>
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



On 2024-02-06 21:08, Souza, Jose wrote:
> On Mon, 2024-02-05 at 12:35 -0800, José Roberto de Souza wrote:
>> On Mon, 2024-02-05 at 08:32 -0800, José Roberto de Souza wrote:
>>> On Fri, 2024-02-02 at 23:45 +0100, Maarten Lankhorst wrote:
>>>> Since we cannot immediately capture the BO's and userptr, perform it in
>>>> 2 stages. The immediate stage takes a reference to each BO and userptr,
>>>> while a delayed worker captures the contents and then frees the
>>>> reference.
>>>>
>>>> This is required because in signaling context, no locks can be taken, no
>>>> memory can be allocated, and no waits on userspace can be performed.
>>>>
>>>> With the delayed worker, all of this can be performed very easily,
>>>> without having to resort to hacks.
>>>>
>>>> Changes since v1:
>>>> - Fix crash on NULL captured vm.
>>>> - Use ascii85_encode to capture BO contents and save some space.
>>>> - Add length to coredump output for each captured area.
>>>> Changes since v2:
>>>> - Dump each mapping on their own line, to simplify tooling.
>>>> - Fix null pointer deref in xe_vm_snapshot_free.
>>>
>>>
>>> First crash dump with piglit already got:
>>>
>>>
>>> [   65.097735] xe 0000:00:02.0: [drm:intel_pps_vdd_off_sync_unlocked [xe]] [ENCODER:307:DDI A/PHY A] PPS 0 PP_STATUS: 0x80000008 PP_CONTROL:
>>> 0x00000067
>>> [   65.238975] xe 0000:00:02.0: [drm:intel_power_well_disable [xe]] disabling PW_3
>>> [   65.239050] xe 0000:00:02.0: [drm:intel_power_well_disable [xe]] disabling PW_2
>>> [  305.225363] loop0: detected capacity change from 0 to 8
>>> [  430.689574] xe 0000:00:02.0: [drm] Timedout job: seqno=4294967169, guc_id=2, flags=0x8
>>> [  430.689933] ------------[ cut here ]------------
>>> [  430.689958] DEBUG_LOCKS_WARN_ON(lock->magic != lock)
>>> [  430.689964] WARNING: CPU: 6 PID: 94 at kernel/locking/mutex.c:587 __mutex_lock+0x50d/0xb80
>>> [  430.690007] Modules linked in: snd_hda_codec_hdmi snd_ctl_led ledtrig_audio snd_hda_codec_realtek snd_hda_codec_generic xe drm_ttm_helper gpu_sched
>>> drm_suballoc_helper drm_gpuvm drm_exec i2c_algo_bit drm_buddy drm_display_helper ttm x86_pkg_temp_thermal mei_pxp mei_hdcp coretemp snd_hda_intel
>>> wmi_bmof crct10dif_pclmul snd_intel_dspcfg crc32_pclmul snd_hda_codec e1000e video ghash_clmulni_intel snd_hwdep kvm_intel snd_hda_core ptp i2c_i801
>>> snd_pcm pps_core i2c_smbus mei_me mei intel_pmc_core intel_vsec wmi pmt_telemetry pmt_class fuse
>>> [  430.690164] CPU: 6 PID: 94 Comm: kworker/u16:2 Not tainted 6.8.0-rc3-zeh-xe+ #1222
>>> [  430.690188] Hardware name: Dell Inc. Latitude 5420/01M3M4, BIOS 1.27.0 03/17/2023
>>> [  430.690212] Workqueue: gt-ordered-wq drm_sched_job_timedout [gpu_sched]
>>> [  430.690239] RIP: 0010:__mutex_lock+0x50d/0xb80
>>> [  430.690254] Code: ff 85 c0 0f 84 7d fb ff ff 8b 15 b2 ec ba 00 85 d2 0f 85 6f fb ff ff 48 c7 c6 ca 46 3a 82 48 c7 c7 73 d6 39 82 e8 73 19 40 ff
>>> <0f> 0b e9 55 fb ff ff 31 c9 31 d2 4c 89 e7 e8 80 7e 47 ff 84 c0 0f
>>> [  430.690298] RSP: 0018:ffffc900005ebc60 EFLAGS: 00010282
>>> [  430.690313] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
>>> [  430.690332] RDX: 0000000000000002 RSI: 0000000000000027 RDI: 00000000ffffffff
>>> [  430.690356] RBP: ffffc900005ebcf0 R08: 00000000fffeffff R09: 0000000000000001
>>> [  430.690375] R10: 00000000fffeffff R11: ffff888287080000 R12: ffff88824998d4a8
>>> [  430.690394] R13: 0000000000000000 R14: ffff88824998d038 R15: ffff8881109b3e00
>>> [  430.690417] FS:  0000000000000000(0000) GS:ffff888287b00000(0000) knlGS:0000000000000000
>>> [  430.690438] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [  430.690455] CR2: 00007f5ccd99de3e CR3: 000000000564a003 CR4: 0000000000770ef0
>>> [  430.690475] PKRU: 55555554
>>> [  430.690485] Call Trace:
>>> [  430.690495]  <TASK>
>>> [  430.690504]  ? __mutex_lock+0x50d/0xb80
>>> [  430.690518]  ? __warn+0x7c/0x170
>>> [  430.690538]  ? __mutex_lock+0x50d/0xb80
>>> [  430.690575]  ? report_bug+0x189/0x1c0
>>> [  430.690597]  ? handle_bug+0x36/0x70
>>> [  430.690616]  ? exc_invalid_op+0x13/0x60
>>> [  430.690637]  ? asm_exc_invalid_op+0x16/0x20
>>> [  430.690661]  ? __mutex_lock+0x50d/0xb80
>>> [  430.690680]  ? __slab_alloc.isra.0+0x4d/0x90
>>> [  430.690703]  ? __slab_alloc.isra.0+0x5a/0x90
>>> [  430.690722]  ? xe_vm_snapshot_capture+0x35/0x1f0 [xe]
>>> [  430.690840]  ? rcu_is_watching+0xd/0x40
>>> [  430.690863]  ? __kmalloc+0x2bd/0x400
>>> [  430.690883]  ? xe_vm_snapshot_capture+0x35/0x1f0 [xe]
>>> [  430.690984]  xe_vm_snapshot_capture+0x35/0x1f0 [xe]
>>> [  430.691070]  ? xe_sched_job_snapshot_capture+0x64/0x80 [xe]
>>> [  430.691155]  xe_devcoredump+0x1b9/0x2e0 [xe]
>>> [  430.691226]  guc_exec_queue_timedout_job+0x98/0x5a0 [xe]
>>> [  430.691305]  drm_sched_job_timedout+0x77/0xe0 [gpu_sched]
>>> [  430.691337]  ? process_one_work+0x18d/0x4d0
>>> [  430.691360]  process_one_work+0x1f4/0x4d0
>>> [  430.691378]  worker_thread+0x1d8/0x3c0
>>> [  430.691396]  ? rescuer_thread+0x390/0x390
>>> [  430.691414]  kthread+0xfb/0x130
>>> [  430.691429]  ? kthread_complete_and_exit+0x20/0x20
>>> [  430.691451]  ret_from_fork+0x28/0x40
>>> [  430.691470]  ? kthread_complete_and_exit+0x20/0x20
>>> [  430.691495]  ret_from_fork_asm+0x11/0x20
>>> [  430.691514]  </TASK>
>>> [  430.691523] irq event stamp: 6077281
>>> [  430.691537] hardirqs last  enabled at (6077281): [<ffffffff81d2dcaa>] _raw_spin_unlock_irqrestore+0x4a/0x70
>>> [  430.691598] hardirqs last disabled at (6077280): [<ffffffff81d2da7a>] _raw_spin_lock_irqsave+0x4a/0x50
>>> [  430.691640] softirqs last  enabled at (6075212): [<ffffffff81131962>] irq_exit_rcu+0x82/0xe0
>>> [  430.691679] softirqs last disabled at (6075205): [<ffffffff81131962>] irq_exit_rcu+0x82/0xe0
>>> [  430.691722] ---[ end trace 0000000000000000 ]---
>>> [  430.691802] xe 0000:00:02.0: [drm] Xe device coredump has been created
>>
>> Hold a bit in this crash, the VM is being destroyed by Iris before drm_exec is done.
>> I think fixing it will fix this warning.
> 
> Yep that was the case, it will be fixed by https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27500

It will fix the warning, but not the kernel bug. snap_mutex should be 
left valid for longer instead.

I'll destroy it from vm_destroy_work_func instead of xe_vm_close_and_put.

Cheers,
~Maarten
