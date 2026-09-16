Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545B1C88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 09:09:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B5A10E7CD;
	Wed, 16 Sep 2026 09:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VxCQamAL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA9410E7CD;
 Wed, 16 Sep 2026 09:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789549795; x=1821085795;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jNU8xvPuubv2pn4pBIAMksokuumnhIclaD2tkav/V1I=;
 b=VxCQamALV8EjYR7nqoBbwxK1zp9smxhBY/ucevMkwA3fpcTGeDZcBvh+
 FtIAKAVDizSPb9tWeJ9/BI8qFjnG1zyDtvgYMULMTxr7+KioAWR8jkiNY
 Wpck9kJX006wtGKeiVImx2EbWj+KYsIDIazpJR0jIixUcCiCibvxEYE9U
 0OKNYnDLlyVdyEBRPR8cklQ0zQB8rI5w2bWA9xF3RUnc/dK6xHOH/yDG4
 YH73tBZuginlgfmypI0JK9wBdjpJNfRGtFOBwyHxLnE5CbWqr9zHfxf0p
 YIpUCt9dJaptSEPACtqO9tWiThdG2NuSLAi9vraShn54uL08gxQLbMctD A==;
X-CSE-ConnectionGUID: POXWcYTyQx+F+MMfGaXr2Q==
X-CSE-MsgGUID: zfIRMfUkRwqlwcShym+qew==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88858858"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="88858858"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 02:09:54 -0700
X-CSE-ConnectionGUID: HfNYL5LaQOaRxSAhnMEDtw==
X-CSE-MsgGUID: 9d8PMMojSVex5yb9UBK7Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="277030182"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa004.jf.intel.com with ESMTP; 16 Sep 2026 02:09:54 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 02/10] drm/i915/dp: Limit M/N ratio for DP SST
Date: Wed, 16 Sep 2026 14:39:38 +0530
Message-Id: <20260916090946.677564-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260916090946.677564-1-suraj.kandpal@intel.com>
References: <20260916090946.677564-1-suraj.kandpal@intel.com>
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
fails early rather than deep inside link config selection.

Also prune such modes in mode_valid. Note the ratio is the pixel clock
over the link symbol clock, and the symbol clock is not monotonic in the
link rate: it is the rate divided by 32 for 128b/132b but only by 10 for
8b/10b, so e.g. HBR3 has a higher symbol clock than UHBR20. There is
therefore no single best link rate to evaluate against, and mode_valid
walks the link configurations instead, only rejecting the mode if none
of them can satisfy the ratio.

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
-Walk the link configurations in mode_valid rather than evaluating the
ratio at the highest link rate, which is not the best case for it.
v4:
-Add iterator for all dp configs in intel_dp_mode_valid_m_n() so
that we do not prune any mode that could have been supported (Sashiko)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c |   4 +-
 drivers/gpu/drm/i915/display/intel_display.h |   2 +
 drivers/gpu/drm/i915/display/intel_dp.c      | 101 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.h      |   2 +
 4 files changed, 107 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index f04a6f97e05a..c53163d7c082 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2641,8 +2641,8 @@ static void compute_m_n(u32 *ret_m, u32 *ret_n,
 	intel_reduce_m_n_ratio(ret_m, ret_n);
 }
 
-static void intel_display_compute_link_m_n(u32 *link_m, u32 *link_n,
-					   int pixel_clock, int link_symbol_clock)
+void intel_display_compute_link_m_n(u32 *link_m, u32 *link_n,
+				    int pixel_clock, int link_symbol_clock)
 {
 	compute_m_n(link_m, link_n,
 		    pixel_clock, link_symbol_clock,
diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index eecafff167d3..404168f4213b 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -523,5 +523,7 @@ bool assert_port_valid(struct intel_display *display, enum port port);
 
 bool intel_scanout_needs_vtd_wa(struct intel_display *display);
 int intel_crtc_num_joined_pipes(const struct intel_crtc_state *crtc_state);
+void intel_display_compute_link_m_n(u32 *link_m, u32 *link_n,
+				    int pixel_clock, int link_symbol_clock);
 
 #endif
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0cd5e6b5034c..f6a2152c4432 100644
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
+	intel_display_compute_link_m_n(&link_m, &link_n, pixel_clock,
+				       intel_dp_link_symbol_clock(link_rate));
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
@@ -1300,6 +1329,31 @@ bool intel_dp_dotclk_valid(struct intel_display *display,
 	return target_clock <= effective_dotclk_limit;
 }
 
+bool intel_dp_mode_valid_m_n(struct intel_dp *intel_dp, int pixel_clock)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+	struct intel_dp_link_caps_order order = {
+		.key = INTEL_DP_LINK_CAPS_ORDER_KEY_RATE_LANE,
+		.dir = INTEL_DP_LINK_CAPS_ORDER_DIR_DESC,
+	};
+	struct intel_dp_link_config link_config;
+	struct intel_dp_link_caps_iter iter;
+	bool found = false;
+
+	intel_dp_link_caps_iter_start(&iter, intel_dp->link.caps, order,
+				      INTEL_DP_LINK_CAPS_FILTER_ALL);
+	for_each_dp_link_config(&iter, &link_config) {
+		if (intel_dp_can_support_m_n(display, pixel_clock, link_config.rate)) {
+			found = true;
+
+			break;
+		}
+	}
+	intel_dp_link_caps_iter_end(&iter);
+
+	return found;
+}
+
 static enum drm_mode_status
 intel_dp_mode_valid_format(struct intel_connector *connector,
 			   const struct drm_display_mode *mode,
@@ -1454,6 +1508,9 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 			return status;
 	}
 
+	if (!intel_dp_mode_valid_m_n(intel_dp, target_clock))
+		return MODE_CLOCK_HIGH;
+
 	/*
 	 * TODO: Even when using a 4:2:0 sink_format intel_dp_output_format()
 	 * will always choose a 4:4:4 output_format if the DFP can do the
@@ -2654,6 +2711,47 @@ intel_dp_dsc_compute_pipe_bpp_limits(struct intel_connector *connector,
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
@@ -2770,6 +2868,9 @@ intel_dp_compute_config_limits(struct intel_dp *intel_dp,
 		limits->link_config_filter = new_filter;
 	}
 
+	if (!intel_dp_compute_m_n_ratio_limits(intel_dp, conn_state, crtc_state, limits))
+		return false;
+
 	if (!intel_dp_test_compute_config(connector, crtc_state, limits))
 		return false;
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 04fae203bb69..aa58833a405b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -239,6 +239,8 @@ bool intel_dp_joiner_candidate_valid(struct intel_connector *connector,
 
 u8 intel_dp_as_sdp_transmission_time(void);
 
+bool intel_dp_mode_valid_m_n(struct intel_dp *intel_dp, int pixel_clock);
+
 int intel_dp_link_init(struct intel_dp *intel_dp);
 void intel_dp_link_cleanup(struct intel_dp *intel_dp);
 
-- 
2.34.1

