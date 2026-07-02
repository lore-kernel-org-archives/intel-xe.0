Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1668C43458
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 08:32:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02AC10E473;
	Thu,  2 Jul 2026 08:32:46 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B6710F245;
 Thu,  2 Jul 2026 08:32:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/intel/display=3A_Remo?=
 =?utf-8?q?ve_forcewake_during_pipe_updates=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 Jul 2026 08:32:45 -0000
Message-ID: <178298116560.141365.9792983645093083518@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260702080346.431508-1-dev@lankhorst.se>
In-Reply-To: <20260702080346.431508-1-dev@lankhorst.se>
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

Series: drm/intel/display: Remove forcewake during pipe updates.
URL   : https://patchwork.freedesktop.org/series/169673/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3c41fd1543876cb2f483377ba9028d899ca3b64d
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Thu Jul 2 10:03:45 2026 +0200

    drm/i915/display: Make set_pipeconf use the fw variants
    
    The calls are used inside the critical section when updating
    the gamma mode, and thus should use the _fw variants to prevent
    locks.
    
    Fixes following splat:
    | BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
    | in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 2115, name: modprobe
    | preempt_count: 0, expected: 0
    | RCU nest depth: 0, expected: 0
    | 4 locks held by modprobe/2115:
    |  #0: ffff99b9425161a0 (&dev->mutex){....}-{4:4}, at: __driver_attach+0xaf/0x1c0
    |  #1: ffffaa224810f6c0 (crtc_ww_class_acquire){+.+.}-{0:0}, at: intel_initial_commit+0x4c/0x200 [i915]
    |  #2: ffffaa224810f6e8 (crtc_ww_class_mutex){+.+.}-{4:4}, at: intel_initial_commit+0x4c/0x200 [i915]
    |  #3: ffff99b94a6c9030 (&uncore->lock){+.+.}-{3:3}, at: gen6_write32+0x50/0x290 [i915]
    | irq event stamp: 513344
    | hardirqs last  enabled at (513343): [<ffffffff8ba8d84c>] _raw_spin_unlock_irqrestore+0x4c/0x60
    | hardirqs last disabled at (513344): [<ffffffffc1543646>] intel_pipe_update_start+0x216/0x2c0 [i915]
    | softirqs last  enabled at (512766): [<ffffffff8af045cf>] __local_bh_enable_ip+0x10f/0x170
    | softirqs last disabled at (512712): [<ffffffffc14dfb6a>] __i915_request_queue+0x3a/0x70 [i915]
    | CPU: 3 UID: 0 PID: 2115 Comm: modprobe Tainted: G        W           6.18.0-rc1+ #17 PREEMPT_{RT,(lazy)}
    | Tainted: [W]=WARN
    | Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./Z68 Pro3-M, BIOS P2.30 06/29/2012
    | Call Trace:
    |  <TASK>
    |  dump_stack_lvl+0x68/0x90
    |  __might_resched.cold+0xf0/0x12b
    |  rt_spin_lock+0x5f/0x200
    |  gen6_write32+0x50/0x290 [i915]
    |  ilk_set_pipeconf+0x12d/0x230 [i915]
    |  ilk_color_commit_arm+0x2d/0x70 [i915]
    |  intel_update_crtc+0x15b/0x690 [i915]
    |  intel_commit_modeset_enables+0xa6/0xd0 [i915]
    |  intel_atomic_commit_tail+0xd55/0x19a0 [i915]
    |  intel_atomic_commit+0x25d/0x2a0 [i915]
    |  drm_atomic_commit+0xad/0xe0 [drm]
    |  intel_initial_commit+0x16c/0x200 [i915]
    |  intel_display_driver_probe+0x2e/0x80 [i915]
    |  i915_driver_probe+0x791/0xc10 [i915]
    |  i915_pci_probe+0xd7/0x190 [i915]
    
    Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 4a1a395fa156b92a83b501f8e331f21cd035c2e1 drm-intel
f213bdc94042 drm/i915/display: Make icl_dsi_frame_update use _fw too
ba329481c1d7 drm/i915/display: Use intel_de_read/write_fw in colorops
-:123: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#123: FILE: drivers/gpu/drm/i915/display/intel_color.c:1054:
+	intel_de_write_fw(display, GAMMA_MODE(crtc->pipe),
 		       crtc_state->gamma_mode);

-:143: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 1 checks, 24 lines checked
7a617c57c5e8 drm/i915/display: Use intel_de_write_fw in intel_pipe_fastset
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
<3> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48

-:156: ERROR:CODE_INDENT: code indent should use tabs where possible
#156: FILE: drivers/gpu/drm/i915/display/intel_display.c:2816:
+^I^I          VBLANK_START(crtc_vblank_start - 1) |$

-:156: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#156: FILE: drivers/gpu/drm/i915/display/intel_display.c:2816:
+	intel_de_write_fw(display, TRANS_VBLANK(display, transcoder),
+		          VBLANK_START(crtc_vblank_start - 1) |

-:157: ERROR:CODE_INDENT: code indent should use tabs where possible
#157: FILE: drivers/gpu/drm/i915/display/intel_display.c:2817:
+^I^I          VBLANK_END(crtc_vblank_end - 1));$

-:238: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 2 errors, 2 warnings, 1 checks, 141 lines checked
3c41fd154387 drm/i915/display: Make set_pipeconf use the fw variants
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
| BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48

-:46: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#46: 
Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

-:76: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 3 warnings, 0 checks, 22 lines checked


