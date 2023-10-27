Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E181EC25B47
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 08:00:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A872B10E963;
	Fri, 27 Oct 2023 08:00:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1CF10E955
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 08:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698393631; x=1729929631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aPwancOLoC1ZLWlvFoWTy0yEN6GLiB5pIE1n877DnHk=;
 b=jnf3kH/hg1hq9v7m5TIATrXlMx3LJkdvz0Dw2Z+b3ThPrwvs4hV/Beti
 1G6vqMFqP/VRn1P28t5rNXtca9U4AlB3Jwv7XsIHoBqcals+y5tEKZSGI
 xGOazsBPwQwNOCwnnCiKMTXNLsJ7dA4oZDcKftLaaT9um9N6jlWSpUJ7n
 lJxvwzM2ooBWAkok6nnIZw/n5WLk0sVP06MYTFp5WnOXH3WNn/aCz7drl
 rbeQdXufhYROfZATUiSdSuYGwWWuRsPQ6dKUDpr99U637QuIY/1cIN/xj
 XbnxUziSG5zqDxD7YD+fmfWICDF9fshbvQJMLRBxaBPLuZnIDWOa8VoAu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="391603895"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="391603895"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 01:00:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="794510437"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="794510437"
Received: from inyestex-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.212.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 01:00:29 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 10:59:18 +0300
Message-Id: <20231027075918.2206862-32-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027075918.2206862-1-jouni.hogander@intel.com>
References: <20231027075918.2206862-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 31/31] fixup! drm/xe/display: Implement display
 support
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We can remove all display parameters from xe params as they are all
now available in xe_device->display->params.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 22 ----------------------
 drivers/gpu/drm/xe/xe_display.c      | 13 -------------
 2 files changed, 35 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 44d622d4cc3a..cb537cac1ef9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -474,30 +474,8 @@ struct xe_device {
 		unsigned int fsb_freq, mem_freq, is_ddr3;
 		u8 vblank_enabled;
 	};
-
 	struct {
-		/* Backlight: XXX: needs to be set to -1 */
-		s32 invert_brightness;
-		s32 vbt_sdvo_panel_type;
-		u32 edp_vswing;
-
-		/* PM support, needs to be -1 as well */
-		s32 disable_power_well;
-		s32 enable_dc;
-
 		const char *dmc_firmware_path;
-		s32 enable_dpcd_backlight;
-		s32 enable_dp_mst;
-		bool enable_dpt;
-		s32 enable_fbc;
-		s32 enable_psr;
-		bool enable_sagv;
-		bool psr_safest_params;
-		s32 enable_psr2_sel_fetch;
-
-		s32 panel_use_ssc;
-		const char *vbt_firmware;
-		u32 lvds_channel_mode;
 	} params;
 #endif
 };
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 77c71c7612ce..da10f16e1c12 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -115,19 +115,6 @@ int xe_display_create(struct xe_device *xe)
 	drmm_mutex_init(&xe->drm, &xe->display.hdcp.hdcp_mutex);
 	xe->enabled_irq_mask = ~0;
 
-	xe->params.invert_brightness = -1;
-	xe->params.vbt_sdvo_panel_type = -1;
-	xe->params.disable_power_well = -1;
-	xe->params.enable_dc = -1;
-	xe->params.enable_dpcd_backlight = -1;
-	xe->params.enable_dp_mst = -1;
-	xe->params.enable_dpt = true;
-	xe->params.enable_fbc = -1;
-	xe->params.enable_psr = -1;
-	xe->params.enable_psr2_sel_fetch = -1;
-	xe->params.enable_sagv = true;
-	xe->params.panel_use_ssc = -1;
-
 	err = drmm_add_action_or_reset(&xe->drm, display_destroy, NULL);
 	if (err)
 		return err;
-- 
2.34.1

