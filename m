Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D430EE49AD
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 05:34:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4538810E2BD;
	Wed, 23 Aug 2023 05:34:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F2410E2BD
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Aug 2023 05:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692768887; x=1724304887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1H1EptTvdAzApOVi5D48xIPYLIM5GkGJ68No2jVLVvI=;
 b=gu1Rzv8DrgH8rHCra592mmeg1kE98/9ENMh42jC8q4+PpZSh31bpYWlr
 SKv5Jgz+yclj49HgQEUQB2t6qroDQ2UKRuSlZfHFF80+hTxDgftsbO6ez
 O9EkM9xVbHGGGbX43zqLt9yWNML1AFuMizj6hwoLFJVQkL7PfJr1+8e5J
 rs4d2Ev5ES+vG03sGMegUst0aXRDxGwLR+nh8iV8zPpCldKTbf59hDfLl
 aMy9dWTONfWwvOlk0U/PGbr56r6DrlQpdPodiye7jbzF1KuWGR2zpzP2g
 h5PhyefNdq3QLE7YxuEVFlXITMwxIv1yz9YhKqYCpiNsJiTZyd/PXtLbx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="405072924"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="405072924"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 22:34:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="860191808"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="860191808"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga004.jf.intel.com with ESMTP; 22 Aug 2023 22:34:44 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 23 Aug 2023 11:10:15 +0530
Message-Id: <20230823054015.1427461-5-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230823054015.1427461-1-himal.prasad.ghimiray@intel.com>
References: <20230823054015.1427461-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 4/4] drm/xe: Process fatal hardware errors.
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
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
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
index e223975a5acf..b8f2b1762d3f 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -90,5 +90,8 @@
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
index 48b933234342..be152ebd6ce9 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -573,7 +573,7 @@ int xe_irq_install(struct xe_device *xe)
 		return -EINVAL;
 	}
 
-	xe_assign_hw_err_regs(xe);
+	xe_process_hw_errors(xe);
 
 	xe->irq.enabled = true;
 
-- 
2.25.1

