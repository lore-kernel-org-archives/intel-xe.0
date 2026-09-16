Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CCDC982C1
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 08:30:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7339F10E8A0;
	Wed, 16 Sep 2026 08:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nzE4FxEE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14FE10E881;
 Wed, 16 Sep 2026 08:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789547412; x=1821083412;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QBY3LSCP3BVM7S/tEozFSKGHkfLVdTf3CrQJdweiKKs=;
 b=nzE4FxEErGxdAAG3Vn+cXgGWmLW/YhwXkhU+eF9g338w1aILVhTmRcbx
 sp9aUiiZcuWBClalXdXAfRaZQX4NlzUslx4hoNC9iPtjscsmV4di6nAWA
 tYuveL1E1lASJfI1SeyPd5xLu12PqqAWHT/5KJXByJnMpckbUcbxn8+cB
 4vwg/cel0UhcIyti2Ysgjc0xPk7XomH9ZqOQ3d9sYM5sfifRVFdJkf7Ta
 W3N6F9XtlN8dumSq7I7EolfoRV5+rvNOEKniGs/8kCMbOtP4ZNkTYBq46
 MTrkuACCZyDYDYM0PH9tvQiwID2VwNEbBqBNqCBhEsln/pMvzy/kbtMHy g==;
X-CSE-ConnectionGUID: BIM0zIJTSGe8Jh4zyWPISA==
X-CSE-MsgGUID: 5lPFr+VZQRuzHFXlAL6hLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="429630"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="429630"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 01:30:11 -0700
X-CSE-ConnectionGUID: NH4xn1NKTcGjvgn5m+fQwg==
X-CSE-MsgGUID: GwmtedQ9RS22fpVIe3zKWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1496732"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 01:30:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 06/11] drm/i915/dp: switch to drm_dp_dpcd_{read_byte, read_data,
 write_byte, write_data}
Date: Wed, 16 Sep 2026 11:29:37 +0300
Message-ID: <ad0a642c726436b5d41f2315e1c431d65fe2ea24.1789547331.git.jani.nikula@intel.com>
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

Use local ret variables for the return value instead of checking inline,
where sensible. Rename local int err to ret for clarity and consistency.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 142 +++++++++++++++---------
 1 file changed, 88 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0cd5e6b5034c..6a8cf3987aa5 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3734,19 +3734,19 @@ static bool downstream_hpd_needs_d0(struct intel_dp *intel_dp)
 static int
 write_dsc_decompression_flag(struct drm_dp_aux *aux, u8 flag, bool set)
 {
-	int err;
+	int ret;
 	u8 val;
 
-	err = drm_dp_dpcd_readb(aux, DP_DSC_ENABLE, &val);
-	if (err < 0)
-		return err;
+	ret = drm_dp_dpcd_read_byte(aux, DP_DSC_ENABLE, &val);
+	if (ret < 0)
+		return ret;
 
 	if (set)
 		val |= flag;
 	else
 		val &= ~flag;
 
-	return drm_dp_dpcd_writeb(aux, DP_DSC_ENABLE, val);
+	return drm_dp_dpcd_write_byte(aux, DP_DSC_ENABLE, val);
 }
 
 static void
@@ -3910,6 +3910,7 @@ intel_dp_init_source_oui(struct intel_dp *intel_dp)
 	struct intel_display *display = to_intel_display(intel_dp);
 	u8 oui[] = { 0x00, 0xaa, 0x01 };
 	u8 buf[3] = {};
+	int ret;
 
 	if (READ_ONCE(intel_dp->oui_valid))
 		return;
@@ -3920,7 +3921,8 @@ intel_dp_init_source_oui(struct intel_dp *intel_dp)
 	 * During driver init, we want to be careful and avoid changing the source OUI if it's
 	 * already set to what we want, so as to avoid clearing any state by accident
 	 */
-	if (drm_dp_dpcd_read(&intel_dp->aux, DP_SOURCE_OUI, buf, sizeof(buf)) < 0)
+	ret = drm_dp_dpcd_read_data(&intel_dp->aux, DP_SOURCE_OUI, buf, sizeof(buf));
+	if (ret < 0)
 		drm_dbg_kms(display->drm, "Failed to read source OUI\n");
 
 	if (memcmp(oui, buf, sizeof(oui)) == 0) {
@@ -3929,7 +3931,8 @@ intel_dp_init_source_oui(struct intel_dp *intel_dp)
 		return;
 	}
 
-	if (drm_dp_dpcd_write(&intel_dp->aux, DP_SOURCE_OUI, oui, sizeof(oui)) < 0) {
+	ret = drm_dp_dpcd_write_data(&intel_dp->aux, DP_SOURCE_OUI, oui, sizeof(oui));
+	if (ret < 0) {
 		drm_dbg_kms(display->drm, "Failed to write source OUI\n");
 		WRITE_ONCE(intel_dp->oui_valid, false);
 	}
@@ -3971,7 +3974,7 @@ void intel_dp_set_power(struct intel_dp *intel_dp, u8 mode)
 		if (downstream_hpd_needs_d0(intel_dp))
 			return;
 
-		ret = drm_dp_dpcd_writeb(&intel_dp->aux, DP_SET_POWER, mode);
+		ret = drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER, mode);
 	} else {
 		struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
 
@@ -3985,17 +3988,17 @@ void intel_dp_set_power(struct intel_dp *intel_dp, u8 mode)
 		 * time to wake up.
 		 */
 		for (i = 0; i < 3; i++) {
-			ret = drm_dp_dpcd_writeb(&intel_dp->aux, DP_SET_POWER, mode);
-			if (ret == 1)
+			ret = drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER, mode);
+			if (!ret)
 				break;
 			msleep(1);
 		}
 
-		if (ret == 1 && intel_lspcon_active(dig_port))
+		if (!ret && intel_lspcon_active(dig_port))
 			intel_lspcon_wait_pcon_mode(dig_port);
 	}
 
-	if (ret != 1)
+	if (ret < 0)
 		drm_dbg_kms(display->drm,
 			    "[ENCODER:%d:%s] Set power to %s failed\n",
 			    encoder->base.base.id, encoder->base.name,
@@ -4086,6 +4089,7 @@ bool intel_dp_initial_fastset_check(struct intel_encoder *encoder,
 static void intel_dp_get_pcon_dsc_cap(struct intel_dp *intel_dp)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
+	int ret;
 
 	/* Clear the cached register set to avoid using stale values */
 
@@ -4094,9 +4098,10 @@ static void intel_dp_get_pcon_dsc_cap(struct intel_dp *intel_dp)
 	if (!drm_dp_is_branch(intel_dp->dpcd))
 		return;
 
-	if (drm_dp_dpcd_read(&intel_dp->aux, DP_PCON_DSC_ENCODER,
-			     intel_dp->pcon_dsc_dpcd,
-			     sizeof(intel_dp->pcon_dsc_dpcd)) < 0)
+	ret = drm_dp_dpcd_read_data(&intel_dp->aux, DP_PCON_DSC_ENCODER,
+				    intel_dp->pcon_dsc_dpcd,
+				    sizeof(intel_dp->pcon_dsc_dpcd));
+	if (ret < 0)
 		drm_err(display->drm, "Failed to read DPCD register 0x%x\n",
 			DP_PCON_DSC_ENCODER);
 
@@ -4255,13 +4260,13 @@ int intel_dp_pcon_set_tmds_mode(struct intel_dp *intel_dp)
 	/* Set PCON source control mode */
 	buf |= DP_PCON_ENABLE_SOURCE_CTL_MODE;
 
-	ret = drm_dp_dpcd_writeb(&intel_dp->aux, DP_PCON_HDMI_LINK_CONFIG_1, buf);
+	ret = drm_dp_dpcd_write_byte(&intel_dp->aux, DP_PCON_HDMI_LINK_CONFIG_1, buf);
 	if (ret < 0)
 		return ret;
 
 	/* Set HDMI LINK ENABLE */
 	buf |= DP_PCON_ENABLE_HDMI_LINK;
-	ret = drm_dp_dpcd_writeb(&intel_dp->aux, DP_PCON_HDMI_LINK_CONFIG_1, buf);
+	ret = drm_dp_dpcd_write_byte(&intel_dp->aux, DP_PCON_HDMI_LINK_CONFIG_1, buf);
 	if (ret < 0)
 		return ret;
 
@@ -4407,6 +4412,7 @@ void intel_dp_configure_protocol_converter(struct intel_dp *intel_dp,
 	bool ycbcr444_to_420 = false;
 	bool rgb_to_ycbcr = false;
 	u8 tmp;
+	int ret;
 
 	if (intel_dp->dpcd[DP_DPCD_REV] < 0x13)
 		return;
@@ -4416,8 +4422,9 @@ void intel_dp_configure_protocol_converter(struct intel_dp *intel_dp,
 
 	tmp = intel_dp_has_hdmi_sink(intel_dp) ? DP_HDMI_DVI_OUTPUT_CONFIG : 0;
 
-	if (drm_dp_dpcd_writeb(&intel_dp->aux,
-			       DP_PROTOCOL_CONVERTER_CONTROL_0, tmp) != 1)
+	ret = drm_dp_dpcd_write_byte(&intel_dp->aux,
+				     DP_PROTOCOL_CONVERTER_CONTROL_0, tmp);
+	if (ret < 0)
 		drm_dbg_kms(display->drm,
 			    "Failed to %s protocol converter HDMI mode\n",
 			    str_enable_disable(intel_dp_has_hdmi_sink(intel_dp)));
@@ -4452,15 +4459,17 @@ void intel_dp_configure_protocol_converter(struct intel_dp *intel_dp,
 
 	tmp = ycbcr444_to_420 ? DP_CONVERSION_TO_YCBCR420_ENABLE : 0;
 
-	if (drm_dp_dpcd_writeb(&intel_dp->aux,
-			       DP_PROTOCOL_CONVERTER_CONTROL_1, tmp) != 1)
+	ret = drm_dp_dpcd_write_byte(&intel_dp->aux,
+				     DP_PROTOCOL_CONVERTER_CONTROL_1, tmp);
+	if (ret < 0)
 		drm_dbg_kms(display->drm,
 			    "Failed to %s protocol converter YCbCr 4:2:0 conversion mode\n",
 			    str_enable_disable(intel_dp->dfp.ycbcr_444_to_420));
 
 	tmp = rgb_to_ycbcr ? DP_CONVERSION_BT709_RGB_YCBCR_ENABLE : 0;
 
-	if (drm_dp_pcon_convert_rgb_to_ycbcr(&intel_dp->aux, tmp) < 0)
+	ret = drm_dp_pcon_convert_rgb_to_ycbcr(&intel_dp->aux, tmp);
+	if (ret < 0)
 		drm_dbg_kms(display->drm,
 			    "Failed to %s protocol converter RGB->YCbCr conversion mode\n",
 			    str_enable_disable(tmp));
@@ -4470,8 +4479,8 @@ static u8 intel_dp_read_dprx_feature_enum(struct intel_dp *intel_dp)
 {
 	u8 dprx = 0;
 
-	drm_dp_dpcd_read_data(&intel_dp->aux, DP_DPRX_FEATURE_ENUMERATION_LIST,
-			      &dprx, sizeof(dprx));
+	drm_dp_dpcd_read_byte(&intel_dp->aux, DP_DPRX_FEATURE_ENUMERATION_LIST, &dprx);
+
 	return dprx;
 }
 
@@ -4490,9 +4499,8 @@ static int intel_dp_read_dsc_dpcd(struct drm_dp_aux *aux,
 {
 	int ret;
 
-	ret = drm_dp_dpcd_read_data(aux, DP_DSC_SUPPORT, dsc_dpcd,
-				    DP_DSC_RECEIVER_CAP_SIZE);
-	if (ret) {
+	ret = drm_dp_dpcd_read_data(aux, DP_DSC_SUPPORT, dsc_dpcd, DP_DSC_RECEIVER_CAP_SIZE);
+	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev,
 			    "Could not read DSC DPCD register 0x%x Error: %pe\n",
 			    DP_DSC_SUPPORT, ERR_PTR(ret));
@@ -4508,7 +4516,7 @@ static int intel_dp_read_dsc_dpcd(struct drm_dp_aux *aux,
 static void init_dsc_overall_throughput_limits(struct intel_connector *connector, bool is_branch)
 {
 	u8 branch_caps[DP_DSC_BRANCH_CAP_SIZE];
-	int line_width;
+	int line_width, ret;
 
 	connector->dp.dsc_branch_caps.overall_throughput.rgb_yuv444 = INT_MAX;
 	connector->dp.dsc_branch_caps.overall_throughput.yuv422_420 = INT_MAX;
@@ -4517,9 +4525,10 @@ static void init_dsc_overall_throughput_limits(struct intel_connector *connector
 	if (!is_branch)
 		return;
 
-	if (drm_dp_dpcd_read_data(connector->dp.dsc_decompression_aux,
-				  DP_DSC_BRANCH_OVERALL_THROUGHPUT_0, branch_caps,
-				  sizeof(branch_caps)) != 0)
+	ret = drm_dp_dpcd_read_data(connector->dp.dsc_decompression_aux,
+				    DP_DSC_BRANCH_OVERALL_THROUGHPUT_0, branch_caps,
+				    sizeof(branch_caps));
+	if (ret < 0)
 		return;
 
 	connector->dp.dsc_branch_caps.overall_throughput.rgb_yuv444 =
@@ -4537,6 +4546,7 @@ void intel_dp_get_dsc_sink_cap(u8 dpcd_rev,
 			       struct intel_connector *connector)
 {
 	struct intel_display *display = to_intel_display(connector);
+	int ret;
 
 	/*
 	 * Clear the cached register set to avoid using stale values
@@ -4553,12 +4563,14 @@ void intel_dp_get_dsc_sink_cap(u8 dpcd_rev,
 	if (dpcd_rev < DP_DPCD_REV_14)
 		return;
 
-	if (intel_dp_read_dsc_dpcd(connector->dp.dsc_decompression_aux,
-				   connector->dp.dsc_dpcd) < 0)
+	ret = intel_dp_read_dsc_dpcd(connector->dp.dsc_decompression_aux,
+				     connector->dp.dsc_dpcd);
+	if (ret < 0)
 		return;
 
-	if (drm_dp_dpcd_readb(connector->dp.dsc_decompression_aux, DP_FEC_CAPABILITY,
-			      &connector->dp.fec_capability) < 0) {
+	ret = drm_dp_dpcd_read_byte(connector->dp.dsc_decompression_aux, DP_FEC_CAPABILITY,
+				    &connector->dp.fec_capability);
+	if (ret < 0) {
 		drm_dbg_kms(display->drm, "Could not read FEC DPCD register\n");
 		return;
 	}
@@ -4668,12 +4680,14 @@ static void intel_edp_mso_init(struct intel_dp *intel_dp)
 	struct intel_display *display = to_intel_display(intel_dp);
 	struct intel_connector *connector = intel_dp->attached_connector;
 	struct drm_display_info *info = &connector->base.display_info;
+	int ret;
 	u8 mso;
 
 	if (intel_dp->edp_dpcd[0] < DP_EDP_14)
 		return;
 
-	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_MSO_LINK_CAPABILITIES, &mso) != 1) {
+	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_EDP_MSO_LINK_CAPABILITIES, &mso);
+	if (ret < 0) {
 		drm_err(display->drm, "Failed to read MSO cap\n");
 		return;
 	}
@@ -4813,9 +4827,9 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector *connector
 	 * method). The display control registers should read zero if they're
 	 * not supported anyway.
 	 */
-	if (drm_dp_dpcd_read(&intel_dp->aux, DP_EDP_DPCD_REV,
-			     intel_dp->edp_dpcd, sizeof(intel_dp->edp_dpcd)) ==
-			     sizeof(intel_dp->edp_dpcd)) {
+	ret = drm_dp_dpcd_read_data(&intel_dp->aux, DP_EDP_DPCD_REV,
+				    intel_dp->edp_dpcd, sizeof(intel_dp->edp_dpcd));
+	if (!ret) {
 		drm_dbg_kms(display->drm, "eDP DPCD: %*ph\n",
 			    (int)sizeof(intel_dp->edp_dpcd),
 			    intel_dp->edp_dpcd);
@@ -5044,6 +5058,7 @@ static bool
 intel_dp_get_sink_irq_esi(struct intel_dp *intel_dp, u8 *esi)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
+	int ret;
 
 	/*
 	 * Display WA for HSD #13013007775: mtl/arl/lnl
@@ -5052,24 +5067,30 @@ intel_dp_get_sink_irq_esi(struct intel_dp *intel_dp, u8 *esi)
 	 * inadvertently.
 	 */
 	if (IS_DISPLAY_VER(display, 14, 20) && !display->platform.battlemage) {
-		if (drm_dp_dpcd_read(&intel_dp->aux, DP_SINK_COUNT_ESI, esi, 3) != 3)
+		ret = drm_dp_dpcd_read_data(&intel_dp->aux, DP_SINK_COUNT_ESI, esi, 3);
+		if (ret < 0)
 			return false;
 
 		/* DP_SINK_COUNT_ESI + 3 == DP_LINK_SERVICE_IRQ_VECTOR_ESI0 */
-		return drm_dp_dpcd_readb(&intel_dp->aux, DP_LINK_SERVICE_IRQ_VECTOR_ESI0,
-					 &esi[3]) == 1;
+		ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_LINK_SERVICE_IRQ_VECTOR_ESI0,
+					    &esi[3]);
+		return ret == 0;
 	}
 
-	return drm_dp_dpcd_read(&intel_dp->aux, DP_SINK_COUNT_ESI, esi, 4) == 4;
+	ret = drm_dp_dpcd_read_data(&intel_dp->aux, DP_SINK_COUNT_ESI, esi, 4);
+
+	return ret == 0;
 }
 
 static bool intel_dp_ack_sink_irq_esi(struct intel_dp *intel_dp, u8 esi[4])
 {
 	int retry;
+	int ret;
 
 	for (retry = 0; retry < 3; retry++) {
-		if (drm_dp_dpcd_write(&intel_dp->aux, DP_SINK_COUNT_ESI + 1,
-				      &esi[1], 3) == 3)
+		ret = drm_dp_dpcd_write_data(&intel_dp->aux, DP_SINK_COUNT_ESI + 1,
+					     &esi[1], 3);
+		if (!ret)
 			return true;
 	}
 
@@ -5079,20 +5100,24 @@ static bool intel_dp_ack_sink_irq_esi(struct intel_dp *intel_dp, u8 esi[4])
 /* Return %true if reading the ESI vector succeeded, %false otherwise. */
 static bool intel_dp_get_sink_irq_esi_sst(struct intel_dp *intel_dp, u8 esi[4])
 {
+	int ret;
+
 	memset(esi, 0, 4);
 
 	/*
 	 * TODO: For DP_DPCD_REV >= 0x12 read
 	 * DP_SINK_COUNT_ESI and DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0.
 	 */
-	if (drm_dp_dpcd_read_data(&intel_dp->aux, DP_SINK_COUNT, esi, 2) != 0)
+	ret = drm_dp_dpcd_read_data(&intel_dp->aux, DP_SINK_COUNT, esi, 2);
+	if (ret < 0)
 		return false;
 
 	if (intel_dp->dpcd[DP_DPCD_REV] < DP_DPCD_REV_12)
 		return true;
 
 	/* TODO: Read DP_DEVICE_SERVICE_IRQ_VECTOR_ESI1 as well */
-	if (drm_dp_dpcd_read_byte(&intel_dp->aux, DP_LINK_SERVICE_IRQ_VECTOR_ESI0, &esi[3]) != 0)
+	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_LINK_SERVICE_IRQ_VECTOR_ESI0, &esi[3]);
+	if (ret < 0)
 		return false;
 
 	return true;
@@ -5101,18 +5126,22 @@ static bool intel_dp_get_sink_irq_esi_sst(struct intel_dp *intel_dp, u8 esi[4])
 /* Return %true if acking the ESI vector IRQ events succeeded, %false otherwise. */
 static bool intel_dp_ack_sink_irq_esi_sst(struct intel_dp *intel_dp, u8 esi[4])
 {
+	int ret;
+
 	/*
 	 * TODO: For DP_DPCD_REV >= 0x12 write
 	 * DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0
 	 */
-	if (drm_dp_dpcd_write_byte(&intel_dp->aux, DP_DEVICE_SERVICE_IRQ_VECTOR, esi[1]) != 0)
+	ret = drm_dp_dpcd_write_byte(&intel_dp->aux, DP_DEVICE_SERVICE_IRQ_VECTOR, esi[1]);
+	if (ret < 0)
 		return false;
 
 	if (intel_dp->dpcd[DP_DPCD_REV] < DP_DPCD_REV_12)
 		return true;
 
 	/* TODO: Read DP_DEVICE_SERVICE_IRQ_VECTOR_ESI1 as well */
-	if (drm_dp_dpcd_write_byte(&intel_dp->aux, DP_LINK_SERVICE_IRQ_VECTOR_ESI0, esi[3]) != 0)
+	ret = drm_dp_dpcd_write_byte(&intel_dp->aux, DP_LINK_SERVICE_IRQ_VECTOR_ESI0, esi[3]);
+	if (ret < 0)
 		return false;
 
 	return true;
@@ -5706,14 +5735,17 @@ intel_dp_handle_hdmi_link_status_change(struct intel_dp *intel_dp)
 {
 	bool is_active;
 	u8 buf = 0;
+	int ret;
 
 	is_active = drm_dp_pcon_hdmi_link_active(&intel_dp->aux);
 	if (intel_dp->frl.is_trained && !is_active) {
-		if (drm_dp_dpcd_readb(&intel_dp->aux, DP_PCON_HDMI_LINK_CONFIG_1, &buf) < 0)
+		ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_PCON_HDMI_LINK_CONFIG_1, &buf);
+		if (ret < 0)
 			return;
 
 		buf &=  ~DP_PCON_ENABLE_HDMI_LINK;
-		if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_PCON_HDMI_LINK_CONFIG_1, buf) < 0)
+		ret = drm_dp_dpcd_write_byte(&intel_dp->aux, DP_PCON_HDMI_LINK_CONFIG_1, buf);
+		if (ret < 0)
 			return;
 
 		drm_dp_pcon_hdmi_frl_link_error_count(&intel_dp->aux, &intel_dp->attached_connector->base);
@@ -6218,6 +6250,7 @@ static bool
 intel_dp_sink_supports_as_sdp_v2(struct intel_dp *intel_dp)
 {
 	u8 rx_features;
+	int ret;
 
 	/*
 	 * The DP spec does not explicitly provide the AS SDP v2 capability.
@@ -6240,9 +6273,10 @@ intel_dp_sink_supports_as_sdp_v2(struct intel_dp *intel_dp)
 	 * support from Display ID.
 	 */
 
-	if (drm_dp_dpcd_read_byte(&intel_dp->aux,
-				  DP_DPRX_FEATURE_ENUMERATION_LIST_CONT_1,
-				  &rx_features) == 1) {
+	ret = drm_dp_dpcd_read_byte(&intel_dp->aux,
+				    DP_DPRX_FEATURE_ENUMERATION_LIST_CONT_1,
+				    &rx_features);
+	if (!ret) {
 		if (rx_features & DP_AS_SDP_FAVT_PAYLOAD_FIELDS_PARSING_SUPPORTED)
 			return true;
 	}
-- 
2.47.3

