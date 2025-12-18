Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E95BD711C8
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 23:51:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1509110EB6D;
	Thu, 18 Dec 2025 23:51:22 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668BA10EB6D;
 Thu, 18 Dec 2025 23:51:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_All_p?=
 =?utf-8?q?atches_to_make_PREEMPT=5FRT_work_on_i915_+_xe=2E_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Dec 2025 23:51:20 -0000
Message-ID: <176610188041.104239.14955564178951483056@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251218163408.97508-1-dev@lankhorst.se>
In-Reply-To: <20251218163408.97508-1-dev@lankhorst.se>
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

Series: drm/i915/display: All patches to make PREEMPT_RT work on i915 + xe. (rev8)
URL   : https://patchwork.freedesktop.org/series/159034/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5f54f403acc61a45ad2b4d68dfd74b336dce1968
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 414f44e1de3c92c3eb95eabf68c0331e834b5b55
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Thu Dec 18 22:50:11 2025 +0100

    drm/i915/display: Remove uncore lock from vlv_atomic_update_fifo
    
    TODO: Grab uncore lock during entire vblank evasion before disabling
    interrupts, and check what breaks?
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 53321a6c9c6493826861710f521737de4c9bffcc drm-intel
d8514f992147 drm/i915/display: Fix intel_lpe_audio_irq_handler for PREEMPT-RT
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
Because intel_lpe_audio_irq_handler() may be called in threaded IRQ context,

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
73961f742b79 drm/i915/display: Make get_vblank_counter use intel_de_read_fw()
-:8: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#8: 
<3> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
c74fc0ca4837 drm/i915/display: Use intel_de_write_fw in intel_pipe_fastset
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
<3> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48

-:201: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 110 lines checked
d60e5f6fd7c2 drm/i915/display: Make set_pipeconf use the fw variants
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
| BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48

-:46: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#46: 
Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

-:76: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 3 warnings, 0 checks, 22 lines checked
13b86837468b drm/i915/display: Move vblank put until after critical section
78d15087cb97 drm/i915/display: Remove locking from intel_vblank_evade critical section
-:47: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#47: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:711:
+static bool scanline_in_safe_range(struct intel_vblank_evade_ctx *evade, int *scanline, bool unlocked)

-:91: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#91: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:743:
+		timeout = wait_event_timeout(*wq, scanline_in_safe_range(evade, &scanline, true), timeout);

total: 0 errors, 2 warnings, 0 checks, 78 lines checked
3702d0879b06 drm/i915/display: Handle vlv dsi workaround in scanline_in_safe_range too
f71357abd8a8 drm/i915/display: Make icl_dsi_frame_update use _fw too
d7ef0cf1ae22 drm/i915/display: Enable interrupts earlier on PREEMPT_RT
d43bc9be159d drm/i915: Use preempt_disable/enable_rt() where recommended
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
e8d21cb9fc86 PREEMPT_RT injection
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 43 lines checked
483c07589286 drm/i915/display: Use intel_de_read_fw in colorops
-:131: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
5494e27dc92b drm/i915/gt: Use spin_lock_irq() instead of local_irq_disable() + spin_lock()
-:22: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#22: 
Reported-by: Clark Williams <williams@redhat.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

total: 0 errors, 1 warnings, 0 checks, 53 lines checked
bd1cad996ff4 drm/i915: Drop the irqs_disabled() check
-:16: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#16: 
Reported-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

total: 0 errors, 1 warnings, 0 checks, 14 lines checked
0d855903e4cc drm/i915/guc: Consider also RCU depth in busy loop.
-:13: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#13: 
Reported-by: "John B. Wyatt IV" <jwyatt@redhat.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

-:27: ERROR:IN_ATOMIC: do not use in_atomic in drivers
#27: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc.h:365:
+	bool not_atomic = !in_atomic() && !irqs_disabled() && !rcu_preempt_depth();

total: 1 errors, 1 warnings, 0 checks, 8 lines checked
ad61d13556f4 Revert "drm/i915: Depend on !PREEMPT_RT."
79c4cd251ff6 drm/i915/gt: Fix selftests on PREEMPT_RT
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 26 lines checked
758d9c37da8d drm/i915/gt: Set stop_timeout() correctly on PREEMPT-RT
-:20: WARNING:LONG_LINE_COMMENT: line length of 101 exceeds 100 columns
#20: FILE: drivers/gpu/drm/i915/gt/intel_engine_cs.c:1610:
+	if (in_atomic() || irqs_disabled() || rcu_preempt_depth()) /* inside atomic preempt-reset? */

-:20: ERROR:IN_ATOMIC: do not use in_atomic in drivers
#20: FILE: drivers/gpu/drm/i915/gt/intel_engine_cs.c:1610:
+	if (in_atomic() || irqs_disabled() || rcu_preempt_depth()) /* inside atomic preempt-reset? */

total: 1 errors, 1 warnings, 0 checks, 8 lines checked
f25876e832e5 drm/i915/display: Do not take uncore lock in i915_get_vblank_counter
-:8: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:39: ERROR:CODE_INDENT: code indent should use tabs where possible
#39: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:114:
+^I^I^I^I        PIPEFRAME(display, pipe));$

-:39: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#39: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:114:
+	frame = intel_de_read64_2x32_fw(display, PIPEFRAMEPIXEL(display, pipe),
+				        PIPEFRAME(display, pipe));

-:56: WARNING:LINE_SPACING: Missing a blank line after declarations
#56: FILE: drivers/gpu/drm/i915/intel_uncore.h:457:
+	u32 upper, lower, old_upper, loop = 0;
+	upper = intel_uncore_read_fw(uncore, upper_reg);

total: 1 errors, 2 warnings, 1 checks, 85 lines checked
414f44e1de3c drm/i915/display: Remove uncore lock from vlv_atomic_update_fifo


