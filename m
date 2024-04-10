Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BA5CD129A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 08:39:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35D010E97C;
	Wed, 10 Apr 2024 08:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JBtzgXEl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEBDD10E2CE
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 08:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712738345; x=1744274345;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YUSXgCVLg6LLgaJmKVuZaazt87PxIqAuBv8QP7j8o0Q=;
 b=JBtzgXElC+p06svjTBImI+4R2lWdCVr/jWPSiLBnDEpBtMlIhCQpbANR
 W0KrJQvtdo/Pdg7BTmSq5yyQfLqPyILaLNFL5md2XWwJcu1YHvzOymtxJ
 aQ/TgHX7rrAF4TI42z/hd5DUEGY9nNa4IGToDKU8MoYoNdkmOcD1GRPMX
 ioQ7HfYdTRuRp5ccXK1llOmWQv3bRHB3QRYa+//sze5x49HEQhoRrGsXD
 Z7mYGCz8xnNnONYUH+aDMrxvvwqsT5oF+mHlOgJR5aBWklEbGmaTRq/h9
 jtXq98qC82ny+aQjJRqqUzSe/h5p4b30h9O6BJgQgI0lJ3PvDLgU4TwaE Q==;
X-CSE-ConnectionGUID: ws++iaz2S22TYnEKzWqH3Q==
X-CSE-MsgGUID: yOJCeW1EQvSJsby802CERA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11877656"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11877656"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 01:39:05 -0700
X-CSE-ConnectionGUID: HWAHACavR12OMqeonj2JZw==
X-CSE-MsgGUID: BVPvWqzWT0ygPgIN/5YKQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20556293"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 01:39:04 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com,
	anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com
Subject: [CI 2/2] drm/xe: re-order lmem init check and wait for initialization
 to complete
Date: Wed, 10 Apr 2024 14:20:05 +0530
Message-Id: <20240410085005.1126343-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240410085005.1126343-1-riana.tauro@intel.com>
References: <20240410085005.1126343-1-riana.tauro@intel.com>
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

Lmem init check should be done only after pcode initialization
status is complete. Move lmem init check after pcode status
check. Also wait for a short while after pcode status check
to allow completion of the task.

Failing to do so, can lead to aborting the module load
leaving the system unusable. Wait until the lmem initialization
is complete within a timeout (60s) or till the user aborts.

v2: use bool as return type
    re-order the code comment (Rodrigo)
    add comment for deferring probe (Himal)

v3: rebase

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 62 ++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_mmio.c   | 24 -------------
 drivers/gpu/drm/xe/xe_mmio.h   |  1 -
 3 files changed, 59 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index a05623a8c163..927e1370e2a0 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -422,12 +422,68 @@ static int xe_set_dma_info(struct xe_device *xe)
 	return err;
 }
 
+static bool verify_lmem_ready(struct xe_gt *gt)
+{
+	u32 val = xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT;
+
+	return !!val;
+}
+
+static int wait_for_lmem_ready(struct xe_device *xe)
+{
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	unsigned long timeout, start;
+
+	if (!IS_DGFX(xe))
+		return 0;
+
+	if (IS_SRIOV_VF(xe))
+		return 0;
+
+	if (verify_lmem_ready(gt))
+		return 0;
+
+	drm_dbg(&xe->drm, "Waiting for lmem initialization\n");
+
+	start = jiffies;
+	timeout = start + msecs_to_jiffies(60 * 1000); /* 60 sec! */
+
+	do {
+		if (signal_pending(current))
+			return -EINTR;
+
+		/*
+		 * The boot firmware initializes local memory and
+		 * assesses its health. If memory training fails,
+		 * the punit will have been instructed to keep the GT powered
+		 * down.we won't be able to communicate with it
+		 *
+		 * If the status check is done before punit updates the register,
+		 * it can lead to the system being unusable.
+		 * use a timeout and defer the probe to prevent this.
+		 */
+		if (time_after(jiffies, timeout)) {
+			drm_dbg(&xe->drm, "lmem not initialized by firmware\n");
+			return -EPROBE_DEFER;
+		}
+
+		msleep(20);
+
+	} while (!verify_lmem_ready(gt));
+
+	drm_dbg(&xe->drm, "lmem ready after %ums",
+		jiffies_to_msecs(jiffies - start));
+
+	return 0;
+}
+
 /**
  * xe_device_probe_early: Device early probe
  * @xe: xe device instance
  *
  * Initialize MMIO resources that don't require any
- * knowledge about tile count. Also initialize pcode
+ * knowledge about tile count. Also initialize pcode and
+ * check vram initialization on root tile.
  *
  * Return: 0 on success, error code on failure
  */
@@ -441,11 +497,11 @@ int xe_device_probe_early(struct xe_device *xe)
 
 	xe_sriov_probe_early(xe);
 
-	err = xe_mmio_verify_vram(xe);
+	err = xe_pcode_probe_early(xe);
 	if (err)
 		return err;
 
-	err = xe_pcode_probe_early(xe);
+	err = wait_for_lmem_ready(xe);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index d66da1a9f165..334637511e75 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -420,30 +420,6 @@ int xe_mmio_init(struct xe_device *xe)
 	return drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
 }
 
-int xe_mmio_verify_vram(struct xe_device *xe)
-{
-	struct xe_gt *gt = xe_root_mmio_gt(xe);
-
-	if (!IS_DGFX(xe))
-		return 0;
-
-	if (IS_SRIOV_VF(xe))
-		return 0;
-
-	/*
-	 * The boot firmware initializes local memory and assesses its health.
-	 * If memory training fails, the punit will have been instructed to
-	 * keep the GT powered down; we won't be able to communicate with it
-	 * and we should not continue with driver initialization.
-	 */
-	if (!(xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT)) {
-		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
-		return -ENODEV;
-	}
-
-	return 0;
-}
-
 u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index b1680c4a14fb..a3cd7b3036c7 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -21,7 +21,6 @@ struct xe_device;
 #define LMEM_BAR		2
 
 int xe_mmio_init(struct xe_device *xe);
-int xe_mmio_verify_vram(struct xe_device *xe);
 void xe_mmio_probe_tiles(struct xe_device *xe);
 
 u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg);
-- 
2.40.0

