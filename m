Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343C0C61DD2
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 13:41:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEDF310ED36;
	Wed, 26 Aug 2026 13:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X2EMCZGQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C1810ED36;
 Wed, 26 Aug 2026 13:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787751700; x=1819287700;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YprIyNkuyGKYOjBLfwp4E2oGO7eUCtAkWsEsEYhpJuE=;
 b=X2EMCZGQpQTyx399rdK+KkBouBu0bTmyp42L8jtqYJjE59dOuz3SGntY
 4xHSGbdEtxw0AFgeiZWU5bbAGVShMpwSYERRd6gUwvmwfiiYinOryTljr
 zKwe45QaH7/PPlpYLCK74Vcg40haLvLNqMrWc0lqcB/fP/ProfV2pg4VO
 Kd0ccUbCd139wGk/6CN7nc4m70lCzRtXRQwrFjpAHuupwpDpbV+Htlm5B
 +jSYpPml++xebNr5hbgurmBzOIa53/E7Ied4dfyRwJsAvREUgrw36se5a
 4l9pgDWMiTtpFn+0jdwjBxivxuERbMDoZ11uXY/SXnYIPY3qAOhqv5oML A==;
X-CSE-ConnectionGUID: NYdTq6DETYWZNOSQg6QnUQ==
X-CSE-MsgGUID: bA+5LGP6QfKSpWsNFAt2xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="92094466"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="92094466"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:41:38 -0700
X-CSE-ConnectionGUID: 6Sv271J7QzqLgJdJa9ojPQ==
X-CSE-MsgGUID: WVtnrYtWRK+yC5S92CqWyA==
X-ExtLoop1: 1
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.39])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:41:37 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 14/14] drm/i915/cdclk: Hoist intel_cdclk_{pre,
 post}_notify() calls upwards
Date: Wed, 26 Aug 2026 16:40:33 +0300
Message-ID: <20260826134033.13976-15-ville.syrjala@linux.intel.com>
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

Now that intel_cdclk_{pre,post}_notify() are implemented via vfuncs
there is no need to keep them inside the .set_cdclk() hooks. Move
the calls one level up to intel_cdclk_set_cdclk().

We do need to adjust {skl,bxt}_cdclk_(un)init_hw() to call the wrapper
rather than the low level implementation directly, or else they would
not do the pcode notification anymore.

The two slight functional changes here are:
- bdw_set_cdclk() might theoretically bail out after doing the
  pre notification, but that codepath would only come into play
  if the hardware is seriously misprogrammed, so should never happen
- cdclk hw readout is still done from .set_cdclk(), so that now
  happens before the post notify vs. previously the readout happened
  before it. This should not matter as the readout is not affected
  by the post notify (since we can't actually read out anything from
  pcode).

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 33 ++++++----------------
 1 file changed, 9 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index b1b96f908e06..d545572a8b6e 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -209,7 +209,12 @@ static void intel_cdclk_set_cdclk(struct intel_display *display,
 				  const struct intel_cdclk_config *cdclk_config,
 				  enum pipe pipe)
 {
+	if (intel_cdclk_pre_notify(display))
+		return;
+
 	display->cdclk.funcs->set_cdclk(display, cdclk_config, pipe);
+
+	intel_cdclk_post_notify(display, cdclk_config);
 }
 
 static int intel_cdclk_modeset_calc_cdclk(struct intel_atomic_state *state)
@@ -933,10 +938,6 @@ static void bdw_set_cdclk(struct intel_display *display,
 		     "trying to change cdclk frequency with cdclk not enabled\n"))
 		return;
 
-	ret = intel_cdclk_pre_notify(display);
-	if (ret)
-		return;
-
 	intel_de_rmw(display, LCPLL_CTL,
 		     0, LCPLL_CD_SOURCE_FCLK);
 
@@ -960,8 +961,6 @@ static void bdw_set_cdclk(struct intel_display *display,
 	if (ret)
 		drm_err(display->drm, "Switching back to LCPLL failed\n");
 
-	intel_cdclk_post_notify(display, cdclk_config);
-
 	intel_de_write(display, CDCLK_FREQ,
 		       DIV_ROUND_CLOSEST(cdclk, 1000) - 1);
 
@@ -1218,7 +1217,6 @@ static void skl_set_cdclk(struct intel_display *display,
 	int cdclk = cdclk_config->cdclk;
 	int vco = cdclk_config->vco;
 	u32 freq_select, cdclk_ctl;
-	int ret;
 
 	/*
 	 * Based on WA#1183 CDCLK rates 308 and 617MHz CDCLK rates are
@@ -1231,10 +1229,6 @@ static void skl_set_cdclk(struct intel_display *display,
 	drm_WARN_ON_ONCE(display->drm,
 			 display->platform.skylake && vco == 8640000);
 
-	ret = intel_cdclk_pre_notify(display);
-	if (ret)
-		return;
-
 	freq_select = skl_cdclk_freq_sel(display, cdclk, vco);
 
 	if (display->cdclk.hw.vco != 0 &&
@@ -1270,8 +1264,6 @@ static void skl_set_cdclk(struct intel_display *display,
 	intel_de_write(display, CDCLK_CTL, cdclk_ctl);
 	intel_de_posting_read(display, CDCLK_CTL);
 
-	intel_cdclk_post_notify(display, cdclk_config);
-
 	intel_update_cdclk(display);
 }
 
@@ -1362,7 +1354,7 @@ static void skl_cdclk_init_hw(struct intel_display *display)
 	cdclk_config.cdclk = skl_calc_cdclk(0, cdclk_config.vco);
 	cdclk_config.voltage_level = skl_calc_voltage_level(cdclk_config.cdclk);
 
-	skl_set_cdclk(display, &cdclk_config, INVALID_PIPE);
+	intel_cdclk_set_cdclk(display, &cdclk_config, INVALID_PIPE);
 }
 
 static void skl_cdclk_uninit_hw(struct intel_display *display)
@@ -1373,7 +1365,7 @@ static void skl_cdclk_uninit_hw(struct intel_display *display)
 	cdclk_config.vco = 0;
 	cdclk_config.voltage_level = skl_calc_voltage_level(cdclk_config.cdclk);
 
-	skl_set_cdclk(display, &cdclk_config, INVALID_PIPE);
+	intel_cdclk_set_cdclk(display, &cdclk_config, INVALID_PIPE);
 }
 
 struct intel_cdclk_vals {
@@ -2335,11 +2327,6 @@ static void bxt_set_cdclk(struct intel_display *display,
 {
 	struct intel_cdclk_config mid_cdclk_config;
 	int cdclk = cdclk_config->cdclk;
-	int ret;
-
-	ret = intel_cdclk_pre_notify(display);
-	if (ret)
-		return;
 
 	if (DISPLAY_VER(display) >= 20 && cdclk < display->cdclk.hw.cdclk)
 		xe2lpd_mdclk_cdclk_ratio_program(display, cdclk_config);
@@ -2355,8 +2342,6 @@ static void bxt_set_cdclk(struct intel_display *display,
 	if (DISPLAY_VER(display) >= 20 && cdclk > display->cdclk.hw.cdclk)
 		xe2lpd_mdclk_cdclk_ratio_program(display, cdclk_config);
 
-	intel_cdclk_post_notify(display, cdclk_config);
-
 	intel_update_cdclk(display);
 
 	/*
@@ -2463,7 +2448,7 @@ static void bxt_cdclk_init_hw(struct intel_display *display)
 	cdclk_config.voltage_level =
 		intel_cdclk_calc_voltage_level(display, cdclk_config.cdclk);
 
-	bxt_set_cdclk(display, &cdclk_config, INVALID_PIPE);
+	intel_cdclk_set_cdclk(display, &cdclk_config, INVALID_PIPE);
 }
 
 static void bxt_cdclk_uninit_hw(struct intel_display *display)
@@ -2475,7 +2460,7 @@ static void bxt_cdclk_uninit_hw(struct intel_display *display)
 	cdclk_config.voltage_level =
 		intel_cdclk_calc_voltage_level(display, cdclk_config.cdclk);
 
-	bxt_set_cdclk(display, &cdclk_config, INVALID_PIPE);
+	intel_cdclk_set_cdclk(display, &cdclk_config, INVALID_PIPE);
 }
 
 /**
-- 
2.54.0

