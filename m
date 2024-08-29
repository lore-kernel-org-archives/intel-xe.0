Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BADC83F23
	for <intel-xe@archiver.kernel.org>; Thu, 29 Aug 2024 13:38:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2EBA10E6B0;
	Thu, 29 Aug 2024 13:38:19 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9770410E6AF;
 Thu, 29 Aug 2024 13:38:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_Consolidation_of_DSS?=
 =?utf-8?q?_Control_in_Separate_Files_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Aug 2024 13:38:18 -0000
Message-ID: <172493869861.831968.17282436905393002091@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240829131828.2350930-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20240829131828.2350930-1-ankit.k.nautiyal@intel.com>
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

Series: Consolidation of DSS Control in Separate Files (rev2)
URL   : https://patchwork.freedesktop.org/series/137788/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: b037f569181e drm-tip: 2024y-08m-29d-12h-48m-40s UTC integration manifest
=== git am output follows ===
.git/rebase-apply/patch:274: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
error: patch failed: drivers/gpu/drm/i915/display/intel_modeset_setup.c:326
error: drivers/gpu/drm/i915/display/intel_modeset_setup.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort".
hint: Disable this message with "git config advice.mergeConflict false"
Applying: drm/i915/display: Move all DSS control registers to a new file
Applying: drm/i915/dss_regs: Use REG_* macros for the DSS ctl bits
Applying: drm/i915/ddi: Move all mso related helpers to a new file
Applying: drm/i915/dss: Move to struct intel_display
Applying: drm/i915/icl_dsi: Avoid using intel_dsi in configure_dual_link_mode
Applying: drm/i915/icl_dsi: Use intel_display in configure_dual_link_mode
Applying: drm/i915/icl_dsi: Move helpers to configure dsi dual link to intel_dss
Applying: drm/i915/vdsc: Rename helper to check if the pipe supports dsc
Applying: drm/i915/vdsc: Move all dss stuff in dss files
Applying: drm/i915/dss: Use struct intel_display in dss dsc helpers
Applying: drm/i915/display: Move dss stuff in intel_dss files
Applying: drm/i915/display: Rename static functions that use joiner
Applying: drm/i915/display: Separate out joiner stuff in a new file
Applying: drm/i915/display: Move intel_crtc_joined_pipe_mask to intel_joiner
Applying: drm/i915/display: Move helpers for primary joiner to intel_joiner
Applying: drm/i915/display: Move intel_crtc_is_joiner_secondary to intel_joiner
Patch failed at 0016 drm/i915/display: Move intel_crtc_is_joiner_secondary to intel_joiner


