Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2887C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 13:11:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9949010EC4D;
	Fri, 28 Jun 2024 13:11:17 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D638E10EC51;
 Fri, 28 Jun 2024 13:11:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915=3A_PREEMPT?=
 =?utf-8?q?=5FRT_related_fixups=2E_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Jun 2024 13:11:15 -0000
Message-ID: <171958027586.185831.15216590919626492801@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240628130601.1772849-1-bigeasy@linutronix.de>
In-Reply-To: <20240628130601.1772849-1-bigeasy@linutronix.de>
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

Series: drm/i915: PREEMPT_RT related fixups. (rev5)
URL   : https://patchwork.freedesktop.org/series/132082/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 886eeb6d89b5 drm-tip: 2024y-06m-28d-10h-30m-43s UTC integration manifest
=== git am output follows ===
Applying: drm/i915: Use preempt_disable/enable_rt() where recommended
Applying: drm/i915: Don't disable interrupts on PREEMPT_RT during atomic updates
Applying: drm/i915: Don't check for atomic context on PREEMPT_RT
Applying: drm/i915: Disable tracing points on PREEMPT_RT
Applying: drm/i915/gt: Use spin_lock_irq() instead of local_irq_disable() + spin_lock()
Applying: drm/i915: Drop the irqs_disabled() check
Applying: drm/i915/guc: Consider also RCU depth in busy loop.
Applying: Revert "drm/i915: Depend on !PREEMPT_RT."


