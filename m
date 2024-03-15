Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0D5C54E6A
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 09:55:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888F01120CB;
	Fri, 15 Mar 2024 09:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Is41q2pn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3311120CB
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 09:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710496504; x=1742032504;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qbsJU4u7sIs4CfewN3hpRk99JP2HpWZwmIoXMvbz8kg=;
 b=Is41q2pnc/BkysoMeLzaMEcKrPvIGZMvOCmpPCgA347HmtJT1/m+8cQo
 61c16UuS4qPrWlcaTehYhq3wsmnmOxBiC9vV9dJQNDBy7qRgvYIvjxf2v
 WPFC51lKU8xtxhMpXwUhkcxx/PaWsUXNBLmaCoWyXCh95DLLNG74LpmkN
 qmpuuXtCGFe7aKDXQyPxw1zcx4n5hdb0Yj1l0hD8wG+LSlM/ZONpU22ku
 lV461yVLG5PX6Fd6w7hp8ZUitFaxmBFY2HilZOy2VELLAxgh/DyOIYWpO
 /dOQ+ubPlCIxEcvWc8KOtiapoDkItM7egEdmqOUwpndIsSJld7tV841d+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="15906934"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="15906934"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 02:55:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="17225618"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 02:55:00 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v2 2/3] drm/xe: re-order lmem init check and wait for
 initialization to complete
Date: Fri, 15 Mar 2024 15:35:29 +0530
Message-Id: <20240315100530.3051944-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240315100530.3051944-1-riana.tauro@intel.com>
References: <20240315100530.3051944-1-riana.tauro@intel.com>
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

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 62 +++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_mmio.c   | 29 ----------------
 2 files changed, 61 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 23bb8e5ce3d7..50473329cce7 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -413,12 +413,68 @@ static int xe_set_dma_info(struct xe_device *xe)
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
@@ -438,6 +494,10 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = wait_for_lmem_ready(xe);
+	if (err)
+		return err;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 7ba2477452d7..7fc0c5453b21 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -360,30 +360,6 @@ static void mmio_fini(struct drm_device *drm, void *arg)
 		iounmap(xe->mem.vram.mapping);
 }
 
-static int xe_verify_lmem_ready(struct xe_device *xe)
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
 int xe_mmio_init(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -407,16 +383,11 @@ int xe_mmio_init(struct xe_device *xe)
 int xe_mmio_root_tile_init(struct xe_device *xe)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
-	int err;
 
 	/* Setup first tile; other tiles (if present) will be setup later. */
 	root_tile->mmio.size = SZ_16M;
 	root_tile->mmio.regs = xe->mmio.regs;
 
-	err = xe_verify_lmem_ready(xe);
-	if (err)
-		return err;
-
 	return 0;
 }
 
-- 
2.40.0

