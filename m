Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB00FA1FD3
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 16:26:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D5210EE87;
	Wed, 22 Apr 2026 16:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B3noxfQh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD17810EA67;
 Wed, 22 Apr 2026 16:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776875172; x=1808411172;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cdmv4G85gx10k2xJDy6ZZCCBPeMGi7zpBNW5/vF5JNA=;
 b=B3noxfQhaOfPXQXdHY8p9BYp7bJmWacg/t+zE81CTVwy62Iy7eFeLogg
 inSTa3Sk99Sht7cKil/rI9/wkLWsO3jd3lOw3TubGUno/TliWftE/NWiT
 XtP/XM1w00UdeTYFT/uEumUVu5OOe1XbDcWT+77/0UhzL4V6/XvZUoUgc
 QSVaOG7unbLTMeH9Xu3DVsWcp5E5TLk77wFfML9HOWW6j34+ZAFxHYLRp
 KWPXEgm/meBu3oBOAzM5fHbBjN6XsiAPlERBHj3BB8Dkgro/uPKc5K++B
 va3xXiM7DM/iIoUe3D5RPQlPcHSFtIhZfqev9OXqZ7x46kLCxE3yZE2sN w==;
X-CSE-ConnectionGUID: LPTDlKSGQqqv8eyRM4jqKw==
X-CSE-MsgGUID: kygx/X7NSQm4VPlA+lXQgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="95247597"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="95247597"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 09:26:11 -0700
X-CSE-ConnectionGUID: DWuqGAZsTDudBrvtT3lnzQ==
X-CSE-MsgGUID: 0IA2THHcQTWLBBVMst3CZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="227816130"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 09:26:09 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, uma.shankar@intel.com,
 suresh.kumar.kurmi@intel.com
Subject: [PATCH v2 04/13] drm/i915/display: Add DC3CO DC_STATE enable/disable
 support
Date: Wed, 22 Apr 2026 21:56:12 +0530
Message-ID: <20260422162622.1869831-5-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260422162622.1869831-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260422162622.1869831-1-dibin.moolakadan.subrahmanian@intel.com>
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

Add DC3CO handling to the dc_off power well sequencing and disable the
DMC wakelock when exiting DC3CO.

BSpec: 75253
Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 .../drm/i915/display/intel_display_power_well.c  | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
index b5e6437c3d8d..5e002d459e95 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
@@ -866,6 +866,13 @@ void gen9_set_dc_state(struct intel_display *display, u32 state)
 	power_domains->dc_state = val & mask;
 }
 
+static void xe3lpd_enable_dc3co(struct intel_display *display)
+{
+	drm_dbg_kms(display->drm, "Enabling DC3CO\n");
+	intel_dmc_wl_enable(display, DC_STATE_EN_UPTO_DC3CO);
+	gen9_set_dc_state(display, DC_STATE_EN_UPTO_DC3CO);
+}
+
 static void assert_can_enable_dc5(struct intel_display *display)
 {
 	enum i915_power_well_id high_pg;
@@ -1054,9 +1061,13 @@ void gen9_disable_dc_states(struct intel_display *display)
 	}
 
 	if (old_state == DC_STATE_EN_UPTO_DC5 ||
-	    old_state == DC_STATE_EN_UPTO_DC6)
+	    old_state == DC_STATE_EN_UPTO_DC6 ||
+	    old_state == DC_STATE_EN_UPTO_DC3CO)
 		intel_dmc_wl_disable(display);
 
+	if (old_state == DC_STATE_EN_UPTO_DC3CO)
+		return;
+
 	intel_cdclk_get_cdclk(display, &cdclk_config);
 	/* Can't read out voltage_level so can't use intel_cdclk_changed() */
 	drm_WARN_ON(display->drm,
@@ -1092,6 +1103,9 @@ static void gen9_dc_off_power_well_disable(struct intel_display *display,
 		return;
 
 	switch (power_domains->target_dc_state) {
+	case DC_STATE_EN_UPTO_DC3CO:
+		xe3lpd_enable_dc3co(display);
+		break;
 	case DC_STATE_EN_UPTO_DC6:
 		skl_enable_dc6(display);
 		break;
-- 
2.43.0

