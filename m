Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656E8EED61E
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 18:56:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314DC10E66F;
	Fri, 15 Sep 2023 18:56:55 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0481D10E033;
 Fri, 15 Sep 2023 18:56:54 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 043EAAA01E;
 Fri, 15 Sep 2023 18:56:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
Date: Fri, 15 Sep 2023 18:56:53 -0000
Message-ID: <169480421398.32040.7501399193912797496@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230915174651.1928176-1-lucas.demarchi@intel.com>
In-Reply-To: <20230915174651.1928176-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_Enable_Lunar_Lake_display_=28rev5=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Enable Lunar Lake display (rev5)
URL   : https://patchwork.freedesktop.org/series/122798/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 4a9681392 drm/xe/pmu: Enable PMU interface
=== git am output follows ===
error: patch failed: drivers/gpu/drm/i915/display/g4x_dp.c:145
error: drivers/gpu/drm/i915/display/g4x_dp.c: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/i915/xelpdp: Add XE_LPDP_FEATURES
Applying: drm/i915/lnl: Add display definitions
Applying: drm/i915/xe2lpd: FBC is now supported on all pipes
Applying: drm/i915/display: Remove FBC capability from fused off pipes
Applying: drm/i915: Re-order if/else ladder in intel_detect_pch()
Applying: drm/i915/xe2lpd: Add fake PCH
Applying: drm/i915/xe2lpd: Treat cursor plane as regular plane for DDB allocation
Applying: drm/i915/xe2lpd: Don't try to program PLANE_AUX_DIST
Applying: drm/i915/xe2lpd: Register DE_RRMR has been removed
Applying: drm/i915/display: Consolidate saved port bits in intel_digital_port
Applying: drm/i915/display: Rename intel_dp->DP
Patch failed at 0011 drm/i915/display: Rename intel_dp->DP
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


