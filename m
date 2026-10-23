Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99108606A319
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 05:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UpGV/Yfp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 541EF112973;
	Fri, 23 Oct 2026 05:02:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C6F10E527;
 Fri, 23 Oct 2026 05:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792731756; x=1824267756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PvaFj4NWD7kUg6V5TtmsikqMi9nLAuPJZDrdf9jgtFs=;
 b=UpGV/YfpmwA7age9tSXSxSHFE61PYMawGTCRjZr0SwushPkfAUHsB+6x
 Bqcft+DWiQ0q4Rv3+qyw0YuUEcKG8ALI93ogIxV02q3mK/8Sxz7ESB1A9
 WAUDF5ZBjoZxU81uGJXTlpwHG8JFxci2zWpU00VjKWq84Fr3wpmWQgxE8
 Cp0WmVRQwgRNy8H2kcQuh7IRn9eN4z+H8Ot94VguyIJmTm4dceOxOP2xb
 kWvKhSbJcdKqzdmFs+2lhKkbl8si3Ay7+Qwc8vgX5Z9OQlCBfjZNH+0CV
 Mr7yZAt52yomV2X+rRexz026sCimQk6HF0iIyBPLvythHjFvhxqpqalf6 g==;
X-CSE-ConnectionGUID: do2BgCv5RHqkI7snm9WsHQ==
X-CSE-MsgGUID: Mc0xl8SeT5+y3yNDmcnZqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1499153"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1499153"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:02:36 -0700
X-CSE-ConnectionGUID: 1UOO70yVQ/yDePwiMose/w==
X-CSE-MsgGUID: AfBBreXXS7iWZ6p4CGoZ+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3926575"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa006.fm.intel.com with ESMTP; 22 Oct 2026 22:02:33 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v8 02/14] drm/i915/dp: Limit M/N ratio for DP
Date: Fri, 23 Oct 2026 10:32:15 +0530
Message-Id: <20261023050227.2068466-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023050227.2068466-1-suraj.kandpal@intel.com>
References: <20261023050227.2068466-1-suraj.kandpal@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

For MSO, intel_dp_compute_config() divides adjusted_mode->crtc_clock by
the MSO link count before computing the link M/N. The limits and
mode_valid are evaluated before that, so divide the pixel clock by the
link count there as well, otherwise the check would be too strict by
that factor. The joiner needs no such handling, as
intel_joiner_adjust_timings() only rewrites the pipe mode and leaves the
adjusted mode the link M/N is derived from untouched.

Note: MST goes through intel_dp_compute_config_limits() as well, so its
compute config is already covered here. Only pruning the modes in the
MST mode_valid is left, which is added in a subsequent commit.

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
v5:
-Drop "SST" from the subject and fix the note, MST compute is already
covered by the shared limits, only the MST mode_valid is left. (Mitul)
-Add the Bspec reference. (Mitul)
-Drop the link_n check, compute_m_n() fixes N at 0x80000 and only halves
it, so it cannot be 0. (Mitul)
-Fold in the MSO adjusted pixel clock from the M/N ratio check commit, so
this commit is correct on its own. (Mitul)
-Add intel_dp_link_m_n_ratio(), so that the M/N ratio check can share
it. (Mitul)
v6:
-Make intel_dp_mode_valid_m_n() static, only the SST mode_valid uses it.
(Mitul)

Bspec: 49266
Co-developed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c |   4 +-
 drivers/gpu/drm/i915/display/intel_display.h |   2 +
 drivers/gpu/drm/i915/display/intel_dp.c      | 117 +++++++++++++++++++
 3 files changed, 121 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 580c36a52921..f74e7ddf0e41 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2650,8 +2650,8 @@ static void compute_m_n(u32 *ret_m, u32 *ret_n,
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
index d8c0d9381471..661a863362ad 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -63,6 +63,7 @@
 #include "intel_de.h"
 #include "intel_dip.h"
 #include "intel_dip_regs.h"
+#include "intel_display.h"
 #include "intel_display_driver.h"
 #include "intel_display_jiffies.h"
 #include "intel_display_utils.h"
@@ -1267,6 +1268,47 @@ bool intel_dp_has_dsc(const struct intel_connector *connector)
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
+static int intel_dp_link_m_n_ratio(u32 link_m, u32 link_n)
+{
+	if (!link_n)
+		return 0;
+
+	return DIV_ROUND_UP(link_m, link_n);
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
+	m_n_ratio = intel_dp_link_m_n_ratio(link_m, link_n);
+
+	return m_n_ratio <= max_m_n_ratio;
+}
+
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
@@ -1302,6 +1344,33 @@ bool intel_dp_dotclk_valid(struct intel_display *display,
 	return target_clock <= effective_dotclk_limit;
 }
 
+static bool intel_dp_mode_valid_m_n(struct intel_dp *intel_dp, int pixel_clock)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+	int m_n_pixel_clock = intel_dp_mso_pixel_clock(intel_dp, pixel_clock);
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
+		if (intel_dp_can_support_m_n(display, m_n_pixel_clock,
+					     link_config.rate)) {
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
@@ -1456,6 +1525,9 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 			return status;
 	}
 
+	if (!intel_dp_mode_valid_m_n(intel_dp, target_clock))
+		return MODE_CLOCK_HIGH;
+
 	/*
 	 * TODO: Even when using a 4:2:0 sink_format intel_dp_output_format()
 	 * will always choose a 4:4:4 output_format if the DFP can do the
@@ -2656,6 +2728,48 @@ intel_dp_dsc_compute_pipe_bpp_limits(struct intel_connector *connector,
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
+	int pixel_clock = intel_dp_mso_pixel_clock(intel_dp,
+						  intel_dp_mode_clock(crtc_state, conn_state));
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
@@ -2772,6 +2886,9 @@ intel_dp_compute_config_limits(struct intel_dp *intel_dp,
 		limits->link_config_filter = new_filter;
 	}
 
+	if (!intel_dp_compute_m_n_ratio_limits(intel_dp, conn_state, crtc_state, limits))
+		return false;
+
 	if (!intel_dp_test_compute_config(connector, crtc_state, limits))
 		return false;
 
-- 
2.34.1

