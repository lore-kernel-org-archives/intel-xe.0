Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117BB606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kkBlRvm7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B876C112AD5;
	Fri, 20 Nov 2026 14:24:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915E7112AA1;
 Fri, 20 Nov 2026 14:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795184637; x=1826720637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y3xS3gm3nzUybRhvAZ5P7Waieh7kOMkqMZjbH0Xf+J0=;
 b=kkBlRvm79em45fcaZh6GjwhW7DP+3yg8S214l9LcaW+0bugycHHTPhpk
 stW8YghBDuIWJcW9Lx8fn82+3BNrmsJQRSrGP7F2LBuRBZ8sbChjD4jTA
 4t1gItunOzscfNa9cfgFy/AIvZ43TBHuSMGNycP60JaQJpJRUcb5VRhPT
 U3ZZKbtWzh7pHRoFN7Oj/8oXW7exmDf/vOTHuKeGvPORQcgH+ocqfNjPk
 0Wi9AoJ4nNNGgkGYqi/sZTKh/s5fX3ZBBUCkQHBGkEvnMyv/cCI/+TNd7
 A/C9ThFaRNSgPjSrFejuM8wkaaZrQW7aD2O8n2ZVdx2vqOu2RxybKFd6W A==;
X-CSE-ConnectionGUID: 278krycuQTmkFJfPp3FV8Q==
X-CSE-MsgGUID: agy0CoXyT6G/d0s5r1JkMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4091000"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4091000"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:39 -0800
X-CSE-ConnectionGUID: Vr3ez/SrQjCgrALWuFRfXw==
X-CSE-MsgGUID: 32Kmpnx0Qlmaks1lONL78g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12422041"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:38 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 18/29] drm/i915/dp: Retrain the PCON FRL link from the link
 check work
Date: Fri, 20 Nov 2026 19:37:18 +0530
Message-ID: <20261120140729.466177-19-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
References: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the HDMI link of a PCON goes down while the stream is active, the
HDMI link status change handler restarts the FRL training, or falls back
to TMDS mode, directly from the short pulse handling. That runs without
any modeset lock, so it can race with a modeset that trains the link as
well, and it has no access to the state of the active stream.

Queue the link check work instead, as it is done for the DP link
retraining, and restart the FRL training there, with the modeset locks
held and only if a stream is active. The work restarts the training only
if the FRL link is not trained and the HDMI link is not active, so it
does nothing after a fallback to TMDS mode.

This allows to use the state of the active stream for the training in
the following changes.

Assisted-by: LLM
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c       | 43 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_dp.h       |  2 +
 .../drm/i915/display/intel_dp_link_training.c |  5 ++-
 3 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0991f913100e..61c2917e4b91 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4640,6 +4640,42 @@ void intel_dp_check_frl_training(struct intel_dp *intel_dp)
 	}
 }
 
+/*
+ * Restart FRL training after the HDMI link went down while the stream is
+ * active, or fall back to TMDS mode.
+ */
+int intel_dp_pcon_frl_recover(struct intel_encoder *encoder,
+			      struct drm_modeset_acquire_ctx *ctx)
+{
+	struct intel_display *display = to_intel_display(encoder);
+	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
+	u8 pipe_mask;
+	int ret;
+
+	if (!(intel_dp->downstream_ports[2] & DP_PCON_SOURCE_CTL_MODE) ||
+	    !intel_dp_is_hdmi_2_1_sink(intel_dp) ||
+	    intel_dp->frl.is_trained ||
+	    drm_dp_pcon_hdmi_link_active(&intel_dp->aux))
+		return 0;
+
+	/* The connection mutex may be held already by the link retraining */
+	ret = drm_modeset_lock(&display->drm->mode_config.connection_mutex, ctx);
+	if (ret && ret != -EALREADY)
+		return ret;
+
+	ret = intel_dp_get_active_pipes(intel_dp, ctx, &pipe_mask);
+	if (ret)
+		return ret;
+
+	/* Without an active stream the next enable trains the link */
+	if (pipe_mask == 0)
+		return 0;
+
+	intel_dp_check_frl_training(intel_dp);
+
+	return 0;
+}
+
 void
 intel_dp_pcon_dsc_configure(struct intel_dp *intel_dp,
 			    const struct intel_crtc_state *crtc_state)
@@ -6063,8 +6099,11 @@ intel_dp_handle_hdmi_link_status_change(struct intel_dp *intel_dp)
 
 		intel_dp->frl.is_trained = false;
 
-		/* Restart FRL training or fall back to TMDS mode */
-		intel_dp_check_frl_training(intel_dp);
+		/*
+		 * Restart FRL training or fall back to TMDS mode, from the link
+		 * check work, where the modeset locks can be taken.
+		 */
+		intel_encoder_link_check_queue_work(&dp_to_dig_port(intel_dp)->base, 0);
 	}
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 1f4a3aff9abe..070f6229cc39 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -188,6 +188,8 @@ void intel_dp_sync_state(struct intel_encoder *encoder,
 			 const struct intel_crtc_state *crtc_state);
 
 void intel_dp_check_frl_training(struct intel_dp *intel_dp);
+int intel_dp_pcon_frl_recover(struct intel_encoder *encoder,
+			      struct drm_modeset_acquire_ctx *ctx);
 void intel_dp_pcon_dsc_configure(struct intel_dp *intel_dp,
 				 const struct intel_crtc_state *crtc_state);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index ac1aff6edf05..4f7c061223a3 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -2627,8 +2627,11 @@ void intel_dp_link_check(struct intel_encoder *encoder)
 	struct drm_modeset_acquire_ctx ctx;
 	int ret;
 
-	intel_modeset_lock_ctx_retry(&ctx, NULL, 0, ret)
+	intel_modeset_lock_ctx_retry(&ctx, NULL, 0, ret) {
 		ret = intel_dp_retrain_link(encoder, &ctx);
+		if (!ret)
+			ret = intel_dp_pcon_frl_recover(encoder, &ctx);
+	}
 }
 
 void intel_dp_check_link_state(struct intel_dp *intel_dp)
-- 
2.50.1

