Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8CDC021B8
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 09:17:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C4010E523;
	Tue,  4 Mar 2025 09:16:59 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDAFF10E527;
 Tue,  4 Mar 2025 09:16:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Use_VRR_timing_gener?=
 =?utf-8?q?ator_for_fixed_refresh_rate_modes_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Mar 2025 09:16:58 -0000
Message-ID: <174107981890.479656.5368952914667269436@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250304081948.3177034-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250304081948.3177034-1-ankit.k.nautiyal@intel.com>
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

Series: Use VRR timing generator for fixed refresh rate modes (rev6)
URL   : https://patchwork.freedesktop.org/series/141152/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 1cf56e26a932 drm-tip: 2025y-03m-04d-00h-06m-47s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/vrr: Remove unwanted comment
Applying: drm/i915:vrr: Separate out functions to compute vmin and vmax
Applying: drm/i915/vrr: Make helpers for cmrr and vrr timings
Applying: drm/i915/vrr: Disable CMRR
Applying: drm/i915/vrr: Track vrr.enable only for variable timing
Applying: drm/i915/vrr: Use crtc_vtotal for vmin
Applying: drm/i915/vrr: Prepare for fixed refresh rate timings
Applying: drm/i915/display: Enable MSA Ignore Timing PAR only when in not fixed_rr mode
Applying: drm/i915/hdmi: Use VRR Timing generator for HDMI for fixed_rr
Applying: drm/i915/dp_mst: Use VRR Timing generator for DP MST for fixed_rr
Applying: drm/i915/display: Disable PSR before disabling VRR
Applying: drm/i915/display: Move intel_psr_post_plane_update() at the later
Applying: drm/i915/vrr: Refactor condition for computing vmax and LRR
Applying: drm/i915/vrr: Always set vrr vmax/vmin/flipline in vrr_{enable/disable}
Applying: drm/i915/display: Use fixed_rr timings in modeset sequence
Applying: drm/i915/vrr: Use fixed timings for platforms that support VRR
Applying: drm/i915/display: Move vrr.guardband/pipeline_full out of !fastset block
Applying: drm/i915/display: Use fixed rr timings in intel_set_transcoder_timings_lrr()
Applying: drm/i915/vrr: Allow fixed_rr with pipe joiner
Applying: drm/i915/vrr: Always use VRR timing generator for MTL+
Applying: drm/i915/display: Add fixed_rr to crtc_state dump
Applying: drm/i915/display: Avoid use of VTOTAL.Vtotal bits


