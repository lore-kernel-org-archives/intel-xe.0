Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BB8C02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 19:36:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BAAB10E206;
	Wed, 12 Feb 2025 19:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aE4grfgh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F37210E26A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 19:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739388994; x=1770924994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q9Hx6iueZMLuwDj09jOH7ulSXij0ULjpgBBLeD9ZoYw=;
 b=aE4grfgh+WSZxTPIVbT6uLlHXH/9shTzkPXxkEx3TzqPy0luebuXyZ4h
 oJBvVAuFod4jUXIp4s3Js0KLAkQI8V3JCIYvdYz4pxVe6yezZS4Dh9EU0
 2cTWT0UEPMU+EQMMD6e1t4r6EClQm5yXudPVWEbj0yOP0mGciZlOjgQua
 7YT3fwp/3HPnQtXcyjZA6dUM9XxHNqUFOzPX21AaOW3SpYLuMHgGvHyTx
 nEg3eYcuKWZf7HUpEj9LId82j2APlWhrxhL8tq1vXkG/touMtR2WmqrqK
 P49F9XPuTTZVrDYCaZ7YaBAbXQ53ZzDOBhelGA/T6IxFBa+qY4IPtAOqW Q==;
X-CSE-ConnectionGUID: 4yjDk2kXS2qKs6FT2923Ow==
X-CSE-MsgGUID: MYRzL8lDSwig/8MGjdPa7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40184236"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40184236"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 11:36:34 -0800
X-CSE-ConnectionGUID: jeAYBjXkR06Nx83BEPr5OA==
X-CSE-MsgGUID: MVYdRqxlQOGAXbC52vIwbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="113437858"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 11:36:34 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 02/13] drm/xe: Fix xe_display_fini() calls
Date: Wed, 12 Feb 2025 11:35:49 -0800
Message-ID: <20250212193600.475089-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212193600.475089-1-lucas.demarchi@intel.com>
References: <20250212193600.475089-1-lucas.demarchi@intel.com>
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

xe_display_fini() undoes things from xe_display_init() (technically from
intel_display_driver_probe()). Those `goto err` in xe_device_probe()
were wrong and being accumulated over time.

Commit 65e366ace5ee ("drm/xe/display: Use a single early init call for
display") made it easier to fix now that we don't have xe_display_* init
calls spread on xe_device_probe(). Change xe_display_init() to use
devm_add_action_or_reset() that will finalize display in the right
order.

While at it, also add a newline and comment about calling
xe_driver_flr_fini.

Cc: Maarten Lankhorst <dev@lankhorst.se>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 22 ++++++++++++----------
 drivers/gpu/drm/xe/display/xe_display.h |  2 --
 drivers/gpu/drm/xe/xe_device.c          | 21 +++++++++++----------
 3 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 651799c946ace..bdcc56e51433f 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -161,27 +161,29 @@ int xe_display_init_early(struct xe_device *xe)
 	return err;
 }
 
-int xe_display_init(struct xe_device *xe)
+static void xe_display_fini(struct xe_device *__xe, void *arg)
 {
+	struct xe_device *xe = arg;
 	struct intel_display *display = &xe->display;
 
-	if (!xe->info.probe_display)
-		return 0;
-
-	return intel_display_driver_probe(display);
+	intel_hpd_poll_fini(xe);
+	intel_hdcp_component_fini(display);
+	intel_audio_deinit(display);
 }
 
-void xe_display_fini(struct xe_device *xe)
+int xe_display_init(struct xe_device *xe)
 {
 	struct intel_display *display = &xe->display;
+	int err;
 
 	if (!xe->info.probe_display)
-		return;
+		return 0;
 
-	intel_hpd_poll_fini(xe);
+	err = intel_display_driver_probe(display);
+	if (err)
+		return err;
 
-	intel_hdcp_component_fini(display);
-	intel_audio_deinit(display);
+	return xe_device_add_action_or_reset(xe, xe_display_fini, xe);
 }
 
 void xe_display_register(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index e2a99624f7064..685dc74402fb8 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -22,7 +22,6 @@ int xe_display_probe(struct xe_device *xe);
 
 int xe_display_init_early(struct xe_device *xe);
 int xe_display_init(struct xe_device *xe);
-void xe_display_fini(struct xe_device *xe);
 
 void xe_display_register(struct xe_device *xe);
 void xe_display_unregister(struct xe_device *xe);
@@ -54,7 +53,6 @@ static inline int xe_display_probe(struct xe_device *xe) { return 0; }
 
 static inline int xe_display_init_early(struct xe_device *xe) { return 0; }
 static inline int xe_display_init(struct xe_device *xe) { return 0; }
-static inline void xe_display_fini(struct xe_device *xe) {}
 
 static inline void xe_display_register(struct xe_device *xe) {}
 static inline void xe_display_unregister(struct xe_device *xe) {}
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 69bde506ee87e..d05171aac1eef 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -741,6 +741,7 @@ static int probe_has_flat_ccs(struct xe_device *xe)
 			"Flat CCS has been disabled in bios, May lead to performance impact");
 
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+
 	return 0;
 }
 
@@ -812,22 +813,26 @@ int xe_device_probe(struct xe_device *xe)
 	err = xe_devcoredump_init(xe);
 	if (err)
 		return err;
+
+	/*
+	 * From here on, if a step fails, make sure a Driver-FLR is triggereed
+	 */
 	err = devm_add_action_or_reset(xe->drm.dev, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
 
 	err = probe_has_flat_ccs(xe);
 	if (err)
-		goto err;
+		return err;
 
 	err = xe_vram_probe(xe);
 	if (err)
-		goto err;
+		return err;
 
 	for_each_tile(tile, xe, id) {
 		err = xe_tile_init_noalloc(tile);
 		if (err)
-			goto err;
+			return err;
 	}
 
 	/* Allocate and map stolen after potential VRAM resize */
@@ -841,17 +846,17 @@ int xe_device_probe(struct xe_device *xe)
 	 */
 	err = xe_display_init_early(xe);
 	if (err)
-		goto err;
+		return err;
 
 	for_each_tile(tile, xe, id) {
 		err = xe_tile_init(tile);
 		if (err)
-			goto err;
+			return err;
 	}
 
 	err = xe_irq_install(xe);
 	if (err)
-		goto err;
+		return err;
 
 	for_each_gt(gt, xe, id) {
 		last_gt = id;
@@ -913,8 +918,6 @@ int xe_device_probe(struct xe_device *xe)
 			break;
 	}
 
-err:
-	xe_display_fini(xe);
 	return err;
 }
 
@@ -1001,8 +1004,6 @@ void xe_device_remove(struct xe_device *xe)
 
 	xe_device_remove_display(xe);
 
-	xe_display_fini(xe);
-
 	xe_oa_fini(xe);
 
 	xe_heci_gsc_fini(xe);
-- 
2.48.1

