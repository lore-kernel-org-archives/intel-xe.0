Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA88606A321
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 06:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=doXLga2I
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AD1112013;
	Thu, 26 Nov 2026 06:35:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510F610FDE2;
 Thu, 26 Nov 2026 06:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795674927; x=1827210927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bv8MMKyzGNJObOdcjADQ8KStc0ptMCCq5E3r7z96gDA=;
 b=doXLga2ISM3QLG05b5/MJdrpolviw40gzup8Ju+nXKKB3DtqahNDWAq3
 VPzGiPx4NIWH/l2VfcOkeGaGM43E67OfLeWfNSGzhNlif0mZyu8+z1LMA
 gG9JYXiscccB08U05n0ouU/ouib42WaDVerRkS5dRSnq/sgWBrVrvxR66
 5QSC+H9BDQlKEWY6Mmlf4bR3CBJ3e7LmgQROq1xcgXmt76UI37O5R19Xz
 2OLV8V77N7/qu34aQzxoaC4TZuoXqqF7TnzCJYEIWN8KniE4kMFmCoy41
 3fwbTsUlaBZNP8aVF5gpOMJxAAB5eLeLjO8F5e2PiI9KStV1qwb8MjaEq A==;
X-CSE-ConnectionGUID: S5X+C+SmRdWkW9Phj5rOZQ==
X-CSE-MsgGUID: j82KPY9lRNS+vYWmrpJRtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4462672"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4462672"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 22:35:27 -0800
X-CSE-ConnectionGUID: e/wkqePpQUelUX6t25ILmQ==
X-CSE-MsgGUID: JUbcVDuRRm+TMEXh3VFVlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12346782"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2026 22:35:25 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 10/15] drm/i915/vrr: Split out setting the guardband
Date: Thu, 26 Nov 2026 12:04:54 +0530
Message-Id: <20261126063459.863698-11-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126063459.863698-1-suraj.kandpal@intel.com>
References: <20261126063459.863698-1-suraj.kandpal@intel.com>
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

Move setting the VRR guardband, and the vblank start and pipeline
full derived from it, out of intel_vrr_compute_guardband() into a
new intel_vrr_guardband_val(). Pipelock is going to use it to raise
the guardband of a tile to match the other tiles in its group.

No functional change.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 30 +++++++++++++++---------
 drivers/gpu/drm/i915/display/intel_vrr.h |  1 +
 2 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 47603c141298..ad88034c23f8 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -620,22 +620,13 @@ static bool intel_vrr_use_optimized_guardband(const struct intel_crtc_state *crt
 	return true;
 }
 
-void intel_vrr_compute_guardband(struct intel_crtc_state *crtc_state)
+void intel_vrr_guardband_val(struct intel_crtc_state *crtc_state, int guardband)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 	struct drm_display_mode *pipe_mode = &crtc_state->hw.pipe_mode;
-	int guardband;
 
-	if (!intel_vrr_possible(crtc_state))
-		return;
-
-	if (intel_vrr_use_optimized_guardband(crtc_state))
-		guardband = intel_vrr_compute_optimized_guardband(crtc_state);
-	else
-		guardband = crtc_state->vrr.vmin - adjusted_mode->crtc_vdisplay;
-
-	crtc_state->vrr.guardband = min(guardband, intel_vrr_max_guardband(crtc_state));
+	crtc_state->vrr.guardband = guardband;
 
 	if (intel_vrr_always_use_vrr_tg(display)) {
 		adjusted_mode->crtc_vblank_start  =
@@ -654,6 +645,23 @@ void intel_vrr_compute_guardband(struct intel_crtc_state *crtc_state)
 							     crtc_state->vrr.guardband);
 }
 
+void intel_vrr_compute_guardband(struct intel_crtc_state *crtc_state)
+{
+	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
+	int guardband;
+
+	if (!intel_vrr_possible(crtc_state))
+		return;
+
+	if (intel_vrr_use_optimized_guardband(crtc_state))
+		guardband = intel_vrr_compute_optimized_guardband(crtc_state);
+	else
+		guardband = crtc_state->vrr.vmin - adjusted_mode->crtc_vdisplay;
+
+	intel_vrr_guardband_val(crtc_state,
+				min(guardband, intel_vrr_max_guardband(crtc_state)));
+}
+
 static u32 trans_vrr_ctl(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.h b/drivers/gpu/drm/i915/display/intel_vrr.h
index 19c7990be1b2..225e2607c9df 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.h
+++ b/drivers/gpu/drm/i915/display/intel_vrr.h
@@ -24,6 +24,7 @@ void intel_vrr_check_modeset(struct intel_atomic_state *state);
 void intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 			      struct drm_connector_state *conn_state);
 void intel_vrr_compute_guardband(struct intel_crtc_state *crtc_state);
+void intel_vrr_guardband_val(struct intel_crtc_state *crtc_state, int guardband);
 void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state);
 void intel_vrr_enable(const struct intel_crtc_state *crtc_state);
 void intel_vrr_send_push(struct intel_dsb *dsb,
-- 
2.34.1

