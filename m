Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01853C88E66
	for <intel-xe@archiver.kernel.org>; Sun, 13 Sep 2026 15:13:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4EE10E94D;
	Sun, 13 Sep 2026 15:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WSbzQp8N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC33A10E94E;
 Sun, 13 Sep 2026 15:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789312424; x=1820848424;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2RKMTlQQgRMXf3+HFd6v3oj9MKo8X37CnAKR3bMVCKc=;
 b=WSbzQp8N9NvIcj8VBIezxUN7RlW4vVOULgD6ncF4EUSyVbDTDvTioH35
 09Zjsa8IuusTtuwZzDYA8ZPtmC8ABnbtbv6SPVPoJrjtzAWgiIsjTzdYq
 kIcSFSob+OXwPh2qtQuAOdzSipMujcSEGvbx0GqJ7PlfBPutbUoo5CxTK
 l7nM2kVvSpVha7Qm/Os23g3BzWjH/Y+WbQeMmd6tbhi1gaf+6xIsRulIx
 wLPia38ZKyygQeqrSL+mEaRhIO8Zlmeel4gPKEPd4k92pkeqcEmdMTE5+
 7y5osgS+ddmGZQutVLpsOOg1qtqcDN+RjIROSgM63kFh/LPciETXU++RA Q==;
X-CSE-ConnectionGUID: ngT5TmCvR4ialYMTHFTG8Q==
X-CSE-MsgGUID: WjittuXmQ1WjjofI4jBkCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="93388782"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; d="scan'208";a="93388782"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2026 08:13:44 -0700
X-CSE-ConnectionGUID: X+Ss9W0OT3OehF1lRAgGRQ==
X-CSE-MsgGUID: g+j17JO7R+aPZ39HJ9EBSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; d="scan'208";a="310694190"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2026 08:13:42 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v6 12/13] drm/i915/dp: Adjust SDP guardband requirement for
 CMN_SDP_TL
Date: Sun, 13 Sep 2026 20:26:47 +0530
Message-ID: <20260913145649.3240904-13-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
References: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
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

Bspec: 68921
Assisted-by: Copilot:claude-sonnet-4.5
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 49 ++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 8c3a324e164e..02e73ae9e34a 100644
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
@@ -7348,9 +7349,55 @@ int intel_dp_compute_config_late(struct intel_encoder *encoder,
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
@@ -7359,8 +7406,6 @@ int intel_dp_get_lines_for_sdp(const struct intel_crtc_state *crtc_state, u32 ty
 		return 8;
 	case DP_SDP_PPS:
 		return 7;
-	case DP_SDP_ADAPTIVE_SYNC:
-		return crtc_state->vrr.vsync_start + 1;
 	default:
 		break;
 	}
-- 
2.50.1

