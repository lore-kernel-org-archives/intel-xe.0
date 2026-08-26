Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F106C61DC2
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 13:41:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2771510ED2D;
	Wed, 26 Aug 2026 13:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dD0EAXWL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99EE910ED2A;
 Wed, 26 Aug 2026 13:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787751676; x=1819287676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bupp6mjkOZvK3d0LIhuY6ifoQVF/zbMP4RBzgaXDXjA=;
 b=dD0EAXWLwKdyJaZ9T/TBrXbOQC02b+Q2/ICgdp+J5oGOHmE2cn9WrrL2
 lJoGu6MwuqfhJObPNwOTNXg5UH7ITTQLNfEZd2oMpJb8Ezktc6seKd3z4
 MphUstr2H3erg+j7z8UWX2ygzfg+Tqic5NPJ0yyBodQH5KNdqf6TVHDid
 HJWxBCCyIBKzoFKVWPY8S1lqK+LkQuNmVsNTccFdJSMpSpPNEbVLlqaba
 8GFhS+3+hoCLjZeYCATUx6/bcIvfq+X3Bgd2iWRlvrFsSLT632tVTGw5n
 XVUObdcjbYo8YU9qquX0LZGlIF0v8RQC6A8kd/KMJRXtB4Z+Om8FDVfF9 w==;
X-CSE-ConnectionGUID: SLRQZy2qS3KU+Jjy39aA2A==
X-CSE-MsgGUID: tjqmiX3YRIujCKiqKA3OgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88360966"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88360966"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:41:16 -0700
X-CSE-ConnectionGUID: /w+MM54BQfOT+4RdY9wELA==
X-CSE-MsgGUID: EEBdZ/nAR6myb09X9vuHOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="271081808"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.39])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:41:15 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 09/14] drm/i915/cdclk: Unify pcode related debugs
Date: Wed, 26 Aug 2026 16:40:28 +0300
Message-ID: <20260826134033.13976-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260826134033.13976-1-ville.syrjala@linux.intel.com>
References: <20260826134033.13976-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The debug spew for the cdclk pcode per/post notify is very
inconsistent between different platforms. Unify it all to
the same form.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 65 ++++++++++++----------
 1 file changed, 36 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 53d6cb05e467..ba1684a99886 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -891,7 +891,7 @@ static void bdw_set_cdclk(struct intel_display *display,
 	ret = intel_parent_pcode_write(display, BDW_PCODE_DISPLAY_FREQ_CHANGE_REQ, 0x0);
 	if (ret) {
 		drm_err(display->drm,
-			"failed to inform pcode about cdclk change\n");
+			"Failed to inform PCODE about start of CDCLK change (%d)\n", ret);
 		return;
 	}
 
@@ -918,8 +918,11 @@ static void bdw_set_cdclk(struct intel_display *display,
 	if (ret)
 		drm_err(display->drm, "Switching back to LCPLL failed\n");
 
-	intel_parent_pcode_write(display, HSW_PCODE_DE_WRITE_FREQ_REQ,
-				 cdclk_config->voltage_level);
+	ret = intel_parent_pcode_write(display, HSW_PCODE_DE_WRITE_FREQ_REQ,
+				       cdclk_config->voltage_level);
+	if (ret)
+		drm_err(display->drm,
+			"Failed to inform PCODE about end of CDCLK change (%d)\n", ret);
 
 	intel_de_write(display, CDCLK_FREQ,
 		       DIV_ROUND_CLOSEST(cdclk, 1000) - 1);
@@ -1181,7 +1184,7 @@ static void skl_set_cdclk(struct intel_display *display,
 					 SKL_CDCLK_READY_FOR_CHANGE, 3);
 	if (ret) {
 		drm_err(display->drm,
-			"Failed to inform PCU about cdclk change (%d)\n", ret);
+			"Failed to inform PCODE about start of CDCLK change (%d)\n", ret);
 		return;
 	}
 
@@ -1221,8 +1224,11 @@ static void skl_set_cdclk(struct intel_display *display,
 	intel_de_posting_read(display, CDCLK_CTL);
 
 	/* inform PCU of the change */
-	intel_parent_pcode_write(display, SKL_PCODE_CDCLK_CONTROL,
-				 cdclk_config->voltage_level);
+	ret = intel_parent_pcode_write(display, SKL_PCODE_CDCLK_CONTROL,
+				       cdclk_config->voltage_level);
+	if (ret)
+		drm_err(display->drm,
+			"Failed to inform PCODE about end of CDCLK change (%d)\n", ret);
 
 	intel_update_cdclk(display);
 }
@@ -2290,8 +2296,7 @@ static void bxt_set_cdclk(struct intel_display *display,
 
 	if (ret) {
 		drm_err(display->drm,
-			"Failed to inform PCU about cdclk change (err %d, freq %d)\n",
-			ret, cdclk);
+			"Failed to inform PCODE about start of CDCLK change (%d)\n", ret);
 		return;
 	}
 
@@ -2326,8 +2331,7 @@ static void bxt_set_cdclk(struct intel_display *display,
 						       cdclk_config->voltage_level, 2);
 	if (ret)
 		drm_err(display->drm,
-			"PCode CDCLK freq set failed, (err %d, freq %d)\n",
-			ret, cdclk);
+			"Failed to inform PCODE about end of CDCLK change (%d)\n", ret);
 
 	intel_update_cdclk(display);
 
@@ -2620,14 +2624,13 @@ void intel_cdclk_dump_config(struct intel_display *display,
 		    cdclk_config->voltage_level);
 }
 
-static void dg2_cdclk_pcode_notify(struct intel_display *display,
-				   u8 voltage_level,
-				   u8 active_pipe_count,
-				   u16 cdclk,
-				   bool cdclk_update_valid,
-				   bool pipe_count_update_valid)
+static int dg2_cdclk_pcode_notify(struct intel_display *display,
+				  u8 voltage_level,
+				  u8 active_pipe_count,
+				  u16 cdclk,
+				  bool cdclk_update_valid,
+				  bool pipe_count_update_valid)
 {
-	int ret;
 	u32 update_mask = 0;
 
 	update_mask = DISPLAY_TO_PCODE_UPDATE_MASK(cdclk, active_pipe_count, voltage_level);
@@ -2638,14 +2641,10 @@ static void dg2_cdclk_pcode_notify(struct intel_display *display,
 	if (pipe_count_update_valid)
 		update_mask |= DISPLAY_TO_PCODE_PIPE_COUNT_VALID;
 
-	ret = intel_parent_pcode_request(display, SKL_PCODE_CDCLK_CONTROL,
-					 update_mask,
-					 SKL_CDCLK_READY_FOR_CHANGE,
-					 SKL_CDCLK_READY_FOR_CHANGE, 3);
-	if (ret)
-		drm_err(display->drm,
-			"Failed to inform PCU about display config (err %d)\n",
-			ret);
+	return intel_parent_pcode_request(display, SKL_PCODE_CDCLK_CONTROL,
+					  update_mask,
+					  SKL_CDCLK_READY_FOR_CHANGE,
+					  SKL_CDCLK_READY_FOR_CHANGE, 3);
 }
 
 static void intel_set_cdclk(struct intel_display *display,
@@ -2724,6 +2723,7 @@ static void dg2_cdclk_pcode_pre_notify(struct intel_atomic_state *state)
 	u8 voltage_level, num_active_pipes = 0;
 	bool change_cdclk, update_pipe_count;
 	unsigned int cdclk_mhz = 0;
+	int ret;
 
 	if (!intel_cdclk_changed(&old_cdclk_state->actual,
 				 &new_cdclk_state->actual) &&
@@ -2760,8 +2760,11 @@ static void dg2_cdclk_pcode_pre_notify(struct intel_atomic_state *state)
 	if (update_pipe_count)
 		num_active_pipes = dg2_power_well_count(display, new_cdclk_state);
 
-	dg2_cdclk_pcode_notify(display, voltage_level, num_active_pipes, cdclk_mhz,
-			       change_cdclk, update_pipe_count);
+	ret = dg2_cdclk_pcode_notify(display, voltage_level, num_active_pipes, cdclk_mhz,
+				     change_cdclk, update_pipe_count);
+	if (ret)
+		drm_err(display->drm,
+			"Failed to inform PCODE about start of CDCLK change (%d)\n", ret);
 }
 
 static void dg2_cdclk_pcode_post_notify(struct intel_atomic_state *state)
@@ -2774,6 +2777,7 @@ static void dg2_cdclk_pcode_post_notify(struct intel_atomic_state *state)
 	u8 voltage_level, num_active_pipes = 0;
 	bool update_cdclk, update_pipe_count;
 	unsigned int cdclk_mhz = 0;
+	int ret;
 
 	/* According to "Sequence After Frequency Change", set voltage to used level */
 	voltage_level = new_cdclk_state->actual.voltage_level;
@@ -2801,8 +2805,11 @@ static void dg2_cdclk_pcode_post_notify(struct intel_atomic_state *state)
 	if (update_pipe_count)
 		num_active_pipes = dg2_power_well_count(display, new_cdclk_state);
 
-	dg2_cdclk_pcode_notify(display, voltage_level, num_active_pipes, cdclk_mhz,
-			       update_cdclk, update_pipe_count);
+	ret = dg2_cdclk_pcode_notify(display, voltage_level, num_active_pipes, cdclk_mhz,
+				     update_cdclk, update_pipe_count);
+	if (ret)
+		drm_err(display->drm,
+			"Failed to inform PCODE about end of CDCLK change (%d)\n", ret);
 }
 
 bool intel_cdclk_is_decreasing_later(struct intel_atomic_state *state)
-- 
2.54.0

