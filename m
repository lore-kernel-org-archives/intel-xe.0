Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9D5606A323
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 06:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qp2zYNyZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F9A112009;
	Thu, 26 Nov 2026 06:35:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BEE410FCFF;
 Thu, 26 Nov 2026 06:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795674925; x=1827210925;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7rBn5ZXu70lFWf996LyfnfdK2ooBUcA86xP0PCnagV0=;
 b=Qp2zYNyZuSQkyzPzqFGQq6dUB3CFBqFBIroYNFVH2vkDkckz8/9xPgL/
 b3CSCqPkYLlMsYeQKnyQ0e1C99GLylsBDRvDea10M9gTIuSWqLLdmdmzG
 xsWcMkiudHazcc/SMH7WD5VcsLdItwInmtgolfZrboNo1Tn4V91m05rOs
 pfBfeSKZDHwfOUK75TobDDsvo1cZAti9op/P87jD1wSfOCXij6Fsq9rNI
 AI0wR0IGN6bckhtiq0m1J355STBlj9MAuxmd59oKb6kUIB5cR09PWdNPW
 jlA4vgzWbSNEmQO+6lZhGDyJEL0QNav7reSOgPnneaoITtL61Di7kbTN2 A==;
X-CSE-ConnectionGUID: hUG5fNJdS4KfSYDadTxMiQ==
X-CSE-MsgGUID: 4fUy471RQtu0XPlkPRsr9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4462668"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4462668"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 22:35:24 -0800
X-CSE-ConnectionGUID: ixqledGQQ8KzuHLtsP9Pbg==
X-CSE-MsgGUID: mKUdb7SlRl+76XXj7reULA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12346776"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2026 22:35:23 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 09/15] drm/i915/pipelock: Compute pipelock groups for DP tiled
 displays
Date: Thu, 26 Nov 2026 12:04:53 +0530
Message-Id: <20261126063459.863698-10-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126063459.863698-1-suraj.kandpal@intel.com>
References: <20261126063459.863698-1-suraj.kandpal@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=a
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Port sync has been off on NVL since it was defeatured, so the tiles of
a tiled DP display run unsynchronized there. Use pipelock to sync them
instead.

On top of the port sync checks, pipelock needs the tiles to have the
same PLL, bpp, set context latency, VRR timings and guardband, and the
same SDPs. DP to HDMI protocol converters can't be locked, as they
retime the signal. The timing generator start delay is computed from
the link M/N ratio, plus the MTP slots left unused for 128b/132b. If
the delay doesn't fit in a line, fall back to syncing just once, which
is only allowed when the refresh rate can't change.

Also make sure a CRTC only computes a sync group it's part of, so that
a tile that can't be locked doesn't end up as a secondary.

Bspec: 68938, 73521
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c      | 15 ++-
 drivers/gpu/drm/i915/display/intel_pipelock.c | 91 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_pipelock.h |  6 ++
 3 files changed, 111 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 54c4f90cdfea..f6352e9ece6e 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -79,6 +79,7 @@
 #include "intel_modeset_lock.h"
 #include "intel_panel.h"
 #include "intel_pfit.h"
+#include "intel_pipelock.h"
 #include "intel_pps.h"
 #include "intel_psr.h"
 #include "intel_quirks.h"
@@ -4670,7 +4671,7 @@ intel_ddi_port_sync_transcoders(const struct intel_crtc_state *ref_crtc_state,
 	 * From, xe3lpd onwards we have defeatured this with reference to
 	 * Wa_16024710867
 	 */
-	if (!IS_DISPLAY_VER(display, 9, 30))
+	if (!IS_DISPLAY_VER(display, 9, 30) && !HAS_PIPELOCK(display))
 		return 0;
 
 	if (!intel_crtc_has_type(ref_crtc_state, INTEL_OUTPUT_DP))
@@ -4692,9 +4693,18 @@ intel_ddi_port_sync_transcoders(const struct intel_crtc_state *ref_crtc_state,
 		if (!crtcs_port_sync_compatible(ref_crtc_state,
 						crtc_state))
 			continue;
+
+		if (HAS_PIPELOCK(display) &&
+		    (!intel_pipelock_possible(crtc_state, to_intel_connector(connector)) ||
+		     !intel_pipelock_compatible(ref_crtc_state, crtc_state)))
+			continue;
+
 		transcoders |= BIT(crtc_state->cpu_transcoder);
 	}
 
+	if (!(transcoders & BIT(ref_crtc_state->cpu_transcoder)))
+		return 0;
+
 	return transcoders;
 }
 
@@ -4737,6 +4747,9 @@ static int intel_ddi_compute_config_late(struct intel_atomic_state *state,
 			~REG_BIT(crtc_state->cpu_transcoder);
 	}
 
+	if (HAS_PIPELOCK(display))
+		intel_pipelock_compute_config(crtc_state);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_pipelock.c b/drivers/gpu/drm/i915/display/intel_pipelock.c
index 67c643b6626c..23b6db074385 100644
--- a/drivers/gpu/drm/i915/display/intel_pipelock.c
+++ b/drivers/gpu/drm/i915/display/intel_pipelock.c
@@ -3,9 +3,20 @@
  * Copyright © 2026 Intel Corporation
  */
 
+#include <linux/math64.h>
+
+#include <drm/display/drm_dp_helper.h>
+#include <drm/drm_print.h>
+
 #include "intel_display_core.h"
 #include "intel_display_types.h"
+#include "intel_dp.h"
+#include "intel_dpll_mgr.h"
 #include "intel_pipelock.h"
+#include "intel_vrr.h"
+
+#define PIPELOCK_CLOCK_CROSSING_DELAY	8
+#define MTP_TIME_SLOTS			64
 
 bool intel_pipelock_connector_possible(const struct intel_connector *connector)
 {
@@ -15,3 +26,83 @@ bool intel_pipelock_connector_possible(const struct intel_connector *connector)
 		connector->base.connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
 		!connector->mst.dp;
 }
+
+static int pipelock_tg_start_delay(const struct intel_crtc_state *crtc_state)
+{
+	const struct intel_link_m_n *m_n = &crtc_state->dp_m_n;
+	int delay = PIPELOCK_CLOCK_CROSSING_DELAY;
+
+	delay += DIV_ROUND_UP(m_n->link_n, m_n->link_m);
+
+	if (intel_dp_is_uhbr(crtc_state))
+		delay += MTP_TIME_SLOTS - m_n->tu;
+
+	return delay;
+}
+
+static int pipelock_line_time(const struct intel_crtc_state *crtc_state)
+{
+	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
+	int symbol_clock = intel_dp_link_symbol_clock(crtc_state->port_clock);
+
+	return div_u64(mul_u32_u32(adjusted_mode->crtc_htotal, symbol_clock),
+		       adjusted_mode->crtc_clock);
+}
+
+static bool pipelock_per_frame_sync(const struct intel_crtc_state *crtc_state)
+{
+	return pipelock_tg_start_delay(crtc_state) < pipelock_line_time(crtc_state);
+}
+
+bool intel_pipelock_possible(const struct intel_crtc_state *crtc_state,
+			     struct intel_connector *connector)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_dp *intel_dp = intel_attached_dp(connector);
+
+	if (!intel_pipelock_connector_possible(connector))
+		return false;
+
+	if (drm_dp_is_branch(intel_dp->dpcd) && intel_dp_has_hdmi_sink(intel_dp)) {
+		drm_dbg_kms(display->drm,
+			    "[CONNECTOR:%d:%s] No pipelock behind an HDMI converter\n",
+			    connector->base.base.id, connector->base.name);
+		return false;
+	}
+
+	if (!pipelock_per_frame_sync(crtc_state) &&
+	    (!intel_vrr_is_fixed_rr(crtc_state) || crtc_state->vrr.in_range)) {
+		drm_dbg_kms(display->drm,
+			    "[CONNECTOR:%d:%s] No pipelock, start delay too long for VRR\n",
+			    connector->base.base.id, connector->base.name);
+		return false;
+	}
+
+	return true;
+}
+
+bool intel_pipelock_compatible(const struct intel_crtc_state *crtc_state1,
+			       const struct intel_crtc_state *crtc_state2)
+{
+	struct intel_display *display = to_intel_display(crtc_state1);
+
+	return crtc_state1->pipe_bpp == crtc_state2->pipe_bpp &&
+		crtc_state1->set_context_latency == crtc_state2->set_context_latency &&
+		crtc_state1->vrr.enable == crtc_state2->vrr.enable &&
+		crtc_state1->vrr.vmin == crtc_state2->vrr.vmin &&
+		crtc_state1->vrr.vmax == crtc_state2->vrr.vmax &&
+		crtc_state1->vrr.flipline == crtc_state2->vrr.flipline &&
+		crtc_state1->vrr.guardband == crtc_state2->vrr.guardband &&
+		crtc_state1->infoframes.enable == crtc_state2->infoframes.enable &&
+		intel_dpll_compare_hw_state(display, &crtc_state1->dpll_hw_state,
+					    &crtc_state2->dpll_hw_state);
+}
+
+void intel_pipelock_compute_config(struct intel_crtc_state *crtc_state)
+{
+	if (crtc_state->sync_primary_transcoder == INVALID_TRANSCODER)
+		return;
+
+	crtc_state->pipelock.tg_start_delay = pipelock_tg_start_delay(crtc_state);
+	crtc_state->pipelock.per_frame_sync = pipelock_per_frame_sync(crtc_state);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_pipelock.h b/drivers/gpu/drm/i915/display/intel_pipelock.h
index b08b10f8da34..b75efa71a831 100644
--- a/drivers/gpu/drm/i915/display/intel_pipelock.h
+++ b/drivers/gpu/drm/i915/display/intel_pipelock.h
@@ -9,7 +9,13 @@
 #include <linux/types.h>
 
 struct intel_connector;
+struct intel_crtc_state;
 
 bool intel_pipelock_connector_possible(const struct intel_connector *connector);
+bool intel_pipelock_possible(const struct intel_crtc_state *crtc_state,
+			     struct intel_connector *connector);
+bool intel_pipelock_compatible(const struct intel_crtc_state *crtc_state1,
+			       const struct intel_crtc_state *crtc_state2);
+void intel_pipelock_compute_config(struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_PIPELOCK_H__ */
-- 
2.34.1

