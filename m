Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAA9CD4F3D
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 05:59:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1CD10E138;
	Thu, 14 May 2026 05:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oHFaS2A9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA9710F120;
 Thu, 14 May 2026 05:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778738339; x=1810274339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8yPfYoXfs6+VpZgi063LuNf4Er90dB9J3mQGv/A/SlE=;
 b=oHFaS2A9UdDdH/Qc8Nd5LaUB4zZkq4oZw4PsCYBHS5sT6N4WqxeaxKkN
 qHVUJeEB7gHSzit9jahDD0maXKsoiz0TrH8Dd7WWml/WffD3xItc6ni6v
 lbrPytMjgNsRlHga/jHcLK5Bui3hZxJlSvkrsbXVqxvsyS9mGkzfIcPfg
 lbnr4PwjWePeGKW7SMslw0hXd6//DTiq+vBQyalJSsMqOB/dYAxaXmijS
 B/wHpwTJkOPKjD6AWuyQROuAAo19fT9s91ea6vSZHh0MTu5ZZXQf66niy
 o7vqTgixXtcWXMTP+dS91VS4VDhs61A8BTXdeTge7C/9i31fLJ6jddVIy Q==;
X-CSE-ConnectionGUID: qFOA6KBjQMCJgKQO5UibnQ==
X-CSE-MsgGUID: dUEw2Z12T0mOpCNZBUB7Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="67203221"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="67203221"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 22:58:59 -0700
X-CSE-ConnectionGUID: QxYAZMlkR+iQx1RxHgYOTg==
X-CSE-MsgGUID: MaBZ6YK0ROmK4PJYJnwE6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="237434218"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa010.jf.intel.com with ESMTP; 13 May 2026 22:58:56 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, jani.nikula@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Todd Brandt <todd.e.brandt@intel.com>
Subject: [PATCH 2/2] drm/i915/backlight: Sanitize BIOS-enabled PCH PWM in
 full-AUX VESA path
Date: Thu, 14 May 2026 11:28:48 +0530
Message-Id: <20260514055848.871938-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514055848.871938-1-suraj.kandpal@intel.com>
References: <20260514055848.871938-1-suraj.kandpal@intel.com>
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

In full-AUX VESA mode (aux_enable && aux_set) the driver never touches
the native PCH PWM. If BIOS left PWM CTL register enabled, the PCH PWM
keeps system alive during s2idle and blocks S0ix.
Always run pwm_funcs->setup() so pwm_enabled reflects real HW state,
and on first enable in full-AUX mode call pwm_funcs->disable() once to
clear the stale bit. Runtime behaviour is otherwise unchanged.

Fixes: 40d2f5820951 ("drm/i915/backlight: Remove try_vesa_interface")
Tested-by: Todd Brandt <todd.e.brandt@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../drm/i915/display/intel_dp_aux_backlight.c | 32 +++++++++++++------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index a8d56ebf06a2..c828c568fb8b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -496,6 +496,17 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
 	struct intel_panel *panel = &connector->panel;
 	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
 
+	/*
+	 * In full AUX VESA mode the native PWM is never driven by us. If BIOS
+	 * left it enabled, the PCH PWM keeps the system alive and blocks
+	 * S0ix. Sanitize it once via pwm_funcs->disable.
+	 */
+	if (panel->backlight.edp.vesa.info.aux_enable &&
+	    panel->backlight.edp.vesa.info.aux_set &&
+	    panel->backlight.pwm_enabled)
+		panel->backlight.pwm_funcs->disable(conn_state,
+						    intel_backlight_invert_pwm_level(connector, 0));
+
 	if (!(panel->backlight.edp.vesa.info.aux_enable ||
 	      panel->backlight.edp.vesa.info.luminance_set)) {
 		u32 pwm_level;
@@ -558,15 +569,18 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
 				    panel->backlight.edp.vesa.info.luminance_set),
 		    backlight_unit_str(panel));
 
-	if (!panel->backlight.edp.vesa.info.aux_set ||
-	    !panel->backlight.edp.vesa.info.aux_enable) {
-		ret = panel->backlight.pwm_funcs->setup(connector, pipe);
-		if (ret < 0) {
-			drm_err(display->drm,
-				"[CONNECTOR:%d:%s] Failed to setup PWM backlight controls for eDP backlight: %d\n",
-				connector->base.base.id, connector->base.name, ret);
-			return ret;
-		}
+	/*
+	 * Always probe the native PWM HW state so panel->backlight.pwm_enabled
+	 * reflects what BIOS left behind. Required for the full-AUX VESA path
+	 * to detect and sanitize a BIOS-enabled PCH PWM that would otherwise
+	 * block S0ix.
+	 */
+	ret = panel->backlight.pwm_funcs->setup(connector, pipe);
+	if (ret < 0) {
+		drm_err(display->drm,
+			"[CONNECTOR:%d:%s] Failed to setup PWM backlight controls for eDP backlight: %d\n",
+			connector->base.base.id, connector->base.name, ret);
+		return ret;
 	}
 
 	if (panel->backlight.edp.vesa.info.luminance_set) {
-- 
2.34.1

