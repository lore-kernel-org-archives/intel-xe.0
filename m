Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93DBF43697
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 12:50:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A311810EA38;
	Fri, 17 Apr 2026 12:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GVZEmpRA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D7410E2AD;
 Fri, 17 Apr 2026 12:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776430199; x=1807966199;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6iam626fG+RKRZ3GvJmMi7syXm10mTd1npjM/e0Mr9k=;
 b=GVZEmpRARQAW8s4udKhLn9uMSXk7LE70t4tWmkAy2/TY/kDZI1bFNL4J
 yjiaARREnPTZmxUw8ONT5uX+UH7VvAQZZLTTScm4kXVJ4awXwuKCWwB7R
 Nfs48YbD8rQvhevVvcsMmPlWGTWZTz8D8c8LhHL9fvgRTSBWD8A2fyNoo
 5w18emXxoeoQWqH9B7y+oRJG7xFqrq9W1vBKMqrXKd5lbIX8f3AZ3xnkm
 L8GZwk3uh5fgvHYGDwBjgLDxRXDlW2/3edcFWrtTgX4n+A0PMx9kRqqAh
 D6FE5MRPSfvGfrkg7+skrVJ4oUF5eXugbFAOh01adwSy33AZZx3dnCJ8Q w==;
X-CSE-ConnectionGUID: lNOPeIdGTAua//JgyT9S+w==
X-CSE-MsgGUID: Cmc7HYbhTR2JipwmBErbIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77517055"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="77517055"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 05:49:59 -0700
X-CSE-ConnectionGUID: UeyNsxiVSi2cvXZcZrrWCA==
X-CSE-MsgGUID: x58GnXR/TKKo8qqlunmDZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="226684826"
Received: from vsrini4-xps-8920.iind.intel.com ([10.223.167.75])
 by fmviesa010.fm.intel.com with ESMTP; 17 Apr 2026 05:49:57 -0700
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, seanpaul@google.com, navaremanasi@google.com,
 shawn.c.lee@intel.com, Vidya Srinivas <vidya.srinivas@intel.com>
Subject: [PATCH] [RFC]: drm/i915/display: Fix vblank timestamps for fixed RR
 on VRR-TG-always platforms
Date: Fri, 17 Apr 2026 18:14:39 +0530
Message-ID: <20260417124439.206962-1-vidya.srinivas@intel.com>
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

When at lower RR (60Hz) and "vrr_enable = false" this issue was seen
The intel_crtc_active_timings() function is not adjusting
crtc_vblank_start for the VRR TG when vrr_enable=false, leaving it at
the raw mode value of 1800 (vactive end). Since the VRR TG counts all
the way to vtotal=3840, the actual frame latch happens at line 3840
(16.67ms), but the vblank timestamp was reported at line 1800 (7.8ms).

This caused Android SurfaceFlinger to miscalculate frame deadlines --
it received fence signals ~8ms into the 16.67ms frame and concluded
frames were being presented late, leading to dropped frames during
heavy workloads like video playback at 60Hz.

Fix by adjusting crtc_vblank_start, crtc_vblank_end, and crtc_vtotal
to match the VRR timing generator values when
intel_vrr_always_use_vrr_tg() is true, even when vrr_enable is false.

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vblank.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index 0726a2abed38..8e0798277d5e 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -527,8 +527,26 @@ static void intel_crtc_active_timings(struct drm_display_mode *mode,
 	drm_mode_init(mode, &crtc_state->hw.adjusted_mode);
 	*vmax_vblank_start = 0;
 
-	if (!vrr_enable)
+	if (!vrr_enable) {
+		/*
+		 * On platforms that always use the VRR timing generator
+		 * LNL+, even fixed refresh rate modes run
+		 * through the VRR TG. The actual frame boundary is at
+		 * flipline (= vtotal), not at vactive end. Without this
+		 * adjustment, vblank timestamps and flip-done fences are
+		 * signaled at vactive end (line 1800 for 60Hz) instead of
+		 * near the real frame boundary, causing
+		 * compositors like SurfaceFlinger to see ~8ms late fences
+		 * and drop frames during GPU-heavy workloads.
+		 */
+		if (intel_vrr_always_use_vrr_tg(to_intel_display(crtc_state))) {
+			mode->crtc_vtotal = intel_vrr_vmin_vtotal(crtc_state);
+			mode->crtc_vblank_end = intel_vrr_vmin_vtotal(crtc_state);
+			mode->crtc_vblank_start =
+				intel_vrr_vmin_vblank_start(crtc_state);
+		}
 		return;
+	}
 
 	mode->crtc_vtotal = intel_vrr_vmax_vtotal(crtc_state);
 	mode->crtc_vblank_end = intel_vrr_vmax_vtotal(crtc_state);
-- 
2.45.2

