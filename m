Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACEFC44500
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 03:27:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A8D10F624;
	Fri,  3 Jul 2026 03:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L6sbEmlJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9032110F370;
 Fri,  3 Jul 2026 03:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783049240; x=1814585240;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1nJnf9s3xxP59eENOWsUKThPW+MJ+Cqh71dxl6nZ8Gc=;
 b=L6sbEmlJNONll5crRbPaXcDxb9zLhRloZCBDL9KYhcFJm6PyhMm6i6KL
 JTcXTwTKjyTM/mv5tz03YcYE7FA4s1IYsnLILxVZErqXALaKLuf6eFwAQ
 ueHKSIoQjZUeULcjo67jYeT3+x7oe/VGlKgsnzqWhr1xcjKsjiJWQsTAm
 UN76SOnzXMcZTQ4HSOflkdI+Z6bW+UIcGRjajOybgMDVvOT/ENXqs6QA7
 1qnozPm2IcPUCeavzUxz1TJwNNdCag09NqjBBKM76gP96QNzG7TRDY0UU
 CIGc6Lg1s5GoDpO8X5TopsKdHkATyxlaHsSoSWLf5J7WrOG6EqIDprZgQ Q==;
X-CSE-ConnectionGUID: HJB9csw3SeaMj48Mfnm2KQ==
X-CSE-MsgGUID: LoOY20S2QWOScz35MGO4Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83854143"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83854143"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 20:27:20 -0700
X-CSE-ConnectionGUID: d7cpPm7aS9OwgnxyPL2REQ==
X-CSE-MsgGUID: wL6OPC2ITsKtNPyxE2f35w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="283095937"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa002.jf.intel.com with ESMTP; 02 Jul 2026 20:27:13 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/i915/display: Skip TRANS_VTOTAL.Vtotal write on NVL pre-C0
Date: Fri,  3 Jul 2026 08:56:54 +0530
Message-Id: <20260703032653.2122784-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

On Nova Lake A/B steppings the GOP breaks DP-Alt / native DP output
when TRANS_VTOTAL.Vtotal is programmed with a non-zero value, and the
initial hardware readout of that field on such systems ends up in
adjusted_mode.crtc_vtotal = 1 -- tripping the DSB scanline WARN in
assert_dsl_ok() during intel_initial_commit.

Keep TRANS_VTOTAL.Vtotal at 0 on Nova Lake pre-C0 (A0..B3) in both
transcoder timing paths, and restore adjusted_mode.crtc_vtotal from
TRANS_VRR_VMIN in intel_vrr_get_config() so downstream state stays
consistent.

Fixes: f26a8df8dff9 ("drm/i915/display: Program TRANS_VTOTAL from mode vtotal")
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 9 +++++++++
 drivers/gpu/drm/i915/display/intel_vrr.c     | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 90c05ad08f86..214454f419e9 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -45,6 +45,7 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_rect.h>
 #include <drm/drm_vblank.h>
+#include <drm/intel/step.h>
 
 #include "g4x_dp.h"
 #include "g4x_hdmi.h"
@@ -2737,6 +2738,10 @@ void intel_set_transcoder_timings(const struct intel_crtc_state *crtc_state,
 		       HSYNC_START(adjusted_mode->crtc_hsync_start - 1) |
 		       HSYNC_END(adjusted_mode->crtc_hsync_end - 1));
 
+	if (display->platform.novalake &&
+	    IS_DISPLAY_STEP(display, STEP_A0, STEP_C0))
+		crtc_vtotal = 1;
+
 	intel_de_write(display, TRANS_VTOTAL(display, transcoder),
 		       VACTIVE(crtc_vdisplay - 1) |
 		       VTOTAL(crtc_vtotal - 1));
@@ -2830,6 +2835,10 @@ void intel_set_transcoder_timings_lrr(const struct intel_crtc_state *crtc_state,
 	 * The double buffer latch point for TRANS_VTOTAL
 	 * is the transcoder's undelayed vblank.
 	 */
+	if (display->platform.novalake &&
+	    IS_DISPLAY_STEP(display, STEP_A0, STEP_C0))
+		crtc_vtotal = 1;
+
 	intel_de_write(display, TRANS_VTOTAL(display, transcoder),
 		       VACTIVE(crtc_vdisplay - 1) |
 		       VTOTAL(crtc_vtotal - 1));
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index bffbdee76ee1..51e4f3309b8b 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -5,6 +5,7 @@
  */
 
 #include <drm/drm_print.h>
+#include <drm/intel/step.h>
 
 #include "intel_alpm.h"
 #include "intel_cmtg.h"
@@ -1106,6 +1107,11 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
 			crtc_state->vrr.vmin += intel_vrr_vmin_flipline_offset(display);
 		}
 
+		if (display->platform.novalake &&
+		    IS_DISPLAY_STEP(display, STEP_A0, STEP_C0))
+			crtc_state->hw.adjusted_mode.crtc_vtotal =
+				intel_vrr_vmin_vtotal(crtc_state);
+
 		if (HAS_AS_SDP(display)) {
 			trans_vrr_vsync =
 				intel_de_read(display,
-- 
2.34.1

