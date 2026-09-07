Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665A2C79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 03:44:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6F810E425;
	Mon,  7 Sep 2026 03:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q2AqsYzN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3850E10E424;
 Mon,  7 Sep 2026 03:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788752686; x=1820288686;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=taNcJCbfkHchQJlDxZasy+DH/FktuTuoWdoRUaBc48o=;
 b=Q2AqsYzNV+aeWICacLjFTgco+RdX+ShS/zcsdXjY/jAbW1XmQngt5Zct
 HysxrgJcn9wpXWkVWJ33WNUYdKqcjyHG1HBKvix+rbuaQZs4RZODJUwbN
 Hxys9it0uPQPnQDflbpa27cdJ5dKw+kY+nAK3EbT3xb/153+yrbtcRVyG
 6V9nvrQyeKbUtm6rPPTfmc3c0UN3wJ15PWZeSa5nz18ldBklvJVsqtGm3
 3EbQt3KrcQp3pRjiD9M0nXWCZfExaDZTgyr7BjAXUPXSLsM2AdWxiRvlz
 d2YbfAOr9/UkY45psxtH/SvZOQhSCtV4yOJ3o0NoqmGSSsP7imkrOPrau w==;
X-CSE-ConnectionGUID: XVOBB5tUQeSQdYHOZbH4mg==
X-CSE-MsgGUID: NiRFKyKHThiEeZP2XdKdwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="99484890"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="99484890"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 20:44:46 -0700
X-CSE-ConnectionGUID: y7TtPXOATayBmwLrZS1SUw==
X-CSE-MsgGUID: hVOylBwgSimyyA2c7mfh+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="270560268"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2026 20:44:44 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH] drm/i915/debugfs: Add HDR status to i915_display_info
Date: Mon,  7 Sep 2026 09:28:31 +0530
Message-ID: <20260907035831.718916-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

i915_display_info currently shows per-connector state but not HDR status,
making HDR bringup hard to debug without correlating EDID, userspace,
and driver state.

Print the sink’s HDR capability from the EDID static metadata block,
whether userspace has set the HDR_OUTPUT_METADATA property, and whether
the driver is actually transmitting HDR metadata in the CRTC state. This
distinguishes between a sink advertising HDR support, a property being
set by userspace, and the actual HDR infoframe being sent on the wire.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 .../drm/i915/display/intel_display_debugfs.c  | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 3e302f23f247..a24c947c23de 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -243,6 +243,86 @@ static void intel_hdmi_info(struct seq_file *m,
 	seq_printf(m, "\taudio support: %s\n", str_yes_no(has_audio));
 }
 
+static const char *intel_hdr_eotf_name(enum hdmi_eotf eotf)
+{
+	switch (eotf) {
+	case HDMI_EOTF_TRADITIONAL_GAMMA_SDR:
+		return "SDR";
+	case HDMI_EOTF_TRADITIONAL_GAMMA_HDR:
+		return "HDR-gamma";
+	case HDMI_EOTF_SMPTE_ST2084:
+		return "SMPTE_ST2084";
+	case HDMI_EOTF_BT_2100_HLG:
+		return "HLG";
+	default:
+		return "unknown";
+	}
+}
+
+static void intel_hdr_sink_info(struct seq_file *m,
+				struct drm_connector *connector)
+{
+	const struct hdr_static_metadata *hdr =
+		&connector->display_info.hdr_sink_metadata.hdmi_type1;
+	int i;
+
+	seq_printf(m, "\tHDR sink capable: %s\n",
+		   str_yes_no(hdr->eotf & (BIT(HDMI_EOTF_SMPTE_ST2084) |
+					   BIT(HDMI_EOTF_BT_2100_HLG))));
+	if (!hdr->eotf)
+		return;
+
+	seq_puts(m, "\t\tsupported EOTF:");
+	for (i = HDMI_EOTF_TRADITIONAL_GAMMA_SDR; i <= HDMI_EOTF_BT_2100_HLG; i++)
+		if (hdr->eotf & BIT(i))
+			seq_printf(m, " %s", intel_hdr_eotf_name(i));
+	seq_puts(m, "\n");
+
+	seq_printf(m, "\t\tstatic metadata type1: %s\n",
+		   str_yes_no(hdr->metadata_type & BIT(HDMI_STATIC_METADATA_TYPE1)));
+	seq_printf(m, "\t\tmax_cll: %u, max_fall: %u, min_cll: %u (EDID coded)\n",
+		   hdr->max_cll, hdr->max_fall, hdr->min_cll);
+}
+
+static void intel_hdr_output_info(struct seq_file *m,
+				  struct drm_connector *connector)
+{
+	const struct drm_connector_state *conn_state = connector->state;
+	const struct intel_crtc_state *crtc_state;
+	const struct hdmi_drm_infoframe *frame;
+
+	if (!conn_state || !conn_state->crtc)
+		return;
+
+	crtc_state = to_intel_crtc_state(conn_state->crtc->state);
+
+	seq_printf(m, "\tHDR output metadata blob: %s\n",
+		   str_yes_no(conn_state->hdr_output_metadata));
+
+	/* HDMI signals HDR via a DRM InfoFrame, DP via a gamut metadata SDP */
+	if (!(crtc_state->infoframes.enable &
+	      (intel_hdmi_infoframe_enable(HDMI_INFOFRAME_TYPE_DRM) |
+	       intel_hdmi_infoframe_enable(HDMI_PACKET_TYPE_GAMUT_METADATA)))) {
+		seq_puts(m, "\tHDR output: off\n");
+		return;
+	}
+
+	frame = &crtc_state->infoframes.drm.drm;
+
+	seq_printf(m, "\tHDR output: on, EOTF: %s, metadata type: %d\n",
+		   intel_hdr_eotf_name(frame->eotf), frame->metadata_type);
+	seq_printf(m, "\t\tprimaries: r(%u,%u) g(%u,%u) b(%u,%u) wp(%u,%u)\n",
+		   frame->display_primaries[0].x, frame->display_primaries[0].y,
+		   frame->display_primaries[1].x, frame->display_primaries[1].y,
+		   frame->display_primaries[2].x, frame->display_primaries[2].y,
+		   frame->white_point.x, frame->white_point.y);
+	seq_printf(m, "\t\tmastering luminance: max %u, min %u\n",
+		   frame->max_display_mastering_luminance,
+		   frame->min_display_mastering_luminance);
+	seq_printf(m, "\t\tmax_cll: %u, max_fall: %u\n",
+		   frame->max_cll, frame->max_fall);
+}
+
 static void intel_connector_info(struct seq_file *m,
 				 struct drm_connector *connector)
 {
@@ -264,6 +344,7 @@ static void intel_connector_info(struct seq_file *m,
 	seq_printf(m, "\tsubpixel order: %s\n",
 		   drm_get_subpixel_order_name(connector->display_info.subpixel_order));
 	seq_printf(m, "\tCEA rev: %d\n", connector->display_info.cea_rev);
+	intel_hdr_sink_info(m, connector);
 
 	switch (connector->connector_type) {
 	case DRM_MODE_CONNECTOR_DisplayPort:
@@ -288,6 +369,7 @@ static void intel_connector_info(struct seq_file *m,
 	intel_hdcp_info(m, intel_connector);
 
 	seq_printf(m, "\tmax bpc: %u\n", connector->display_info.bpc);
+	intel_hdr_output_info(m, connector);
 
 	intel_panel_info(m, intel_connector);
 
-- 
2.53.0

