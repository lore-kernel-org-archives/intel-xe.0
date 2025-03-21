Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743EFC36000
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 10:58:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3414310E7A0;
	Fri, 21 Mar 2025 10:58:34 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3030E10E7A0;
 Fri, 21 Mar 2025 10:58:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/display=3A_?=
 =?utf-8?q?yet_another_batch_of_struct_intel=5Fdisplay_conversions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Mar 2025 10:58:32 -0000
Message-ID: <174255471218.63986.17569669918170898189@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <cover.1742554320.git.jani.nikula@intel.com>
In-Reply-To: <cover.1742554320.git.jani.nikula@intel.com>
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

Series: drm/i915/display: yet another batch of struct intel_display conversions
URL   : https://patchwork.freedesktop.org/series/146583/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: b15a87713d14 drm-tip: 2025y-03m-21d-08h-20m-21s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/dsi: convert vlv_dsi.[ch] to struct intel_display
Applying: drm/i915/dsi: convert vlv_dsi_pll.[ch] to struct intel_display
Applying: drm/i915/dsi: convert parameter printing to drm_printer
Applying: drm/i915/dsi: convert intel_dsi_vbt.[ch] to struct intel_display
Applying: drm/i915/dsi: convert intel_dsi_dcs_backlight.c to struct intel_display
Applying: drm/i915/dvo: convert intel_dvo.[ch] to struct intel_display
Applying: drm/i915/lvds: convert intel_lvds.[ch] to struct intel_display
Applying: drm/i915/tc: convert intel_tc.c to struct intel_display
Applying: drm/i915/atomic: convert intel_atomic.c to struct intel_display
Applying: drm/i915/display: convert intel_crtc_state_dump.c to struct intel_display
Applying: drm/i915/pch: convert intel_pch_display.[ch] to struct intel_display
Applying: drm/i915/pch: convert intel_pch_refclk.c to struct intel_display


