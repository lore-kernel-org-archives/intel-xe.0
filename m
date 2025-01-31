Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEA3C0218F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 12:57:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A0C710EAA5;
	Fri, 31 Jan 2025 12:57:07 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AB710EAA2;
 Fri, 31 Jan 2025 12:57:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/dp=3A_dsc_f?=
 =?utf-8?q?ix=2C_refactoring_and_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 Jan 2025 12:57:05 -0000
Message-ID: <173832822587.3206920.16905611344338778305@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1738327620.git.jani.nikula@intel.com>
In-Reply-To: <cover.1738327620.git.jani.nikula@intel.com>
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

Series: drm/i915/dp: dsc fix, refactoring and cleanups
URL   : https://patchwork.freedesktop.org/series/144178/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 7998f28da73c drm-tip: 2025y-01m-31d-10h-41m-29s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/dp: Iterate DSC BPP from high to low on all platforms
Applying: drm/i915/dp: Add intel_dp_dsc_bpp_step_x16() helper to get DSC BPP precision
Applying: drm/i915/dp: Rename some variables in xelpd_dsc_compute_link_config()
Applying: drm/i915/dp: Pass .4 BPP values to {icl, xelpd}_dsc_compute_link_config()
Applying: drm/i915/dp: Move max DSC BPP reduction one level higher
Applying: drm/i915/dp: Change icl_dsc_compute_link_config() DSC BPP iteration
Applying: drm/i915/dp: Move force_dsc_fractional_bpp_en check to intel_dp_dsc_valid_bpp()
Applying: drm/i915/dp: Unify DSC link config functions
Applying: drm/i915/dp: Inline do_dsc_compute_compressed_bpp()
Applying: drm/i915/dp: Simplify input BPP checks in intel_dp_dsc_compute_pipe_bpp()
Applying: drm/i915/dp: Use int for compressed BPP in dsc_compute_link_config()
Applying: drm/i915/dp: Drop compute_pipe_bpp parameter from intel_dp_dsc_compute_config()
Applying: drm/i915/dp: Pass connector state all the way to dsc_compute_link_config()
Applying: drm/i915/mst: Convert intel_dp_mtp_tu_compute_config() to .4 format


