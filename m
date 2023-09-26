Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F86E7D252
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 08:23:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96EF110E361;
	Tue, 26 Sep 2023 08:23:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD4210E37A
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 08:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695716601; x=1727252601;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ztS72aqzh7izIgyE50M0M3jcqmX+Dh7P4aoRh55z8r4=;
 b=CL3LWUCyJp7Ic8tkc3/x85t5nkczNpcUK7Qt/QqaGrbFLRA/tBM13Bno
 FdphcHFgqoab8NoEa7fZ2IKviY7moSNtkJBA59b3sqceHFe2eUekQ89yj
 MvZU1AM/aTTXLp4PvLkKWIXI/y2fFrZyjXCaCT2fgN/aMtaqmVJiP+d5c
 rrD56e3iirdXOE9sHZLF/5InZ68Ll891dqjWT+f+ljxHrS/non8WdztX+
 fgmGbvVycKoWVGhLPi5+xfNw1OQ0aq1zzGaNwcGcosu54Zl3sIEj3EnVR
 WF2SRk+5KzMqFx3muTfa+yI/ns5g7P6faHQfJlcNGhzebMf99fJ8cR9Xl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="385362816"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="385362816"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 01:23:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="892122485"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="892122485"
Received: from respir1x-mobl1.ger.corp.intel.com (HELO [10.252.26.195])
 ([10.252.26.195])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 01:22:15 -0700
Message-ID: <ed910211-6113-b28d-9914-305848e4a2f6@intel.com>
Date: Tue, 26 Sep 2023 09:23:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-GB
To: "Souza, Jose" <jose.souza@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230925132113.59900-9-matthew.auld@intel.com>
 <dc4be093602fe728ba8b561ed810ca83de30e960.camel@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <dc4be093602fe728ba8b561ed810ca83de30e960.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v3 0/7] PAT and cache coherency support
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

On 25/09/2023 20:47, Souza, Jose wrote:
> On Mon, 2023-09-25 at 14:21 +0100, Matthew Auld wrote:
>> Branch available here (lightly tested):
>> https://gitlab.freedesktop.org/mwa/kernel/-/tree/xe-pat-index?ref_type=heads
>>
>> Series still needs some more testing. Also note that the series directly depends
>> on the WIP patch here: https://patchwork.freedesktop.org/series/122708/
>>
>> Goal here is to allow userspace to directly control the pat_index when mapping
>> memory via the ppGTT, in addtion to the CPU caching mode for system memory. This
>> is very much needed on newer igpu platforms which allow incoherent GT access,
>> where the choice over the cache level and expected coherency is best left to
>> userspace depending on their usecase.  In the future there may also be other
>> stuff encoded in the pat_index, so giving userspace direct control will also be
>> needed there.
>>
>> To support this we added new gem_create uAPI for selecting the CPU cache
>> mode to use for system memory, including the expected GPU coherency mode. There
>> are various restrictions here for the selected coherency mode and compatible CPU
>> cache modes.  With that in place the actual pat_index can now be provided as
>> part of vm_bind. The only restriction is that the coherency mode of the
>> pat_index must be at least as coherent as the gem_create coherency mode. There
>> are also some special cases like with userptr and dma-buf.
>>
>> v2:
>>    - Loads of improvements/tweaks. Main changes are to now allow
>>      gem_create.coh_mode <= coh_mode(pat_index), rather than it needing to match
>>      exactly. This simplifies the dma-buf policy from userspace pov. Also we now
>>      only consider COH_NONE and COH_AT_LEAST_1WAY.
>> v3:
>>    - Rebase. Split the pte_encode() refactoring, plus various smaller tweaks and
>>      fixes.
>>
> 
> Thanks for the fixes, display is now working in TGL and DG2 but getting a new crash in MTL:

Is the MTL bug present on the same base branch. i.e if you drop all the 
patches in this series?

> 
> 
> [  259.478814] xe 0000:00:02.0: [drm:skl_compute_wm [xe]] [PLANE:31:plane 1A]  blocks   16,  97,  97, 129, 129, 161,   0,   0,  30,  33,   47 ->   62,
> 93,  93, 123, 123, 154,   0,   0, 137,  62,  137
> [  259.478936] xe 0000:00:02.0: [drm:skl_compute_wm [xe]] [PLANE:31:plane 1A] min_ddb   19, 108, 108, 143, 143, 179,   0,   0,  31,  38,   48 ->  123,
> 184, 184, 184, 184, 245,   0,   0, 138, 123,  138
> [  259.479089] ------------[ cut here ]------------
> [  259.479093] WARNING: CPU: 2 PID: 2057 at drivers/gpu/drm/xe/display/xe_fb_pin.c:199 __xe_pin_fb_vma+0x3dc/0x840 [xe]
> [  259.479239] Modules linked in: xe drm_ttm_helper drm_exec gpu_sched drm_suballoc_helper i2c_algo_bit drm_buddy ttm drm_display_helper
> x86_pkg_temp_thermal coretemp crct10dif_pclmul crc32_pclmul wmi_bmof pmt_telemetry pmt_class ghash_clmulni_intel snd_hda_intel snd_intel_dspcfg
> snd_hda_codec kvm_intel snd_hwdep snd_hda_core e1000e mei_me ptp snd_pcm i2c_i801 mei i2c_smbus pps_core intel_vsec video wmi pinctrl_meteorlake fuse
> [  259.479327] CPU: 2 PID: 2057 Comm: gnome-shell Tainted: G        W          6.5.0-rc7+zeh-xe+ #1109
> [  259.479333] Hardware name: Intel Corporation Meteor Lake Client Platform/MTL-M LP5x CONF1 RVP, BIOS MTLMFWI1.R00.3323.D84.2308220916 08/22/2023
> [  259.479337] RIP: 0010:__xe_pin_fb_vma+0x3dc/0x840 [xe]
> [  259.479498] Code: 4d 89 f4 48 8b 44 24 08 49 8d b4 24 28 03 00 00 b9 16 00 00 00 4c 89 60 08 48 8d 78 10 f3 48 a5 4c 8b 6c 24 08 e9 2c fd ff ff
> <0f> 0b 49 c7 c5 ed ff ff ff e9 14 fd ff ff 48 8b 7c 24 28 89 14 24
> [  259.479503] RSP: 0018:ffffc9000604bb88 EFLAGS: 00010246
> [  259.479509] RAX: ffff888196c9f190 RBX: ffff8881a222dc00 RCX: 0000000000000001
> [  259.479513] RDX: 0000000000000000 RSI: ffffffff826a896e RDI: ffffffff826ac710
> [  259.479517] RBP: ffff888183823800 R08: 0000000000000128 R09: ffff8881b2eff4d8
> [  259.479521] R10: ffffc9000604bac8 R11: 0000000000000002 R12: ffff8881a222dc00
> [  259.479526] R13: ffff888102ab0000 R14: 0000000000000000 R15: 0000563e9575fa00
> [  259.479530] FS:  00007f4dbdf5f5c0(0000) GS:ffff88846e100000(0000) knlGS:0000000000000000
> [  259.479535] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  259.479540] CR2: 00000e17254bc000 CR3: 0000000117bb8005 CR4: 0000000000770ee0
> [  259.479545] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  259.479549] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
> [  259.479552] PKRU: 55555554
> [  259.479556] Call Trace:
> [  259.479560]  <TASK>
> [  259.479564]  ? __xe_pin_fb_vma+0x3dc/0x840 [xe]
> [  259.479708]  ? __warn+0x7c/0x170
> [  259.479716]  ? __xe_pin_fb_vma+0x3dc/0x840 [xe]
> [  259.479855]  ? report_bug+0x18d/0x1c0
> [  259.479865]  ? handle_bug+0x3a/0x70
> [  259.479873]  ? exc_invalid_op+0x13/0x60
> [  259.479880]  ? asm_exc_invalid_op+0x16/0x20
> [  259.479894]  ? __xe_pin_fb_vma+0x3dc/0x840 [xe]
> [  259.480030]  ? __xe_pin_fb_vma+0x34/0x840 [xe]
> [  259.480160]  ? lock_acquire+0xd3/0x2d0
> [  259.480170]  ? find_held_lock+0x2b/0x80
> [  259.480179]  intel_plane_pin_fb+0x34/0x90 [xe]
> [  259.480314]  intel_prepare_plane_fb+0x2c/0x70 [xe]
> [  259.480469]  drm_atomic_helper_prepare_planes+0x6b/0x210
> [  259.480481]  intel_atomic_commit+0x4d/0x360 [xe]
> [  259.480666]  drm_mode_atomic_ioctl+0x7c7/0xbd0
> [  259.480688]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> [  259.480696]  drm_ioctl_kernel+0xc0/0x170
> [  259.480705]  drm_ioctl+0x212/0x470
> [  259.480711]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> [  259.480729]  __x64_sys_ioctl+0x8d/0xb0
> [  259.480739]  do_syscall_64+0x38/0x90
> [  259.480746]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> [  259.480752] RIP: 0033:0x7f4dc211aaff
> [  259.480756] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05
> <41> 89 c0 3d 00 f0 ff ff 77 1f 48 8b 44 24 18 64 48 2b 04 25 28 00
> [  259.480761] RSP: 002b:00007ffd6d2b7940 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [  259.480767] RAX: ffffffffffffffda RBX: 00007ffd6d2b79e0 RCX: 00007f4dc211aaff
> [  259.480771] RDX: 00007ffd6d2b79e0 RSI: 00000000c03864bc RDI: 0000000000000009
> [  259.480774] RBP: 00000000c03864bc R08: 0000000000000000 R09: 0000000000000000
> [  259.480777] R10: 00007f4dc221a2f0 R11: 0000000000000246 R12: 0000563e988b4590
> [  259.480781] R13: 0000000000000009 R14: 0000563e988b4650 R15: 0000563e9814f060
> [  259.480794]  </TASK>
> [  259.480797] irq event stamp: 2049057
> [  259.480800] hardirqs last  enabled at (2049063): [<ffffffff811e2369>] __up_console_sem+0x59/0x80
> [  259.480808] hardirqs last disabled at (2049068): [<ffffffff811e234e>] __up_console_sem+0x3e/0x80
> [  259.480815] softirqs last  enabled at (2048430): [<ffffffff8114f3aa>] irq_exit_rcu+0x8a/0xe0
> [  259.480821] softirqs last disabled at (2048423): [<ffffffff8114f3aa>] irq_exit_rcu+0x8a/0xe0
> [  259.480826] ---[ end trace 0000000000000000 ]---
> [  259.494838] xe 0000:00:02.0: [drm:drm_mode_addfb2] [FB:219]
> [  259.494943] xe 0000:00:02.0: [drm:skl_compute_wm [xe]] [PLAN
> 
> That is: __xe_pin_fb_vma()
> if (XE_WARN_ON(view->type == I915_GTT_VIEW_REMAPPED)) {
> 
> 
> 
