Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8B3CD6E49
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 04:29:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A68410E740;
	Wed, 27 May 2026 04:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gk27BkeP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2A510E715;
 Wed, 27 May 2026 04:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779856147; x=1811392147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xfFFPBpGWDTRA4T5zHd12kWmojeTaw8e/xXYHYFSIR8=;
 b=gk27BkePpJ8hqy/tsNJClBL82rbSfMo7QnOggEefjDe4Sm9vOKE9+VtL
 Pz1IkX90D1w/cU/QoA8hBHyPasAlHDNtWGwmDpL2AkRq2Menv9zjqVrk6
 dpVArnKTa9Ty8LZdCNgtLRWYIsFy3NNUpWNfqpHlnviOm7gOFkqndLX+J
 r07yjkZvvOMruf6GylQVV+DbpF2AatCtM/wf62Bgy1jFyTQ9xYr8iWFJB
 8LsJK4o4sJQWxdKQlC7Tv/i4/vjKJ9UG6CWQiZbMlGPNf+pN080NnMGeh
 FU/bhIAjkV9iCdzByhhg+tTQDs/59cDK0lg6AS0lLUchoQ+aWh0oELxlA g==;
X-CSE-ConnectionGUID: bQt2RkjISZ+E62tZpPG0uw==
X-CSE-MsgGUID: 9CP+HsLPQ1q4ax58uluMJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80405807"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="80405807"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 21:28:55 -0700
X-CSE-ConnectionGUID: rFlNP1pRSVGXA/WI6XGPQQ==
X-CSE-MsgGUID: 4QckJAxvRzmwFzY6cM3CcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="272452379"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 21:28:52 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 05/12] drm/i915/display: Add helper for AS SDP transmission
 time selection
Date: Wed, 27 May 2026 09:40:43 +0530
Message-ID: <20260527041050.601735-6-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260527041050.601735-1-ankit.k.nautiyal@intel.com>
References: <20260527041050.601735-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

AS SDP may be transmitted at T1 or T2 depending on Panel Replay and
Adaptive Sync SDP configuration as per DP 2.1. Current we are using
T1 only, but future PR/AS SDP modes/features may require T2 or dynamic
selection.

Introduce a helper to return the appropriate AS SDP transmission time so
that a single value is consistently used for programming PR_ALPM.
For now this returns T1.

v2: Avoid adding new member to crtc_state; use a helper. (Ville)
v3: Clarify why AS SDP transmission time is fixed to T1. (Ville)
v4: Return u8 from intel_dp_as_sdp_transmission_time(). (Ville)

Bspec: 68920
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 20 +++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_dp.c   | 11 +++++++++++
 drivers/gpu/drm/i915/display/intel_dp.h   |  2 ++
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index a7350ce8e716..c6963ea420cc 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -11,6 +11,7 @@
 #include "intel_crtc.h"
 #include "intel_de.h"
 #include "intel_display_types.h"
+#include "intel_display_utils.h"
 #include "intel_dp.h"
 #include "intel_dp_aux.h"
 #include "intel_psr.h"
@@ -359,6 +360,23 @@ void intel_alpm_lobf_compute_config(struct intel_dp *intel_dp,
 	crtc_state->has_lobf = true;
 }
 
+static u32 get_pr_alpm_as_sdp_transmission_time(const struct intel_crtc_state *crtc_state)
+{
+	u8 as_sdp_setup_time = intel_dp_as_sdp_transmission_time();
+
+	switch (as_sdp_setup_time) {
+	case DP_PR_AS_SDP_SETUP_TIME_T1:
+		return PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_T1;
+	case DP_PR_AS_SDP_SETUP_TIME_DYNAMIC:
+		return PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_T1_OR_T2;
+	case DP_PR_AS_SDP_SETUP_TIME_T2:
+		return PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_T2;
+	default:
+		MISSING_CASE(as_sdp_setup_time);
+		return PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_T1;
+	}
+}
+
 static void lnl_alpm_configure(struct intel_dp *intel_dp,
 			       const struct intel_crtc_state *crtc_state)
 {
@@ -382,7 +400,7 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
 			ALPM_CTL_AUX_LESS_WAKE_TIME(crtc_state->alpm_state.aux_less_wake_lines);
 
 		if (intel_dp->as_sdp_supported) {
-			u32 pr_alpm_ctl = PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_T1;
+			u32 pr_alpm_ctl = get_pr_alpm_as_sdp_transmission_time(crtc_state);
 
 			if (crtc_state->link_off_after_as_sdp_when_pr_active)
 				pr_alpm_ctl |= PR_ALPM_CTL_ALLOW_LINK_OFF_BETWEEN_AS_SDP_AND_SU;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 7ce45c28cc3a..64b3842adcce 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -7555,3 +7555,14 @@ bool intel_dp_joiner_candidate_valid(struct intel_connector *connector,
 
 	return true;
 }
+
+u8 intel_dp_as_sdp_transmission_time(void)
+{
+	/*
+	 * DP allows AS SDP position to move during PR active in some cases, but
+	 * software-controlled refresh rate changes with DC6v / ALPM require the
+	 * AS SDP to remain at T1. Use T1 unconditionally for now.
+	 */
+
+	return DP_PR_AS_SDP_SETUP_TIME_T1;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index f41480d24714..46a7f5c70981 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -241,4 +241,6 @@ bool intel_dp_joiner_candidate_valid(struct intel_connector *connector,
 	for ((__num_joined_pipes) = 1; (__num_joined_pipes) <= (I915_MAX_PIPES); (__num_joined_pipes)++) \
 		for_each_if(intel_dp_joiner_candidate_valid(__connector, (__mode)->hdisplay, __num_joined_pipes))
 
+u8 intel_dp_as_sdp_transmission_time(void);
+
 #endif /* __INTEL_DP_H__ */
-- 
2.45.2

