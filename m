Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAF6C0218F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 22:31:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224BC10E226;
	Fri, 31 Jan 2025 22:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lQrgv9sP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB7110E257
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 22:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738362717; x=1769898717;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=As3NIgdrNa0uShHMd8ywVmaoWif4JY40oC/5gK2dp0w=;
 b=lQrgv9sPIRFK022mAQBdj0B5RT3H1igNGYYlDyY7XkpDgdFM9Jwk4PwZ
 PuAR83ruh0bewvJpxT8wQnmqT75mLJ5cFOlssscwIR4+12sQFuK5L1f2h
 GlgHldc0/q3UJzCAUgB4399I9wBdKI73nVSdC9JyKtZkRWtYtHSkUoLuP
 LxVs6F61ZP36hk/vcZdEBzlO0JXa+r00/nhJ5xOSb69BtYl6B9zuMZ55m
 +dO8BgG9FfjefplV3q930Ps3uGnLG+2xz5iZ7KLpDQd8VsN/tO0WWL9uZ
 o6GVzYFXTw56NCDzFcuofeS4/g647Hoi7Fuizi8It/9O6KcLHIguqjWBN w==;
X-CSE-ConnectionGUID: fD3F1G+7QkuOSqvLGFnZsg==
X-CSE-MsgGUID: T2M5vxZDQjiKw1Yc9M44ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38149059"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="38149059"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 14:31:56 -0800
X-CSE-ConnectionGUID: 6P/IcQSPQam6ZiOoU94FSw==
X-CSE-MsgGUID: /l3l1/j5QZeRHWA4S7NM8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110622310"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 14:31:56 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/7] drm/xe: Fix xe_display_fini() calls
Date: Fri, 31 Jan 2025 14:31:34 -0800
Message-ID: <20250131223140.4144292-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250131223140.4144292-1-lucas.demarchi@intel.com>
References: <20250131223140.4144292-1-lucas.demarchi@intel.com>
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
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 22 ++++++++++++----------
 drivers/gpu/drm/xe/display/xe_display.h |  2 --
 drivers/gpu/drm/xe/xe_device.c          | 19 ++++++++++---------
 3 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 651799c946ace..302f533af037d 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -161,27 +161,29 @@ int xe_display_init_early(struct xe_device *xe)
 	return err;
 }
 
-int xe_display_init(struct xe_device *xe)
+static void xe_display_fini(void *arg)
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
+	return devm_add_action_or_reset(xe->drm.dev, xe_display_fini, xe);
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
index 8a2763e8a6e27..589bbe21c32b4 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -734,6 +734,7 @@ static int probe_has_flat_ccs(struct xe_device *xe)
 			"Flat CCS has been disabled in bios, May lead to performance impact");
 
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+
 	return 0;
 }
 
@@ -802,22 +803,26 @@ int xe_device_probe(struct xe_device *xe)
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
@@ -831,12 +836,12 @@ int xe_device_probe(struct xe_device *xe)
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
@@ -896,8 +901,6 @@ int xe_device_probe(struct xe_device *xe)
 			break;
 	}
 
-err:
-	xe_display_fini(xe);
 	return err;
 }
 
@@ -918,8 +921,6 @@ void xe_device_remove(struct xe_device *xe)
 
 	xe_device_remove_display(xe);
 
-	xe_display_fini(xe);
-
 	xe_oa_fini(xe);
 
 	xe_heci_gsc_fini(xe);
-- 
2.48.0

