Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000F1C67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 17:16:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82762113C9D;
	Fri,  5 Apr 2024 17:16:48 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C36D112CA0;
 Fri,  5 Apr 2024 17:16:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/i915=3A_PREEMPT?=
 =?utf-8?q?=5FRT_related_fixups=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Apr 2024 17:16:46 -0000
Message-ID: <171233740611.1239316.13474346238073768926@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240405142737.920626-1-bigeasy@linutronix.de>
In-Reply-To: <20240405142737.920626-1-bigeasy@linutronix.de>
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

Series: drm/i915: PREEMPT_RT related fixups.
URL   : https://patchwork.freedesktop.org/series/132082/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 8cb1ee178ef7 drm-tip: 2024y-04m-05d-16h-52m-43s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/i915/Kconfig:3
error: drivers/gpu/drm/i915/Kconfig: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/i915: Use preempt_disable/enable_rt() where recommended
Applying: drm/i915: Don't disable interrupts on PREEMPT_RT during atomic updates
Applying: drm/i915: Don't check for atomic context on PREEMPT_RT
Applying: drm/i915: Disable tracing points on PREEMPT_RT
Applying: drm/i915: skip DRM_I915_LOW_LEVEL_TRACEPOINTS with NOTRACE
Applying: drm/i915/gt: Queue and wait for the irq_work item.
Applying: drm/i915/gt: Use spin_lock_irq() instead of local_irq_disable() + spin_lock()
Applying: drm/i915: Drop the irqs_disabled() check
Applying: drm/i915/guc: Consider also RCU depth in busy loop.
Applying: Revert "drm/i915: Depend on !PREEMPT_RT."
Patch failed at 0010 Revert "drm/i915: Depend on !PREEMPT_RT."
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


