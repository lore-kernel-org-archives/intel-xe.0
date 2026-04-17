Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF867F4369F
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 13:11:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE2E10E83A;
	Fri, 17 Apr 2026 13:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HPq856n7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6211410E599;
 Fri, 17 Apr 2026 13:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776431507; x=1807967507;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RXuPrdoQ5Ob2rISZh3Y0kuDSMNjRmRWW6nVUMEM76Q4=;
 b=HPq856n7StKL40Yzb5CLMhmh8TMN7vazdRKU0rC6PYKgWZNOz3LwDPrS
 elKCY9R+SWry5cbQqB3VO7r8FENpyfA/Flc/I+h3mToeKv/fMKXcMzd77
 9SYytqcKla2TV/FbSakQF6tsIuOGVdAmwGQEYZnq00zRvwbEiRuNWoGe3
 6l1jxRJmSNi+gYGiKSrwJ/ZDWf4rwN148ll4d/SR1WMZAwanOcKEOP8Fq
 w3sUN2O4Qt4BVVvJ7MXBRZWZqZVba9+L0rm5qo4Vc6bCTBYpV009CxOUj
 62jBiXR9tJ4cOmrA/SC6xSFlyJ8CdHMu4sQh9Zzv7RdKNyVvKU85iYnyu Q==;
X-CSE-ConnectionGUID: /NjGgxVET5iq2X3fNocYYA==
X-CSE-MsgGUID: MEgME3rDR+KT9RgWm/YhQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="76476107"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="76476107"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 06:11:46 -0700
X-CSE-ConnectionGUID: kogaA3dHTGiRRPOAVOeXKw==
X-CSE-MsgGUID: GvO8YtrrQGCLw05I/Fn78g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="269060393"
Received: from vsrini4-xps-8920.iind.intel.com ([10.223.167.75])
 by orviesa001.jf.intel.com with ESMTP; 17 Apr 2026 06:11:44 -0700
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, seanpaul@google.com, navaremanasi@google.com,
 shawn.c.lee@intel.com, Vidya Srinivas <vidya.srinivas@intel.com>
Subject: [PATCH] [RFC]: drm/i915/display: Fix vblank timestamps for fixed RR
 on VRR-TG-always platforms when userspace set vrr_enable=FALSE
Date: Fri, 17 Apr 2026 18:36:27 +0530
Message-ID: <20260417130627.207267-1-vidya.srinivas@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On LNL+ VRR timing generator is always active.
For panels like this

"2880x1800": 120 709633 2880 2888 2920 3080 1800 1880 1896 1920 0x48 0xa
"2880x1800": 60 709633 2880 2888 2920 3080 1800 3800 3816 3840 0x40 0xa

that use the same pixel clock with a stretched vtotal have a large front
porch. For this case 2880x1800 panel:
120Hz: vtotal=1920 (120 lines of front porch)
60Hz: vtotal=3840 (2000 lines of front porch)

When at lower RR (60Hz) and "vrr_enable = FALSE"
the intel_crtc_active_timings() function is not adjusting
crtc_vblank_start leaving it at the raw mode value of 1800 (vactive end).

This caused Android SurfaceFlinger to miscalculate frame deadlines --
it received fence signals ~8ms into the 16.67ms frame and concluded
frames were being presented late, leading to dropped frames during
heavy workloads like video playback at 60Hz.

Fix by adjusting crtc_vblank_start, crtc_vblank_end, and crtc_vtotal
to match the VRR timing generator values when
intel_vrr_always_use_vrr_tg() is true, even when vrr_enable is false.

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vblank.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index 0726a2abed38..3667e1a7c0ad 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -527,13 +527,15 @@ static void intel_crtc_active_timings(struct drm_display_mode *mode,
 	drm_mode_init(mode, &crtc_state->hw.adjusted_mode);
 	*vmax_vblank_start = 0;
 
-	if (!vrr_enable)
+	if (!vrr_enable && !intel_vrr_always_use_vrr_tg(to_intel_display(crtc_state)))
 		return;
 
 	mode->crtc_vtotal = intel_vrr_vmax_vtotal(crtc_state);
 	mode->crtc_vblank_end = intel_vrr_vmax_vtotal(crtc_state);
 	mode->crtc_vblank_start = intel_vrr_vmin_vblank_start(crtc_state);
-	*vmax_vblank_start = intel_vrr_vmax_vblank_start(crtc_state);
+
+	if (vrr_enable)
+		*vmax_vblank_start = intel_vrr_vmax_vblank_start(crtc_state);
 }
 
 void intel_crtc_update_active_timings(const struct intel_crtc_state *crtc_state,
-- 
2.45.2

