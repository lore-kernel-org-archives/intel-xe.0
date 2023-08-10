Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9CCC04A94
	for <intel-xe@archiver.kernel.org>; Thu, 10 Aug 2023 07:22:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A7610E4C9;
	Thu, 10 Aug 2023 07:22:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CB310E4C9
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Aug 2023 07:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691652120; x=1723188120;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=saf9jXRZgucGJXkk4v2hOjix74due7FbZsPn9obFuHg=;
 b=HQTvcYJeCc/cQ5QLuZyxSS5klsFoOLwziZ1tefnP7eW/T2iipB85D2ic
 dIR3fAMByRLNk1gXpVRHzViTVLsQlncBs+W4yboEFTZBH9QFd0KN5ndtQ
 OIgcIb+Tbe6sYlBiD/sLWM1jyKmYPOYMamJ1C13GBufQogxuSYeIxH+BE
 7Yt+ZIZl3MngCzMSS6DJOlRCiwId8ZqnTZYTrdtD71mkDpOQNOGV4J7nt
 /IWCVTONZBJIUiMupYuwOnEcRnBlo19jTkYV37OCEgWh+G9Vuh5n5FIzY
 9cz6GunbxTdAdEHDeTxGgw8ckV6CAzcqoEG3CKo2Gvd5Sf02MoVtq8wGN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="375037580"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="375037580"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 00:21:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="761696788"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="761696788"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga008.jf.intel.com with ESMTP; 10 Aug 2023 00:21:19 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 10 Aug 2023 12:56:31 +0530
Message-Id: <20230810072631.722373-5-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230810072631.722373-1-himal.prasad.ghimiray@intel.com>
References: <20230810072631.722373-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 4/4] drm/xe: Process fatal hardware errors.
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
 drivers/gpu/drm/xe/regs/xe_gt_error_regs.h |  3 ++
 drivers/gpu/drm/xe/xe_irq.c                | 37 +++++++++++++++++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
index 27a54b7c278a..b389ddd140d0 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
@@ -42,6 +42,9 @@ enum gt_vctr_registers {
 						ERR_STAT_GT_COR_VCTR_REG(x) : \
 						ERR_STAT_GT_FATAL_VCTR_REG(x))
 
+#define DEV_PCIEERR_STATUS              XE_REG(0x100180)
+#define DEV_PCIEERR_IS_FATAL(x)         REG_BIT(x * 4 + 2)
+
 /* Count of GT Correctable and FATAL HW ERRORS */
 enum xe_gt_hw_errors {
 	XE_GT_HW_ERR_SUBSLICE_CORR,
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index ab29ac625d3a..7193744c2c45 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -784,6 +784,41 @@ xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
 	}
 }
 
+/**
+ * process_hw_errors - checks for the occurrence of HW errors
+ *
+ * This checks for the HW Errors including FATAL error that might
+ * have occurred in the previous boot of the driver which will
+ * initiate PCIe FLR reset of the device and cause the
+ * driver to reload.
+ */
+static void process_hw_errors(struct xe_device *xe)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
+	struct xe_gt *root_mmio = root_tile->primary_gt;
+
+	u32 dev_pcieerr_status, master_ctl;
+	struct xe_tile *tile;
+	int i;
+
+	update_valid_error_regs(xe);
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
+		xe_mmio_write32(mmio, GFX_MSTR_IRQ, master_ctl);
+		xe_hw_error_irq_handler(tile, master_ctl);
+	}
+	if (dev_pcieerr_status)
+		xe_mmio_write32(root_mmio, DEV_PCIEERR_STATUS, dev_pcieerr_status);
+}
+
 /*
  * Top-level interrupt handler for Xe_LP+ and beyond.  These platforms have
  * a "master tile" interrupt register which must be consulted before the
@@ -984,7 +1019,7 @@ int xe_irq_install(struct xe_device *xe)
 		return -EINVAL;
 	}
 
-	update_valid_error_regs(xe);
+	process_hw_errors(xe);
 
 	xe->irq.enabled = true;
 
-- 
2.25.1

