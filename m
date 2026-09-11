Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE18C79FA1
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 04:15:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1815B10EBC4;
	Fri, 11 Sep 2026 04:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZiFbUN9G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B2410E50A;
 Fri, 11 Sep 2026 04:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789100102; x=1820636102;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LdqcRYFXej4vRh0T9rQg9qY1Jqd7iprMaOORN9PBuE0=;
 b=ZiFbUN9GJJuNYsaA8HljEBC3wfSMBK8x2G+6v7rXY/VqqaogziCQZBgC
 bGfHQ4yvS66NyzzvTFncqvRnKE8Y9aixwwXe+B9Hd9ALQn7YK1dHsjjFC
 EMieNEm1XDfRJq/xScdqsEPWk5+mc3b0vh9D/B4hgx3yolsSj6IJtXunI
 OVKjbx6P7pocqdIYyK6ji9B0GEZEg9WcpX0JhlF36AVliU2HViUcBw10P
 VEkWlic+D+GzUsPyIsujeP6ABqHWZjIR6t1HHKkhEGqsLID5aYtOx8se/
 h3d97cMe6O6naa6PEVreWQ1v0r8Qfqh158F3b7Ss7HEeTR0EwnWVLMNnQ Q==;
X-CSE-ConnectionGUID: N3qfPmJmSjWY/eu8ZQT4Vg==
X-CSE-MsgGUID: bSGEpLanSXqTIVSK+uLZjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89599952"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89599952"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 21:15:02 -0700
X-CSE-ConnectionGUID: kuS8MkgeSX68mQux/EvRkA==
X-CSE-MsgGUID: AexFAM+xR5Ciae/gZlaI3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="275334416"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa003.jf.intel.com with ESMTP; 10 Sep 2026 21:15:01 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 02/10] drm/i915/dp: Limit M/N ratio for DP SST
Date: Fri, 11 Sep 2026 09:44:41 +0530
Message-Id: <20260911041449.3699400-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911041449.3699400-1-suraj.kandpal@intel.com>
References: <20260911041449.3699400-1-suraj.kandpal@intel.com>
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

The hardware cannot support DisplayPort configurations where the
ceiling of the Link M/Link N ratio exceeds the limit the transcoder's
timing generator DDA can track. This limitation has always existed, but
it typically wasn't encountered without the use of joiners and DSC.

With higher resolutions and combinations involving joiners and DSC,
this constraint can now be hit in certain scenarios.

Restrict the link configurations to those satisfying the constraint
while computing the link config limits, so that the SST and the MST
paths both get it, and so that a mode which no link rate can support
fails early rather than deep inside link config selection. Also prune
such modes already in mode_valid, using the highest link rate available.

Note: This change applies the check only for SST. Support for MST will
be added in a subsequent commit.

v2:
-Move the M/N ratio check to the link rate configuration phase instead
of during M/N computation. (Ville)
-Prune modes that cannot be supported even with highest link rate due to
M/N ratio restriction.
v3:
-Rebase on the link caps iterator based link config selection.
-Set the constraint up in intel_dp_compute_config_limits() by narrowing
the link config filter, and fail there if no config qualifies, instead
of skipping configs while iterating them. (Imre)
-Use a limit of 4 on DG2. (Wa_14014191401)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c |  1 -
 drivers/gpu/drm/i915/display/intel_display.h |  3 +
 drivers/gpu/drm/i915/display/intel_dp.c      | 81 ++++++++++++++++++++
 3 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index b5682c196646..951856a1694d 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2633,7 +2633,6 @@ static void compute_m_n(u32 *ret_m, u32 *ret_n,
 	intel_reduce_m_n_ratio(ret_m, ret_n);
 }
 
-static
 void intel_display_get_link_m_n(u32 *link_m, u32 *link_n,
 				u32 pixel_clock,
 				u32 link_clock)
diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index eecafff167d3..fc474d9cd533 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -523,5 +523,8 @@ bool assert_port_valid(struct intel_display *display, enum port port);
 
 bool intel_scanout_needs_vtd_wa(struct intel_display *display);
 int intel_crtc_num_joined_pipes(const struct intel_crtc_state *crtc_state);
+void intel_display_get_link_m_n(u32 *link_m, u32 *link_n,
+				u32 pixel_clock,
+				u32 link_clock);
 
 #endif
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0cd5e6b5034c..dbece80c7a06 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -61,6 +61,7 @@
 #include "intel_cx0_phy.h"
 #include "intel_ddi.h"
 #include "intel_de.h"
+#include "intel_display.h"
 #include "intel_display_driver.h"
 #include "intel_display_jiffies.h"
 #include "intel_display_utils.h"
@@ -1265,6 +1266,34 @@ bool intel_dp_has_dsc(const struct intel_connector *connector)
 	return true;
 }
 
+static int
+intel_dp_get_max_m_n_ratio(struct intel_display *display)
+{
+	if (display->platform.dg2)
+		return 4;
+
+	return 10;
+}
+
+static bool
+intel_dp_can_support_m_n(struct intel_display *display,
+			 int pixel_clock, int link_rate)
+{
+	int max_m_n_ratio = intel_dp_get_max_m_n_ratio(display);
+	u32 link_m, link_n;
+	int m_n_ratio;
+
+	intel_display_get_link_m_n(&link_m, &link_n,
+				   pixel_clock, link_rate);
+
+	if (!link_n)
+		return true;
+
+	m_n_ratio = DIV_ROUND_UP(link_m, link_n);
+
+	return m_n_ratio <= max_m_n_ratio;
+}
+
 static
 bool intel_dp_can_join(struct intel_dp *intel_dp,
 		       int num_joined_pipes)
@@ -1432,6 +1461,7 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 	struct intel_connector *connector = to_intel_connector(_connector);
 	const struct drm_display_info *info = &connector->base.display_info;
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
+	struct intel_dp_link_config max_rate_config;
 	int target_clock = mode->clock;
 	enum drm_mode_status status;
 
@@ -1454,6 +1484,13 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 			return status;
 	}
 
+	if (intel_dp_link_caps_get_max_config(intel_dp->link.caps,
+					      INTEL_DP_LINK_CAPS_ORDER_KEY_RATE_LANE,
+					      INTEL_DP_LINK_CAPS_FILTER_ALL,
+					      &max_rate_config) &&
+	    !intel_dp_can_support_m_n(display, target_clock, max_rate_config.rate))
+		return MODE_CLOCK_HIGH;
+
 	/*
 	 * TODO: Even when using a 4:2:0 sink_format intel_dp_output_format()
 	 * will always choose a 4:4:4 output_format if the DFP can do the
@@ -2654,6 +2691,47 @@ intel_dp_dsc_compute_pipe_bpp_limits(struct intel_connector *connector,
 	return true;
 }
 
+static bool
+intel_dp_compute_m_n_ratio_limits(struct intel_dp *intel_dp,
+				  struct drm_connector_state *conn_state,
+				  const struct intel_crtc_state *crtc_state,
+				  struct link_config_limits *limits)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+	struct intel_connector *connector = to_intel_connector(conn_state->connector);
+	struct intel_dp_link_caps *link_caps = intel_dp->link.caps;
+	struct intel_dp_link_caps_order order =
+		intel_dp_link_caps_connector_compute_order(connector);
+	struct intel_dp_link_caps_filter new_filter = INTEL_DP_LINK_CAPS_FILTER_NONE;
+	int pixel_clock = intel_dp_mode_clock(crtc_state, conn_state);
+	struct intel_dp_link_config link_config;
+	struct intel_dp_link_caps_iter iter;
+	bool found = false;
+
+	intel_dp_link_caps_iter_start(&iter, link_caps, order, limits->link_config_filter);
+	for_each_dp_link_config(&iter, &link_config) {
+		if (!intel_dp_can_support_m_n(display, pixel_clock, link_config.rate))
+			continue;
+
+		intel_dp_link_caps_filter_add(link_caps, &new_filter, &link_config);
+		found = true;
+	}
+	intel_dp_link_caps_iter_end(&iter);
+
+	if (!found) {
+		drm_dbg_kms(display->drm,
+			    "[CONNECTOR:%d:%s] No link config with a Link M/N ratio <= %d\n",
+			    connector->base.base.id, connector->base.name,
+			    intel_dp_get_max_m_n_ratio(display));
+
+		return false;
+	}
+
+	limits->link_config_filter = new_filter;
+
+	return true;
+}
+
 bool
 intel_dp_compute_config_limits(struct intel_dp *intel_dp,
 			       struct drm_connector_state *conn_state,
@@ -2770,6 +2848,9 @@ intel_dp_compute_config_limits(struct intel_dp *intel_dp,
 		limits->link_config_filter = new_filter;
 	}
 
+	if (!intel_dp_compute_m_n_ratio_limits(intel_dp, conn_state, crtc_state, limits))
+		return false;
+
 	if (!intel_dp_test_compute_config(connector, crtc_state, limits))
 		return false;
 
-- 
2.34.1

