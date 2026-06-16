Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE0FCD98DA
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 09:37:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA6310E9C5;
	Tue, 16 Jun 2026 09:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gx7WunI6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE79710E99F;
 Tue, 16 Jun 2026 09:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781602671; x=1813138671;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3X+gc7y4iBGyBoLjKwB2nGly1YebL8MguN9JQX/qRbY=;
 b=gx7WunI6uZIhKorCVrxhH3hzxdUIHoOzaeesVRQaQwhfemM2vSIDsOKT
 ZxBlgHhJRQxZApF9wr6JzZImwopp5c4IvTPXIqoqFPhhXlWLnc8/T3+po
 5xtf0jG86xhtL3zYx2x9dLbiI3XuBPHRwusM8U7Ji/w70tIx3o+kXQON6
 fdWymNKqp5Sgtj8MfVDw9YfIErB4Swei9yIPqJJ8pkDZOozsUQlBX93kH
 wdPlHa0P6FNacxr2OuH9rtyCfrC1n/rL6Y2CmcTNJ0ee/0t4gdO7Y+9x4
 kSI9MyWmBMp0gCZMn2CVU9j4WYvNKft4G2M/uAkZh1JWX1MDl7CfxK2Fd Q==;
X-CSE-ConnectionGUID: s8zA7lGSQEG/vzQ544GzRQ==
X-CSE-MsgGUID: Dj4K+fAFRD2gqzsgG3VRwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82262483"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82262483"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 02:37:51 -0700
X-CSE-ConnectionGUID: 9rfmbq1ZQXmpac7uaq9JkQ==
X-CSE-MsgGUID: 1SeNnT3OQeWo953KkicXLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="243351335"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa006.fm.intel.com with ESMTP; 16 Jun 2026 02:37:49 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH] drm/i915/backlight: Set brightness to 0 on disable
Date: Tue, 16 Jun 2026 15:06:36 +0530
Message-Id: <20260616093636.2334540-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
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

On backlight disable for AUX based panels set the brightness to 0 before
disabling the backlight. PWM based backlight also does set the
brightness to 0 before disable.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index a8d56ebf06a2..e4ce39c1eebb 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -355,9 +355,14 @@ intel_dp_aux_hdr_disable_backlight(const struct drm_connector_state *conn_state,
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct intel_panel *panel = &connector->panel;
 
-	/* Nothing to do for AUX based backlight controls */
-	if (panel->backlight.edp.intel_cap.sdr_uses_aux)
+	/*
+	 * Drive the DPCD brightness to 0 before tearing down the link / power
+	 * sequencer so the panel can blank emission gracefully.
+	 */
+	if (panel->backlight.edp.intel_cap.sdr_uses_aux) {
+		intel_dp_aux_hdr_set_aux_backlight(conn_state, 0);
 		return;
+	}
 
 	/* Note we want the actual pwm_level to be 0, regardless of pwm_min */
 	panel->backlight.pwm_funcs->disable(conn_state, intel_backlight_invert_pwm_level(connector, 0));
@@ -519,6 +524,12 @@ static void intel_dp_aux_vesa_disable_backlight(const struct drm_connector_state
 	struct intel_panel *panel = &connector->panel;
 	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
 
+	/*
+	 * Drive the DPCD brightness register to 0 before clearing BL_ENABLE or
+	 * dropping the panel power.
+	 */
+	drm_edp_backlight_set_level(&intel_dp->aux, &panel->backlight.edp.vesa.info, 0);
+
 	drm_edp_backlight_disable(&intel_dp->aux, &panel->backlight.edp.vesa.info);
 
 	if (!(panel->backlight.edp.vesa.info.aux_enable ||
-- 
2.25.1

