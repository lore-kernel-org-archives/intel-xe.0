Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86884C3ABC3
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 10:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37EF310E1F9;
	Tue, 13 May 2025 10:03:54 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A70A10E1F9;
 Tue, 13 May 2025 10:03:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/i915=3A_refactor?=
 =?utf-8?q?_VLV_IOSF_SB_for_display_usage_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 May 2025 10:03:53 -0000
Message-ID: <174713063336.74293.6324878362219096204@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <cover.1747061743.git.jani.nikula@intel.com>
In-Reply-To: <cover.1747061743.git.jani.nikula@intel.com>
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

Series: drm/i915: refactor VLV IOSF SB for display usage (rev3)
URL   : https://patchwork.freedesktop.org/series/148265/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: c9de1544553b drm-tip: 2025y-05m-13d-08h-26m-34s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/i915/Makefile:45
error: drivers/gpu/drm/i915/Makefile: patch does not apply
error: patch failed: drivers/gpu/drm/i915/display/intel_display_power_map.c:10
error: drivers/gpu/drm/i915/display/intel_display_power_map.c: patch does not apply
error: patch failed: drivers/gpu/drm/i915/display/intel_display_power_well.c:30
error: drivers/gpu/drm/i915/display/intel_display_power_well.c: patch does not apply
error: patch failed: drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c:22
error: drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c: patch does not apply
error: patch failed: drivers/gpu/drm/i915/gt/intel_rps.c:23
error: drivers/gpu/drm/i915/gt/intel_rps.c: patch does not apply
error: patch failed: drivers/gpu/drm/i915/i915_driver.c:108
error: drivers/gpu/drm/i915/i915_driver.c: patch does not apply
error: patch failed: drivers/gpu/drm/i915/intel_clock_gating.c:37
error: drivers/gpu/drm/i915/intel_clock_gating.c: patch does not apply
error: patch failed: drivers/gpu/drm/i915/soc/intel_dram.c:10
error: drivers/gpu/drm/i915/soc/intel_dram.c: patch does not apply
error: drivers/gpu/drm/i915/vlv_sideband.c: does not exist in index
error: drivers/gpu/drm/i915/vlv_sideband.h: does not exist in index
error: drivers/gpu/drm/i915/vlv_sideband_reg.h: does not exist in index
error: drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband.h: does not exist in index
error: drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_reg.h: does not exist in index
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/i915: rename vlv_sideband*.[ch] to vlv_iosf_sb*.[ch]
Patch failed at 0001 drm/i915: rename vlv_sideband*.[ch] to vlv_iosf_sb*.[ch]
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


