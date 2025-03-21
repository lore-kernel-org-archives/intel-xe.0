Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DD4C35FF3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 07:40:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E90810E0FD;
	Fri, 21 Mar 2025 07:40:27 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36EA10E0EC;
 Fri, 21 Mar 2025 07:40:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/display=3A_?=
 =?utf-8?q?conversions_to_struct_intel=5Fdisplay_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Mar 2025 07:40:26 -0000
Message-ID: <174254282673.62657.7414275638476844744@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <cover.1742481923.git.jani.nikula@intel.com>
In-Reply-To: <cover.1742481923.git.jani.nikula@intel.com>
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

Series: drm/i915/display: conversions to struct intel_display (rev4)
URL   : https://patchwork.freedesktop.org/series/144749/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: a64b76313c59 drm-tip: 2025y-03m-21d-02h-27m-14s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/color: prefer display->platform.<platform> checks
Applying: drm/i915/connector: convert intel_connector.c to struct intel_display
Applying: drm/i915/hotplug: convert intel_hotplug.[ch] to struct intel_display
Applying: drm/i915/hotplug: convert hotplug debugfs to struct intel_display
Applying: drm/i915/hotplug: convert hotplug irq handling to intel_de_*()
Applying: drm/i915/hotplug: convert intel_hotplug_irq.[ch] to struct intel_display
Applying: drm/i915/irq: convert intel_display_irq.[ch] interfaces to struct intel_display
Applying: drm/i915/irq: convert rest of intel_display_irq.[ch] to struct intel_display
Applying: drm/i915/display: rename I915_HAS_HOTPLUG() to HAS_HOTPLUG


