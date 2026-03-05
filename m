Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3142F30946
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 12:50:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92BD710EB53;
	Thu,  5 Mar 2026 12:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O2/ErUc4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DBE010EB6B;
 Thu,  5 Mar 2026 12:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772715005; x=1804251005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WE/8KnaBczlOtS0A1jXOdJXGvlvVyVHWAs3Lb2ljmvM=;
 b=O2/ErUc4PJC6vKqNHDAL+vosU0oz7PzXXrkj9pPLsT5h1pQxltocw7uR
 3IXibN1lxDEve1A9XnU8B5nW0ZlWbzZChpE/vTFO4n8KsBR4jD8Dowein
 8UeV9EghyFTlUpDKO0zwf8FzYTGiqOTFQ5ilvIZECrkkvFcvKN8jJQzbZ
 ENNXoF8wKKz+iYtPT4O+OINy719HRVUyd7p1uRGDATZ0DEKdYhiBaAflY
 uzSXVOm1JEKvQMOymXI3SHOSA56agV6g3qtMiGh/5L/Y7E87twFhlgQ7E
 J/iAYJngmfnRu2o4p2PVPtw4BmQo4F8xmvZSexedxiKiya5OeSmKk5sSG A==;
X-CSE-ConnectionGUID: l4nPvHfWQxG/ser21v6JFg==
X-CSE-MsgGUID: oBGFaUwOSo2HZYioErVE4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73706865"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="73706865"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 04:50:05 -0800
X-CSE-ConnectionGUID: KEct3YAiQNiAdWcUlj8ZUQ==
X-CSE-MsgGUID: DDMeCq6TSDCY68bQDGLtNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="215483438"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa006.fm.intel.com with ESMTP; 05 Mar 2026 04:50:02 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, jani.nikula@intel.com,
 Animesh Manna <animesh.manna@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v6 1/2] drm/i915/display: Panel Replay BW optimization for
 DP2.0 tunneling
Date: Thu,  5 Mar 2026 17:50:10 +0530
Message-Id: <20260305122011.3297262-2-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260305122011.3297262-1-animesh.manna@intel.com>
References: <20260305122011.3297262-1-animesh.manna@intel.com>
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

Unused bandwidth can be used by external display agents for Panel Replay
enabled DP panel during idleness with link on. Enable source to replace
dummy data from the display with data from another agent by programming
TRANS_DP2_CTL [Panel Replay Tunneling Enable].

v2:
- Enable pr bw optimization along with panel replay enable. [Jani]

v3:
- Write TRANS_DP2_CTL once for both bw optimization and panel replay
enable. [Jani]

v4:
- Read DPCD once in init() and store in panel_replay_caps. [Jouni]

v5:
- Avoid reading DPCD for edp. [Jouni]
- Use drm_dp_dpcd_read_byte() and some cosmetic changes. [Jani]

Bspec: 68920
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 .../gpu/drm/i915/display/intel_display_regs.h |  1 +
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       |  1 +
 drivers/gpu/drm/i915/display/intel_psr.c      | 35 +++++++++++++++++--
 4 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 5838338f495a..0a641daf22c6 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -2269,6 +2269,7 @@
 #define TRANS_DP2_CTL(trans)			_MMIO_TRANS(trans, _TRANS_DP2_CTL_A, _TRANS_DP2_CTL_B)
 #define  TRANS_DP2_128B132B_CHANNEL_CODING	REG_BIT(31)
 #define  TRANS_DP2_PANEL_REPLAY_ENABLE		REG_BIT(30)
+#define  TRANS_DP2_PR_TUNNELING_ENABLE		REG_BIT(26)
 #define  TRANS_DP2_DEBUG_ENABLE			REG_BIT(23)
 
 #define _TRANS_DP2_VFREQHIGH_A			0x600a4
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 7adfb4169e25..a291665808cc 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -576,6 +576,7 @@ struct intel_connector {
 
 			bool support;
 			bool su_support;
+			bool optimization_support;
 			enum intel_panel_replay_dsc_support dsc_support;
 
 			u16 su_w_granularity;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index fcf478fbf8cd..7758213c070e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6250,6 +6250,7 @@ intel_dp_detect(struct drm_connector *_connector,
 		intel_dp->psr.sink_panel_replay_support = false;
 		connector->dp.panel_replay_caps.support = false;
 		connector->dp.panel_replay_caps.su_support = false;
+		connector->dp.panel_replay_caps.optimization_support = false;
 		connector->dp.panel_replay_caps.dsc_support =
 			INTEL_DP_PANEL_REPLAY_DSC_NOT_SUPPORTED;
 
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 5bea2eda744b..27ba96ede8e2 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -43,6 +43,7 @@
 #include "intel_dmc.h"
 #include "intel_dp.h"
 #include "intel_dp_aux.h"
+#include "intel_dp_tunnel.h"
 #include "intel_dsb.h"
 #include "intel_frontbuffer.h"
 #include "intel_hdmi.h"
@@ -603,6 +604,7 @@ static void _panel_replay_init_dpcd(struct intel_dp *intel_dp, struct intel_conn
 {
 	struct intel_display *display = to_intel_display(intel_dp);
 	int ret;
+	u8 val;
 
 	/* TODO: Enable Panel Replay on MST once it's properly implemented. */
 	if (intel_dp->mst_detect == DRM_DP_MST)
@@ -650,6 +652,15 @@ static void _panel_replay_init_dpcd(struct intel_dp *intel_dp, struct intel_conn
 		    connector->dp.panel_replay_caps.su_support ?
 		    "selective_update " : "",
 		    panel_replay_dsc_support_str(connector->dp.panel_replay_caps.dsc_support));
+
+	if (intel_dp_is_edp(intel_dp))
+		return;
+
+	/* Rest is for DP only */
+
+	drm_dp_dpcd_read_byte(&intel_dp->aux, DP_TUNNELING_CAPABILITIES, &val);
+	connector->dp.panel_replay_caps.optimization_support = val &
+		DP_PANEL_REPLAY_OPTIMIZATION_SUPPORT;
 }
 
 static void _psr_init_dpcd(struct intel_dp *intel_dp, struct intel_connector *connector)
@@ -1022,11 +1033,29 @@ static u8 frames_before_su_entry(struct intel_dp *intel_dp)
 	return frames_before_su_entry;
 }
 
+static bool intel_psr_allow_pr_bw_optimization(struct intel_dp *intel_dp)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+	struct intel_connector *connector = intel_dp->attached_connector;
+
+	if (DISPLAY_VER(display) < 35)
+		return false;
+
+	if (!intel_dp_tunnel_bw_alloc_is_enabled(intel_dp))
+		return false;
+
+	if (!connector->dp.panel_replay_caps.optimization_support)
+		return false;
+
+	return true;
+}
+
 static void dg2_activate_panel_replay(struct intel_dp *intel_dp)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
 	struct intel_psr *psr = &intel_dp->psr;
 	enum transcoder cpu_transcoder = intel_dp->psr.transcoder;
+	u32 dp2_ctl_val = TRANS_DP2_PANEL_REPLAY_ENABLE;
 
 	if (intel_dp_is_edp(intel_dp) && psr->sel_update_enabled) {
 		u32 val = psr->su_region_et_enabled ?
@@ -1039,12 +1068,14 @@ static void dg2_activate_panel_replay(struct intel_dp *intel_dp)
 			       val);
 	}
 
+	if (!intel_dp_is_edp(intel_dp) && intel_psr_allow_pr_bw_optimization(intel_dp))
+		dp2_ctl_val |= TRANS_DP2_PR_TUNNELING_ENABLE;
+
 	intel_de_rmw(display,
 		     PSR2_MAN_TRK_CTL(display, intel_dp->psr.transcoder),
 		     0, ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME);
 
-	intel_de_rmw(display, TRANS_DP2_CTL(intel_dp->psr.transcoder), 0,
-		     TRANS_DP2_PANEL_REPLAY_ENABLE);
+	intel_de_rmw(display, TRANS_DP2_CTL(intel_dp->psr.transcoder), 0, dp2_ctl_val);
 }
 
 static void hsw_activate_psr2(struct intel_dp *intel_dp)
-- 
2.29.0

