Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F186DCD4F3C
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 14:03:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B216E10EB23;
	Tue, 12 May 2026 14:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hD2zE4La";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F1910EB36;
 Tue, 12 May 2026 14:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778594624; x=1810130624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KQT6dl33Omeo3XEYXpYb6UD0fJMi34tApnhj8plFDRw=;
 b=hD2zE4LaqcGog2onJeMZBGLhyI3tCiCWgoU/WvhBEU+k6UnfSacNx1S8
 Gl8WRsXPosAzT7XiVuSsZ80JawdheE/44118eFcyIHPtxpEGtcx7waxCD
 hcZrNBnw7hshCg4+qZIHXGRja9iB2fH2YnFDw1VZSqSk50YNUATUMsLAS
 mDHG5xirz0Ts65grWqD79lMTxL7VqKv9wVKhzqnMDKvGPIWSCbbn2Wk7t
 w/n0RLybf76M8LgR+0PpQ0xHWGtXxugumPV0U8y8/YQmbhUmGf9T3omuY
 K10e6/aLtgBpHTPNJwUsm1JLik19SN1YTrhBUJ420fyqkMLHEbt5D4ddb A==;
X-CSE-ConnectionGUID: /V1nj3QUSwqABiuEwTA32Q==
X-CSE-MsgGUID: CASC8FXSR86MTg2JMe24ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="89806374"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="89806374"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 07:03:44 -0700
X-CSE-ConnectionGUID: 264Bo4Q+TaiN/crCZPByUA==
X-CSE-MsgGUID: tSmWko7hTqm10pVsu0R6ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="233311377"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa006.fm.intel.com with ESMTP; 12 May 2026 07:03:41 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v5 09/15] drm/i915/cmtg: Split CMTG support check from
 intel_cmtg_is_allowed()
Date: Tue, 12 May 2026 19:02:02 +0530
Message-Id: <20260512133208.1363116-10-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260512133208.1363116-1-animesh.manna@intel.com>
References: <20260512133208.1363116-1-animesh.manna@intel.com>
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

Introduce a dedicated hook to check whether CMTG is supported. This
helper is used in both the enable and disable sequences, while
intel_cmtg_is_allowed() is now used only in enable path.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index 2576121d0c3d..da08a6e0c4d0 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -82,6 +82,18 @@ static void intel_cmtg_dump_config(struct intel_display *display,
 		    str_yes_no(cmtg_config->trans_b_secondary));
 }
 
+static bool intel_cmtg_is_supported(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+
+	if ((cpu_transcoder == TRANSCODER_A || cpu_transcoder == TRANSCODER_B) &&
+	    DISPLAY_VER(display) == 35 && intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP))
+		return true;
+
+	return false;
+}
+
 static bool intel_cmtg_transcoder_is_secondary(struct intel_display *display,
 					       enum transcoder trans)
 {
@@ -190,10 +202,8 @@ void intel_cmtg_sanitize(struct intel_display *display)
 bool intel_cmtg_is_allowed(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
-	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 
-	if ((cpu_transcoder == TRANSCODER_A || cpu_transcoder == TRANSCODER_B) &&
-	    DISPLAY_VER(display) == 35 && intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP) &&
+	if (intel_cmtg_is_supported(crtc_state) &&
 	    intel_display_power_get_current_dc_state(display) == DC_STATE_EN_UPTO_DC3CO)
 		return true;
 
-- 
2.29.0

