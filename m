Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C67D59D6F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 15:40:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963B510E8D5;
	Fri, 12 Dec 2025 15:40:34 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422FA10E8CF;
 Fri, 12 Dec 2025 15:40:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_All_p?=
 =?utf-8?q?atches_to_make_PREEMPT=5FRT_work_on_xe=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Dec 2025 15:40:33 -0000
Message-ID: <176555403325.81112.1463289123035520708@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251212143504.973839-14-dev@lankhorst.se>
In-Reply-To: <20251212143504.973839-14-dev@lankhorst.se>
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

Series: drm/i915/display: All patches to make PREEMPT_RT work on xe. (rev2)
URL   : https://patchwork.freedesktop.org/series/158855/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8f50e69d0ce3656564bbdf8b3e213d61470d463f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6f23d82fc548cacd6b8bd153d23f32b8168be334
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Fri Dec 12 15:35:16 2025 +0100

    drm/i915/display: Use intel_de_read_fw in colorops
    
    This fixes a module load error on PTL:
    
    BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
    in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 1335, name: xe_module_load
    preempt_count: 0, expected: 0
    RCU nest depth: 0, expected: 0
    11 locks held by xe_module_load/1335:
     #0: ffff888107e0c1a0 (&dev->mutex){....}-{3:3}, at: __driver_attach+0x104/0x220
     #1: ffff888115388280 (&dev->clientlist_mutex){+.+.}-{3:3}, at: drm_client_register+0x32/0xe0
     #2: ffffffff837f89d8 (registration_lock){+.+.}-{3:3}, at: register_framebuffer+0x1b/0x50
     #3: ffffffff83598620 (console_lock){+.+.}-{0:0}, at: fbcon_fb_registered+0x6f/0x90
     #4: ffff888122775aa0 (&helper->lock){+.+.}-{3:3}, at: __drm_fb_helper_restore_fbdev_mode_unlocked+0x7b/0x110
     #5: ffff888115388158 (&dev->master_mutex){+.+.}-{3:3}, at: drm_master_internal_acquire+0x20/0x50
     #6: ffff888122775888 (&client->modeset_mutex){+.+.}-{3:3}, at: drm_client_modeset_commit_locked+0x2a/0x1b0
     #7: ffffc90003d46e88 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_client_modeset_commit_atomic+0x4c/0x2b0
     #8: ffffc90003d46eb0 (crtc_ww_class_mutex){+.+.}-{3:3}, at: drm_client_modeset_commit_atomic+0x4c/0x2b0
     #9: ffff888139a0b8b8 (&intel_dp->psr.lock){+.+.}-{3:3}, at: intel_psr_lock+0xc5/0xf0 [xe]
     #10: ffff888127123d30 (&wl->lock){+.+.}-{2:2}, at: intel_dmc_wl_get+0x3c/0x140 [xe]
    irq event stamp: 1240122
    hardirqs last  enabled at (1240121): [<ffffffff828a2d11>] _raw_spin_unlock_irqrestore+0x51/0x80
    hardirqs last disabled at (1240122): [<ffffffffa0d7de9b>] intel_pipe_update_start+0x34b/0x440 [xe]
    softirqs last  enabled at (0): [<ffffffff813c291c>] copy_process+0xabc/0x23d0
    softirqs last disabled at (0): [<0000000000000000>] 0x0
    CPU: 5 UID: 0 PID: 1335 Comm: xe_module_load Tainted: G     U              6.18.0-lgci-xe-xe-pw-158855v1+ #1 PREEMPT_{RT,(lazy)}
    Tainted: [U]=USER
    Hardware name: Intel Corporation Panther Lake Client Platform/PTL-UH LP5 T3 RVP1, BIOS PTLPFWI1.R00.3383.D10.2510222219 10/22/2025
    Call Trace:
     <TASK>
     dump_stack_lvl+0x91/0xf0
     dump_stack+0x10/0x20
     __might_resched+0x174/0x260
     rt_spin_lock+0x63/0x200
     ? intel_dmc_wl_get+0x3c/0x140 [xe]
     ? __lock_acquire+0x1195/0x2860
     intel_dmc_wl_get+0x3c/0x140 [xe]
     intel_color_plane_commit_arm+0xbc/0x140 [xe]
     icl_plane_update_arm+0x23f/0x280 [xe]
     intel_plane_update_arm+0x74/0x170 [xe]
     intel_crtc_planes_update_arm+0x3cb/0x4c0 [xe]
     intel_update_crtc+0x1c3/0x840 [xe]
     ? intel_pre_update_crtc+0x2ce/0x470 [xe]
     ? intel_enable_crtc+0x123/0x150 [xe]
     skl_commit_modeset_enables+0x4c4/0x720 [xe]
     intel_atomic_commit_tail+0xd9d/0x1b30 [xe]
     intel_atomic_commit+0x2e8/0x330 [xe]
     ? intel_atomic_commit+0x2e8/0x330 [xe]
     drm_atomic_commit+0xaf/0xf0
     ? __pfx___drm_printfn_info+0x10/0x10
     drm_client_modeset_commit_atomic+0x25c/0x2b0
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 39f65c105d5b1af093f9df6f3dc688a642f96456 drm-intel
a37bcbc8627e drm/i915/display: Fix intel_lpe_audio_irq_handler for PREEMPT-RT
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
Because intel_lpe_audio_irq_handler() may be called in threaded IRQ context,

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
e1da0756e838 drm/i915/display: Make get_vblank_counter use intel_de_read_fw()
-:8: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#8: 
<3> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
29c4c86f7797 drm/i915/display: Use intel_de_write_fw in intel_pipe_fastset
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
<3> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48

-:201: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 110 lines checked
d376b9f757a4 drm/i915/display: Make set_pipeconf use the fw variants
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
| BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48

-:46: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#46: 
Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

-:76: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 3 warnings, 0 checks, 22 lines checked
84e6c40813e9 drm/i915/display: Move vblank put until after critical section
1bc8e8b6ce0a drm/i915/display: Remove locking from intel_vblank_evade critical section
-:66: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#66: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:740:
+		timeout = wait_event_timeout(*wq, scanline_in_safe_range(evade, &scanline), timeout);

total: 0 errors, 1 warnings, 0 checks, 52 lines checked
84ce63e289e9 drm/i915/display: Handle vlv dsi workaround in scanline_in_safe_range too
feb9abff8f44 drm/i915/display: Make icl_dsi_frame_update use _fw too
448dcf10d582 drm/i915/display: Enable interrupts earlier on PREEMPT_RT
7e25e4403f5c drm/i915: Use preempt_disable/enable_rt() where recommended
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
  ad3543ede630f ("drm/intel: Push get_scanout_position() timestamping into kms driver.")

-:45: WARNING:LINE_SPACING: Missing a blank line after declarations
#45: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:325:
+	struct drm_i915_private *i915 = to_i915(display->drm);
+	spin_lock_irqsave(&i915->uncore.lock, *flags);

-:52: WARNING:LINE_SPACING: Missing a blank line after declarations
#52: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:332:
+	struct drm_i915_private *i915 = to_i915(display->drm);
+	spin_unlock_irqrestore(&i915->uncore.lock, flags);

total: 0 errors, 3 warnings, 0 checks, 78 lines checked
93a4bf4cf673 PREEMPT_RT injection
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 43 lines checked
6f23d82fc548 drm/i915/display: Use intel_de_read_fw in colorops
-:79: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 16 lines checked


