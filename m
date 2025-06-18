Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF26C7115D
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 18:50:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7C510E8CE;
	Wed, 18 Jun 2025 18:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SEM1UyiY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B5F10E43D
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Jun 2025 18:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750272612; x=1781808612;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dDINoXszJr0JVvSz54g1/8o6ZmO7MCG8FN0tF4+Mi8g=;
 b=SEM1UyiYaRk7dB5B4V1pQpLK2IcZuHlaJ0ypJgvEwskL2xo+y0Mm+DbQ
 I0i+OjO8lc8oTBeMa+Gbg3txFIatyjq0usV+sCQIjCOQsfpvzn/Xxvou8
 YRZSjunMgFnFFtCH4xJA+t2IZkHC5N5MN2RA+Ji415NJq8Icb9YxjZQGD
 BkdLscfsn0Bk5mpNT5mJIXRSCA/5y2LmjkD4j4PyWZEinoSzrs0NVl45r
 69V8ZoY0C3XCAMGkZ04XNnEp2CWdbTVOo3ufEzLnpicmNNDMgJtbEPv3l
 NYRG8HslySHSs48nx3OrfYGLISZeGye6RqQ2SG77/Q/B1Jmkx7ZWSVv1X w==;
X-CSE-ConnectionGUID: ugASk8gvSx2b6vFAKKJDsg==
X-CSE-MsgGUID: D91gAascSZ+CjLX4DJwh8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="75036861"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="75036861"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 11:50:11 -0700
X-CSE-ConnectionGUID: Qowtakb+Tcij8JPZEBNAWg==
X-CSE-MsgGUID: +TrJpdILShG33O4WEDgCNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="150730705"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 11:50:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v5 3/4] drm/xe: Split xe_device_td_flush()
Date: Wed, 18 Jun 2025 11:50:00 -0700
Message-ID: <20250618-wa-22019338487-v5-3-b888388477f2@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618-wa-22019338487-v5-0-b888388477f2@intel.com>
References: <20250618-wa-22019338487-v5-0-b888388477f2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-a7f9c
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

xe_device_td_flush() has 2 possible implementations: an entire L2 flush
or a transient flush, depending on WA 16023588340. Make this clear by
splitting the function so it calls each of them.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 68 +++++++++++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8cfcfff250ca5..8396612b68d4b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -981,38 +981,15 @@ void xe_device_wmb(struct xe_device *xe)
 		xe_mmio_write32(xe_root_tile_mmio(xe), VF_CAP_REG, 0);
 }
 
-/**
- * xe_device_td_flush() - Flush transient L3 cache entries
- * @xe: The device
- *
- * Display engine has direct access to memory and is never coherent with L3/L4
- * caches (or CPU caches), however KMD is responsible for specifically flushing
- * transient L3 GPU cache entries prior to the flip sequence to ensure scanout
- * can happen from such a surface without seeing corruption.
- *
- * Display surfaces can be tagged as transient by mapping it using one of the
- * various L3:XD PAT index modes on Xe2.
- *
- * Note: On non-discrete xe2 platforms, like LNL, the entire L3 cache is flushed
- * at the end of each submission via PIPE_CONTROL for compute/render, since SA
- * Media is not coherent with L3 and we want to support render-vs-media
- * usescases. For other engines like copy/blt the HW internally forces uncached
- * behaviour, hence why we can skip the TDF on such platforms.
+/*
+ * Issue a TRANSIENT_FLUSH_REQUEST and wait for completion on each gt.
  */
-void xe_device_td_flush(struct xe_device *xe)
+static void tdf_request_sync(struct xe_device *xe)
 {
-	struct xe_gt *gt;
 	unsigned int fw_ref;
+	struct xe_gt *gt;
 	u8 id;
 
-	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) < 20)
-		return;
-
-	if (XE_WA(xe_root_mmio_gt(xe), 16023588340)) {
-		xe_device_l2_flush(xe);
-		return;
-	}
-
 	for_each_gt(gt, xe, id) {
 		if (xe_gt_is_media_type(gt))
 			continue;
@@ -1022,6 +999,7 @@ void xe_device_td_flush(struct xe_device *xe)
 			return;
 
 		xe_mmio_write32(&gt->mmio, XE2_TDF_CTRL, TRANSIENT_FLUSH_REQUEST);
+
 		/*
 		 * FIXME: We can likely do better here with our choice of
 		 * timeout. Currently we just assume the worst case, i.e. 150us,
@@ -1052,15 +1030,49 @@ void xe_device_l2_flush(struct xe_device *xe)
 		return;
 
 	spin_lock(&gt->global_invl_lock);
-	xe_mmio_write32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1);
 
+	xe_mmio_write32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1);
 	if (xe_mmio_wait32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1, 0x0, 500, NULL, true))
 		xe_gt_err_once(gt, "Global invalidation timeout\n");
+
 	spin_unlock(&gt->global_invl_lock);
 
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
+/**
+ * xe_device_td_flush() - Flush transient L3 cache entries
+ * @xe: The device
+ *
+ * Display engine has direct access to memory and is never coherent with L3/L4
+ * caches (or CPU caches), however KMD is responsible for specifically flushing
+ * transient L3 GPU cache entries prior to the flip sequence to ensure scanout
+ * can happen from such a surface without seeing corruption.
+ *
+ * Display surfaces can be tagged as transient by mapping it using one of the
+ * various L3:XD PAT index modes on Xe2.
+ *
+ * Note: On non-discrete xe2 platforms, like LNL, the entire L3 cache is flushed
+ * at the end of each submission via PIPE_CONTROL for compute/render, since SA
+ * Media is not coherent with L3 and we want to support render-vs-media
+ * usescases. For other engines like copy/blt the HW internally forces uncached
+ * behaviour, hence why we can skip the TDF on such platforms.
+ */
+void xe_device_td_flush(struct xe_device *xe)
+{
+	struct xe_gt *root_gt;
+
+	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) < 20)
+		return;
+
+	root_gt = xe_root_mmio_gt(xe);
+	if (XE_WA(root_gt, 16023588340))
+		/* A transient flush is not sufficient: flush the L2 */
+		xe_device_l2_flush(xe);
+	else
+		tdf_request_sync(xe);
+}
+
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
 {
 	return xe_device_has_flat_ccs(xe) ?

-- 
2.49.0

