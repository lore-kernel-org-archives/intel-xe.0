Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0925FD2D63
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 12:11:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 611F610E6AC;
	Tue, 10 Mar 2026 12:11:33 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA29310E279;
 Tue, 10 Mar 2026 12:11:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_All_p?=
 =?utf-8?q?atches_to_make_PREEMPT=5FRT_work_on_i915_+_xe=2E_=28rev14=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Mar 2026 12:11:31 -0000
Message-ID: <177314469193.338934.165818632824742825@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260310115709.2276203-1-dev@lankhorst.se>
In-Reply-To: <20260310115709.2276203-1-dev@lankhorst.se>
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

Series: drm/i915/display: All patches to make PREEMPT_RT work on i915 + xe. (rev14)
URL   : https://patchwork.freedesktop.org/series/159034/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7fd9e411743903c36fc1e625dd8de6900d4f5acb
Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date:   Tue Mar 10 12:57:08 2026 +0100

    drm/i915/gt: Add a spinlock to prevent starvation of irq_work.
    
    IRQ-Work (FIFO-1) will be preempted by the threaded-interrupt (FIFO-50)
    and the interrupt will poll on signaler_active while the irq-work can't
    make progress.
    
    Solve this by adding a spinlock to prevent starvation and force
    completion.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 77e176657e782bb81270c230d1cfec91f7707162 drm-intel
79bd7d0764c3 drm/vblank_work: Add methods to schedule vblank_work in 2 stages
-:116: CHECK:LINE_SPACING: Please don't use multiple blank lines
#116: FILE: drivers/gpu/drm/drm_vblank_work.c:180:
 
+

total: 0 errors, 0 warnings, 1 checks, 162 lines checked
639b9c115d50 drm/vblank: Add a 2-stage version of drm_crtc_arm_vblank_event
652ee2c41511 drm/intel/display: Make intel_crtc_arm_vblank_event static
3986bb1e7e09 drm/intel/display: Convert vblank event handling to 2-stage arming
-:139: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#139: FILE: drivers/gpu/drm/i915/display/intel_crtc.c:752:
+							 drm_crtc_accurate_vblank_count(&crtc->base) + 1,

-:142: WARNING:LONG_LINE_COMMENT: line length of 110 exceeds 100 columns
#142: FILE: drivers/gpu/drm/i915/display/intel_crtc.c:755:
+				/* Remove plane from atomic state, cleanup/free is done from vblank worker. */

total: 0 errors, 2 warnings, 0 checks, 120 lines checked
722856e23869 drm/i915/display: Move vblank put until after critical section
e576e647adfe drm/i915/display: Remove locking from intel_vblank_evade critical section
-:47: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#47: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:735:
+static bool scanline_in_safe_range(struct intel_vblank_evade_ctx *evade, int *scanline, bool unlocked)

-:91: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#91: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:767:
+		timeout = wait_event_timeout(*wq, scanline_in_safe_range(evade, &scanline, true), timeout);

total: 0 errors, 2 warnings, 0 checks, 78 lines checked
4183ddfb90b6 drm/i915/display: Handle vlv dsi workaround in scanline_in_safe_range too
b86bc8bd77b0 drm/i915: Use preempt_disable/enable_rt() where recommended
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
5cb67d624443 drm/i915/display: Make get_vblank_counter use intel_de_read_fw()
-:8: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#8: 
<3> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
fa92857210d4 drm/i915/display: Do not take uncore lock in i915_get_vblank_counter
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
3ca6b97d05b4 drm/i915/display: Make icl_dsi_frame_update use _fw too
4cd533806948 drm/i915/display: Use intel_de_read/write_fw in colorops
-:123: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#123: FILE: drivers/gpu/drm/i915/display/intel_color.c:1054:
+	intel_de_write_fw(display, GAMMA_MODE(crtc->pipe),
 		       crtc_state->gamma_mode);

-:143: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 1 checks, 24 lines checked
765abf38cf39 drm/i915/display: Use intel_de_write_fw in intel_pipe_fastset
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
<3> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48

-:203: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 112 lines checked
ae5a92ca1c69 drm/i915/display: Make set_pipeconf use the fw variants
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
| BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48

-:46: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#46: 
Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

-:76: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 3 warnings, 0 checks, 22 lines checked
d1a9944e7d20 drm/i915/display: Fix intel_lpe_audio_irq_handler for PREEMPT-RT
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
Because intel_lpe_audio_irq_handler() may be called in threaded IRQ context,

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
dd15c45c1bf3 drm/i915/gt: Use spin_lock_irq() instead of local_irq_disable() + spin_lock()
-:22: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#22: 
Reported-by: Clark Williams <williams@redhat.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

total: 0 errors, 1 warnings, 0 checks, 53 lines checked
de19a909607a drm/i915: Drop the irqs_disabled() check
-:16: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#16: 
Reported-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

total: 0 errors, 1 warnings, 0 checks, 14 lines checked
0d88e188d794 drm/i915/guc: Consider also RCU depth in busy loop.
-:13: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#13: 
Reported-by: "John B. Wyatt IV" <jwyatt@redhat.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

-:27: ERROR:IN_ATOMIC: do not use in_atomic in drivers
#27: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc.h:365:
+	bool not_atomic = !in_atomic() && !irqs_disabled() && !rcu_preempt_depth();

total: 1 errors, 1 warnings, 0 checks, 8 lines checked
196c87b569a0 drm/i915/gt: Fix selftests on PREEMPT_RT
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 26 lines checked
ed35927713c8 drm/i915/gt: Set stop_timeout() correctly on PREEMPT-RT
-:20: WARNING:LONG_LINE_COMMENT: line length of 101 exceeds 100 columns
#20: FILE: drivers/gpu/drm/i915/gt/intel_engine_cs.c:1610:
+	if (in_atomic() || irqs_disabled() || rcu_preempt_depth()) /* inside atomic preempt-reset? */

-:20: ERROR:IN_ATOMIC: do not use in_atomic in drivers
#20: FILE: drivers/gpu/drm/i915/gt/intel_engine_cs.c:1610:
+	if (in_atomic() || irqs_disabled() || rcu_preempt_depth()) /* inside atomic preempt-reset? */

total: 1 errors, 1 warnings, 0 checks, 8 lines checked
b11495d3f633 drm/i915/display: Remove uncore lock from vlv_atomic_update_fifo
f7913847b960 drm/i915: Use sleeping selftests for igt_atomic on PREEMPT_RT
86cd54693e7e Revert "drm/i915: Depend on !PREEMPT_RT."
e1708d8ad928 PREEMPT_RT injection
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 43 lines checked
c5087b289fb2 FOR-CI: bump MAX_STACK_TRACE_ENTRIES
7fd9e4117439 drm/i915/gt: Add a spinlock to prevent starvation of irq_work.
-:65: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#65: FILE: drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h:43:
+	spinlock_t signaler_active_sync;

-:68: ERROR:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author 'Sebastian Andrzej Siewior <bigeasy@linutronix.de>'

total: 1 errors, 0 warnings, 1 checks, 40 lines checked


