Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9D3C02192
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 14:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A5710E519;
	Mon,  3 Feb 2025 14:35:09 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C44310E52E;
 Mon,  3 Feb 2025 14:35:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Use_VRR_timing_gener?=
 =?utf-8?q?ator_for_fixed_refresh_rate_modes_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 03 Feb 2025 14:35:09 -0000
Message-ID: <173859330924.350570.486021640727605530@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250203123840.3855874-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250203123840.3855874-1-ankit.k.nautiyal@intel.com>
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

Series: Use VRR timing generator for fixed refresh rate modes (rev3)
URL   : https://patchwork.freedesktop.org/series/141152/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 3c17a49b1e97 drm-tip: 2025y-02m-03d-13h-54m-56s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/vrr: Remove unwanted comment
Applying: drm/i915:vrr: Separate out functions to compute vmin and vmax
Applying: drm/i915/vrr: Make helpers for cmrr and vrr timings
Applying: drm/i915/vrr: Simplify CMRR Enable Check in intel_vrr_get_config
Applying: drm/i915/vrr: Introduce new field for VRR mode
Applying: drm/i915/vrr: Fill VRR timing generator mode for CMRR and VRR
Applying: drm/i915/display: Remove vrr.enable and instead check vrr.mode != NONE
Applying: drm/i915/display: Absorb cmrr attributes into vrr struct
Applying: drm/i915/display: Add vrr mode to crtc_state dump
Applying: drm/i915/vrr: Disable CMRR
Applying: drm/i915/display: Update intel_crtc_vrr_{enable/disable}
Applying: drm/i915/vrr: Use crtc_vtotal for vmin
Applying: drm/i915/vrr: Prepare for fixed refresh rate timings
Applying: drm/i915/dp: Avoid vrr compute config for HDMI sink
Applying: drm/i915/vrr: Introduce VRR mode Fixed RR
Applying: drm/i915/display: Enable MSA Ignore Timing PAR only when in not fixed_rr mode
Applying: drm/i915/hdmi: Use VRR Timing generator for HDMI
Applying: drm/i915/display: Disable PSR before disabling VRR
Applying: drm/i915/psr: Allow PSR for fixed refrsh rate with VRR TG
Applying: drm/i915/display: Extend WA 14015406119 for PSR2
Applying: drm/i915/vrr: Handle joiner with vrr
Applying: drm/i915/vrr: Refactor condition for computing vmax and LRR
Applying: drm/i915/display: Pass vrr.mode to intel_crtc_update_active_timings()
Applying: drm/i915/vblank: Add crtc active timings for fixed_rr mode
Applying: drm/i915/vrr: Always set vrr vmax/vmin/flipline in vrr_{enable/disable}
Applying: drm/i915/display: Use fixed_rr timings in modeset sequence
Applying: drm/i915/vrr: Always use VRR timing generator for MTL+
Applying: drm/i915/vblank: Avoid warning for platforms that always use VRR TG


