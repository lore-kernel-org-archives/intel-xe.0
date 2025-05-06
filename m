Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3997FC3ABAC
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 13:13:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F007510E347;
	Tue,  6 May 2025 13:13:57 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352B210E347;
 Tue,  6 May 2025 13:13:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915=3A_irq=5Flo?=
 =?utf-8?q?ck_refactoring=2C_move_to_display?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 May 2025 13:13:57 -0000
Message-ID: <174653723720.51226.10092448386340020288@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <cover.1746536745.git.jani.nikula@intel.com>
In-Reply-To: <cover.1746536745.git.jani.nikula@intel.com>
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

Series: drm/i915: irq_lock refactoring, move to display
URL   : https://patchwork.freedesktop.org/series/148637/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 9f365ea4cf81 drm-tip: 2025y-05m-06d-11h-59m-44s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/irq: move locking inside vlv_display_irq_reset()
Applying: drm/i915/irq: move locking inside valleyview_{enable, disable}_display_irqs()
Applying: drm/i915/irq: move locking inside vlv_display_irq_postinstall()
Applying: drm/i915/irq: split out i915_display_irq_postinstall()
Applying: drm/i915/irq: split out i965_display_irq_postinstall()
Applying: drm/i915/irq: make i915_enable_asle_pipestat() static
Applying: drm/i915/rps: refactor display rps support
Applying: drm/i915/irq: move i915->irq_lock to display->irq.lock


