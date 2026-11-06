Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B431D606D60D
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 09:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DwISt0pq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A48211204C;
	Fri,  6 Nov 2026 09:41:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9044410F11D;
 Fri,  6 Nov 2026 09:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793958077; x=1825494077;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3mmGsJJLvcTdLqF25nFrJCCHKxPAO4kHFM/q5RJoi+E=;
 b=DwISt0pqX+Wu2YFe0n/iCj+y3XBwcc+ResPURsoAhwAxzj7tiJpxdY73
 qYtKQFwFVxuspLNRjFTuHyUgHDFYu916E2MGdVnj+GepfgR7H5rLdMG5W
 H2QU2t9b8T9lrKCVc3ZdkOi74YY+DZl730XlD8gJr1FmBc0dMt8hwDuZ1
 PT4Wm7UaKMMLKXI4dtW7z1GiFwq7kuX5qYmwrsB1+4tp13ul723aSEwBv
 aC3r24zDztxFkrahBdJm7NeutAZmWlDFeNHEFllhFxCch5fKcDlVJVHa/
 d+5YJyiPMAVWxnFFLjrBgu8kDO6lKPLkAQeNf4nIUU2k8xttmax66GVG4 A==;
X-CSE-ConnectionGUID: rMCkFjrtQ4eM7bIcM7WEGQ==
X-CSE-MsgGUID: 6wKHdgwGQG6uilALGEgyuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2790450"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2790450"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 01:41:16 -0800
X-CSE-ConnectionGUID: L/JWYnBbT1azoABdSo92vg==
X-CSE-MsgGUID: Tz/gIcsGR0GhBVM0ldoYwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7575493"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa001.fm.intel.com with ESMTP; 06 Nov 2026 01:41:16 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH] drm/i915/display: Limit the eDP joiner to the pipe A and B
 pair
Date: Fri,  6 Nov 2026 09:41:13 +0000
Message-ID: <20261106094113.2917630-1-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
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

eDP only works joined as the pipe A and B pair, other consecutive pairs
fail to come up. Keep the eDP joiner primary on pipe A. DP and unjoined
eDP are unaffected.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index ef164a797618..b359a66a018f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1362,16 +1362,27 @@ static int intel_dp_mso_pixel_clock(struct intel_dp *intel_dp, int pixel_clock)
 	return pixel_clock / intel_dp->mso_link_count;
 }
 
+/* eDP can only be joined as the pipe A and B pair. */
+static u8 intel_dp_joiner_valid_primary_pipe_mask(struct intel_dp *intel_dp,
+						  int num_joined_pipes)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+	u8 pipe_mask = intel_joiner_valid_primary_pipe_mask(display, num_joined_pipes);
+
+	if (num_joined_pipes > 1 && intel_dp_is_edp(intel_dp))
+		pipe_mask &= BIT(PIPE_A);
+
+	return pipe_mask;
+}
+
 static
 bool intel_dp_can_join(struct intel_dp *intel_dp,
 		       int num_joined_pipes)
 {
-	struct intel_display *display = to_intel_display(intel_dp);
-
 	if (num_joined_pipes > 1 && !intel_dp_has_joiner(intel_dp))
 		return false;
 
-	return intel_joiner_valid_primary_pipe_mask(display, num_joined_pipes);
+	return intel_dp_joiner_valid_primary_pipe_mask(intel_dp, num_joined_pipes);
 }
 
 bool intel_dp_dotclk_valid(struct intel_display *display,
@@ -3083,7 +3094,6 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
 			     struct drm_connector_state *conn_state,
 			     bool respect_downstream_limits)
 {
-	struct intel_display *display = to_intel_display(encoder);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct intel_connector *connector =
 		to_intel_connector(conn_state->connector);
@@ -3099,7 +3109,8 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
 
 	for_each_joiner_candidate(connector, adjusted_mode, num_joined_pipes) {
 		/* If the pipe can't be a joiner primary, skip early. */
-		if (!(intel_joiner_valid_primary_pipe_mask(display, num_joined_pipes) & BIT(crtc->pipe)))
+		if (!(intel_dp_joiner_valid_primary_pipe_mask(intel_dp, num_joined_pipes) &
+		      BIT(crtc->pipe)))
 			continue;
 
 		/*
-- 
2.43.0

