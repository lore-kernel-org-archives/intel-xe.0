Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345A8CA0ED3
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 13:13:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78C910E419;
	Tue, 12 Sep 2023 13:13:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64F610E419
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 13:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694524402; x=1726060402;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I849JyADgwOcl+HG+SklpbtTKTR89WyZMLdhnLssDt8=;
 b=EzSfK5iL6n2OLvcYukKr/lOK1DQEnqJ3Plbc8/nVRMXl1zDOPYWcFsXZ
 01+DeQLYMfYb34jAbWXXSbjGbEvm5oQDfcJvKe91/mVMoxIflLyEayOt4
 rIVHCMQAtTG753tnNGn3zjtT8CwMfy9PAFdnv6EEGODc+Gdup+G3iQi7m
 rKlL4tDL8PzXmGdKLq7OOV5aHQepWOxaU4FioMnXZz0KNbs6S9hx0bzKp
 9SByBzAk3bBslyqujILl3PFZ5EeyyCxucMq4vJ0oalHRXfwMjRlE6SieO
 O60ZJ0GjTNEo2D45+FG0flxASp4O+WsWFFiiHjB4ArMlFnNZc77g8AB0F Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="464740129"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="464740129"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 06:13:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="737116353"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="737116353"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 06:13:18 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Tue, 12 Sep 2023 16:08:34 +0300
Message-Id: <20230912130835.2488728-4-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912130835.2488728-1-alexander.usyskin@intel.com>
References: <20230912130835.2488728-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/4] drm/xe/gsc: add gsc device support
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
Cc: linux-kernel@vger.kernel.org, Tomas Winkler <tomas.winkler@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Vitaly Lubart <vitaly.lubart@intel.com>

Create mei-gscfi auxiliary device and configure interrupts
to be consumed by mei-gsc device driver.

Signed-off-by: Vitaly Lubart <vitaly.lubart@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/xe/Kconfig       |   1 +
 drivers/gpu/drm/xe/Makefile      |   1 +
 drivers/gpu/drm/xe/xe_gt.c       |   4 +
 drivers/gpu/drm/xe/xe_gt_gsc.c   | 218 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_gsc.h   |  36 +++++
 drivers/gpu/drm/xe/xe_gt_types.h |   4 +
 drivers/gpu/drm/xe/xe_irq.c      |  11 +-
 7 files changed, 273 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_gsc.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_gsc.h

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 0a4ea965645b..9d396ca7708a 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -36,6 +36,7 @@ config DRM_XE
 	select DRM_SCHED
 	select MMU_NOTIFIER
 	select WANT_DEV_COREDUMP
+	select AUXILIARY_BUS
 	help
 	  Experimental driver for Intel Xe series GPUs
 
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 9a2245ffede2..9ba9389a2cfd 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -65,6 +65,7 @@ xe-y += xe_bb.o \
 	xe_gt_sysfs.o \
 	xe_gt_tlb_invalidation.o \
 	xe_gt_topology.o \
+	xe_gt_gsc.o \
 	xe_guc.o \
 	xe_guc_ads.o \
 	xe_guc_ct.o \
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 4c7f66647a04..f373c139e1a1 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -76,6 +76,8 @@ static void gt_fini(struct drm_device *drm, void *arg)
 
 	destroy_workqueue(gt->ordered_wq);
 
+	xe_gsc_fini(&gt->gsc);
+
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
 }
@@ -460,6 +462,8 @@ int xe_gt_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	xe_gsc_init(&gt->gsc, gt_to_xe(gt));
+
 	err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_gt_gsc.c b/drivers/gpu/drm/xe/xe_gt_gsc.c
new file mode 100644
index 000000000000..ed825c883da7
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_gsc.c
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2023, Intel Corporation. All rights reserved.
+ */
+
+#include <linux/irq.h>
+#include <linux/mei_aux.h>
+#include <linux/pci.h>
+#include <linux/sizes.h>
+
+#include "regs/xe_regs.h"
+#include "xe_drv.h"
+#include "xe_gt_gsc.h"
+#include "xe_gt_types.h"
+#include "xe_device_types.h"
+#include "xe_platform_types.h"
+
+#define GSC_BAR_LENGTH  0x00000FFC
+
+static void gsc_irq_mask(struct irq_data *d)
+{
+	/* generic irq handling */
+}
+
+static void gsc_irq_unmask(struct irq_data *d)
+{
+	/* generic irq handling */
+}
+
+static struct irq_chip gsc_irq_chip = {
+	.name = "gsc_irq_chip",
+	.irq_mask = gsc_irq_mask,
+	.irq_unmask = gsc_irq_unmask,
+};
+
+static inline struct xe_gt *gsc_to_gt(struct xe_gsc *gsc)
+{
+	return container_of(gsc, struct xe_gt, gsc);
+}
+
+static int gsc_irq_init(int irq)
+{
+	irq_set_chip_and_handler_name(irq, &gsc_irq_chip,
+				      handle_simple_irq, "gsc_irq_handler");
+
+	return irq_set_chip_data(irq, NULL);
+}
+
+/**
+ * struct gsc_def - graphics security controller heci interface definistions
+ *
+ * @name: name of the heci device
+ * @bar: address of the mmio bar
+ * @bar_size: size of the mmio bar
+ * @use_polling: indication of using polling mode for the device
+ * @slow_firmware: indication of whether the device is slow (needs longer timeouts)
+ */
+struct gsc_def {
+	const char *name;
+	unsigned long bar;
+	size_t bar_size;
+	bool use_polling;
+	bool slow_firmware;
+};
+
+/* gsc resources and definitions */
+static const struct gsc_def gsc_def_dg1 = {
+	.name = "mei-gscfi",
+	.bar = DG1_GSC_HECI2_BASE,
+	.bar_size = GSC_BAR_LENGTH,
+};
+
+static const struct gsc_def gsc_def_dg2 = {
+	.name = "mei-gscfi",
+	.bar = DG2_GSC_HECI2_BASE,
+	.bar_size = GSC_BAR_LENGTH,
+};
+
+static void gsc_release_dev(struct device *dev)
+{
+	struct auxiliary_device *aux_dev = to_auxiliary_dev(dev);
+	struct mei_aux_device *adev = auxiliary_dev_to_mei_aux_dev(aux_dev);
+
+	kfree(adev);
+}
+
+void xe_gsc_fini(struct xe_gsc *gsc)
+{
+	struct xe_gt *gt = gsc_to_gt(gsc);
+
+	if (!HAS_HECI_GSCFI(gt_to_xe(gt)))
+		return;
+
+	if (gsc->adev) {
+		struct auxiliary_device *aux_dev = &gsc->adev->aux_dev;
+
+		auxiliary_device_delete(aux_dev);
+		auxiliary_device_uninit(aux_dev);
+		gsc->adev = NULL;
+	}
+
+	if (gsc->irq >= 0)
+		irq_free_desc(gsc->irq);
+	gsc->irq = -1;
+}
+
+void xe_gsc_init(struct xe_gsc *gsc, struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct mei_aux_device *adev;
+	struct auxiliary_device *aux_dev;
+	const struct gsc_def *def;
+	int ret;
+
+	if (!HAS_HECI_GSCFI(xe))
+		return;
+
+	gsc->irq = -1;
+
+	/*
+	 * On the multi-tile setups the GSC is functional on the first tile only
+	 */
+	if (gsc_to_gt(gsc)->info.id != 0) {
+		drm_dbg(&xe->drm, "Not initializing gsc for remote tiles\n");
+		return;
+	}
+
+	if (xe->info.platform == XE_DG1) {
+		def = &gsc_def_dg1;
+	} else if (xe->info.platform == XE_DG2) {
+		def = &gsc_def_dg2;
+	} else {
+		drm_warn_once(&xe->drm, "Unknown platform\n");
+		return;
+	}
+
+	if (!def->name) {
+		drm_warn_once(&xe->drm, "HECI is not implemented!\n");
+		return;
+	}
+
+	/* skip irq initialization */
+	if (def->use_polling)
+		goto add_device;
+
+	gsc->irq = irq_alloc_desc(0);
+	if (gsc->irq < 0) {
+		drm_err(&xe->drm, "gsc irq error %d\n", gsc->irq);
+		goto fail;
+	}
+
+	ret = gsc_irq_init(gsc->irq);
+	if (ret < 0) {
+		drm_err(&xe->drm, "gsc irq init failed %d\n", ret);
+		goto fail;
+	}
+
+add_device:
+	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
+	if (!adev)
+		goto fail;
+	adev->irq = gsc->irq;
+	adev->bar.parent = &pdev->resource[0];
+	adev->bar.start = def->bar + pdev->resource[0].start;
+	adev->bar.end = adev->bar.start + def->bar_size - 1;
+	adev->bar.flags = IORESOURCE_MEM;
+	adev->bar.desc = IORES_DESC_NONE;
+	adev->slow_firmware = def->slow_firmware;
+
+	aux_dev = &adev->aux_dev;
+	aux_dev->name = def->name;
+	aux_dev->id = (pci_domain_nr(pdev->bus) << 16) |
+		      PCI_DEVID(pdev->bus->number, pdev->devfn);
+	aux_dev->dev.parent = &pdev->dev;
+	aux_dev->dev.release = gsc_release_dev;
+
+	ret = auxiliary_device_init(aux_dev);
+	if (ret < 0) {
+		drm_err(&xe->drm, "gsc aux init failed %d\n", ret);
+		kfree(adev);
+		goto fail;
+	}
+
+	gsc->adev = adev; /* needed by the notifier */
+	ret = auxiliary_device_add(aux_dev);
+	if (ret < 0) {
+		drm_err(&xe->drm, "gsc aux add failed %d\n", ret);
+		gsc->adev = NULL;
+
+		/* adev will be freed with the put_device() and .release sequence */
+		auxiliary_device_uninit(aux_dev);
+		goto fail;
+	}
+
+	return;
+fail:
+	xe_gsc_fini(gsc);
+}
+
+void xe_gsc_irq_handler(struct xe_gt *gt, u32 iir)
+{
+	int ret;
+
+	if ((iir & GSC_IRQ_INTF(1)) == 0)
+		return;
+
+	if (!HAS_HECI_GSCFI(gt_to_xe(gt))) {
+		drm_warn_once(&gt_to_xe(gt)->drm, "GSC irq: not supported");
+		return;
+	}
+
+	if (gt->gsc.irq < 0)
+		return;
+
+	ret = generic_handle_irq(gt->gsc.irq);
+	if (ret)
+		drm_err_ratelimited(&gt_to_xe(gt)->drm, "error handling GSC irq: %d\n", ret);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_gsc.h b/drivers/gpu/drm/xe/xe_gt_gsc.h
new file mode 100644
index 000000000000..91dba19e47c1
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_gsc.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2023, Intel Corporation. All rights reserved.
+ */
+#ifndef __XE_GSC_DEV_H__
+#define __XE_GSC_DEV_H__
+
+#include <linux/types.h>
+
+struct xe_device;
+struct xe_gt;
+struct mei_aux_device;
+
+/*
+ * The HECI1 bit corresponds to bit15 and HECI2 to bit14.
+ * The reason for this is to allow growth for more interfaces in the future.
+ */
+#define GSC_IRQ_INTF(_x)  BIT(15 - (_x))
+
+/**
+ * struct xe_gsc - graphics security controller for xe
+ *
+ * @adev : pointer to mei auxiliary device structure
+ * @irq : irq number
+ *
+ */
+struct xe_gsc {
+	struct mei_aux_device *adev;
+	int irq;
+};
+
+void xe_gsc_init(struct xe_gsc *gsc, struct xe_device *xe);
+void xe_gsc_fini(struct xe_gsc *gsc);
+void xe_gsc_irq_handler(struct xe_gt *gt, u32 iir);
+
+#endif /* __XE_GSC_DEV_H__ */
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index f11da12d3146..1b8ab32b488d 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -13,6 +13,7 @@
 #include "xe_reg_sr_types.h"
 #include "xe_sa_types.h"
 #include "xe_uc_types.h"
+#include "xe_gt_gsc.h"
 
 struct xe_exec_queue_ops;
 struct xe_migrate;
@@ -267,6 +268,9 @@ struct xe_gt {
 	/** @uc: micro controllers on the GT */
 	struct xe_uc uc;
 
+	/** @gsc: graphics security controller */
+	struct xe_gsc gsc;
+
 	/** @gtidle: idle properties of GT */
 	struct xe_gt_idle gtidle;
 
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 1dee3e832eb5..1ae4cc9f1522 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -128,6 +128,7 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 ccs_mask, bcs_mask;
 	u32 irqs, dmask, smask;
+	u32 gsc_mask = GSC_IRQ_INTF(1);
 
 	if (xe_device_guc_submission_enabled(xe)) {
 		irqs = GT_RENDER_USER_INTERRUPT |
@@ -180,6 +181,9 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 		if (xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_OTHER)) {
 			xe_mmio_write32(gt, GUNIT_GSC_INTR_ENABLE, irqs);
 			xe_mmio_write32(gt, GUNIT_GSC_INTR_MASK, ~irqs);
+		} else if (HAS_HECI_GSCFI(xe)) {
+			xe_mmio_write32(gt, GUNIT_GSC_INTR_ENABLE, gsc_mask);
+			xe_mmio_write32(gt, GUNIT_GSC_INTR_MASK, ~gsc_mask);
 		}
 	}
 }
@@ -227,6 +231,8 @@ gt_other_irq_handler(struct xe_gt *gt, const u8 instance, const u16 iir)
 		return xe_guc_irq_handler(&gt->uc.guc, iir);
 	if (instance == OTHER_MEDIA_GUC_INSTANCE && xe_gt_is_media_type(gt))
 		return xe_guc_irq_handler(&gt->uc.guc, iir);
+	if (instance == OTHER_GSC_INSTANCE)
+		return xe_gsc_irq_handler(gt, iir);
 
 	if (instance != OTHER_GUC_INSTANCE &&
 	    instance != OTHER_MEDIA_GUC_INSTANCE) {
@@ -470,8 +476,9 @@ static void gt_irq_reset(struct xe_tile *tile)
 	if (ccs_mask & (BIT(2)|BIT(3)))
 		xe_mmio_write32(mmio,  CCS2_CCS3_INTR_MASK, ~0);
 
-	if (tile->media_gt &&
-	    xe_hw_engine_mask_per_class(tile->media_gt, XE_ENGINE_CLASS_OTHER)) {
+	if ((tile->media_gt &&
+	     xe_hw_engine_mask_per_class(tile->media_gt, XE_ENGINE_CLASS_OTHER)) ||
+	    HAS_HECI_GSCFI(tile_to_xe(tile))) {
 		xe_mmio_write32(mmio, GUNIT_GSC_INTR_ENABLE, 0);
 		xe_mmio_write32(mmio, GUNIT_GSC_INTR_MASK, ~0);
 	}
-- 
2.34.1

