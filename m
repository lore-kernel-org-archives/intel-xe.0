Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EECC5AD49
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 12:05:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7648510E2E8;
	Mon, 26 May 2025 12:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jzZHmQqA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562D510E2E8
 for <intel-xe@lists.freedesktop.org>; Mon, 26 May 2025 12:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748261147; x=1779797147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qWf6hmBZtbPUBBeOQjyRSgOPuOTL00f2bYkHDLlN8sM=;
 b=jzZHmQqAbK7XVEdFGjOOiLmN39RSx1MntF8vReRp9SCWYAlA2lNil6DC
 jVxkgqILXkk8VENTWvaSRT7vurV40jhlQIOQ4OEFbpGAdMSlaIu3eep7o
 ETVvK7323peY8GKa9wEg5lW9D/J6HPhMsKkItI9GpjV6PlGAFiyoxxpEN
 ISj6kAGNa1Jo1JKcxHlRLUt54oaSwrmTt4H2WiDNoRcp+GOsXbON+0vlr
 PxgMwCVhXVOw7P6SC79Fq+coQiIVa/ofhipcm9QY9xNtG4z6J1PF975zB
 q5rWCVdBms0DL72bqGFp0181dXclzh0gnzbMLA4fzWNRRK+bdK6fT7R6K w==;
X-CSE-ConnectionGUID: pq0emNQWSz+RljXcnwCpqg==
X-CSE-MsgGUID: thMvvbTWTS2qQLXcdqTAnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60492312"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="60492312"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:05:47 -0700
X-CSE-ConnectionGUID: iEuuMWfiRFyVtDJukzNxvw==
X-CSE-MsgGUID: l0nhUn4bS3qJN/XbYFBD1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="147576134"
Received: from johunt-mobl9.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.245.138])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:05:45 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v4 10/12] drm/i915/display: Add function to configure LFPS
 sending
Date: Mon, 26 May 2025 15:05:10 +0300
Message-ID: <20250526120512.1702815-11-jouni.hogander@intel.com>
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

Add function to configre LFPS sending for Panel Replay according to link
training sequence in HAS document.

This assumes we are using AUX Less always if it's supported by the sink and
the source.

v2:
  - drop HAS reference
  - replay kerneldoc comment with a generic comment
  - check display version in intel_lnl_mac_transmit_lfps

Bspec: 68849
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cx0_phy.c | 31 ++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_cx0_phy.h |  2 ++
 drivers/gpu/drm/i915/display/intel_ddi.c     |  8 ++++-
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index 91118d115fd3..75caccb65513 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -3225,6 +3225,37 @@ void intel_mtl_pll_enable(struct intel_encoder *encoder,
 		intel_cx0pll_enable(encoder, crtc_state);
 }
 
+/*
+ * According to HAS we need to enable MAC Transmitting LFPS in the "PHY Common
+ * Control 0" PIPE register in case of AUX Less ALPM is going to be used. This
+ * function is doing that and is called by link retrain sequence.
+ */
+void intel_lnl_mac_transmit_lfps(struct intel_encoder *encoder,
+				 const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(encoder);
+	u8 owned_lane_mask = intel_cx0_get_owned_lane_mask(encoder);
+	bool enable = intel_alpm_is_alpm_aux_less(enc_to_intel_dp(encoder),
+						  crtc_state);
+	int i;
+
+	if (DISPLAY_VER(display) < 20)
+		return;
+
+	for (i = 0; i < 4; i++) {
+		int tx = i % 2 + 1;
+		u8 lane_mask = i < 2 ? INTEL_CX0_LANE0 : INTEL_CX0_LANE1;
+
+		if (!(owned_lane_mask & lane_mask))
+			continue;
+
+		intel_cx0_rmw(encoder, lane_mask, PHY_CMN1_CONTROL(tx, 0),
+			      CONTROL0_MAC_TRANSMIT_LFPS,
+			      enable ? CONTROL0_MAC_TRANSMIT_LFPS : 0,
+			      MB_WRITE_COMMITTED);
+	}
+}
+
 static u8 cx0_power_control_disable_val(struct intel_encoder *encoder)
 {
 	struct intel_display *display = to_intel_display(encoder);
diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.h b/drivers/gpu/drm/i915/display/intel_cx0_phy.h
index a8f811ca5e7b..c5a7b529955b 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.h
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.h
@@ -43,5 +43,7 @@ void intel_cx0_phy_set_signal_levels(struct intel_encoder *encoder,
 				     const struct intel_crtc_state *crtc_state);
 int intel_mtl_tbt_calc_port_clock(struct intel_encoder *encoder);
 void intel_cx0_pll_power_save_wa(struct intel_display *display);
+void intel_lnl_mac_transmit_lfps(struct intel_encoder *encoder,
+				 const struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_CX0_PHY_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index f9653fa667b7..4c845dd410a2 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3742,10 +3742,16 @@ static void mtl_ddi_prepare_link_retrain(struct intel_dp *intel_dp,
 	intel_dp->DP |= DDI_BUF_CTL_ENABLE;
 
 	/*
-	 * 6.k If AUX-Less ALPM is going to be enabled
+	 * 6.k If AUX-Less ALPM is going to be enabled:
 	 *     i. Configure PORT_ALPM_CTL and PORT_ALPM_LFPS_CTL here
 	 */
 	intel_alpm_port_configure(intel_dp, crtc_state);
+
+	/*
+	 *     ii. Enable MAC Transmits LFPS in the "PHY Common Control 0" PIPE
+	 *         register
+	 */
+	intel_lnl_mac_transmit_lfps(encoder, crtc_state);
 }
 
 static void intel_ddi_prepare_link_retrain(struct intel_dp *intel_dp,
-- 
2.43.0

