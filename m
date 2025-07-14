Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C02C83F17
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 15:47:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3BBB10E055;
	Mon, 14 Jul 2025 15:47:12 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2AF010E2C0;
 Mon, 14 Jul 2025 15:47:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_PREEMPT=5FRT_?=
 =?utf-8?q?related_fixups=2E_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Jul 2025 15:47:11 -0000
Message-ID: <175250803185.159553.8341537126627172410@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250714153954.629393-1-bigeasy@linutronix.de>
In-Reply-To: <20250714153954.629393-1-bigeasy@linutronix.de>
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

Series: drm/i915: PREEMPT_RT related fixups. (rev6)
URL   : https://patchwork.freedesktop.org/series/132082/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
43254c2aa575037fc031c7ac21b0d031c700b2bf
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3c01c318ede839384c3bad0b683e47c308cac3a8
Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date:   Mon Jul 14 17:39:54 2025 +0200

    Revert "drm/i915: Depend on !PREEMPT_RT."
    
    Once the known issues are addressed, it should be safe to enable the
    driver.
    
    Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+ /mt/dim checkpatch 83838c0b69ca6dfadc90247a517638ca73a9c3d0 drm-intel
e803ab82673a drm/i915: Use preempt_disable/enable_rt() where recommended
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
  ad3543ede630f ("drm/intel: Push get_scanout_position() timestamping into kms driver.")

-:44: WARNING:LINE_SPACING: Missing a blank line after declarations
#44: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:320:
+	struct drm_i915_private *i915 = to_i915(display->drm);
+	spin_lock_irqsave(&i915->uncore.lock, *flags);

-:51: WARNING:LINE_SPACING: Missing a blank line after declarations
#51: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:327:
+	struct drm_i915_private *i915 = to_i915(display->drm);
+	spin_unlock_irqrestore(&i915->uncore.lock, flags);

total: 0 errors, 3 warnings, 0 checks, 78 lines checked
4bd472c9af6c drm/i915: Don't disable interrupts on PREEMPT_RT during atomic updates
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
started disabling interrupts across atomic updates. This breaks on PREEMPT_RT

total: 0 errors, 1 warnings, 0 checks, 68 lines checked
9168ff945fad drm/i915: Don't check for atomic context on PREEMPT_RT
-:35: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#35: FILE: drivers/gpu/drm/i915/i915_utils.h:276:
+#if IS_ENABLED(CONFIG_DRM_I915_DEBUG) && IS_ENABLED(CONFIG_PREEMPT_COUNT) && !defined(CONFIG_PREEMPT_RT)

total: 0 errors, 1 warnings, 0 checks, 15 lines checked
1072a90192dd drm/i915: Disable tracing points on PREEMPT_RT
-:27: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#27: 
Reported-by: Luca Abeni <lucabe72@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>

-:75: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 30 lines checked
63ba2f0dbe68 drm/i915/gt: Use spin_lock_irq() instead of local_irq_disable() + spin_lock()
-:22: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#22: 
Reported-by: Clark Williams <williams@redhat.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

total: 0 errors, 1 warnings, 0 checks, 53 lines checked
a03ce64f156f drm/i915: Drop the irqs_disabled() check
-:16: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#16: 
Reported-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

total: 0 errors, 1 warnings, 0 checks, 14 lines checked
b95f2e0f32ac drm/i915/guc: Consider also RCU depth in busy loop.
-:13: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#13: 
Reported-by: "John B. Wyatt IV" <jwyatt@redhat.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

-:26: ERROR:IN_ATOMIC: do not use in_atomic in drivers
#26: FILE: drivers/gpu/drm/i915/gt/uc/intel_guc.h:365:
+	bool not_atomic = !in_atomic() && !irqs_disabled() && !rcu_preempt_depth();

total: 1 errors, 1 warnings, 0 checks, 8 lines checked
dd70550c799a drm/i915: Consider RCU read section as atomic.
-:26: WARNING:LONG_LINE_COMMENT: line length of 101 exceeds 100 columns
#26: FILE: drivers/gpu/drm/i915/gt/intel_engine_cs.c:1612:
+	if (in_atomic() || irqs_disabled() || rcu_preempt_depth()) /* inside atomic preempt-reset? */

-:26: ERROR:IN_ATOMIC: do not use in_atomic in drivers
#26: FILE: drivers/gpu/drm/i915/gt/intel_engine_cs.c:1612:
+	if (in_atomic() || irqs_disabled() || rcu_preempt_depth()) /* inside atomic preempt-reset? */

total: 1 errors, 1 warnings, 0 checks, 8 lines checked
3c01c318ede8 Revert "drm/i915: Depend on !PREEMPT_RT."


