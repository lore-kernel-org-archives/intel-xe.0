Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C93D29FBB
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 15:29:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4560B10E2E9;
	Wed,  6 Nov 2024 15:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hadEfVk3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6F610E2E9
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Nov 2024 15:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730906944; x=1762442944;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Cmd97J8wR725uzXf9EdoDKQIxndLUKXoHM+ZTMeBdyI=;
 b=hadEfVk3Flue6FeAgeayPyIiPhAAaAJeM+MjPzXrCdmqwxj+ubqlqWII
 fgozvnEth1gs8ePCMqrxIJuJfpPwxtZGm3DUXiQEAdYT7m65PZlGv2eL0
 wfWTCc19GU1v1ywrZl7QCzkOqaqpJKThEoTwy4GG0OCEtBdOrX8oCLCtT
 V985s9svKYPNBpdjWtGAEe5KeLPLaci7F5kNRR/tDzzmgUaDYLVbQb7+S
 i5i07xK5OTl7kg74hBFVVqhInh8dGer+StCTmr0172SPYIGvRO5ENMInH
 g+m01PjAmvacN7bXoAVeYByf/aKwpMSvJ+E5spgyVUja4um+gCQv3qLso A==;
X-CSE-ConnectionGUID: ExZxSirhQ+ay6WRANtto+A==
X-CSE-MsgGUID: eyK1a3NYSISAsb7E4J2MjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30137440"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="30137440"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 07:29:04 -0800
X-CSE-ConnectionGUID: 9ZBGLwECTsumN2wIkk9wIg==
X-CSE-MsgGUID: 9xJVtKnIR8GHx8jUcyso3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="84731665"
Received: from sorvi2.fi.intel.com ([10.237.72.194])
 by orviesa006.jf.intel.com with ESMTP; 06 Nov 2024 07:29:03 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH] drm/i915/display: Pcode sets the CD clock frequency voltage
 levels
Date: Wed,  6 Nov 2024 17:20:23 +0200
Message-ID: <20241106152023.398748-1-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
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

On xe3lpd the CD clock frequency is set by the driver
without setting voltage levels. Previously, we had 4
levels of voltages to choose from. However, having only 4
levels is rather coarse and we may end up consuming more
power than necessary. Therefore, these are now removed
and choosing the correct voltage level is now handed over
to Pcode firmware which is able to set voltage level with
higher granularity.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 48 +++++++++++-----------
 drivers/gpu/drm/i915/i915_reg.h            |  3 ++
 2 files changed, 28 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 03c4eef3f92a..72da06e77815 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -1627,16 +1627,6 @@ static u8 rplu_calc_voltage_level(int cdclk)
 				  rplu_voltage_level_max_cdclk);
 }
 
-static u8 xe3lpd_calc_voltage_level(int cdclk)
-{
-	/*
-	 * Starting with xe3lpd power controller does not need the voltage
-	 * index when doing the modeset update. This function is best left
-	 * defined but returning 0 to the mask.
-	 */
-	return 0;
-}
-
 static void icl_readout_refclk(struct intel_display *display,
 			       struct intel_cdclk_config *cdclk_config)
 {
@@ -1758,8 +1748,9 @@ static void bxt_get_cdclk(struct intel_display *display,
 	 * Can't read this out :( Let's assume it's
 	 * at least what the CDCLK frequency requires.
 	 */
-	cdclk_config->voltage_level =
-		intel_cdclk_calc_voltage_level(display, cdclk_config->cdclk);
+	if (DISPLAY_VER(display) < 30)
+		cdclk_config->voltage_level =
+			intel_cdclk_calc_voltage_level(display, cdclk_config->cdclk);
 }
 
 static void bxt_de_pll_disable(struct intel_display *display)
@@ -2209,7 +2200,7 @@ static void bxt_set_cdclk(struct intel_display *display,
 
 	intel_update_cdclk(display);
 
-	if (DISPLAY_VER(display) >= 11)
+	if (DISPLAY_VER(display) >= 11 && DISPLAY_VER(display) < 30)
 		/*
 		 * Can't read out the voltage level :(
 		 * Let's just assume everything is as expected.
@@ -2288,8 +2279,10 @@ static void bxt_cdclk_init_hw(struct intel_display *display)
 	 */
 	cdclk_config.cdclk = bxt_calc_cdclk(display, 0);
 	cdclk_config.vco = bxt_calc_cdclk_pll_vco(display, cdclk_config.cdclk);
-	cdclk_config.voltage_level =
-		intel_cdclk_calc_voltage_level(display, cdclk_config.cdclk);
+
+	if (DISPLAY_VER(display) < 30)
+		cdclk_config.voltage_level =
+			intel_cdclk_calc_voltage_level(display, cdclk_config.cdclk);
 
 	bxt_set_cdclk(display, &cdclk_config, INVALID_PIPE);
 }
@@ -2300,8 +2293,10 @@ static void bxt_cdclk_uninit_hw(struct intel_display *display)
 
 	cdclk_config.cdclk = cdclk_config.bypass;
 	cdclk_config.vco = 0;
-	cdclk_config.voltage_level =
-		intel_cdclk_calc_voltage_level(display, cdclk_config.cdclk);
+
+	if (DISPLAY_VER(display) < 30)
+		cdclk_config.voltage_level =
+			intel_cdclk_calc_voltage_level(display, cdclk_config.cdclk);
 
 	bxt_set_cdclk(display, &cdclk_config, INVALID_PIPE);
 }
@@ -2477,10 +2472,15 @@ void intel_cdclk_dump_config(struct intel_display *display,
 			     const struct intel_cdclk_config *cdclk_config,
 			     const char *context)
 {
-	drm_dbg_kms(display->drm, "%s %d kHz, VCO %d kHz, ref %d kHz, bypass %d kHz, voltage level %d\n",
-		    context, cdclk_config->cdclk, cdclk_config->vco,
-		    cdclk_config->ref, cdclk_config->bypass,
-		    cdclk_config->voltage_level);
+	if (DISPLAY_VER(display) == 30)
+		drm_dbg_kms(display->drm, "%s %d kHz, VCO %d kHz, ref %d kHz, bypass %d kHz\n",
+			    context, cdclk_config->cdclk, cdclk_config->vco,
+			    cdclk_config->ref, cdclk_config->bypass);
+	else
+		drm_dbg_kms(display->drm, "%s %d kHz, VCO %d kHz, ref %d kHz, bypass %d kHz, voltage level %d\n",
+			    context, cdclk_config->cdclk, cdclk_config->vco,
+			    cdclk_config->ref, cdclk_config->bypass,
+			    cdclk_config->voltage_level);
 }
 
 static void intel_pcode_notify(struct intel_display *display,
@@ -2497,7 +2497,10 @@ static void intel_pcode_notify(struct intel_display *display,
 	if (!IS_DG2(i915))
 		return;
 
-	update_mask = DISPLAY_TO_PCODE_UPDATE_MASK(cdclk, active_pipe_count, voltage_level);
+	if (DISPLAY_VER(i915) == 30)
+		update_mask = DISPLAY30_TO_PCODE_UPDATE_MASK(cdclk, active_pipe_count);
+	else
+		update_mask = DISPLAY_TO_PCODE_UPDATE_MASK(cdclk, active_pipe_count, voltage_level);
 
 	if (cdclk_update_valid)
 		update_mask |= DISPLAY_TO_PCODE_CDCLK_VALID;
@@ -3699,7 +3702,6 @@ static const struct intel_cdclk_funcs xe3lpd_cdclk_funcs = {
 	.get_cdclk = bxt_get_cdclk,
 	.set_cdclk = bxt_set_cdclk,
 	.modeset_calc_cdclk = bxt_modeset_calc_cdclk,
-	.calc_voltage_level = xe3lpd_calc_voltage_level,
 };
 
 static const struct intel_cdclk_funcs rplu_cdclk_funcs = {
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index c160e087972a..5d0b13460631 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -3581,6 +3581,9 @@
 		((DISPLAY_TO_PCODE_CDCLK(cdclk)) | \
 		(DISPLAY_TO_PCODE_PIPE_COUNT(num_pipes)) | \
 		(DISPLAY_TO_PCODE_VOLTAGE(voltage_level)))
+#define   DISPLAY30_TO_PCODE_UPDATE_MASK(cdclk, num_pipes) \
+		((DISPLAY_TO_PCODE_CDCLK(cdclk)) | \
+		(DISPLAY_TO_PCODE_PIPE_COUNT(num_pipes)))
 #define   ICL_PCODE_SAGV_DE_MEM_SS_CONFIG	0xe
 #define     ICL_PCODE_REP_QGV_MASK		REG_GENMASK(1, 0)
 #define     ICL_PCODE_REP_QGV_SAFE		REG_FIELD_PREP(ICL_PCODE_REP_QGV_MASK, 0)
-- 
2.43.0

