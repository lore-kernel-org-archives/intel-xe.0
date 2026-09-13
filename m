Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D063C88E65
	for <intel-xe@archiver.kernel.org>; Sun, 13 Sep 2026 15:13:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3086E10E94A;
	Sun, 13 Sep 2026 15:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ov+AEo6u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC4F310E946;
 Sun, 13 Sep 2026 15:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789312411; x=1820848411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DGUOvBeFzcYU/hL4cPR9aTW9PX7dzAKx1M8ufkwIi38=;
 b=Ov+AEo6uthcyLmV3+nI0LmY1Y5ywa9PZ3a/qcJHGBcLYL7iHv4fHQZN5
 N6lQcJZ9K5h66eUJusT8Fh9UAGgqQWjG78eSATfuBx0GpqZn6ELirMm2s
 u2AHvNaNkyPb3vzbwRu1lJKXBt/Njk+m0SWwui/Kt9or9SyMdp3tZ/j3v
 MOCkfbe7QDZGJXwMzZ+Yc9uhjD2Os0k2f0NbPJ0PUdqIYqKFETtdW3I4L
 Ux1MHbBIJXuSJjzz2q8yeK+G75Lhu+02h20U72tSHUA5V5KwZ9H9Zc3wf
 1QpVshS0veq00tYr+9YaT7mYFWo2la0xuOx+kcOdYkoW8FwaKoDuFL4xC w==;
X-CSE-ConnectionGUID: rlaoxkR7RveIwl4YmIvysA==
X-CSE-MsgGUID: uAKmo2DtT2uHeZiQ/CWgLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="93388772"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; d="scan'208";a="93388772"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2026 08:13:31 -0700
X-CSE-ConnectionGUID: m4YTNMqnQ5GytVTbUL4HUQ==
X-CSE-MsgGUID: EtkHn4I0QES8ilTg6QfMfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; d="scan'208";a="310694153"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2026 08:13:29 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v6 06/13] drm/i915/dip: Store and use AS SDP transmission line
 from crtc state
Date: Sun, 13 Sep 2026 20:26:41 +0530
Message-ID: <20260913145649.3240904-7-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
References: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
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
 drivers/gpu/drm/i915/display/intel_dp.c  |  3 +++
 4 files changed, 19 insertions(+), 9 deletions(-)

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
index 25bae4a04d6b..20f9aeb85c39 100644
--- a/drivers/gpu/drm/i915/display/intel_dip.h
+++ b/drivers/gpu/drm/i915/display/intel_dip.h
@@ -35,4 +35,7 @@ struct intel_crtc_state;
 u16 intel_dip_read_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state);
 void intel_dip_write_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state);
 
+void intel_dip_sdp_tl_compute_config_late(struct intel_crtc_state *crtc_state);
+void intel_dip_sdp_transmission_line_get_config(struct intel_crtc_state *crtc_state);
+
 #endif /* __INTEL_DIP_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0cd5e6b5034c..8c3a324e164e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -61,6 +61,7 @@
 #include "intel_cx0_phy.h"
 #include "intel_ddi.h"
 #include "intel_de.h"
+#include "intel_dip.h"
 #include "intel_display_driver.h"
 #include "intel_display_jiffies.h"
 #include "intel_display_utils.h"
@@ -7324,6 +7325,8 @@ int intel_dp_sdp_compute_config_late(struct intel_crtc_state *crtc_state)
 		return -EINVAL;
 	}
 
+	intel_dip_sdp_tl_compute_config_late(crtc_state);
+
 	return 0;
 }
 
-- 
2.50.1

