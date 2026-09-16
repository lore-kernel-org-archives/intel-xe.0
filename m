Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20073C88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 02:57:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49E610E46C;
	Wed, 16 Sep 2026 02:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XsH/Flm6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B7F10E40D;
 Wed, 16 Sep 2026 02:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789527441; x=1821063441;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wS3QA+Fz9CXmm9zQdSEyTYJA13kJNH5BNDYzAb3vJhs=;
 b=XsH/Flm6k4gHZg04ZJ1x6rj+hJOAo3CQ66cuCS0svIBsE3J10SCEo5qc
 dXhRYlveEt3CsFpNWYCeAwLZMhO+4+j5QnSIy4nk2a5faRz7vwmg1ySz7
 n+kH/3cjMG1HVhN1ngm1qtSViowGFhI/4H6EmzVTI0ChjgeLDHh0FB2Xd
 sQ27XZJc4dzdR28Jd9pi8KIKpITMkmAGleg3i8SR291ZFdpjem0TUHy4b
 JtGA79zPfO3pd4pg9XUV2182jZSsizNelLXG9fy6XQhPI/dApVE32hrwQ
 GIY5ZRWQIVo4/wP+0xyeUZ9B8iGpSIpgUpoHuiNmwpi6dB7neBVJ9y4n2 Q==;
X-CSE-ConnectionGUID: N5lF/PvOSNWwT3bMJnSWvA==
X-CSE-MsgGUID: inkeJ9GIR+2txBrcsb/d8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100498335"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100498335"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 19:57:21 -0700
X-CSE-ConnectionGUID: Gv7yJ2bgRTqYHNFM8+mbEg==
X-CSE-MsgGUID: vyOCCERUSEitd8YK/k1OTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="311473400"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa001.jf.intel.com with ESMTP; 15 Sep 2026 19:57:20 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 04/10] drm/i915/dp: Add M/N ratio check with warning for DP
 link config
Date: Wed, 16 Sep 2026 08:27:04 +0530
Message-Id: <20260916025710.432281-5-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260916025710.432281-1-suraj.kandpal@intel.com>
References: <20260916025710.432281-1-suraj.kandpal@intel.com>
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

Introduce intel_dp_check_m_n_ratio() to validate the computed link
M/N ratio against the maximum allowed value. If the ratio exceeds the
limit, a warning is issued via drm_WARN().

The link config limits computed in the previous patches only restrict
the configurations that may be selected; this catches anything that
still slips through and turns a silently broken link into a loud
warning.

This check works off the M/N values as actually computed, which exposes
a mismatch with the prediction done while computing the limits: the
pixel clock there is the one before intel_dp_compute_config() divides
adjusted_mode->crtc_clock by the MSO link count. Divide in the
prediction too, so both agree. The joiner needs no such handling, as
intel_joiner_adjust_timings() only rewrites the pipe mode and leaves the
adjusted mode the link M/N is derived from untouched.

v2:
-Use the platform specific ratio limit. (Wa_14014191401)
-Use the MSO adjusted pixel clock when predicting the ratio, matching
what the link M/N is actually computed from. (Imre)
-Drop the check from ilk_fdi_compute_config(): it was passing dp_m_n
rather than the fdi_m_n it had just computed, and an FDI link cannot get
anywhere near the ratio limit anyway.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 37 +++++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_dp.h     |  3 ++
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  2 ++
 3 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 4a1934d4eca4..2fca0eedb443 100644
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
@@ -1488,7 +1496,9 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 					      INTEL_DP_LINK_CAPS_ORDER_KEY_RATE_LANE,
 					      INTEL_DP_LINK_CAPS_FILTER_ALL,
 					      &max_rate_config) &&
-	    !intel_dp_can_support_m_n(display, target_clock, max_rate_config.rate))
+	    !intel_dp_can_support_m_n(display,
+				      intel_dp_mso_pixel_clock(intel_dp, target_clock),
+				      max_rate_config.rate))
 		return MODE_CLOCK_HIGH;
 
 	/*
@@ -2703,7 +2713,8 @@ intel_dp_compute_m_n_ratio_limits(struct intel_dp *intel_dp,
 	struct intel_dp_link_caps_order order =
 		intel_dp_link_caps_connector_compute_order(connector);
 	struct intel_dp_link_caps_filter new_filter = INTEL_DP_LINK_CAPS_FILTER_NONE;
-	int pixel_clock = intel_dp_mode_clock(crtc_state, conn_state);
+	int pixel_clock = intel_dp_mso_pixel_clock(intel_dp,
+						  intel_dp_mode_clock(crtc_state, conn_state));
 	struct intel_dp_link_config link_config;
 	struct intel_dp_link_caps_iter iter;
 	bool found = false;
@@ -3362,6 +3373,24 @@ static bool can_enable_drrs(struct intel_connector *connector,
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
+		drm_WARN(display->drm, 1,
+			 "Link M/N ratio (%d) exceeds max allowed (%d)\n",
+			 m_n_ratio, max_m_n_ratio);
+}
+
 static void
 intel_dp_drrs_compute_config(struct intel_connector *connector,
 			     struct intel_crtc_state *pipe_config,
@@ -3400,6 +3429,8 @@ intel_dp_drrs_compute_config(struct intel_connector *connector,
 			       intel_dp_bw_fec_overhead(pipe_config->fec_enable),
 			       &pipe_config->dp_m2_n2);
 
+	intel_dp_check_m_n_ratio(pipe_config, &pipe_config->dp_m2_n2);
+
 	/* FIXME: abstract this better */
 	if (pipe_config->splitter.enable)
 		pipe_config->dp_m2_n2.data_m *= pipe_config->splitter.link_count;
@@ -3719,6 +3750,8 @@ intel_dp_compute_config(struct intel_atomic_state *state,
 				       pipe_config->port_clock,
 				       intel_dp_bw_fec_overhead(pipe_config->fec_enable),
 				       &pipe_config->dp_m_n);
+
+		intel_dp_check_m_n_ratio(pipe_config, &pipe_config->dp_m_n);
 	}
 
 	ret = intel_dp_compute_min_hblank(pipe_config, conn_state);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 757e74ca8696..13e9432f98c6 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -26,6 +26,7 @@ struct intel_display;
 struct intel_dp;
 struct intel_dp_link_config;
 struct intel_encoder;
+struct intel_link_m_n;
 
 struct link_config_limits {
 	struct intel_dp_link_caps_filter link_config_filter;
@@ -244,5 +245,7 @@ void intel_dp_link_cleanup(struct intel_dp *intel_dp);
 
 bool intel_dp_can_support_m_n(struct intel_display *display,
 			      int pixel_clock, int link_rate);
+void intel_dp_check_m_n_ratio(struct intel_crtc_state *crtc_state,
+			      struct intel_link_m_n *m_n);
 
 #endif /* __INTEL_DP_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 3f4ab9573d0c..d375fff3fe4c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -347,6 +347,8 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
 					 link_bpp_x16,
 					 &crtc_state->dp_m_n);
 
+		intel_dp_check_m_n_ratio(crtc_state, &crtc_state->dp_m_n);
+
 		if (is_mst) {
 			int remote_bw_overhead;
 			int remote_tu;
-- 
2.34.1

