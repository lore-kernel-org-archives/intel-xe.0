Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFF0C88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 08:30:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FCE410E913;
	Wed, 16 Sep 2026 08:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kIUoQPJ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58C210E8F5;
 Wed, 16 Sep 2026 08:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789547431; x=1821083431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=729uozchNY3nWRt1FypQolYuPQ2oX07ymlFLjJZTVTo=;
 b=kIUoQPJ/hdo+TlidmsG3EzpQctbU+vKsQohXOsQZ/kj66aE9wkfxQWiD
 c8qoxJnTrDEheH47Av5eWGZB7C8G1Czsrtt80omrxJ1M/qCxV2fB4xqk/
 dqD69APlglSPsBnDo83SaYikPRxRP01M9gYGsrwICH+IlaKXhxTtfX+wk
 MfZOKGdi8uxmuu2Wmw4+nFBziWC01EwATHgM0fIoD+pMymqMQ6DFNmR8/
 yea6ipcy+3GT9LowjUQWE75txFD281J1/jq3xE4jolhLOFMYIdOB1RDg8
 2aLxNl16UNj4PTfNP+aN3EHOzHUP6FC952paWV6leKQk3WsuUqYhernCy w==;
X-CSE-ConnectionGUID: zwmlGoIcRfaGn4uLYJcRIg==
X-CSE-MsgGUID: mTVSd7fOSWCXqJm2Urabog==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="429653"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="429653"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 01:30:31 -0700
X-CSE-ConnectionGUID: Cuobu29BRGKjwAthKBc81w==
X-CSE-MsgGUID: 5a1FQnapR+O/lCwi8P6UfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1497235"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 01:30:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 11/11] drm/i915/psr: switch to drm_dp_dpcd_{read_byte,
 read_data, write_byte, write_data}()
Date: Wed, 16 Sep 2026 11:29:42 +0300
Message-ID: <0a32cfdb64a37e586579a689bd8c3c4944596a31.1789547331.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789547331.git.jani.nikula@intel.com>
References: <cover.1789547331.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

Switch to the modern DPCD access functions that return negative error
codes on errors, -EIO for incomplete access, and 0 on success.

This flags incomplete reads, and clarifies error handling all over the
place. Use 1-byte accessors where sensible. Rename local int r to ret
for clarity and consistency.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 65 ++++++++++++------------
 1 file changed, 33 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 872e253db178..f1d48b69a18f 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -471,9 +471,10 @@ static u8 intel_dp_get_sink_sync_latency(struct intel_dp *intel_dp)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
 	u8 val = 8; /* assume the worst if we can't read the value */
+	int ret;
 
-	if (drm_dp_dpcd_readb(&intel_dp->aux,
-			      DP_SYNCHRONIZATION_LATENCY_IN_SINK, &val) == 1)
+	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_SYNCHRONIZATION_LATENCY_IN_SINK, &val);
+	if (!ret)
 		val &= DP_MAX_RESYNC_FRAME_COUNT_MASK;
 	else
 		drm_dbg_kms(display->drm,
@@ -485,7 +486,7 @@ static void _psr_compute_su_granularity(struct intel_dp *intel_dp,
 					struct intel_connector *connector)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
-	ssize_t r;
+	int ret;
 	__le16 w;
 	u8 y;
 
@@ -500,19 +501,19 @@ static void _psr_compute_su_granularity(struct intel_dp *intel_dp,
 		goto exit;
 	}
 
-	r = drm_dp_dpcd_read(&intel_dp->aux, DP_PSR2_SU_X_GRANULARITY, &w, sizeof(w));
-	if (r != sizeof(w))
+	ret = drm_dp_dpcd_read_data(&intel_dp->aux, DP_PSR2_SU_X_GRANULARITY, &w, sizeof(w));
+	if (ret < 0)
 		drm_dbg_kms(display->drm,
 			    "Unable to read selective update x granularity\n");
 	/*
 	 * Spec says that if the value read is 0 the default granularity should
 	 * be used instead.
 	 */
-	if (r != sizeof(w) || w == 0)
+	if (ret < 0 || w == 0)
 		w = cpu_to_le16(4);
 
-	r = drm_dp_dpcd_read(&intel_dp->aux, DP_PSR2_SU_Y_GRANULARITY, &y, 1);
-	if (r != 1) {
+	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_PSR2_SU_Y_GRANULARITY, &y);
+	if (ret < 0) {
 		drm_dbg_kms(display->drm,
 			    "Unable to read selective update y granularity\n");
 		y = 4;
@@ -796,11 +797,11 @@ static void _panel_replay_enable_sink(struct intel_dp *intel_dp,
 		panel_replay_config[1] |=
 			DP_PANEL_REPLAY_SU_REGION_SCANLINE_CAPTURE;
 
-	drm_dp_dpcd_write(&intel_dp->aux, PANEL_REPLAY_CONFIG,
-			  panel_replay_config, sizeof(panel_replay_config));
+	drm_dp_dpcd_write_data(&intel_dp->aux, PANEL_REPLAY_CONFIG,
+			       panel_replay_config, sizeof(panel_replay_config));
 
 	panel_replay_config_3 = intel_dp_as_sdp_transmission_time();
-	drm_dp_dpcd_writeb(&intel_dp->aux, PANEL_REPLAY_CONFIG3, panel_replay_config_3);
+	drm_dp_dpcd_write_byte(&intel_dp->aux, PANEL_REPLAY_CONFIG3, panel_replay_config_3);
 }
 
 static void _psr_enable_sink(struct intel_dp *intel_dp,
@@ -827,10 +828,10 @@ static void _psr_enable_sink(struct intel_dp *intel_dp,
 
 	if (intel_dp->psr.entry_setup_frames > 0)
 		val |= DP_PSR_FRAME_CAPTURE;
-	drm_dp_dpcd_writeb(&intel_dp->aux, DP_PSR_EN_CFG, val);
+	drm_dp_dpcd_write_byte(&intel_dp->aux, DP_PSR_EN_CFG, val);
 
 	val |= DP_PSR_ENABLE;
-	drm_dp_dpcd_writeb(&intel_dp->aux, DP_PSR_EN_CFG, val);
+	drm_dp_dpcd_write_byte(&intel_dp->aux, DP_PSR_EN_CFG, val);
 }
 
 static void intel_psr_enable_sink(struct intel_dp *intel_dp,
@@ -843,7 +844,7 @@ static void intel_psr_enable_sink(struct intel_dp *intel_dp,
 		_psr_enable_sink(intel_dp, crtc_state);
 
 	if (intel_dp_is_edp(intel_dp))
-		drm_dp_dpcd_writeb(&intel_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
+		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
 }
 
 void intel_psr_panel_replay_enable_sink(struct intel_dp *intel_dp)
@@ -854,8 +855,8 @@ void intel_psr_panel_replay_enable_sink(struct intel_dp *intel_dp)
 	 * ensure this bit is cleared/set accordingly.
 	 */
 	if (CAN_PANEL_REPLAY(intel_dp) && panel_replay_global_enabled(intel_dp))
-		drm_dp_dpcd_writeb(&intel_dp->aux, PANEL_REPLAY_CONFIG,
-				   DP_PANEL_REPLAY_ENABLE);
+		drm_dp_dpcd_write_byte(&intel_dp->aux, PANEL_REPLAY_CONFIG,
+				       DP_PANEL_REPLAY_ENABLE);
 }
 
 static u32 intel_psr1_get_tp_time(struct intel_dp *intel_dp)
@@ -2373,11 +2374,11 @@ static void intel_psr_disable_locked(struct intel_dp *intel_dp)
 
 	/* Disable PSR on Sink */
 	if (!intel_dp->psr.panel_replay_enabled) {
-		drm_dp_dpcd_writeb(&intel_dp->aux, DP_PSR_EN_CFG, 0);
+		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_PSR_EN_CFG, 0);
 
 		if (intel_dp->psr.sel_update_enabled)
-			drm_dp_dpcd_writeb(&intel_dp->aux,
-					   DP_RECEIVER_ALPM_CONFIG, 0);
+			drm_dp_dpcd_write_byte(&intel_dp->aux,
+					       DP_RECEIVER_ALPM_CONFIG, 0);
 	}
 
 	/* Wa_16025596647 */
@@ -3517,7 +3518,7 @@ static void intel_psr_handle_irq(struct intel_dp *intel_dp)
 	intel_psr_disable_locked(intel_dp);
 	psr->sink_not_reliable = true;
 	/* let's make sure that sink is awaken */
-	drm_dp_dpcd_writeb(&intel_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
+	drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
 }
 
 static void intel_psr_work(struct work_struct *work)
@@ -3796,15 +3797,15 @@ static int psr_get_status_and_error_status(struct intel_dp *intel_dp,
 	offset = intel_dp->psr.panel_replay_enabled ?
 		 DP_SINK_DEVICE_PR_AND_FRAME_LOCK_STATUS : DP_PSR_STATUS;
 
-	ret = drm_dp_dpcd_readb(aux, offset, status);
-	if (ret != 1)
+	ret = drm_dp_dpcd_read_byte(aux, offset, status);
+	if (ret < 0)
 		return ret;
 
 	offset = intel_dp->psr.panel_replay_enabled ?
 		 DP_PANEL_REPLAY_ERROR_STATUS : DP_PSR_ERROR_STATUS;
 
-	ret = drm_dp_dpcd_readb(aux, offset, error_status);
-	if (ret != 1)
+	ret = drm_dp_dpcd_read_byte(aux, offset, error_status);
+	if (ret < 0)
 		return ret;
 
 	*status = *status & DP_PSR_SINK_STATE_MASK;
@@ -3829,11 +3830,11 @@ static void psr_capability_changed_check(struct intel_dp *intel_dp)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
 	struct intel_psr *psr = &intel_dp->psr;
+	int ret;
 	u8 val;
-	int r;
 
-	r = drm_dp_dpcd_readb(&intel_dp->aux, DP_PSR_ESI, &val);
-	if (r != 1) {
+	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_PSR_ESI, &val);
+	if (ret < 0) {
 		drm_err(display->drm, "Error reading DP_PSR_ESI\n");
 		return;
 	}
@@ -3845,7 +3846,7 @@ static void psr_capability_changed_check(struct intel_dp *intel_dp)
 			    "Sink PSR capability changed, disabling PSR\n");
 
 		/* Clearing it */
-		drm_dp_dpcd_writeb(&intel_dp->aux, DP_PSR_ESI, val);
+		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_PSR_ESI, val);
 	}
 }
 
@@ -3913,10 +3914,10 @@ void intel_psr_short_pulse(struct intel_dp *intel_dp)
 			"PSR_ERROR_STATUS unhandled errors %x\n",
 			error_status & ~errors);
 	/* clear status register */
-	drm_dp_dpcd_writeb(&intel_dp->aux,
-			   panel_replay_enabled ?
-			   DP_PANEL_REPLAY_ERROR_STATUS : DP_PSR_ERROR_STATUS,
-			   error_status);
+	drm_dp_dpcd_write_byte(&intel_dp->aux,
+			       panel_replay_enabled ?
+			       DP_PANEL_REPLAY_ERROR_STATUS : DP_PSR_ERROR_STATUS,
+			       error_status);
 
 	if (!psr->panel_replay_enabled) {
 		psr_alpm_check(intel_dp);
-- 
2.47.3

