Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40000CAC59A
	for <intel-xe@archiver.kernel.org>; Fri, 19 Sep 2025 18:08:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F014C10EA6E;
	Fri, 19 Sep 2025 18:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z3mbPWWY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76F810E252;
 Fri, 19 Sep 2025 18:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758305335; x=1789841335;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=99HaX3TAXI0t9GE83AREsCukqZRivIuql15b1F0QHLc=;
 b=Z3mbPWWYKdOzoWBNl31XvFD8llCZWerZxV6AumtRQRxQ/k2QmGo+GWQC
 ZCD6bz+Ts+TnnVHlBS+deoUktMhHpV2mXw2bRmAVuETjew0wZobEXdKBL
 8/b49qOtTDVM9OQ5lkcnICpRqgP6jrS7btZ2guRo95ZXkE5x990lJfYeW
 aLbCgIrkCSERpG3f9yuDXULOguTjaGmSyOH/A73aU3siD+8cEKD2H7v0G
 +pvNtoy0vx1RdR3zek6WFTX5MXTpCyWF53fYBNb69V2cx9/9O/3tyL0oj
 McUet+WSmWltn7sPEgIhDFhydMKyBivde33YJhbwmD/45saJURPj9DWof g==;
X-CSE-ConnectionGUID: GRAzoa+tQVOGsyUNojTNVg==
X-CSE-MsgGUID: 2szV1hlsR3eSU2lRj2okzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64458769"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64458769"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 11:08:50 -0700
X-CSE-ConnectionGUID: 9mkXLDC4QAuK8RNBIxbH8w==
X-CSE-MsgGUID: 3+yKOaXYRIKV6PJ9pL9Mxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="181019112"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.112])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 11:08:50 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915: Deobfuscate wm linetime calculation
Date: Fri, 19 Sep 2025 21:08:37 +0300
Message-ID: <20250919180838.10498-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250919180838.10498-1-ville.syrjala@linux.intel.com>
References: <20250919180838.10498-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

intel_get_linetime_us() is a mess. Rewrite it in a straightforward
manner. Also the checks for the !active and pixel_rate==0 are
completely pointless here since we know that the plane is visible.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/skl_watermark.c | 21 ++++----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index bdd005c6cc2d..3eaaf26100f1 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -1636,24 +1636,12 @@ skl_wm_method2(u32 pixel_rate, u32 pipe_htotal, u32 latency,
 	return ret;
 }
 
-static uint_fixed_16_16_t
+static int
 intel_get_linetime_us(const struct intel_crtc_state *crtc_state,
 		      int pixel_rate)
 {
-	struct intel_display *display = to_intel_display(crtc_state);
-	u32 crtc_htotal;
-	uint_fixed_16_16_t linetime_us;
-
-	if (!crtc_state->hw.active)
-		return u32_to_fixed16(0);
-
-	if (drm_WARN_ON(display->drm, pixel_rate == 0))
-		return u32_to_fixed16(0);
-
-	crtc_htotal = crtc_state->hw.pipe_mode.crtc_htotal;
-	linetime_us = div_fixed16(crtc_htotal * 1000, pixel_rate);
-
-	return linetime_us;
+	return DIV_ROUND_UP(crtc_state->hw.pipe_mode.crtc_htotal * 1000,
+			    pixel_rate);
 }
 
 static int
@@ -1741,8 +1729,7 @@ skl_compute_wm_params(const struct intel_crtc_state *crtc_state,
 	wp->y_tile_minimum = mul_u32_fixed16(wp->y_min_scanlines,
 					     wp->plane_blocks_per_line);
 
-	wp->linetime_us = fixed16_to_u32_round_up(intel_get_linetime_us(crtc_state,
-									plane_pixel_rate));
+	wp->linetime_us = intel_get_linetime_us(crtc_state, plane_pixel_rate);
 
 	return 0;
 }
-- 
2.49.1

