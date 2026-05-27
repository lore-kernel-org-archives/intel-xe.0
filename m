Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66535CD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 04:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2574210E74B;
	Wed, 27 May 2026 04:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jgSMv9zP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70C210E744;
 Wed, 27 May 2026 04:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779856155; x=1811392155;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7qHL3V6jKnXzkrS2PEbOaMY5JXK1+OFeIDWiVIghjCE=;
 b=jgSMv9zP5O0BX+fxkXIMHIOPlI0YPzL+2x94dq3euLiMoCfvjGTcXf+b
 7i/sgxBGnguI6bLuhXX9nzs3PMu40Alf5JRJdDKbFvSZoIeaDaLPXlNiD
 Q0i8I/wjPvR0sW+0cDDASnx9OIcI5b7WxRSu7+/Y5p4M+VH6zxj9cpheM
 CPDQ5pR0AUwBAItbisBSbxrMqaQ+rNepomIdj0aL/8poLH0AXR7NlefQX
 a3ThxOUWna7X4CSAQMg1wfajwFoTKjoqXoaq3UqUMsH+O1CwuGtIoaRrs
 5LgFpFpM6dM+ziJuiNJPeZji6i5ogIgIo587jn+vBJk+LAT/sWl4+kNPX Q==;
X-CSE-ConnectionGUID: slCdBVvlSQm8UKRQXMHWgQ==
X-CSE-MsgGUID: 4GUCtjLkSteEG+ktDpBHyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80405831"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="80405831"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 21:29:11 -0700
X-CSE-ConnectionGUID: H0RZEwQ2R5q24yFkkqo1Ww==
X-CSE-MsgGUID: /iRciQ8FSzeamlDEegdecg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="272452460"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 21:29:10 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 12/12] drm/i915/dp: Account for AS_SDP guardband only when
 enabled
Date: Wed, 27 May 2026 09:40:50 +0530
Message-ID: <20260527041050.601735-13-ankit.k.nautiyal@intel.com>
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

Currently the intel_dp_sdp_min_guardband() accounts for AS_SDP for all
platforms that support adaptive sync SDP even for configurations where
it cannot be enabled. Instead account for adaptive sync SDP guardband
only when it is enabled.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index a84fd6bb4053..c9236d6f656a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -7539,7 +7539,6 @@ int intel_dp_get_lines_for_sdp(const struct intel_crtc_state *crtc_state, u32 ty
 int intel_dp_sdp_min_guardband(const struct intel_crtc_state *crtc_state,
 			       bool assume_all_enabled)
 {
-	struct intel_display *display = to_intel_display(crtc_state);
 	int sdp_guardband = 0;
 
 	if (assume_all_enabled ||
@@ -7554,8 +7553,8 @@ int intel_dp_sdp_min_guardband(const struct intel_crtc_state *crtc_state,
 		sdp_guardband = max(sdp_guardband,
 				    intel_dp_get_lines_for_sdp(crtc_state, DP_SDP_PPS));
 
-	if ((assume_all_enabled && HAS_AS_SDP(display)) ||
-	    crtc_state->infoframes.enable & intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC))
+	if (crtc_state->infoframes.enable &
+	    intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC))
 		sdp_guardband = max(sdp_guardband,
 				    intel_dp_get_lines_for_sdp(crtc_state, DP_SDP_ADAPTIVE_SYNC));
 
-- 
2.45.2

