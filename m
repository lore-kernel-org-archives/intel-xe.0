Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66858C79FA0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 06:39:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6E710E9F2;
	Tue,  8 Sep 2026 06:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k8BPpX6h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B4810E9DE;
 Tue,  8 Sep 2026 06:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788849552; x=1820385552;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mgXVR3+KFd3PmCPZM5hFDaKghf11tBc48B3XB1fG97I=;
 b=k8BPpX6h4DHzeR+62R75SQ28ngxW84GW6Imu/2p2Q1HluhrpnsR24IDV
 P87Fknj0cG0B/U+s3xlbZvNOLtfqQobSy7p656QK1wajIwLBtl1R4oRAG
 swDBckXq5G6ku/URFBbIYMko4dtlK1iEXC+RmyGK1d8VQudQwFRBvSQ9J
 8yU7P8AYo22WtE5/EgIGBOuCZTSb9l4jRfLEfY4EZOtVJKta3++qHT+QC
 gmNyeWT8K1/jcJoeuJBP2yyTrlEpUOHGJI+xUoxvHQauZvMt7mZMNcDfc
 iPlT862QTUsW3XptympUhsDifg3p3TY11YdK/LmLaFoHcHM7y8G2GvwjS g==;
X-CSE-ConnectionGUID: Eoa9KeaYRVu+8vmIgBfVvg==
X-CSE-MsgGUID: /rusFLVyS3murOHdfQu9sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93061791"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="93061791"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:39:11 -0700
X-CSE-ConnectionGUID: mtbyIcE1TiuLiojR+h4wPg==
X-CSE-MsgGUID: CUUHjSFtSrGggStQwvLCUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="264702447"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:39:08 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v5 06/12] drm/i915/dip: Store and use AS SDP transmission line
 from crtc state
Date: Tue,  8 Sep 2026 11:52:17 +0530
Message-ID: <20260908062224.2897987-7-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
References: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
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

The driver currently computes the Adaptive Sync SDP transmission line
directly at programming time. Instead, compute and store the
AS SDP transmission line in the crtc state and use it when programming the
EMP_AS_SDP_TL register.

We get the clear picture about the SDPs and guardband only in
intel_dp_sdp_compute_config_late() therefore we must configure the
AS SDP transmission line at this point when AS SDP is enabled in
crtc_state.

This prepares the ground for supporting programmable transmission lines
for additional DP SDPs.

While moving the helper into intel_dip.c, drop the
intel_crtc_has_dp_encoder() check instead of relocating it. It was
needed in the old VRR write path shared by other encoderes as well, but
intel_dip_sdp_tl_compute_config_late() is only reached via DP, so HDMI
never sets crtc_state->dip.emp_as_sdp_tl and it stays 0 by default.

v2:
- Move the helper into intel_dip.c and drop the
  intel_crtc_has_dp_encoder() check.
- Drop the redundant checks. (Suraj)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c |  2 ++
 drivers/gpu/drm/i915/display/intel_dip.c | 20 +++++++++++---------
 drivers/gpu/drm/i915/display/intel_dip.h |  3 +++
 drivers/gpu/drm/i915/display/intel_dp.c  |  2 ++
 4 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 9b3b526e5e55..dacb4b7588a0 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -49,6 +49,7 @@
 #include "intel_ddi.h"
 #include "intel_ddi_buf_trans.h"
 #include "intel_de.h"
+#include "intel_dip.h"
 #include "intel_display_power.h"
 #include "intel_display_regs.h"
 #include "intel_display_types.h"
@@ -4235,6 +4236,7 @@ static void intel_ddi_get_config(struct intel_encoder *encoder,
 	intel_read_dp_sdp(encoder, pipe_config, HDMI_PACKET_TYPE_GAMUT_METADATA);
 	intel_read_dp_sdp(encoder, pipe_config, DP_SDP_VSC);
 	intel_read_dp_sdp(encoder, pipe_config, DP_SDP_ADAPTIVE_SYNC);
+	intel_dip_sdp_transmission_line_get_config(pipe_config);
 
 	intel_audio_codec_get_config(encoder, pipe_config);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dip.c b/drivers/gpu/drm/i915/display/intel_dip.c
index 0277b15e1c82..d1acc7eb5a39 100644
--- a/drivers/gpu/drm/i915/display/intel_dip.c
+++ b/drivers/gpu/drm/i915/display/intel_dip.c
@@ -43,19 +43,21 @@ void intel_dip_write_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
-	u32 transmission_line = 0;
 
 	if (!HAS_EMP_AS_SDP_TL(display))
 		return;
-	/*
-	 * Since we currently support VRR only for DP/eDP, program the register
-	 * for Adaptive Sync SDP using vsync start. For non-DP encoders,
-	 * the register is reset to 0.
-	 */
-	if (intel_crtc_has_dp_encoder(crtc_state))
-		transmission_line = intel_dip_get_as_sdp_transmission_line(crtc_state);
 
 	intel_de_write(display,
 		       EMP_AS_SDP_TL(display, cpu_transcoder),
-		       EMP_AS_SDP_DB_TL(transmission_line));
+		       EMP_AS_SDP_DB_TL(crtc_state->dip.emp_as_sdp_tl));
+}
+
+void intel_dip_sdp_tl_compute_config_late(struct intel_crtc_state *crtc_state)
+{
+	crtc_state->dip.emp_as_sdp_tl = intel_dip_get_as_sdp_transmission_line(crtc_state);
+}
+
+void intel_dip_sdp_transmission_line_get_config(struct intel_crtc_state *crtc_state)
+{
+	crtc_state->dip.emp_as_sdp_tl = intel_dip_read_emp_as_sdp_tl(crtc_state);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dip.h b/drivers/gpu/drm/i915/display/intel_dip.h
index 37507ac3e645..600dabbf7372 100644
--- a/drivers/gpu/drm/i915/display/intel_dip.h
+++ b/drivers/gpu/drm/i915/display/intel_dip.h
@@ -43,4 +43,7 @@ struct intel_dip {
 	u16 emp_as_sdp_tl;
 };
 
+void intel_dip_sdp_tl_compute_config_late(struct intel_crtc_state *crtc_state);
+void intel_dip_sdp_transmission_line_get_config(struct intel_crtc_state *crtc_state);
+
 #endif /* __INTEL_DIP_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0cd5e6b5034c..eed4fca2b985 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -7324,6 +7324,8 @@ int intel_dp_sdp_compute_config_late(struct intel_crtc_state *crtc_state)
 		return -EINVAL;
 	}
 
+	intel_dip_sdp_tl_compute_config_late(crtc_state);
+
 	return 0;
 }
 
-- 
2.50.1

