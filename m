Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF02BC982C1
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 17:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5962F10F767;
	Tue, 15 Sep 2026 17:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YNCreFSC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5361010F3D7;
 Tue, 15 Sep 2026 17:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789491838; x=1821027838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7diJa4cK9ubrIEL2zOl3T3EbLgRqGTMGLyaN+q+9wPg=;
 b=YNCreFSCxkTDOuDWKPJN7P/2K4hnlDSoxdDcaHZE03YXXX5z2cktuqqc
 2NEtlPziKAThNblvsAkjP/qFrd2V99XfVc7miph1kiqb+E5jyQkyCNkjL
 bHsjjrE/Imn9Gclwv7j7P/ml3BnLgy6Pd/gmOSmL2bJ87JvQIl5Xica35
 y9BFY7wDaLOB2Qgw2fLtEV+oBjaRPKLpjPgAGOxXJPDjN1PwZSZ0VIYmZ
 QVoL22kmxzWnLWCq8kpwtxRgl4SzubBB+lVV9pZxLcMl5J9SE5DDTH9z/
 fNkyzSdEMwpysAhB3ggCEEYrZ2OIFYQTua855CfZMkEiIYYw1fZ5hYanC Q==;
X-CSE-ConnectionGUID: 4w/3KcgTQcSj/XiGKSEdgQ==
X-CSE-MsgGUID: I27pY+POShqfO20NmEo75Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="371920"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="371920"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 10:03:58 -0700
X-CSE-ConnectionGUID: zEZ6JgXHTSSowKPPlNIwLQ==
X-CSE-MsgGUID: ee64iTzLR1yzAN2K/3ceGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270443943"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 10:03:56 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v7 13/14] drm/i915/dp: Adjust SDP guardband requirement for
 CMN_SDP_TL
Date: Tue, 15 Sep 2026 22:16:54 +0530
Message-ID: <20260915164657.3429075-14-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260915164657.3429075-1-ankit.k.nautiyal@intel.com>
References: <20260915164657.3429075-1-ankit.k.nautiyal@intel.com>
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

Once CMN_SDP_TL is enabled, GMP/PPS/VSC/VSC_EXT/AS SDPs are no longer
positioned relative to the guardband: they are anchored via
CMN_SDP_TL/CMN_SDP_TL_STGR_CTL instead. As per Bspec 68921, SDP Setup is
0 in this mode, so the old per-packet guardband sizing (based on
GMP/PPS/AS-SDP being enabled) no longer applies for GMP/PPS/VSC/VSC_EXT.

Since we are using the default stagger values for now, size the guardband
such that the max default transmission line can be supported, similar to
when CMN SDP TL is not set:

base   : 2nd line of delayed vblank
GMP    : 2 + GMP_STAGGER
VSC_EXT: 2 + VSC_EXT_STAGGER
VSC    : 2
PPS    : 2 + PPS_STAGGER

SDP Setup = 1 + MAX(GMP, VSC_EXT, VSC, PPS setup lines)

Add intel_dp_get_lines_for_cmn_sdp_tl() and route it via the existing
intel_dp_get_lines_for_sdp().

The AS SDP check in intel_dp_sdp_min_guardband() still adds
vrr.vsync_start + 1 to the guardband, since AS SDP positioning is
unaffected by CMN_SDP_TL.

v2: Add VSC min SDP guardband. (Sashiko)

Bspec: 68921
Assisted-by: Copilot:claude-sonnet-4.5
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 52 ++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 018dc6303dfe..f13f17d67d5a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -62,6 +62,7 @@
 #include "intel_ddi.h"
 #include "intel_de.h"
 #include "intel_dip.h"
+#include "intel_dip_regs.h"
 #include "intel_display_driver.h"
 #include "intel_display_jiffies.h"
 #include "intel_display_utils.h"
@@ -7348,9 +7349,58 @@ int intel_dp_compute_config_late(struct intel_encoder *encoder,
 	return 0;
 }
 
+static
+int intel_dp_get_lines_for_cmn_sdp_tl(u32 type)
+{
+	u32 stagger_val;
+
+	/*
+	 * Since we are using default stagger values similar to the case
+	 * where CMN SDP TL is not set, the different SDP transmission
+	 * lines are:
+	 * base : 2nd line of delayed vblank:
+	 * GMP : 2 + GMP_STAGGER
+	 * VSC_EXT: 2 + VSC_EXT_STAGGER
+	 * VSC : 2
+	 * PPS : 2 + PPS_STAGGER
+	 *
+	 * SDP Setup = 1 + MAX(GMP, VSC_EXT, VSC, PPS setup lines)
+	 *
+	 * For EMP_AS_SDP_TL guardband should be more than vrr.vsync_start.
+	 */
+
+	switch (type) {
+	case DP_SDP_VSC_EXT_VESA:
+	case DP_SDP_VSC_EXT_CEA:
+		stagger_val = VSC_EXT_STAGGER_DEFAULT;
+		break;
+	case HDMI_PACKET_TYPE_GAMUT_METADATA:
+		stagger_val = GMP_STAGGER_DEFAULT;
+		break;
+	case DP_SDP_PPS:
+		stagger_val = PPS_STAGGER_DEFAULT;
+		break;
+	case DP_SDP_VSC:
+		stagger_val = 0;
+		break;
+	default:
+		return 0;
+	}
+
+	return 1 + 2 + stagger_val;
+}
+
 static
 int intel_dp_get_lines_for_sdp(const struct intel_crtc_state *crtc_state, u32 type)
 {
+	struct intel_display *display = to_intel_display(crtc_state);
+
+	if (type == DP_SDP_ADAPTIVE_SYNC)
+		return crtc_state->vrr.vsync_start + 1;
+
+	if (HAS_COMMON_SDP_TL(display))
+		return intel_dp_get_lines_for_cmn_sdp_tl(type);
+
 	switch (type) {
 	case DP_SDP_VSC_EXT_VESA:
 	case DP_SDP_VSC_EXT_CEA:
@@ -7361,8 +7411,6 @@ int intel_dp_get_lines_for_sdp(const struct intel_crtc_state *crtc_state, u32 ty
 		return 7;
 	case DP_SDP_VSC:
 		return 3;
-	case DP_SDP_ADAPTIVE_SYNC:
-		return crtc_state->vrr.vsync_start + 1;
 	default:
 		break;
 	}
-- 
2.50.1

