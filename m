Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F47F30922
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 10:01:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4DA10EBED;
	Thu,  5 Mar 2026 10:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fgcSXnZ0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824EE10EBEB;
 Thu,  5 Mar 2026 10:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772704877; x=1804240877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/cOtuolsD/w85xfbDKhxlzpjuC8C0Y+ffRXPAfwygSU=;
 b=fgcSXnZ01J30JzHrPWs/alCctPMqrNvnsm0n1QsSXog91aR582W/R3XR
 BlqBwwXPXx8OA8jwatM0wTXKLMSBUqpY1jVz1/rNwMMPCM1kkV3NenXJB
 k+JagEzoBLingW7jxZIoeHrJga8ErQ7KdinIbo/PdriII7tqkQD/c0RVv
 4R91gzLRVcp5pGfsVf1Wa4cQuOc7iPiSRrucSroZ2wVovp0VVcu9b4g3Y
 FCkNputy01CMGbG0vUxiWC62EhTyh49zd2YfMAintrtczf5OZmi+BzJOI
 +ZRkKWWriM7e0plO8fyK5cr7iJQr1PNka8f8+3ChGCe1icVa4OhPRY6DC g==;
X-CSE-ConnectionGUID: sW2iLDZ9SUqMqqBkcxOQFQ==
X-CSE-MsgGUID: UMzprfKEQvOHKA5HaH9hsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73758075"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="73758075"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:01:17 -0800
X-CSE-ConnectionGUID: pzdToreRQSKPEnAgDTlT2A==
X-CSE-MsgGUID: Eoqi3aKyRPCZe7DHhSEYnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="215460228"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.57])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:01:14 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	suraj.kandpal@intel.com
Subject: [PATCH v5 02/16] drm/i915/display: convert audio workaround to new
 framework
Date: Thu,  5 Mar 2026 11:59:05 +0200
Message-ID: <20260305100100.332956-3-luciano.coelho@intel.com>
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
 drivers/gpu/drm/i915/display/intel_audio.c    | 24 +++++++++----------
 .../gpu/drm/i915/display/intel_display_wa.c   |  4 ++++
 .../gpu/drm/i915/display/intel_display_wa.h   |  1 +
 3 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index 5f3c175afdd2..081627e0d917 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -37,6 +37,7 @@
 #include "intel_crtc.h"
 #include "intel_de.h"
 #include "intel_display_types.h"
+#include "intel_display_wa.h"
 #include "intel_lpe_audio.h"
 
 /**
@@ -184,17 +185,6 @@ static const struct hdmi_aud_ncts hdmi_aud_ncts_36bpp[] = {
 	{ 192000, TMDS_445_5M, 20480, 371250 },
 };
 
-/*
- * WA_14020863754: Implement Audio Workaround
- * Corner case with Min Hblank Fix can cause audio hang
- */
-static bool needs_wa_14020863754(struct intel_display *display)
-{
-	return DISPLAY_VERx100(display) == 3000 ||
-		DISPLAY_VERx100(display) == 2000 ||
-		DISPLAY_VERx100(display) == 1401;
-}
-
 /* get AUD_CONFIG_PIXEL_CLOCK_HDMI_* value for mode */
 static u32 audio_config_hdmi_pixel_clock(const struct intel_crtc_state *crtc_state)
 {
@@ -440,7 +430,11 @@ static void hsw_audio_codec_disable(struct intel_encoder *encoder,
 	intel_de_rmw(display, HSW_AUD_PIN_ELD_CP_VLD,
 		     AUDIO_OUTPUT_ENABLE(cpu_transcoder), 0);
 
-	if (needs_wa_14020863754(display))
+	/*
+	 * WA_14020863754: Implement Audio Workaround
+	 * Corner case with Min Hblank Fix can cause audio hang
+	 */
+	if (intel_display_wa(display, INTEL_DISPLAY_WA_14020863754))
 		intel_de_rmw(display, AUD_CHICKENBIT_REG3, DACBE_DISABLE_MIN_HBLANK_FIX, 0);
 
 	intel_audio_sdp_split_update(old_crtc_state, false);
@@ -572,7 +566,11 @@ static void hsw_audio_codec_enable(struct intel_encoder *encoder,
 
 	intel_audio_sdp_split_update(crtc_state, true);
 
-	if (needs_wa_14020863754(display))
+	/*
+	 * WA_14020863754: Implement Audio Workaround
+	 * Corner case with Min Hblank Fix can cause audio hang
+	 */
+	if (intel_display_wa(display, INTEL_DISPLAY_WA_14020863754))
 		intel_de_rmw(display, AUD_CHICKENBIT_REG3, 0, DACBE_DISABLE_MIN_HBLANK_FIX);
 
 	/* Enable audio presence detect */
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index 1d8340b36c01..b383bfad3af6 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -74,6 +74,10 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 			DISPLAY_VERx100(display) == 3500;
 	case INTEL_DISPLAY_WA_14011503117:
 		return DISPLAY_VER(display) == 13;
+	case INTEL_DISPLAY_WA_14020863754:
+		return DISPLAY_VERx100(display) == 3000 ||
+			DISPLAY_VERx100(display) == 2000 ||
+			DISPLAY_VERx100(display) == 1401;
 	case INTEL_DISPLAY_WA_14025769978:
 		return DISPLAY_VER(display) == 35;
 	case INTEL_DISPLAY_WA_15018326506:
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index 06c1f62c0f6d..b1bcc18dd2c8 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -29,6 +29,7 @@ bool intel_display_needs_wa_16023588340(struct intel_display *display);
 enum intel_display_wa {
 	INTEL_DISPLAY_WA_13012396614,
 	INTEL_DISPLAY_WA_14011503117,
+	INTEL_DISPLAY_WA_14020863754,
 	INTEL_DISPLAY_WA_14025769978,
 	INTEL_DISPLAY_WA_15018326506,
 	INTEL_DISPLAY_WA_16023588340,
-- 
2.51.0

