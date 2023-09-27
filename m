Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B519E810D2
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 11:40:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA6F10E4E4;
	Wed, 27 Sep 2023 11:40:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83B910E4E8
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 11:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695814818; x=1727350818;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zjUIJXu5K4Yln1CcsvtvBpi1fTx2iP6stci/lcxYuXQ=;
 b=YW1rp8fAMm1RiH8HvofGI74mfMBhqYoViazhgP+UXMNFAoTNQH8NEcmW
 i2uWzYdAG0OGbHF7sjCWc80Xj/zRPeMsOU0ZCagerLbJ0UUJFd84SJN4J
 43juIWKkrc0PnFQZ/POnj+3Pu/HNP2ZASKtdfmMrAYfnTGAXpBLiMnt+T
 sKp2kZQ63pW53OfFm9jEt3TZMzyn0gwXGoEjoLShlOWqLRT67d/DABcGi
 wI0PCr4nfkLUCF6VthDMIc5e879p5ycgG2wayMuVOSJOjJ6EyCE1nE5U0
 olxCMsXCWj7gy0Vwqbf/pDO/R5UM+peos52gOsVqCwEvVHrNXyUvkylpF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="366863199"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="366863199"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 04:40:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="872855569"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="872855569"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga004.jf.intel.com with ESMTP; 27 Sep 2023 04:40:15 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 27 Sep 2023 17:16:20 +0530
Message-Id: <20230927114627.136925-5-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
References: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 04/11] drm/xe: Process fatal hardware errors.
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fatal errors are reported as PCIe errors. When a PCIe error is asserted,
the OS will perform a device warm reset which causes the driver to reload.
The error registers are sticky and the values are maintained through a
warm reset. We read these registers during the boot flow of the driver and
increment the respective error counters.

Bspec: 53076

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h |  3 +++
 drivers/gpu/drm/xe/xe_hw_error.c  | 37 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_hw_error.h  |  3 ++-
 drivers/gpu/drm/xe/xe_irq.c       |  2 +-
 4 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 863df80d69bf..68bdb218bbe0 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -93,5 +93,8 @@
 #define   GT_DW_IRQ(x)				REG_BIT(x)
 #define   XE_ERROR_IRQ(x)			REG_BIT(26 + (x))
 
+#define DEV_PCIEERR_STATUS			XE_REG(0x100180)
+#define   DEV_PCIEERR_IS_FATAL(x)		REG_BIT(x * 4 + 2)
+
 #define PVC_RP_STATE_CAP			XE_REG(0x281014)
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index deb020a509d2..9595e3369656 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -183,7 +183,7 @@ static const struct err_msg_cntr_pair err_stat_gt_correctable_vectr_reg[] = {
 	[2 ... 3]         = {"L3BANK",		XE_GT_HW_ERR_L3BANK_CORR},
 };
 
-void xe_assign_hw_err_regs(struct xe_device *xe)
+static void xe_assign_hw_err_regs(struct xe_device *xe)
 {
 	const struct err_msg_cntr_pair **dev_err_stat = xe->hw_err_regs.dev_err_stat;
 	const struct err_msg_cntr_pair **err_stat_gt = xe->hw_err_regs.err_stat_gt;
@@ -417,3 +417,38 @@ xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
 			xe_hw_error_source_handler(tile, hw_err);
 	}
 }
+
+/**
+ * process_hw_errors - checks for the occurrence of HW errors
+ *
+ * This checks for the HW Errors including FATAL errors that might
+ * have occurred in the previous boot of the driver which will
+ * initiate PCIe FLR reset of the device and cause the
+ * driver to reload.
+ */
+void xe_process_hw_errors(struct xe_device *xe)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
+	struct xe_gt *root_mmio = root_tile->primary_gt;
+
+	u32 dev_pcieerr_status, master_ctl;
+	struct xe_tile *tile;
+	int i;
+
+	xe_assign_hw_err_regs(xe);
+
+	dev_pcieerr_status = xe_mmio_read32(root_mmio, DEV_PCIEERR_STATUS);
+
+	for_each_tile(tile, xe, i) {
+		struct xe_gt *mmio = tile->primary_gt;
+
+		if (dev_pcieerr_status & DEV_PCIEERR_IS_FATAL(i))
+			xe_hw_error_source_handler(tile, HARDWARE_ERROR_FATAL);
+
+		master_ctl = xe_mmio_read32(mmio, GFX_MSTR_IRQ);
+		xe_hw_error_irq_handler(tile, master_ctl);
+		xe_mmio_write32(mmio, GFX_MSTR_IRQ, master_ctl);
+	}
+	if (dev_pcieerr_status)
+		xe_mmio_write32(root_mmio, DEV_PCIEERR_STATUS, dev_pcieerr_status);
+}
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
index 3fcbbcc338fe..2812407dd4bf 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.h
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -104,5 +104,6 @@ struct xe_device;
 struct xe_tile;
 
 void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
-void xe_assign_hw_err_regs(struct xe_device *xe);
+void xe_process_hw_errors(struct xe_device *xe);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 68f5f7b6a74e..06c9b43e2c71 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -592,7 +592,7 @@ int xe_irq_install(struct xe_device *xe)
 		return -EINVAL;
 	}
 
-	xe_assign_hw_err_regs(xe);
+	xe_process_hw_errors(xe);
 
 	xe->irq.enabled = true;
 
-- 
2.25.1

