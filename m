Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87324C77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:25:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68BD110E82A;
	Wed, 12 Apr 2023 14:25:52 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD7F10E82A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309550; x=1712845550;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UoYGFPHS7Qws+Q6cG10jX0Bex9ndWq84KtmYGKC2coQ=;
 b=IFB0/RTRPN9zXiT7BNelN6kVodrZi+QmIDUzy8Y+TLk3gXRiTmcTG4K3
 /MnbOZtUh1wxIKbXlznKfdZuKdRkJoSApFCPB2t2ujSSPf2jNwpaZfkix
 wjpdCilfqM2TglSzrh6GJIsWksnR+viZ3uELlPk07KEuW5ukJngIvuaph
 mRArlTaBFXcLC+YkT8tIpOjal/tFAV2BgCAwY//8Yb18fHs09s5H9Voxs
 wsampeg8Ym0jfGWD4O1tEKyELZT/ksCTposZLLpjaU4a+xw8nc8/NFaee
 +zIqtd4w99+hbRyQQorKHNzFFWhFimcY37HSdprafPDwIWWojwbucEjH5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="342667708"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="342667708"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:25:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="800358216"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="800358216"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:25:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:49 +0300
Message-Id: <20230412142006.877109-25-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 24/41] fixup! drm/i915/display: Remaining changes
 to make xe compile
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

No longer needed.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index f451b8b1d1a6..2fd0630b26fb 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -474,7 +474,6 @@ static void hsw_get_cdclk(struct drm_i915_private *dev_priv,
 		cdclk_config->cdclk = 540000;
 }
 
-#ifdef I915
 static int vlv_calc_cdclk(struct drm_i915_private *dev_priv, int min_cdclk)
 {
 	int freq_320 = (dev_priv->hpll_freq <<  1) % 320000 != 0 ?
@@ -713,7 +712,6 @@ static void chv_set_cdclk(struct drm_i915_private *dev_priv,
 
 	intel_display_power_put(dev_priv, POWER_DOMAIN_DISPLAY_CORE, wakeref);
 }
-#endif
 
 static int bdw_calc_cdclk(int min_cdclk)
 {
@@ -2608,7 +2606,6 @@ static int bxt_compute_min_voltage_level(struct intel_cdclk_state *cdclk_state)
 	return min_voltage_level;
 }
 
-#ifdef I915
 static int vlv_modeset_calc_cdclk(struct intel_cdclk_state *cdclk_state)
 {
 	struct intel_atomic_state *state = cdclk_state->base.state;
@@ -2637,7 +2634,6 @@ static int vlv_modeset_calc_cdclk(struct intel_cdclk_state *cdclk_state)
 
 	return 0;
 }
-#endif
 
 static int bdw_modeset_calc_cdclk(struct intel_cdclk_state *cdclk_state)
 {
@@ -3140,14 +3136,12 @@ static int pch_rawclk(struct drm_i915_private *dev_priv)
 	return (intel_de_read(dev_priv, PCH_RAWCLK_FREQ) & RAWCLK_FREQ_MASK) * 1000;
 }
 
-#ifdef I915
 static int vlv_hrawclk(struct drm_i915_private *dev_priv)
 {
 	/* RAWCLK_FREQ_VLV register updated from power well code */
 	return vlv_get_cck_clock_hpll(dev_priv, "hrawclk",
 				      CCK_DISPLAY_REF_CLOCK_CONTROL);
 }
-#endif
 
 static int i9xx_hrawclk(struct drm_i915_private *dev_priv)
 {
@@ -3229,10 +3223,8 @@ u32 intel_read_rawclk(struct drm_i915_private *dev_priv)
 		freq = cnp_rawclk(dev_priv);
 	else if (HAS_PCH_SPLIT(dev_priv))
 		freq = pch_rawclk(dev_priv);
-#ifdef I915
 	else if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv))
 		freq = vlv_hrawclk(dev_priv);
-#endif
 	else if (DISPLAY_VER(dev_priv) >= 3)
 		freq = i9xx_hrawclk(dev_priv);
 	else
@@ -3289,7 +3281,6 @@ static const struct intel_cdclk_funcs bdw_cdclk_funcs = {
 	.modeset_calc_cdclk = bdw_modeset_calc_cdclk,
 };
 
-#ifdef I915
 static const struct intel_cdclk_funcs chv_cdclk_funcs = {
 	.get_cdclk = vlv_get_cdclk,
 	.set_cdclk = chv_set_cdclk,
@@ -3301,7 +3292,6 @@ static const struct intel_cdclk_funcs vlv_cdclk_funcs = {
 	.set_cdclk = vlv_set_cdclk,
 	.modeset_calc_cdclk = vlv_modeset_calc_cdclk,
 };
-#endif
 
 static const struct intel_cdclk_funcs hsw_cdclk_funcs = {
 	.get_cdclk = hsw_get_cdclk,
@@ -3425,12 +3415,10 @@ void intel_init_cdclk_hooks(struct drm_i915_private *dev_priv)
 		dev_priv->display.funcs.cdclk = &bdw_cdclk_funcs;
 	} else if (IS_HASWELL(dev_priv)) {
 		dev_priv->display.funcs.cdclk = &hsw_cdclk_funcs;
-#ifdef I915
 	} else if (IS_CHERRYVIEW(dev_priv)) {
 		dev_priv->display.funcs.cdclk = &chv_cdclk_funcs;
 	} else if (IS_VALLEYVIEW(dev_priv)) {
 		dev_priv->display.funcs.cdclk = &vlv_cdclk_funcs;
-#endif
 	} else if (IS_SANDYBRIDGE(dev_priv) || IS_IVYBRIDGE(dev_priv)) {
 		dev_priv->display.funcs.cdclk = &fixed_400mhz_cdclk_funcs;
 	} else if (IS_IRONLAKE(dev_priv)) {
-- 
2.39.2

