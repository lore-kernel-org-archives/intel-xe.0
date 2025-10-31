Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AE8CCF9FF
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 09:35:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FAA10EAE1;
	Fri, 31 Oct 2025 09:35:10 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C04D10EADF;
 Fri, 31 Oct 2025 09:35:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Testing_PREEMPT=5FRT_with?=
 =?utf-8?q?_disabling_irqs_in_the_most_critical_section=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 Oct 2025 09:35:09 -0000
Message-ID: <176190330917.4069.11801247842383542598@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251030184710.359870-1-dev@lankhorst.se>
In-Reply-To: <20251030184710.359870-1-dev@lankhorst.se>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Testing PREEMPT_RT with disabling irqs in the most critical section. (rev2)
URL   : https://patchwork.freedesktop.org/series/156777/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f867e605613af1770f90c4b0afd4a8f06424d1f0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 30e46b18c639f363c80401c19866b787d0a506f4
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Thu Oct 30 19:47:10 2025 +0100

    drm/i915/display: Use intel_de_write_fw in intel_pipe_fastset
    
    intel_set_pipe_src_size(), hsw_set_linetime_wm(),
    intel_cpu_transcoder_set_m1_n1() and intel_set_transcoder_timings_lrr()
    are called from an atomic context on PREEMPT_RT, and should be using the
    _fw functions.
    
    Again noticed when trying to disable preemption in vblank evasion:
    <3> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
    <3> in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1505, name: kms_cursor_lega
    <3> preempt_count: 1, expected: 0
    <3> RCU nest depth: 0, expected: 0
    <4> 4 locks held by kms_cursor_lega/1505:
    <4>  #0: ffffc90003c6f988 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_mode_atomic_ioctl+0x13b/0xe90
    <4>  #1: ffffc90003c6f9b0 (crtc_ww_class_mutex){+.+.}-{3:3}, at: drm_mode_atomic_ioctl+0x13b/0xe90
    <4>  #2: ffff888135b838b8 (&intel_dp->psr.lock){+.+.}-{3:3}, at: intel_psr_lock+0xc5/0xf0 [xe]
    <4>  #3: ffff88812607bbc0 (&wl->lock){+.+.}-{2:2}, at: intel_dmc_wl_get+0x3c/0x140 [xe]
    <4> CPU: 6 UID: 0 PID: 1505 Comm: kms_cursor_lega Tainted: G     U              6.18.0-rc3-lgci-xe-xe-pw-156729v1+ #1 PREEMPT_{RT,(lazy)}
    <4> Tainted: [U]=USER
    <4> Hardware name: Intel Corporation Panther Lake Client Platform/PTL-UH LP5 T3 RVP1, BIOS PTLPFWI1.R00.3383.D02.2509240621 09/24/2025
    <4> Call Trace:
    <4>  <TASK>
    <4>  dump_stack_lvl+0xc1/0xf0
    <4>  dump_stack+0x10/0x20
    <4>  __might_resched+0x174/0x260
    <4>  rt_spin_lock+0x63/0x200
    <4>  ? intel_dmc_wl_get+0x3c/0x140 [xe]
    <4>  intel_dmc_wl_get+0x3c/0x140 [xe]
    <4>  intel_set_pipe_src_size+0x89/0xe0 [xe]
    <4>  intel_update_crtc+0x3c1/0x950 [xe]
    <4>  ? intel_pre_update_crtc+0x258/0x400 [xe]
    <4>  skl_commit_modeset_enables+0x217/0x720 [xe]
    <4>  intel_atomic_commit_tail+0xd4e/0x1af0 [xe]
    <4>  ? lock_release+0xce/0x2a0
    <4>  intel_atomic_commit+0x2e5/0x330 [xe]
    <4>  ? intel_atomic_commit+0x2e5/0x330 [xe]
    <4>  drm_atomic_commit+0xaf/0xf0
    <4>  ? __pfx___drm_printfn_info+0x10/0x10
    <4>  drm_mode_atomic_ioctl+0xbd5/0xe90
    <4>  ? lock_acquire+0xc4/0x2e0
    <4>  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
    <4>  drm_ioctl_kernel+0xb6/0x120
    <4>  drm_ioctl+0x2d7/0x5a0
    <4>  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
    <4>  ? rt_spin_unlock+0xa0/0x140
    <4>  ? __pm_runtime_resume+0x53/0x90
    <4>  xe_drm_ioctl+0x56/0x90 [xe]
    <4>  __x64_sys_ioctl+0xa8/0x110
    <4>  ? lock_acquire+0xc4/0x2e0
    <4>  x64_sys_call+0x1144/0x26a0
    <4>  do_syscall_64+0x93/0xae0
    <4>  ? lock_release+0xce/0x2a0
    <4>  ? __task_pid_nr_ns+0xd9/0x270
    <4>  ? do_syscall_64+0x1b7/0xae0
    <4>  ? find_held_lock+0x31/0x90
    <4>  ? __task_pid_nr_ns+0xcf/0x270
    <4>  ? __lock_acquire+0x43e/0x2860
    <4>  ? __task_pid_nr_ns+0xd9/0x270
    <4>  ? lock_acquire+0xc4/0x2e0
    <4>  ? find_held_lock+0x31/0x90
    <4>  ? __task_pid_nr_ns+0xcf/0x270
    <4>  ? lock_release+0xce/0x2a0
    <4>  ? __task_pid_nr_ns+0xd9/0x270
    <4>  ? do_syscall_64+0x1b7/0xae0
    <4>  ? do_syscall_64+0x1b7/0xae0
    <4>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch b77fdf10d8dee0b5e42da888b78e3841955ad8a0 drm-intel
4f539c0ee40b drm/xe: Bump xe_device_l2_flush even higher
47c0dc72ffa0 drm/i915/display: Make get_vblank_counter use intel_de_read_fw()
-:8: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#8: 
<3> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
c1c57a339216 drm/i915: Use preempt_disable/enable_rt() where recommended
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
  ad3543ede630f ("drm/intel: Push get_scanout_position() timestamping into kms driver.")

-:45: WARNING:LINE_SPACING: Missing a blank line after declarations
#45: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:324:
+	struct drm_i915_private *i915 = to_i915(display->drm);
+	spin_lock_irqsave(&i915->uncore.lock, *flags);

-:52: WARNING:LINE_SPACING: Missing a blank line after declarations
#52: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:331:
+	struct drm_i915_private *i915 = to_i915(display->drm);
+	spin_unlock_irqrestore(&i915->uncore.lock, flags);

total: 0 errors, 3 warnings, 0 checks, 78 lines checked
8a1b0b5685e5 drm/i915: Don't disable interrupts on PREEMPT_RT during atomic updates
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
started disabling interrupts across atomic updates. This breaks on PREEMPT_RT

total: 0 errors, 1 warnings, 0 checks, 68 lines checked
39d52408d50c drm/xe/display: Disable preemption in the most critical section
9dce8ad96807 PREEMPT_RT injection
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 43 lines checked
a734e3de2137 With disabled irqs instead
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 125 lines checked
30e46b18c639 drm/i915/display: Use intel_de_write_fw in intel_pipe_fastset
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
<3> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48

-:199: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 110 lines checked


