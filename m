Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D01EC88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 08:30:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8DF510E839;
	Wed, 16 Sep 2026 08:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L64pSsaF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A682E10E881;
 Wed, 16 Sep 2026 08:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789547404; x=1821083404;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=97rg7dNLjQwGrGPudZbdV6PVDNFM10qTDKe5UrB5gqs=;
 b=L64pSsaFwCdQtf1wNJHSoSExT/EZx8/DBz1qIRIMj6Y7iL2oRF45Yafp
 GT18jDc95XPF3PeAy94p14b/+VZtkDjTXbflL7QUXk+jUN6L3sykU0Bx2
 UuLP4LuqHT9R62kdapUL9NxjlmwHLAmov9uv2AKngdvLFmyP7YhiutBx1
 QLYMSkEJk1IMZYhTMxhbLsFK0eyC0SNjVcN09aOzpEfiinoA3eLcwefS2
 Q5e6H32CERrYfMs/H6bn3xgWc3FJtCiKvRpaezdC5duOP8qs3q9gXvWE8
 G1Dpnqnj3akqnBxsI3TgorZd7gaDZ+NncUNFwncwch/jIX6xAQVkncqc6 w==;
X-CSE-ConnectionGUID: n83svjIITvilwYB3FayK6g==
X-CSE-MsgGUID: WB3KIgyvQ+yxnz+C3UbU8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="429616"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="429616"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 01:30:03 -0700
X-CSE-ConnectionGUID: +7PJ70vbQ6yNBFgshGOMDA==
X-CSE-MsgGUID: zWtgIqnERtev+Y20FniYeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="276796727"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 01:30:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 04/11] drm/i915/ddi: switch to drm_dp_dpcd_write_byte()
Date: Wed, 16 Sep 2026 11:29:35 +0300
Message-ID: <f0652fabfd6143680decd826ec74cd5d1116195f.1789547331.git.jani.nikula@intel.com>
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

Use local ret variables for the return value instead of checking inline
where sensible. This improves clarity.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 9b3b526e5e55..fbf485a54dda 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -2331,12 +2331,14 @@ static void intel_dp_sink_set_msa_timing_par_ignore_state(struct intel_dp *intel
 							  bool enable)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
+	int ret;
 
 	if (!crtc_state->vrr.enable)
 		return;
 
-	if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_DOWNSPREAD_CTRL,
-			       enable ? DP_MSA_TIMING_PAR_IGNORE_EN : 0) <= 0)
+	ret = drm_dp_dpcd_write_byte(&intel_dp->aux, DP_DOWNSPREAD_CTRL,
+				     enable ? DP_MSA_TIMING_PAR_IGNORE_EN : 0);
+	if (ret < 0)
 		drm_dbg_kms(display->drm,
 			    "Failed to %s MSA_TIMING_PAR_IGNORE in the sink\n",
 			    str_enable_disable(enable));
@@ -2347,18 +2349,20 @@ static void intel_dp_sink_set_fec_ready(struct intel_dp *intel_dp,
 					bool enable)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
+	int ret;
 
 	if (!crtc_state->fec_enable)
 		return;
 
-	if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_FEC_CONFIGURATION,
-			       enable ? DP_FEC_READY : 0) <= 0)
+	ret = drm_dp_dpcd_write_byte(&intel_dp->aux, DP_FEC_CONFIGURATION,
+				     enable ? DP_FEC_READY : 0);
+	if (ret < 0)
 		drm_dbg_kms(display->drm, "Failed to set FEC_READY to %s in the sink\n",
 			    str_enabled_disabled(enable));
 
 	if (enable &&
-	    drm_dp_dpcd_writeb(&intel_dp->aux, DP_FEC_STATUS,
-			       DP_FEC_DECODE_EN_DETECTED | DP_FEC_DECODE_DIS_DETECTED) <= 0)
+	    drm_dp_dpcd_write_byte(&intel_dp->aux, DP_FEC_STATUS,
+				   DP_FEC_DECODE_EN_DETECTED | DP_FEC_DECODE_DIS_DETECTED) < 0)
 		drm_dbg_kms(display->drm, "Failed to clear FEC detected flags\n");
 }
 
-- 
2.47.3

