Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA2ACD8C90
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 17:07:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6450810E69F;
	Wed, 10 Jun 2026 17:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WVfDXroD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3295910EB30;
 Wed, 10 Jun 2026 17:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781111261; x=1812647261;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JhZQ3l1iNGn6EpNWQcAzEd9NCkdLbENwP5W+s5v+nPw=;
 b=WVfDXroDKapr8XROlme4QWxVgWC4gT+sSr2JjcGljxpT5pVJJgwbv2GU
 Ckv2ilA67SLOrV8yDpO5PUBZ5075/5yCX94nNIN1ci4Dv5xAL/3FLRMvj
 Y0JDdWk1wLjppzYN3JulUntfqjt2acV0nJOTavdjEDOBiBULFUktdk2QF
 0IqlY5pdNTu3CHFUkXL3pfnuv8G0SIhetdyYJ4Z+XNtwlAQzrd4TLcJcf
 dzJYIbVpiSZC0yCcV9mplvL1fI3O7QfGbNanzoDnp+iX9uAttxUTeLk1T
 pjRzKRFMSxMg8vVY044bTCQmiTGnwyLcUrPeb4FGvtl/SK6t80eSHKHQs A==;
X-CSE-ConnectionGUID: bKZDCfZQRHqNtOUB7W6FNw==
X-CSE-MsgGUID: xOw/kSgkTzuXISvluZyENg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82103732"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="82103732"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 10:07:40 -0700
X-CSE-ConnectionGUID: JVXDCKpYSY6Rj5w2lGk8cw==
X-CSE-MsgGUID: FR/fkKCFQWSITQMEuMtmSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="251325782"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.62])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 10:07:38 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 09/14] drm/i915/cdclk: Unify pcode related debugs
Date: Wed, 10 Jun 2026 20:06:46 +0300
Message-ID: <20260610170652.5320-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260610170652.5320-1-ville.syrjala@linux.intel.com>
References: <20260610170652.5320-1-ville.syrjala@linux.intel.com>
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

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 65 ++++++++++++----------
 1 file changed, 36 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 09981a112db4..542724256d0f 100644
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
@@ -2263,8 +2269,7 @@ static void bxt_set_cdclk(struct intel_display *display,
 
 	if (ret) {
 		drm_err(display->drm,
-			"Failed to inform PCU about cdclk change (err %d, freq %d)\n",
-			ret, cdclk);
+			"Failed to inform PCODE about start of CDCLK change (%d)\n", ret);
 		return;
 	}
 
@@ -2299,8 +2304,7 @@ static void bxt_set_cdclk(struct intel_display *display,
 						       cdclk_config->voltage_level, 2);
 	if (ret)
 		drm_err(display->drm,
-			"PCode CDCLK freq set failed, (err %d, freq %d)\n",
-			ret, cdclk);
+			"Failed to inform PCODE about end of CDCLK change (%d)\n", ret);
 
 	intel_update_cdclk(display);
 
@@ -2571,14 +2575,13 @@ void intel_cdclk_dump_config(struct intel_display *display,
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
@@ -2589,14 +2592,10 @@ static void dg2_cdclk_pcode_notify(struct intel_display *display,
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
@@ -2674,6 +2673,7 @@ static void dg2_cdclk_pcode_pre_notify(struct intel_atomic_state *state)
 		intel_atomic_get_new_cdclk_state(state);
 	unsigned int cdclk = 0; u8 voltage_level, num_active_pipes = 0;
 	bool change_cdclk, update_pipe_count;
+	int ret;
 
 	if (!intel_cdclk_changed(&old_cdclk_state->actual,
 				 &new_cdclk_state->actual) &&
@@ -2708,8 +2708,11 @@ static void dg2_cdclk_pcode_pre_notify(struct intel_atomic_state *state)
 	if (update_pipe_count)
 		num_active_pipes = dg2_power_well_count(display, new_cdclk_state);
 
-	dg2_cdclk_pcode_notify(display, voltage_level, num_active_pipes, cdclk,
-			       change_cdclk, update_pipe_count);
+	ret = dg2_cdclk_pcode_notify(display, voltage_level, num_active_pipes, cdclk,
+				     change_cdclk, update_pipe_count);
+	if (ret)
+		drm_err(display->drm,
+			"Failed to inform PCODE about start of CDCLK change (%d)\n", ret);
 }
 
 static void dg2_cdclk_pcode_post_notify(struct intel_atomic_state *state)
@@ -2721,6 +2724,7 @@ static void dg2_cdclk_pcode_post_notify(struct intel_atomic_state *state)
 		intel_atomic_get_old_cdclk_state(state);
 	unsigned int cdclk = 0; u8 voltage_level, num_active_pipes = 0;
 	bool update_cdclk, update_pipe_count;
+	int ret;
 
 	/* According to "Sequence After Frequency Change", set voltage to used level */
 	voltage_level = new_cdclk_state->actual.voltage_level;
@@ -2747,8 +2751,11 @@ static void dg2_cdclk_pcode_post_notify(struct intel_atomic_state *state)
 	if (update_pipe_count)
 		num_active_pipes = dg2_power_well_count(display, new_cdclk_state);
 
-	dg2_cdclk_pcode_notify(display, voltage_level, num_active_pipes, cdclk,
-			       update_cdclk, update_pipe_count);
+	ret = dg2_cdclk_pcode_notify(display, voltage_level, num_active_pipes, cdclk,
+				     update_cdclk, update_pipe_count);
+	if (ret)
+		drm_err(display->drm,
+			"Failed to inform PCODE about end of CDCLK change (%d)\n", ret);
 }
 
 bool intel_cdclk_is_decreasing_later(struct intel_atomic_state *state)
-- 
2.53.0

