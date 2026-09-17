Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA24C982D3
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 05:07:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D494B10E599;
	Thu, 17 Sep 2026 05:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KP1rwKPG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A644B10E57F;
 Thu, 17 Sep 2026 05:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789621663; x=1821157663;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A4elBug/chmTzapFFXleEaKLwx/IS3A1jtdnvhdE7kU=;
 b=KP1rwKPGKmw+oHXu3mfWmMNhUrM3/+i3wclvhxvOLRTdm/8rl0YZ1jUQ
 25Nc5MWgx6qQLgksj21IcuJJ0Iopi2hR4O1pGMiHc1P9FYS9fIw92nqln
 Fy992BDOLGxrhMc6QfDycM6Wos9DGXQXcrnWYdQuk05FkxoD2z72eLR35
 5B6hfWg8DZ06BA20xDixJ2+xyaAJ7IE6ggz8bgBjTA8ZyWETwY+BSQE9c
 HZh1IgNJ9b8YbRGaC7B+9X5MKVqoiSy8TW8ogs2FF5zlHiWdk5GsnsaX1
 ytd7o2gOzHC22ChD68I/Cjy+sVTvomXxe4LxpV1eGqEFROKyKi6OVuh0c A==;
X-CSE-ConnectionGUID: m9+a7CLFTx+OyILIGZme5A==
X-CSE-MsgGUID: 2WSOecmGT6WEjbBLmf0VzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77569685"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="77569685"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 22:07:42 -0700
X-CSE-ConnectionGUID: Y5uHQxDkQOSzs/PeQ6iWBw==
X-CSE-MsgGUID: zNz/XS7+RnGSHxlK65Vg9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="278799009"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa005.fm.intel.com with ESMTP; 16 Sep 2026 22:07:40 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v4 04/10] drm/i915/dp: Add M/N ratio check for DP link config
Date: Thu, 17 Sep 2026 10:36:43 +0530
Message-Id: <20260917050649.871960-5-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917050649.871960-1-suraj.kandpal@intel.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
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

From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Introduce intel_dp_check_m_n_ratio() to validate the computed link M/N
ratio against the maximum allowed value, and log it if the ratio exceeds
the limit.

The link config limits computed in the previous patches only restrict
the configurations that may be selected; this catches anything that
still slips through.

Log it rather than warn about it: the link config filter already
excludes the configurations violating the limit, so the only way to get
here is with link parameters forced through debugfs, which are applied
after that filter. A user triggerable drm_WARN() with its backtrace
would be out of proportion for that.

This check works off the M/N values as actually computed, which exposes
a mismatch with the prediction done while computing the limits: the
pixel clock there is the one before intel_dp_compute_config() divides
adjusted_mode->crtc_clock by the MSO link count. Divide in the
prediction too, so both agree. The joiner needs no such handling, as
intel_joiner_adjust_timings() only rewrites the pipe mode and leaves the
adjusted mode the link M/N is derived from untouched.

For MST the check goes after the bpp loop rather than inside it. The
link M/N is computed from the pixel clock and the link symbol clock, so
it does not depend on the bpp being tried and the result is the same on
every iteration.

v2:
-Use the platform specific ratio limit. (Wa_14014191401)
-Use the MSO adjusted pixel clock when predicting the ratio, matching
what the link M/N is actually computed from. (Imre)
-Drop the check from ilk_fdi_compute_config(): it was passing dp_m_n
rather than the fdi_m_n it had just computed, and an FDI link cannot get
anywhere near the ratio limit anyway.
v3:
-Check the ratio once after the MST bpp loop instead of on every
iteration, the result does not depend on the bpp. (Sashiko)
-Log instead of warning, since the link config filter already excludes
these configurations and only forced link parameters can reach it.
(Sashiko)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 37 +++++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_dp.h     |  4 +++
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  2 ++
 3 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index f6a2152c4432..fbfc00101886 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1294,6 +1294,14 @@ intel_dp_can_support_m_n(struct intel_display *display,
 	return m_n_ratio <= max_m_n_ratio;
 }
 
+static int intel_dp_mso_pixel_clock(struct intel_dp *intel_dp, int pixel_clock)
+{
+	if (!intel_dp->mso_link_count)
+		return pixel_clock;
+
+	return pixel_clock / intel_dp->mso_link_count;
+}
+
 static
 bool intel_dp_can_join(struct intel_dp *intel_dp,
 		       int num_joined_pipes)
@@ -1332,6 +1340,7 @@ bool intel_dp_dotclk_valid(struct intel_display *display,
 bool intel_dp_mode_valid_m_n(struct intel_dp *intel_dp, int pixel_clock)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
+	int m_n_pixel_clock = intel_dp_mso_pixel_clock(intel_dp, pixel_clock);
 	struct intel_dp_link_caps_order order = {
 		.key = INTEL_DP_LINK_CAPS_ORDER_KEY_RATE_LANE,
 		.dir = INTEL_DP_LINK_CAPS_ORDER_DIR_DESC,
@@ -1343,7 +1352,8 @@ bool intel_dp_mode_valid_m_n(struct intel_dp *intel_dp, int pixel_clock)
 	intel_dp_link_caps_iter_start(&iter, intel_dp->link.caps, order,
 				      INTEL_DP_LINK_CAPS_FILTER_ALL);
 	for_each_dp_link_config(&iter, &link_config) {
-		if (intel_dp_can_support_m_n(display, pixel_clock, link_config.rate)) {
+		if (intel_dp_can_support_m_n(display, m_n_pixel_clock,
+					     link_config.rate)) {
 			found = true;
 
 			break;
@@ -2723,7 +2733,8 @@ intel_dp_compute_m_n_ratio_limits(struct intel_dp *intel_dp,
 	struct intel_dp_link_caps_order order =
 		intel_dp_link_caps_connector_compute_order(connector);
 	struct intel_dp_link_caps_filter new_filter = INTEL_DP_LINK_CAPS_FILTER_NONE;
-	int pixel_clock = intel_dp_mode_clock(crtc_state, conn_state);
+	int pixel_clock = intel_dp_mso_pixel_clock(intel_dp,
+						  intel_dp_mode_clock(crtc_state, conn_state));
 	struct intel_dp_link_config link_config;
 	struct intel_dp_link_caps_iter iter;
 	bool found = false;
@@ -3382,6 +3393,24 @@ static bool can_enable_drrs(struct intel_connector *connector,
 		intel_panel_drrs_type(connector) == DRRS_TYPE_SEAMLESS;
 }
 
+void intel_dp_check_m_n_ratio(struct intel_crtc_state *crtc_state,
+			      struct intel_link_m_n *m_n)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	int max_m_n_ratio = intel_dp_get_max_m_n_ratio(display);
+	int m_n_ratio;
+
+	if (!m_n || !m_n->link_n)
+		return;
+
+	m_n_ratio = DIV_ROUND_UP(m_n->link_m, m_n->link_n);
+
+	if (m_n_ratio > max_m_n_ratio)
+		drm_dbg_kms(display->drm,
+			    "Link M/N ratio (%d) exceeds max allowed (%d)\n",
+			    m_n_ratio, max_m_n_ratio);
+}
+
 static void
 intel_dp_drrs_compute_config(struct intel_connector *connector,
 			     struct intel_crtc_state *pipe_config,
@@ -3420,6 +3449,8 @@ intel_dp_drrs_compute_config(struct intel_connector *connector,
 			       intel_dp_bw_fec_overhead(pipe_config->fec_enable),
 			       &pipe_config->dp_m2_n2);
 
+	intel_dp_check_m_n_ratio(pipe_config, &pipe_config->dp_m2_n2);
+
 	/* FIXME: abstract this better */
 	if (pipe_config->splitter.enable)
 		pipe_config->dp_m2_n2.data_m *= pipe_config->splitter.link_count;
@@ -3739,6 +3770,8 @@ intel_dp_compute_config(struct intel_atomic_state *state,
 				       pipe_config->port_clock,
 				       intel_dp_bw_fec_overhead(pipe_config->fec_enable),
 				       &pipe_config->dp_m_n);
+
+		intel_dp_check_m_n_ratio(pipe_config, &pipe_config->dp_m_n);
 	}
 
 	ret = intel_dp_compute_min_hblank(pipe_config, conn_state);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index aa58833a405b..4c975358ab96 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -26,6 +26,7 @@ struct intel_display;
 struct intel_dp;
 struct intel_dp_link_config;
 struct intel_encoder;
+struct intel_link_m_n;
 
 struct link_config_limits {
 	struct intel_dp_link_caps_filter link_config_filter;
@@ -244,4 +245,7 @@ bool intel_dp_mode_valid_m_n(struct intel_dp *intel_dp, int pixel_clock);
 int intel_dp_link_init(struct intel_dp *intel_dp);
 void intel_dp_link_cleanup(struct intel_dp *intel_dp);
 
+void intel_dp_check_m_n_ratio(struct intel_crtc_state *crtc_state,
+			      struct intel_link_m_n *m_n);
+
 #endif /* __INTEL_DP_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 823fe99ca0a1..6d2e234a9e9b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -429,6 +429,8 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
 		return slots;
 	}
 
+	intel_dp_check_m_n_ratio(crtc_state, &crtc_state->dp_m_n);
+
 	if (!dsc)
 		crtc_state->pipe_bpp = fxp_q4_to_int(bpp_x16);
 	else
-- 
2.34.1

