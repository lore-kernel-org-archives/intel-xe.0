Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C602C5AD49
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 12:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B7A10E344;
	Mon, 26 May 2025 12:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KCR7AHEP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799F910E300
 for <intel-xe@lists.freedesktop.org>; Mon, 26 May 2025 12:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748261136; x=1779797136;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OzmkxcF/NRVjyzhVDgpI2/tealFm4pIY0gzRrDQNU1I=;
 b=KCR7AHEPOdEOENry2Gv7Wy7pMKQqhulnfzqDvpRYbMs7RIXRiNIzw32V
 lYcJ4JFjDGTzoNkN5mY6rALj/HUvpFA0SPJqqRhNGFgsS9OlbU0jpP/8O
 GIPVQsp+PZqbt4rS2P+k3R9mq4f12U7xulG7om+bDRulM3B3V/bMt2Jg4
 oOhHdbOnG91o8WtUQHHGwgxqawyiTSlFnc/ab94Vt6LiGvPbGS32kV3PI
 MWhpQUCqKMEDVAXTneagjwWkA7JYzGeuNFXD4p9LOW5fLt1sJg7+iNxlC
 H5a3biuk1/nvEnQ6frGeyZYGaW4yzzDXXV+JbtLqf1UF84YPzxIaBU/ne w==;
X-CSE-ConnectionGUID: UCLxUxDLT4yRVds1ZrymOg==
X-CSE-MsgGUID: UnyUCt45Rn+DWUDlsP7YLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60492286"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="60492286"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:05:36 -0700
X-CSE-ConnectionGUID: TQvHO8sxSrWKPKENbmTZjg==
X-CSE-MsgGUID: VnYQnhVuQk2oaFsE96BeEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="147576022"
Received: from johunt-mobl9.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.245.138])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:05:35 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v4 03/12] drm/i915/psr: Read all Panel Replay capability
 registers from DPCD
Date: Mon, 26 May 2025 15:05:03 +0300
Message-ID: <20250526120512.1702815-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250526120512.1702815-1-jouni.hogander@intel.com>
References: <20250526120512.1702815-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

There are several Panel Replay capability register in DPCD. Read them
all for later use.

v2:
  - avoid using hardcoded indices
  - read all Panel Replay capability registers

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  4 +++-
 drivers/gpu/drm/i915/display/intel_psr.c      | 20 ++++++++++++-------
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index fc1eda590da8..ed4d743fc7c5 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1669,7 +1669,9 @@ struct intel_dp {
 	bool use_max_params;
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	u8 psr_dpcd[EDP_PSR_RECEIVER_CAP_SIZE];
-	u8 pr_dpcd;
+	u8 pr_dpcd[DP_PANEL_REPLAY_CAP_SIZE];
+#define INTEL_PR_DPCD_INDEX(pr_dpcd_register)	((pr_dpcd_register) - DP_PANEL_REPLAY_CAP_SUPPORT)
+
 	u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS];
 	u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE];
 	u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE];
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 0cfdeff268f9..1072549649cd 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -608,7 +608,8 @@ static void _panel_replay_init_dpcd(struct intel_dp *intel_dp)
 			return;
 		}
 
-		if (!(intel_dp->pr_dpcd & DP_PANEL_REPLAY_EARLY_TRANSPORT_SUPPORT)) {
+		if (!(intel_dp->pr_dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_SUPPORT)] &
+		      DP_PANEL_REPLAY_EARLY_TRANSPORT_SUPPORT)) {
 			drm_dbg_kms(display->drm,
 				    "Panel doesn't support early transport, eDP Panel Replay not possible\n");
 			return;
@@ -617,7 +618,8 @@ static void _panel_replay_init_dpcd(struct intel_dp *intel_dp)
 
 	intel_dp->psr.sink_panel_replay_support = true;
 
-	if (intel_dp->pr_dpcd & DP_PANEL_REPLAY_SU_SUPPORT)
+	if (intel_dp->pr_dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_SUPPORT)] &
+	    DP_PANEL_REPLAY_SU_SUPPORT)
 		intel_dp->psr.sink_panel_replay_su_support = true;
 
 	drm_dbg_kms(display->drm,
@@ -676,10 +678,12 @@ void intel_psr_init_dpcd(struct intel_dp *intel_dp)
 {
 	drm_dp_dpcd_read(&intel_dp->aux, DP_PSR_SUPPORT, intel_dp->psr_dpcd,
 			 sizeof(intel_dp->psr_dpcd));
-	drm_dp_dpcd_readb(&intel_dp->aux, DP_PANEL_REPLAY_CAP_SUPPORT,
-			  &intel_dp->pr_dpcd);
 
-	if (intel_dp->pr_dpcd & DP_PANEL_REPLAY_SUPPORT)
+	drm_dp_dpcd_read(&intel_dp->aux, DP_PANEL_REPLAY_CAP_SUPPORT,
+			 &intel_dp->pr_dpcd, sizeof(intel_dp->pr_dpcd));
+
+	if (intel_dp->pr_dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_SUPPORT)] &
+	    DP_PANEL_REPLAY_SUPPORT)
 		_panel_replay_init_dpcd(intel_dp);
 
 	if (intel_dp->psr_dpcd[0])
@@ -736,7 +740,8 @@ static bool psr2_su_region_et_valid(struct intel_dp *intel_dp, bool panel_replay
 		return false;
 
 	return panel_replay ?
-		intel_dp->pr_dpcd & DP_PANEL_REPLAY_EARLY_TRANSPORT_SUPPORT :
+		intel_dp->pr_dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_SUPPORT)] &
+		DP_PANEL_REPLAY_EARLY_TRANSPORT_SUPPORT :
 		intel_dp->psr_dpcd[0] == DP_PSR2_WITH_Y_COORD_ET_SUPPORTED &&
 		psr2_su_region_et_global_enabled(intel_dp);
 }
@@ -3916,7 +3921,8 @@ static void intel_psr_sink_capability(struct intel_dp *intel_dp,
 	seq_printf(m, ", Panel Replay = %s", str_yes_no(psr->sink_panel_replay_support));
 	seq_printf(m, ", Panel Replay Selective Update = %s",
 		   str_yes_no(psr->sink_panel_replay_su_support));
-	if (intel_dp->pr_dpcd & DP_PANEL_REPLAY_EARLY_TRANSPORT_SUPPORT)
+	if (intel_dp->pr_dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_SUPPORT)] &
+	    DP_PANEL_REPLAY_EARLY_TRANSPORT_SUPPORT)
 		seq_printf(m, " (Early Transport)");
 	seq_printf(m, "\n");
 }
-- 
2.43.0

