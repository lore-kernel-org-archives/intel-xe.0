Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F416C61DD3
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 13:41:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6F010ED38;
	Wed, 26 Aug 2026 13:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hhZqhFff";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8ADA10ED34;
 Wed, 26 Aug 2026 13:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787751700; x=1819287700;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EIW0P+IZeNIx+e4jSf2WsnGSCdZ7699HA78BYH8a3vM=;
 b=hhZqhFffBw32vzrbAFO+FctUiudFAT9iSfkobKBZekeb7ZHpxtrw/5cX
 gXpR6pWXHlzMkmjdz6rYIRRrz6owNABxD42hj2UWNuyPaUXdCDzPt6aUM
 ANAY3EN+PAcm7Uhl/2P6G0JEyiPnMaLeUt3GXT1T4yrnFPXM8nI8o1Z2J
 B+pb5Tk3Um43kzcYFk+83gzOd0grC5snqfyp1BTPcZPQcMgvlNKrCV0qY
 A7eo3A42+yMYrDXEG2uSU7O34RvmQy4cYu51CDaM7VIS6JDQkttYYMXCZ
 plDnXq/uAckeP166OlMEpFTMFyuD3o0zgmeymeoMjMrPeyVQPJDt2jtmc A==;
X-CSE-ConnectionGUID: Y1BYdZwCQ4yKbA4u+fqAmQ==
X-CSE-MsgGUID: iLO1rPoiRTCp3o6Y6PzSBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="92094459"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="92094459"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:41:35 -0700
X-CSE-ConnectionGUID: VyBYNPekTYWNTiEo3xG3zQ==
X-CSE-MsgGUID: vbaHrrBUR8KSmiiWzlH6WA==
X-ExtLoop1: 1
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.39])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:41:33 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 13/14] drm/i915/cdclk: Introduce CDCLK .{pre,
 post}_notify() vfuncs
Date: Wed, 26 Aug 2026 16:40:32 +0300
Message-ID: <20260826134033.13976-14-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260826134033.13976-1-ville.syrjala@linux.intel.com>
References: <20260826134033.13976-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Turn the cdclk pcode pre/post notify functions into vfuncs.
Mainly to get rid of the hideous if-ladders in bxt_set_cdclk().

DG2 is currently doing its own thing with its pcode notify funcs so
can't be converted yet. And MTL+ go via the pmdemand stuff so this
is all supposedly handled elsewhere.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 122 ++++++++++++---------
 1 file changed, 73 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index cf7efac7d648..b1b96f908e06 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -163,6 +163,9 @@ struct intel_cdclk_funcs {
 	void (*set_cdclk)(struct intel_display *display,
 			  const struct intel_cdclk_config *cdclk_config,
 			  enum pipe pipe);
+	int (*pre_notify)(struct intel_display *display);
+	int (*post_notify)(struct intel_display *display,
+			   const struct intel_cdclk_config *cdclk_config);
 	int (*modeset_calc_cdclk)(struct intel_atomic_state *state);
 	u8 (*calc_voltage_level)(int cdclk);
 };
@@ -173,6 +176,35 @@ void intel_cdclk_get_cdclk(struct intel_display *display,
 	display->cdclk.funcs->get_cdclk(display, cdclk_config);
 }
 
+static int intel_cdclk_pre_notify(struct intel_display *display)
+{
+	int ret;
+
+	if (!display->cdclk.funcs->pre_notify)
+		return 0;
+
+	ret = display->cdclk.funcs->pre_notify(display);
+	if (ret)
+		drm_err(display->drm,
+			"Failed to inform system about start of CDCLK change (%d)\n", ret);
+
+	return ret;
+}
+
+static void intel_cdclk_post_notify(struct intel_display *display,
+				    const struct intel_cdclk_config *cdclk_config)
+{
+	int ret;
+
+	if (!display->cdclk.funcs->post_notify)
+		return;
+
+	ret = display->cdclk.funcs->post_notify(display, cdclk_config);
+	if (ret)
+		drm_err(display->drm,
+			"Failed to inform system about end of CDCLK change (%d)\n", ret);
+}
+
 static void intel_cdclk_set_cdclk(struct intel_display *display,
 				  const struct intel_cdclk_config *cdclk_config,
 				  enum pipe pipe)
@@ -901,12 +933,9 @@ static void bdw_set_cdclk(struct intel_display *display,
 		     "trying to change cdclk frequency with cdclk not enabled\n"))
 		return;
 
-	ret = bdw_cdclk_pcode_pre_notify(display);
-	if (ret) {
-		drm_err(display->drm,
-			"Failed to inform PCODE about start of CDCLK change (%d)\n", ret);
+	ret = intel_cdclk_pre_notify(display);
+	if (ret)
 		return;
-	}
 
 	intel_de_rmw(display, LCPLL_CTL,
 		     0, LCPLL_CD_SOURCE_FCLK);
@@ -931,10 +960,7 @@ static void bdw_set_cdclk(struct intel_display *display,
 	if (ret)
 		drm_err(display->drm, "Switching back to LCPLL failed\n");
 
-	ret = bdw_cdclk_pcode_post_notify(display, cdclk_config);
-	if (ret)
-		drm_err(display->drm,
-			"Failed to inform PCODE about end of CDCLK change (%d)\n", ret);
+	intel_cdclk_post_notify(display, cdclk_config);
 
 	intel_de_write(display, CDCLK_FREQ,
 		       DIV_ROUND_CLOSEST(cdclk, 1000) - 1);
@@ -1205,12 +1231,9 @@ static void skl_set_cdclk(struct intel_display *display,
 	drm_WARN_ON_ONCE(display->drm,
 			 display->platform.skylake && vco == 8640000);
 
-	ret = skl_cdclk_pcode_pre_notify(display);
-	if (ret) {
-		drm_err(display->drm,
-			"Failed to inform PCODE about start of CDCLK change (%d)\n", ret);
+	ret = intel_cdclk_pre_notify(display);
+	if (ret)
 		return;
-	}
 
 	freq_select = skl_cdclk_freq_sel(display, cdclk, vco);
 
@@ -1247,10 +1270,7 @@ static void skl_set_cdclk(struct intel_display *display,
 	intel_de_write(display, CDCLK_CTL, cdclk_ctl);
 	intel_de_posting_read(display, CDCLK_CTL);
 
-	ret = skl_cdclk_pcode_post_notify(display, cdclk_config);
-	if (ret)
-		drm_err(display->drm,
-			"Failed to inform PCODE about end of CDCLK change (%d)\n", ret);
+	intel_cdclk_post_notify(display, cdclk_config);
 
 	intel_update_cdclk(display);
 }
@@ -2317,24 +2337,9 @@ static void bxt_set_cdclk(struct intel_display *display,
 	int cdclk = cdclk_config->cdclk;
 	int ret;
 
-	/*
-	 * Inform power controller of upcoming frequency change.
-	 * Display versions 14 and beyond do not follow the PUnit
-	 * mailbox communication, skip
-	 * this step.
-	 */
-	if (DISPLAY_VER(display) >= 14 || display->platform.dg2)
-		ret = 0; /* NOOP */
-	else if (DISPLAY_VER(display) >= 11)
-		ret = skl_cdclk_pcode_pre_notify(display);
-	else
-		ret = bxt_cdclk_pcode_pre_notify(display);
-
-	if (ret) {
-		drm_err(display->drm,
-			"Failed to inform PCODE about start of CDCLK change (%d)\n", ret);
+	ret = intel_cdclk_pre_notify(display);
+	if (ret)
 		return;
-	}
 
 	if (DISPLAY_VER(display) >= 20 && cdclk < display->cdclk.hw.cdclk)
 		xe2lpd_mdclk_cdclk_ratio_program(display, cdclk_config);
@@ -2350,16 +2355,7 @@ static void bxt_set_cdclk(struct intel_display *display,
 	if (DISPLAY_VER(display) >= 20 && cdclk > display->cdclk.hw.cdclk)
 		xe2lpd_mdclk_cdclk_ratio_program(display, cdclk_config);
 
-	if (DISPLAY_VER(display) >= 14 || display->platform.dg2)
-		ret = 0; /* NOOP */
-	else if (DISPLAY_VER(display) >= 11)
-		ret = skl_cdclk_pcode_post_notify(display, cdclk_config);
-	else
-		ret = bxt_cdclk_pcode_post_notify(display, cdclk_config);
-
-	if (ret)
-		drm_err(display->drm,
-			"Failed to inform PCODE about end of CDCLK change (%d)\n", ret);
+	intel_cdclk_post_notify(display, cdclk_config);
 
 	intel_update_cdclk(display);
 
@@ -3983,9 +3979,25 @@ static const struct intel_cdclk_funcs xe3lpd_cdclk_funcs = {
 	.calc_voltage_level = xe3lpd_calc_voltage_level,
 };
 
+static const struct intel_cdclk_funcs mtl_cdclk_funcs = {
+	.get_cdclk = bxt_get_cdclk,
+	.set_cdclk = bxt_set_cdclk,
+	.modeset_calc_cdclk = bxt_modeset_calc_cdclk,
+	.calc_voltage_level = rplu_calc_voltage_level,
+};
+
+static const struct intel_cdclk_funcs dg2_cdclk_funcs = {
+	.get_cdclk = bxt_get_cdclk,
+	.set_cdclk = bxt_set_cdclk,
+	.modeset_calc_cdclk = bxt_modeset_calc_cdclk,
+	.calc_voltage_level = tgl_calc_voltage_level,
+};
+
 static const struct intel_cdclk_funcs rplu_cdclk_funcs = {
 	.get_cdclk = bxt_get_cdclk,
 	.set_cdclk = bxt_set_cdclk,
+	.pre_notify = skl_cdclk_pcode_pre_notify,
+	.post_notify = skl_cdclk_pcode_post_notify,
 	.modeset_calc_cdclk = bxt_modeset_calc_cdclk,
 	.calc_voltage_level = rplu_calc_voltage_level,
 };
@@ -3993,6 +4005,8 @@ static const struct intel_cdclk_funcs rplu_cdclk_funcs = {
 static const struct intel_cdclk_funcs tgl_cdclk_funcs = {
 	.get_cdclk = bxt_get_cdclk,
 	.set_cdclk = bxt_set_cdclk,
+	.pre_notify = skl_cdclk_pcode_pre_notify,
+	.post_notify = skl_cdclk_pcode_post_notify,
 	.modeset_calc_cdclk = bxt_modeset_calc_cdclk,
 	.calc_voltage_level = tgl_calc_voltage_level,
 };
@@ -4000,6 +4014,8 @@ static const struct intel_cdclk_funcs tgl_cdclk_funcs = {
 static const struct intel_cdclk_funcs ehl_cdclk_funcs = {
 	.get_cdclk = bxt_get_cdclk,
 	.set_cdclk = bxt_set_cdclk,
+	.pre_notify = skl_cdclk_pcode_pre_notify,
+	.post_notify = skl_cdclk_pcode_post_notify,
 	.modeset_calc_cdclk = bxt_modeset_calc_cdclk,
 	.calc_voltage_level = ehl_calc_voltage_level,
 };
@@ -4007,6 +4023,8 @@ static const struct intel_cdclk_funcs ehl_cdclk_funcs = {
 static const struct intel_cdclk_funcs icl_cdclk_funcs = {
 	.get_cdclk = bxt_get_cdclk,
 	.set_cdclk = bxt_set_cdclk,
+	.pre_notify = skl_cdclk_pcode_pre_notify,
+	.post_notify = skl_cdclk_pcode_post_notify,
 	.modeset_calc_cdclk = bxt_modeset_calc_cdclk,
 	.calc_voltage_level = icl_calc_voltage_level,
 };
@@ -4014,6 +4032,8 @@ static const struct intel_cdclk_funcs icl_cdclk_funcs = {
 static const struct intel_cdclk_funcs bxt_cdclk_funcs = {
 	.get_cdclk = bxt_get_cdclk,
 	.set_cdclk = bxt_set_cdclk,
+	.pre_notify = bxt_cdclk_pcode_pre_notify,
+	.post_notify = bxt_cdclk_pcode_post_notify,
 	.modeset_calc_cdclk = bxt_modeset_calc_cdclk,
 	.calc_voltage_level = bxt_calc_voltage_level,
 };
@@ -4021,12 +4041,16 @@ static const struct intel_cdclk_funcs bxt_cdclk_funcs = {
 static const struct intel_cdclk_funcs skl_cdclk_funcs = {
 	.get_cdclk = skl_get_cdclk,
 	.set_cdclk = skl_set_cdclk,
+	.pre_notify = skl_cdclk_pcode_pre_notify,
+	.post_notify = skl_cdclk_pcode_post_notify,
 	.modeset_calc_cdclk = skl_modeset_calc_cdclk,
 };
 
 static const struct intel_cdclk_funcs bdw_cdclk_funcs = {
 	.get_cdclk = bdw_get_cdclk,
 	.set_cdclk = bdw_set_cdclk,
+	.pre_notify = bdw_cdclk_pcode_pre_notify,
+	.post_notify = bdw_cdclk_pcode_post_notify,
 	.modeset_calc_cdclk = bdw_modeset_calc_cdclk,
 };
 
@@ -4132,16 +4156,16 @@ void intel_init_cdclk_hooks(struct intel_display *display)
 		display->cdclk.funcs = &xe3lpd_cdclk_funcs;
 		display->cdclk.table = xe3lpd_cdclk_table;
 	} else if (DISPLAY_VER(display) >= 20) {
-		display->cdclk.funcs = &rplu_cdclk_funcs;
+		display->cdclk.funcs = &mtl_cdclk_funcs;
 		display->cdclk.table = xe2lpd_cdclk_table;
 	} else if (DISPLAY_VERx100(display) >= 1401) {
-		display->cdclk.funcs = &rplu_cdclk_funcs;
+		display->cdclk.funcs = &mtl_cdclk_funcs;
 		display->cdclk.table = xe2hpd_cdclk_table;
 	} else if (DISPLAY_VER(display) >= 14) {
-		display->cdclk.funcs = &rplu_cdclk_funcs;
+		display->cdclk.funcs = &mtl_cdclk_funcs;
 		display->cdclk.table = mtl_cdclk_table;
 	} else if (display->platform.dg2) {
-		display->cdclk.funcs = &tgl_cdclk_funcs;
+		display->cdclk.funcs = &dg2_cdclk_funcs;
 		display->cdclk.table = dg2_cdclk_table;
 	} else if (display->platform.alderlake_p) {
 		/* Wa_22011320316:adl-p[a0] */
-- 
2.54.0

