Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA818C43458
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 13:35:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905E510E8B0;
	Mon, 29 Jun 2026 13:35:42 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6D610E079;
 Mon, 29 Jun 2026 13:35:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_All_p?=
 =?utf-8?q?atches_to_make_PREEMPT=5FRT_work_on_i915_+_xe=2E_=28rev20=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 29 Jun 2026 13:35:41 -0000
Message-ID: <178274014182.128396.12277147981305870976@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260626134222.1198252-1-dev@lankhorst.se>
In-Reply-To: <20260626134222.1198252-1-dev@lankhorst.se>
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

Series: drm/i915/display: All patches to make PREEMPT_RT work on i915 + xe. (rev20)
URL   : https://patchwork.freedesktop.org/series/159034/
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
commit 9f578eacfb5e1be5c40c9b4fd25ab9d0c475d25f
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Fri Jun 26 15:42:20 2026 +0200

    drm/i915/pmu: Disable on PREEMPT_RT
    
    I tried to come up with alternative and lockless approaches
    to make pmu work, but since the perf events are run in
    atomic context on PREEMPT_RT, ordinary spinlocks no longer
    work and forcewake and register accesses become problematic.
    
    Disable perf events on PREEMPT_RT for now, without affecting
    !PREEMPT_RT users.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch b9aebfff5a3c5049500a7bd4573815090a425f34 drm-intel
afb11535c21f drm/vblank_work: Add methods to schedule vblank_work in 2 stages
-:116: CHECK:LINE_SPACING: Please don't use multiple blank lines
#116: FILE: drivers/gpu/drm/drm_vblank_work.c:180:
 
+

total: 0 errors, 0 warnings, 1 checks, 166 lines checked
e4438d34fa7f drm/vblank: Add a 2-stage version of drm_crtc_arm_vblank_event
8649fdb8d811 drm/intel/display: Make intel_crtc_arm_vblank_event static
50d2fffe94e8 drm/intel/display: Convert vblank event handling to 2-stage arming
-:139: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#139: FILE: drivers/gpu/drm/i915/display/intel_crtc.c:798:
+							 drm_crtc_accurate_vblank_count(&crtc->base) + 1,

-:142: WARNING:LONG_LINE_COMMENT: line length of 110 exceeds 100 columns
#142: FILE: drivers/gpu/drm/i915/display/intel_crtc.c:801:
+				/* Remove plane from atomic state, cleanup/free is done from vblank worker. */

total: 0 errors, 2 warnings, 0 checks, 120 lines checked
7107fb33bad8 drm/i915/display: Move vblank put until after critical section
5a4d3e4df358 drm/i915/display: Remove locking from intel_vblank_evade critical section
-:47: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#47: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:735:
+static bool scanline_in_safe_range(struct intel_vblank_evade_ctx *evade, int *scanline, bool unlocked)

-:91: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#91: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:767:
+		timeout = wait_event_timeout(*wq, scanline_in_safe_range(evade, &scanline, true), timeout);

total: 0 errors, 2 warnings, 0 checks, 78 lines checked
6aadb8d63395 drm/i915/display: Handle vlv dsi workaround in scanline_in_safe_range too
bbdd606ae294 drm/i915: Use preempt_disable/enable_rt() where recommended
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
  ad3543ede630f ("drm/intel: Push get_scanout_position() timestamping into kms driver.")

-:46: WARNING:LINE_SPACING: Missing a blank line after declarations
#46: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:324:
+	struct intel_uncore *uncore = to_intel_uncore(display->drm);
+	spin_lock_irqsave(&uncore->lock, *flags);

-:53: WARNING:LINE_SPACING: Missing a blank line after declarations
#53: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:331:
+	struct intel_uncore *uncore = to_intel_uncore(display->drm);
+	spin_unlock_irqrestore(&uncore->lock, flags);

total: 0 errors, 3 warnings, 0 checks, 78 lines checked
18fd912d52c8 drm/i915/display: Make get_vblank_counter use intel_de_read_fw()
-:8: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#8: 
<3> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
e6b755d49fe6 drm/i915/display: Do not take uncore lock in i915_get_vblank_counter
-:43: ERROR:CODE_INDENT: code indent should use tabs where possible
#43: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:113:
+^I^I^I^I        PIPEFRAME(display, pipe));$

-:43: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#43: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:113:
+	frame = intel_de_read64_2x32_fw(display, PIPEFRAMEPIXEL(display, pipe),
+				        PIPEFRAME(display, pipe));

-:60: WARNING:LINE_SPACING: Missing a blank line after declarations
#60: FILE: drivers/gpu/drm/i915/intel_uncore.h:457:
+	u32 upper, lower, old_upper, loop = 0;
+	upper = intel_uncore_read_fw(uncore, upper_reg);

total: 1 errors, 1 warnings, 1 checks, 85 lines checked
358ba3bfecee drm/i915/display: Make icl_dsi_frame_update use _fw too
283fb1bdb2d1 drm/i915/display: Use intel_de_read/write_fw in colorops
-:123: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#123: FILE: drivers/gpu/drm/i915/display/intel_color.c:1054:
+	intel_de_write_fw(display, GAMMA_MODE(crtc->pipe),
 		       crtc_state->gamma_mode);

-:143: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 1 checks, 24 lines checked
10ed20c8742b drm/i915/display: Use intel_de_write_fw in intel_pipe_fastset
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
6d7fc0be37b0 drm/i915/display: Make set_pipeconf use the fw variants
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
| BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48

-:46: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#46: 
Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

-:76: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 3 warnings, 0 checks, 22 lines checked
87e5aa43295c drm/i915/gt: Use spin_lock_irq() instead of local_irq_disable() + spin_lock()
-:22: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#22: 
Reported-by: Clark Williams <williams@redhat.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

total: 0 errors, 1 warnings, 0 checks, 53 lines checked
5cb3c3b6d2f8 drm/i915: Drop the irqs_disabled() check
-:16: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#16: 
Reported-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

total: 0 errors, 1 warnings, 0 checks, 14 lines checked
7b979c48d2cf drm/i915/guc: Consider also RCU depth in busy loop.
-:13: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#13: 
Reported-by: "John B. Wyatt IV" <jwyatt@redhat.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

-:27: ERROR:IN_ATOMIC: do not use in_atomic in drivers
#27: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc.h:365:
+	bool not_atomic = !in_atomic() && !irqs_disabled() && !rcu_preempt_depth();

total: 1 errors, 1 warnings, 0 checks, 8 lines checked
531f939d3e58 drm/i915/gt: Fix selftests on PREEMPT_RT
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 26 lines checked
b6c8682cd1fd drm/i915/gt: Set stop_timeout() correctly on PREEMPT-RT
-:20: WARNING:LONG_LINE_COMMENT: line length of 101 exceeds 100 columns
#20: FILE: drivers/gpu/drm/i915/gt/intel_engine_cs.c:1610:
+	if (in_atomic() || irqs_disabled() || rcu_preempt_depth()) /* inside atomic preempt-reset? */

-:20: ERROR:IN_ATOMIC: do not use in_atomic in drivers
#20: FILE: drivers/gpu/drm/i915/gt/intel_engine_cs.c:1610:
+	if (in_atomic() || irqs_disabled() || rcu_preempt_depth()) /* inside atomic preempt-reset? */

total: 1 errors, 1 warnings, 0 checks, 8 lines checked
0d0f33fcd5c1 drm/i915/display: Remove uncore lock from vlv_atomic_update_fifo
d92ece06412b drm/i915: Use sleeping selftests for igt_atomic on PREEMPT_RT
fb995e4c4dc1 Revert "drm/i915: Depend on !PREEMPT_RT."
cc7046e1b384 PREEMPT_RT injection
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 11 lines checked
7664cdf047bb FOR-CI: bump MAX_STACK_TRACE_ENTRIES
54d1561ae971 drm/i915/gt: Add a spinlock to prevent starvation of irq_work.
-:65: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#65: FILE: drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h:43:
+	spinlock_t signaler_active_sync;

-:68: ERROR:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author 'Sebastian Andrzej Siewior <bigeasy@linutronix.de>'

total: 1 errors, 0 warnings, 1 checks, 40 lines checked
e88437ac7c02 drm/xe: Avoid using stolen memory for DPT.
1b4aea9f9246 drm/xe/display: Avoid using stolen memory for framebuffer when media gt exists.
78bb0128533b drm/xe/display: Do not allocate into stolen for new framebuffers.
9f578eacfb5e drm/i915/pmu: Disable on PREEMPT_RT


