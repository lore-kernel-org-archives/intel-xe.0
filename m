Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3C8D2E9C3
	for <intel-xe@archiver.kernel.org>; Mon, 11 Nov 2024 09:17:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4F110E1C8;
	Mon, 11 Nov 2024 09:17:40 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB92810E1C8;
 Mon, 11 Nov 2024 09:17:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Use_VRR_timing_gener?=
 =?utf-8?q?ator_for_fixed_refresh_rate_modes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 11 Nov 2024 09:17:38 -0000
Message-ID: <173131665896.2543115.6752242248167863813@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241111091221.2992818-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20241111091221.2992818-1-ankit.k.nautiyal@intel.com>
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

Series: Use VRR timing generator for fixed refresh rate modes
URL   : https://patchwork.freedesktop.org/series/141152/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 75325ad29c3a drm-tip: 2024y-11m-11d-08h-56m-17s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/vrr: Refactor VRR Timing Computation
Applying: drm/i915/vrr: Simplify CMRR Enable Check in intel_vrr_get_config
Applying: drm/i915/vrr: Introduce new field for VRR mode
Applying: drm/i915/vrr: Fill VRR mode for CMRR and dynamic VRR
Applying: drm/i915/vrr: Rename vrr.enable to vrr.tg_enable
Applying: drm/i915/display: Absorb cmrr attributes into vrr
Applying: drm/i915/display: Add vrr mode to crtc_state dump
Applying: drm/i915/vrr: Remove condition flipline > vmin for LNL
Applying: drm/i915/vrr: Compute vrr vsync if platforms support it
Applying: drm/i915/dp: Avoid vrr compute config for HDMI sink
Applying: drm/i915/dp: fix the Adaptive sync Operation mode for SDP
Applying: drm/i915/hdmi: Use VRR Timing generator for HDMI
Applying: drm/i915/vrr: Handle joiner with vrr
Applying: drm/i915/display: Handle transcoder timings for joiner
Applying: drm/i915/vrr: Introduce VRR mode Fixed RR
Applying: drm/i915/vrr: Fill fixed refresh mode in vrr_get_compute_config
Applying: drm/i915/display: Enable MSA Ignore Timing PAR only when in not fixed_rr mode
Applying: drm/i915/dp: Set FAVT mode in DP SDP with fixed refresh rate
Applying: drm/i915/vrr: Avoid sending PUSH when VRR TG is used with Fixed refresh rate
Applying: drm/i915/display: Disable PSR before disabling VRR
Applying: drm/i915/psr: Allow PSR for fixed refrsh rate with VRR TG
Applying: drm/i915/vrr: Always use VRR timing generator for XE2LPD+
Applying: drm/i915/display: Use VRR timings for XE2LPD+ in modeset sequence


