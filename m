Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B47C88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 08:30:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51AAB10E89B;
	Wed, 16 Sep 2026 08:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YzwlOJB6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E33710E89B;
 Wed, 16 Sep 2026 08:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789547407; x=1821083407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IOul37yjrHjLdXIK4Ly+JNUZi2x2Hiq7zej9INZmPio=;
 b=YzwlOJB6iHJLGASP9FtZMmLi79g+bpp5PA5cNOY53r/FZLIRmAsFcnEd
 HPrL4UCZnkapQttf7BIwx2RHJGBTjXJqPf36wWaFPMWQmZOx8lolwfSb9
 cDvEw/00Ydj6Buk8A5ZnBPEEkB52leZBuoA/+3nF5+yHh3JSzr3nw/bI9
 d53VY9FYdtFchxC3Vo625LNgiZyhDU5TBIM6xo1l42Qi+TrWNeQC5gtXL
 MTbOc6WT9VMHUGUkI2kFuTzvQCq/DdWtr4QD6gaO50f9K3z6XCkHmqyuA
 9QT+VNBw3xegjEmJ7x0QYjOQWhVQ7BnFWyHnwJNBsBjaLut53k0nPGLAV A==;
X-CSE-ConnectionGUID: mLD79/geTrGXQYqvuECvmQ==
X-CSE-MsgGUID: JJ7X5frDT4OIc/2I/ASCFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="429624"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="429624"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 01:30:07 -0700
X-CSE-ConnectionGUID: svh8gThkS0O2lXY9xLURAA==
X-CSE-MsgGUID: y/VBnkkkTjSRtZYJFQ5bvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="276796757"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 01:30:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 05/11] drm/i915/lspcon: switch to drm_dp_dpcd_{read_byte,
 read_data, write_byte, write_data}()
Date: Wed, 16 Sep 2026 11:29:36 +0300
Message-ID: <f16cb57607634d411a42ca6cd80b10a713d7677f.1789547331.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789547331.git.jani.nikula@intel.com>
References: <cover.1789547331.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Switch to the modern DPCD access functions that return negative error
codes on errors, -EIO for incomplete access, and 0 on success.

Use local ret variables for the return value instead of checking
inline. Use %pe and ERR_PTR() for logging the errors.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../drm/i915/display/intel_dp_aux_backlight.c | 51 ++++++++++---------
 1 file changed, 27 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 266e042e0023..f30da5f7e3d2 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -120,8 +120,8 @@ intel_dp_aux_supports_hdr_backlight(struct intel_connector *connector)
 
 	intel_dp_wait_source_oui(intel_dp);
 
-	ret = drm_dp_dpcd_read(aux, INTEL_EDP_HDR_TCON_CAP0, tcon_cap, sizeof(tcon_cap));
-	if (ret != sizeof(tcon_cap))
+	ret = drm_dp_dpcd_read_data(aux, INTEL_EDP_HDR_TCON_CAP0, tcon_cap, sizeof(tcon_cap));
+	if (ret < 0)
 		return false;
 
 	drm_dbg_kms(display->drm,
@@ -178,8 +178,10 @@ intel_dp_aux_hdr_get_backlight(struct intel_connector *connector, enum pipe pipe
 	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
 	u8 tmp;
 	u8 buf[2] = {};
+	int ret;
 
-	if (drm_dp_dpcd_readb(&intel_dp->aux, INTEL_EDP_HDR_GETSET_CTRL_PARAMS, &tmp) != 1) {
+	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, INTEL_EDP_HDR_GETSET_CTRL_PARAMS, &tmp);
+	if (ret < 0) {
 		drm_err(display->drm,
 			"[CONNECTOR:%d:%s] Failed to read current backlight mode from DPCD\n",
 			connector->base.base.id, connector->base.name);
@@ -197,8 +199,9 @@ intel_dp_aux_hdr_get_backlight(struct intel_connector *connector, enum pipe pipe
 		return panel->backlight.max;
 	}
 
-	if (drm_dp_dpcd_read(&intel_dp->aux, INTEL_EDP_BRIGHTNESS_NITS_LSB, buf,
-			     sizeof(buf)) != sizeof(buf)) {
+	ret = drm_dp_dpcd_read_data(&intel_dp->aux, INTEL_EDP_BRIGHTNESS_NITS_LSB, buf,
+				    sizeof(buf));
+	if (ret < 0) {
 		drm_err(display->drm,
 			"[CONNECTOR:%d:%s] Failed to read brightness from DPCD\n",
 			connector->base.base.id, connector->base.name);
@@ -215,12 +218,14 @@ intel_dp_aux_hdr_set_aux_backlight(const struct drm_connector_state *conn_state,
 	struct drm_device *dev = connector->base.dev;
 	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
 	u8 buf[4] = {};
+	int ret;
 
 	buf[0] = level & 0xFF;
 	buf[1] = (level & 0xFF00) >> 8;
 
-	if (drm_dp_dpcd_write(&intel_dp->aux, INTEL_EDP_BRIGHTNESS_NITS_LSB, buf,
-			      sizeof(buf)) != sizeof(buf))
+	ret = drm_dp_dpcd_write_data(&intel_dp->aux, INTEL_EDP_BRIGHTNESS_NITS_LSB, buf,
+				     sizeof(buf));
+	if (ret < 0)
 		drm_err(dev, "[CONNECTOR:%d:%s] Failed to write brightness level to DPCD\n",
 			connector->base.base.id, connector->base.name);
 }
@@ -258,13 +263,12 @@ intel_dp_aux_write_content_luminance(struct intel_connector *connector,
 	buf[2] = hdr_metadata->hdmi_metadata_type1.max_fall & 0xFF;
 	buf[3] = (hdr_metadata->hdmi_metadata_type1.max_fall & 0xFF00) >> 8;
 
-	ret = drm_dp_dpcd_write(&intel_dp->aux,
-				INTEL_EDP_HDR_CONTENT_LUMINANCE,
-				buf, sizeof(buf));
+	ret = drm_dp_dpcd_write_data(&intel_dp->aux,
+				     INTEL_EDP_HDR_CONTENT_LUMINANCE,
+				     buf, sizeof(buf));
 	if (ret < 0)
 		drm_dbg_kms(display->drm,
-			    "Content Luminance DPCD reg write failed, err:-%d\n",
-			    ret);
+			    "Content Luminance DPCD reg write failed (%pe)\n", ERR_PTR(ret));
 }
 
 static void
@@ -313,11 +317,11 @@ intel_dp_aux_hdr_enable_backlight(const struct intel_crtc_state *crtc_state,
 
 	intel_dp_wait_source_oui(intel_dp);
 
-	ret = drm_dp_dpcd_readb(&intel_dp->aux, INTEL_EDP_HDR_GETSET_CTRL_PARAMS, &old_ctrl);
-	if (ret != 1) {
+	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, INTEL_EDP_HDR_GETSET_CTRL_PARAMS, &old_ctrl);
+	if (ret < 0) {
 		drm_err(display->drm,
-			"[CONNECTOR:%d:%s] Failed to read current backlight control mode: %d\n",
-			connector->base.base.id, connector->base.name, ret);
+			"[CONNECTOR:%d:%s] Failed to read current backlight control mode (%pe)\n",
+			connector->base.base.id, connector->base.name, ERR_PTR(ret));
 		return;
 	}
 
@@ -338,7 +342,7 @@ intel_dp_aux_hdr_enable_backlight(const struct intel_crtc_state *crtc_state,
 	intel_dp_aux_fill_hdr_tcon_params(conn_state, &ctrl);
 
 	if (ctrl != old_ctrl &&
-	    drm_dp_dpcd_writeb(&intel_dp->aux, INTEL_EDP_HDR_GETSET_CTRL_PARAMS, ctrl) != 1)
+	    drm_dp_dpcd_write_byte(&intel_dp->aux, INTEL_EDP_HDR_GETSET_CTRL_PARAMS, ctrl) < 0)
 		drm_err(display->drm,
 			"[CONNECTOR:%d:%s] Failed to configure DPCD brightness controls\n",
 			connector->base.base.id, connector->base.name);
@@ -392,13 +396,12 @@ intel_dp_aux_write_panel_luminance_override(struct intel_connector *connector)
 	buf[2] = panel->backlight.max & 0xFF;
 	buf[3] = (panel->backlight.max & 0xFF00) >> 8;
 
-	ret = drm_dp_dpcd_write(&intel_dp->aux,
-				INTEL_EDP_HDR_PANEL_LUMINANCE_OVERRIDE,
-				buf, sizeof(buf));
+	ret = drm_dp_dpcd_write_data(&intel_dp->aux,
+				     INTEL_EDP_HDR_PANEL_LUMINANCE_OVERRIDE,
+				     buf, sizeof(buf));
 	if (ret < 0)
 		drm_dbg_kms(display->drm,
-			    "Panel Luminance DPCD reg write failed, err:-%d\n",
-			    ret);
+			    "Panel Luminance DPCD reg write failed (%pe)\n", ERR_PTR(ret));
 }
 
 static int
@@ -456,8 +459,8 @@ static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector *connector, en
 	int ret;
 
 	if (panel->backlight.edp.vesa.luminance_control_support) {
-		ret = drm_dp_dpcd_read(&intel_dp->aux, DP_EDP_PANEL_TARGET_LUMINANCE_VALUE, buf,
-				       sizeof(buf));
+		ret = drm_dp_dpcd_read_data(&intel_dp->aux, DP_EDP_PANEL_TARGET_LUMINANCE_VALUE, buf,
+					    sizeof(buf));
 		if (ret < 0) {
 			drm_err(intel_dp->aux.drm_dev,
 				"[CONNECTOR:%d:%s] Failed to read Luminance from DPCD\n",
-- 
2.47.3

