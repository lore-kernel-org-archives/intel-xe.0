Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB9AF3092A
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 10:01:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA5510EBFC;
	Thu,  5 Mar 2026 10:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="koKM0Gk5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C1710EBF2;
 Thu,  5 Mar 2026 10:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772704891; x=1804240891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7VckB54ll4MThF2ZTS+u3csShpaBdqlYwa5oYOM8Jew=;
 b=koKM0Gk5xQOOZY3tJkv9BQrf0rV5lhwQ0avd4DokRPxXbse1tPJRuW5F
 gK29TL0ytQC1+zcc+By2tDz7n3OtDno5uRhBGnObO0RCVz1LT9Hnw7ECw
 z8CtIA4p3Qof13dP3Cn2W7AMwHvhuuPBPbpXtS57P2H8RLHxXavbfXxfq
 tucR6hnK0SlJRIaQW3jy0wftRBbVaFvFwQpwj5QBhz6Jmc75DQxSLndZB
 xEf5w39Z+FifIGVfisM5+5SDNX2gKyNya/yxnPc0M3t6RbT+ue98IqweL
 zU+ekIyK5lHZmgIn9erWwLnUPx+N45diZo0NPe9YENS6Jmjwf1PfnFos+ g==;
X-CSE-ConnectionGUID: kFDyG/YPQRCy5RA9b2/mcg==
X-CSE-MsgGUID: QJwHvPjGTCiLr16xtgVV1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73758098"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="73758098"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:01:30 -0800
X-CSE-ConnectionGUID: moEDuyG7S02QBmLBnRzdjw==
X-CSE-MsgGUID: 27eC7bJIRzmiR3Q89df3qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="215460282"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.57])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:01:28 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	suraj.kandpal@intel.com
Subject: [PATCH v5 09/16] drm/i915/display: convert W/As in intel_dp_mst.c to
 new framework
Date: Thu,  5 Mar 2026 11:59:12 +0200
Message-ID: <20260305100100.332956-10-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260305100100.332956-1-luciano.coelho@intel.com>
References: <20260305100100.332956-1-luciano.coelho@intel.com>
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

Convert the low-hanging fruits of workaround checks to the workaround
framework.  Instead of having display structure checks for the
workarounds all over, concentrate the checks in intel_display_wa.c.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_wa.c | 2 ++
 drivers/gpu/drm/i915/display/intel_display_wa.h | 1 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c     | 3 ++-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index 2934331d905f..be37a23edce4 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -94,6 +94,8 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 	case INTEL_DISPLAY_WA_14011765242:
 		return display->platform.alderlake_s &&
 			IS_DISPLAY_STEP(display, STEP_A0, STEP_A2);
+	case INTEL_DISPLAY_WA_14014143976:
+		return IS_DISPLAY_STEP(display, STEP_E0, STEP_FOREVER);
 	case INTEL_DISPLAY_WA_14020863754:
 		return DISPLAY_VERx100(display) == 3000 ||
 			DISPLAY_VERx100(display) == 2000 ||
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index b781a3c6d803..dc1a187fd0a1 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -36,6 +36,7 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_14011503117,
 	INTEL_DISPLAY_WA_14011508470,
 	INTEL_DISPLAY_WA_14011765242,
+	INTEL_DISPLAY_WA_14014143976,
 	INTEL_DISPLAY_WA_14020863754,
 	INTEL_DISPLAY_WA_14025769978,
 	INTEL_DISPLAY_WA_15013987218,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 0bb39f9bd74e..887b6de14e46 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -43,6 +43,7 @@
 #include "intel_display_regs.h"
 #include "intel_display_types.h"
 #include "intel_display_utils.h"
+#include "intel_display_wa.h"
 #include "intel_dp.h"
 #include "intel_dp_hdcp.h"
 #include "intel_dp_link_training.h"
@@ -1276,7 +1277,7 @@ static void enable_bs_jitter_was(const struct intel_crtc_state *crtc_state)
 		set |= DP_MST_FEC_BS_JITTER_WA(crtc_state->cpu_transcoder);
 
 	/* Wa_14014143976:adlp */
-	if (IS_DISPLAY_STEP(display, STEP_E0, STEP_FOREVER)) {
+	if (intel_display_wa(display, INTEL_DISPLAY_WA_14014143976)) {
 		if (intel_dp_is_uhbr(crtc_state))
 			set |= DP_MST_SHORT_HBLANK_WA(crtc_state->cpu_transcoder);
 		else if (crtc_state->fec_enable)
-- 
2.51.0

