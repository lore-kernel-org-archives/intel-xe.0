Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C50FC4167D
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 21:45:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCC910E824;
	Wed, 13 Dec 2023 21:45:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D302310E824
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Dec 2023 21:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702503934; x=1734039934;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=xP/EuhTOvkCV00KJxoTtmuJGXPtru+rLWc7LShboyE4=;
 b=au9/3hF7GxU54rALP9gebQvGLhIub33L93fTZSUSaqEMUZnP79/FxuFk
 z4jxQ/K14Yh8kIgp1q0P35wyIDjuizG0fm9CO3R6O+IyIlxQuN6WWZzR7
 3KJt6jsG9odUHvnx5/DWnRVszs1cOzQbCSYSGCoJWlfRdaT5RhH6NcVDi
 Tl7RdPkBGg8WXciX/x4p7+7Gtb1ugu+48eGVIHy9wu35GKEmSTVgZkBZs
 oFi81Xd/X6Rrea6ThnXlUmxPf3JK6nuuchCR2/gZo5sD59Ws3nY7NibLy
 mI+FTXa412XGFVg1NvDMtHgT+5KRyoLN1X5VK9f1h7S8t1qXYjNWOc1v6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="16581501"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="16581501"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 13:45:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="22137472"
Received: from awvttsim-04.aw.intel.com (HELO awvttsim-04.ph.intel.com)
 ([10.228.212.165])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 13:45:33 -0800
From: David Kershner <david.kershner@intel.com>
To: david.kershner@intel.com, intel-xe@lists.freedesktop.org,
 michael.j.ruhl@intel.com, john.fleck@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, matthew.d.roper@intel.com
Subject: [PATCH v3 1/3] drm/xe: Introduce XeLink device
Date: Wed, 13 Dec 2023 16:45:23 -0500
Message-Id: <20231213214525.2584729-2-david.kershner@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20231213214525.2584729-1-david.kershner@intel.com>
References: <20231213214525.2584729-1-david.kershner@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add XeLink support for PVC devices.

Introduce the initial platform data structure that will be shared
between the Xe driver and the XeLink driver.

If the device is PVC, and there is an XeLink device present, add
and initialize an Auxbus device with the appropriate resources.

Add the XeLink information register.

Add package address register for defining the Device Physical Address
space (DPA).

Add initial interrupt support.

The package address register defines the device physical
address (DPA) space for the given device.

Using the "unique" xa_array index, generate a DPA address
for the device and program the package register appropriately.

Update the LMEM offset to use the DPA address.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: David Kershner <david.kershner@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  30 ++
 drivers/gpu/drm/xe/xe_device.c       |  13 +-
 drivers/gpu/drm/xe/xe_device_types.h |  25 ++
 drivers/gpu/drm/xe/xe_gt_types.h     |   2 +
 drivers/gpu/drm/xe/xe_irq.c          |  22 ++
 drivers/gpu/drm/xe/xe_link.c         | 449 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_link.h         |  36 +++
 drivers/gpu/drm/xe/xe_mmio.c         |   3 +-
 drivers/gpu/drm/xe/xe_pci.c          |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h    |   1 +
 include/drm/xelink_platform.h        | 140 +++++++++
 12 files changed, 721 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_link.c
 create mode 100644 drivers/gpu/drm/xe/xe_link.h
 create mode 100644 include/drm/xelink_platform.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index f4ae063a7005..cf40fa7e7f86 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -96,6 +96,7 @@ xe-y += xe_bb.o \
 	xe_huc.o \
 	xe_huc_debugfs.o \
 	xe_irq.o \
+	xe_link.o \
 	xe_lrc.o \
 	xe_migrate.o \
 	xe_mmio.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index f5bf4c6d1761..8dd927083cf5 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -84,6 +84,11 @@
 #define XEHP_GLOBAL_MOCS(i)			XE_REG_MCR(0x4000 + (i) * 4)
 #define CCS_AUX_INV				XE_REG(0x4208)
 
+#define PKG_ADDR_RANGE				XE_REG(0x41B0)
+#define   PKG_ADDR_RANGE_RANGE_SHIFT		20
+#define   PKG_ADDR_RANGE_BASE_SHIFT		1
+#define   PKG_ADDR_RANGE_ENABLE			1
+
 #define VD0_AUX_INV				XE_REG(0x4218)
 #define VE0_AUX_INV				XE_REG(0x4238)
 
@@ -91,6 +96,11 @@
 #define   AUX_INV				REG_BIT(0)
 
 #define XEHP_TILE_ADDR_RANGE(_idx)		XE_REG_MCR(0x4900 + (_idx) * 4)
+#define   XEHP_TILE_LMEM_RANGE_SHIFT            8
+#define   XEHP_TILE_LMEM_BASE_SHIFT             1
+#define   XEHP_TILE_LMEM_BASE_MASK              REG_GENMASK(7, 1)
+#define   XEHP_TILE_LMEM_RANGE_MASK             REG_GENMASK(14, 8)
+
 #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
 
 #define WM_CHICKEN3				XE_REG_MCR(0x5588, XE_REG_OPTION_MASKED)
@@ -421,6 +431,11 @@
 #define   CCS_MODE_CSLICE(cslice, ccs) \
 	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
 
+#define PKG_ADDR_BASE				XE_REG(0x108390)
+#define   PKG_ADDR_BASE_RANGE_SHIFT		20
+#define   PKG_ADDR_BASE_BASE_SHIFT		1
+#define   PKG_ADDR_BASE_ENABLE			1
+
 #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
 #define   FORCEWAKE_KERNEL			BIT(0)
 #define   FORCEWAKE_USER			BIT(1)
@@ -493,4 +508,19 @@
 #define   POWER_LIMIT_2_MASK			REG_BIT(11)
 #define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
 
+#define PUNIT_MMIO_CR_POC_STRAPS		XE_REG(0x281078)
+#define NUM_TILES_MASK				REG_GENMASK(1, 0)
+#define CD_ALIVE				REG_BIT(2)
+#define SOCKET_ID_MASK				REG_GENMASK(7, 3)
+
+/* Define the BAR and offset for XeLink CSRs */
+#define XE_XELINK_IRQ				BIT(8)
+#define CD_BASE_OFFSET				0x291000
+#define CD_BAR_SIZE				(256 * 1024)
+
+#define CPORT_MBDB_CSRS				XE_REG(CD_BASE_OFFSET + 0x6000)
+#define CPORT_MBDB_CSRS_END			XE_REG(CD_BASE_OFFSET + 0x1000)
+#define CPORT_MBDB_INT_ENABLE_MASK_LOW		XE_REG(CD_BASE_OFFSET + 0x8)
+#define CPORT_MBDB_INT_ENABLE_MASK_HIGH		XE_REG(CD_BASE_OFFSET + 0x10)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 221e87584352..f15e2d724a4e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: MIT
 /*
- * Copyright © 2021 Intel Corporation
+ * Copyright © 2021 - 2023 Intel Corporation
  */
 
 #include "xe_device.h"
@@ -29,6 +29,7 @@
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_irq.h"
+#include "xe_link.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_pat.h"
@@ -441,6 +442,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	xe_link_init_early(xe);
+
 	err = xe_set_dma_info(xe);
 	if (err)
 		return err;
@@ -458,6 +461,8 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
+	xe_link_init_mmio(xe);
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
@@ -486,6 +491,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	xe_link_init(xe);
+
 	err = xe_mmio_probe_vram(xe);
 	if (err)
 		goto err_irq_shutdown;
@@ -527,6 +534,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_display_register(xe);
 
+	xe_link_init_aux(xe);
+
 	xe_debugfs_register(xe);
 
 	xe_pmu_register(&xe->pmu);
@@ -563,6 +572,8 @@ void xe_device_remove(struct xe_device *xe)
 
 	xe_display_fini(xe);
 
+	xe_link_remove(xe);
+
 	xe_heci_gsc_fini(xe);
 
 	xe_irq_shutdown(xe);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index d1a48456e9a3..6b3ff57f358c 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -21,6 +21,7 @@
 #include "xe_pmu.h"
 #include "xe_sriov_types.h"
 #include "xe_step_types.h"
+#include "xe_link.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 #include "soc/intel_pch.h"
@@ -255,6 +256,8 @@ struct xe_device {
 		u8 has_asid:1;
 		/** @force_execlist: Forced execlist submission */
 		u8 force_execlist:1;
+		/** @has_xelink: Has XeLink */
+		u8 has_xelink:1;
 		/** @has_flat_ccs: Whether flat CCS metadata is used */
 		u8 has_flat_ccs:1;
 		/** @has_llc: Device has a shared CPU+GPU last level cache */
@@ -439,6 +442,28 @@ struct xe_device {
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
+	/** @xelink: XeLink information, for those gpus with XeLink connectivity */
+	struct {
+		/** @ops: shared interface operations */
+		const struct xelink_ops *ops;
+		/** @handle: XeLink device handle */
+		void *handle;
+		/** @pd: platform data needed for auxiliary bus */
+		struct xelink_pdata *pd;
+		/** @dpa: base device physical address */
+		u64 dpa;
+		/** @irq_base: base IRQ for multi tile devices */
+		int irq_base;
+		/** @index: internal index for xe devices */
+		int index;
+		/** @xelink_id: XeLink id generated by the XeLink device */
+		u32 xelink_id;
+		/** @socket_id: socket from certain platforms */
+		u8 socket_id;
+		/* @present: Reflect PUNIT presence information */
+		bool present;
+	} xelink;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index f74684660475..1e8c0d3cf17f 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -358,6 +358,8 @@ struct xe_gt {
 		/** @oob: bitmap with active OOB workaroudns */
 		unsigned long *oob;
 	} wa_active;
+	/** @xelink_irq: IRQ value assigned to the Xelink device */
+	int xelink_irq;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index d1f5ba4bb745..2424840ead08 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -5,6 +5,7 @@
 
 #include "xe_irq.h"
 
+#include <linux/irq.h>
 #include <linux/sched/clock.h>
 
 #include <drm/drm_managed.h>
@@ -27,6 +28,9 @@
 #define IIR(offset)				XE_REG(offset + 0x8)
 #define IER(offset)				XE_REG(offset + 0xc)
 
+/* Define the BAR and offset for XeLink CSRs */
+#define XE_XELINK_IRQ BIT(8)
+
 static void assert_iir_is_zero(struct xe_gt *mmio, struct xe_reg reg)
 {
 	u32 val = xe_mmio_read32(mmio, reg);
@@ -376,6 +380,18 @@ static void dg1_intr_enable(struct xe_device *xe, bool stall)
 		xe_mmio_read32(mmio, DG1_MSTR_TILE_INTR);
 }
 
+/*
+ * xelink_irq_handler - handle XeLink IRQs
+ *
+ * PVC can have an XeLink attached.  Handle the IRQs that are sourced by
+ * the device supporting the XeLink.
+ */
+static void xelink_irq_handler(struct xe_gt *gt, const u32 master_ctl)
+{
+	if (master_ctl & XE_XELINK_IRQ)
+		generic_handle_irq(gt->xelink_irq);
+}
+
 /*
  * Top-level interrupt handler for Xe_LP+ and beyond.  These platforms have
  * a "master tile" interrupt register which must be consulted before the
@@ -437,6 +453,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 			xe_display_irq_handler(xe, master_ctl);
 			gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
 		}
+		xelink_irq_handler(mmio, master_ctl);
 	}
 
 	dg1_intr_enable(xe, false);
@@ -490,6 +507,11 @@ static void gt_irq_reset(struct xe_tile *tile)
 	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_MASK,  ~0);
 	xe_mmio_write32(mmio, GUC_SG_INTR_ENABLE,	 0);
 	xe_mmio_write32(mmio, GUC_SG_INTR_MASK,		~0);
+
+	if (tile->xe->xelink.present) {
+		xe_mmio_write32(mmio, CPORT_MBDB_INT_ENABLE_MASK_LOW, 0);
+		xe_mmio_write32(mmio, CPORT_MBDB_INT_ENABLE_MASK_HIGH, 0);
+	}
 }
 
 static void xelp_irq_reset(struct xe_tile *tile)
diff --git a/drivers/gpu/drm/xe/xe_link.c b/drivers/gpu/drm/xe/xe_link.c
new file mode 100644
index 000000000000..3ed1113fe348
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_link.c
@@ -0,0 +1,449 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+#include <linux/auxiliary_bus.h>
+#include <linux/firmware.h>
+#include <linux/irq.h>
+#include <linux/xarray.h>
+
+#include <drm/xelink_platform.h>
+
+#include "xe_device.h"
+#include "xe_link.h"
+#include "xe_mmio.h"
+#include "xe_gt_mcr.h"
+#include "regs/xe_reg_defs.h"
+#include "regs/xe_gt_regs.h"
+
+#define HAS_XELINK(xe) ((xe)->info.has_xelink)
+/* Define the BAR and offset for the XeLink CSRs */
+#define GTTMMADR_BAR 0
+
+/* Xarray of XeLink devices */
+static DEFINE_XARRAY_ALLOC(intel_fdevs);
+
+static struct query_info *default_query(void *handle, u32 xelink_id)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
+static int default_handle_event(void *handle, enum xelink_parent_event event)
+{
+	return -EOPNOTSUPP;
+}
+
+static const struct xelink_ops default_ops = {
+	.connectivity_query = default_query,
+	.parent_event = default_handle_event,
+};
+
+static int register_dev(void *parent, void *handle, u32 xelink_id,
+			const struct xelink_ops *ops)
+{
+	struct xe_device *xe = parent;
+
+	WARN(xe->xelink.ops != &default_ops, "XeLink: already registered");
+
+	xe->xelink.handle = handle;
+	xe->xelink.xelink_id = xelink_id;
+	xe->xelink.ops = ops;
+
+	drm_info(&xe->drm, "XeLink: registered: 0x%x\n", xelink_id);
+
+	return 0;
+}
+
+static void unregister_dev(void *parent, const void *handle)
+{
+	struct xe_device *xe = parent;
+
+	WARN(xe->xelink.handle != handle, "XeLink: invalid handle");
+
+	drm_info(&xe->drm, "XeLink: unregistered: 0x%x\n",
+		 xe->xelink.xelink_id);
+	xe->xelink.handle = NULL;
+	xe->xelink.ops = &default_ops;
+}
+
+static int dev_event(void *parent, void *handle, enum xelink_dev_event event,
+		     void *event_data)
+{
+	return 0;
+}
+
+/**
+ * init_pd - Allocate and initialize platform specific data
+ * @xe: Valid xe instance
+ *
+ * Return:
+ * * pd - initialized xelink_pdata,
+ * * NULL - Allocation failure
+ */
+static struct xelink_pdata *init_pd(struct xe_device *xe)
+{
+	struct xelink_pdata *pd;
+	u32 reg;
+
+	pd = kzalloc(sizeof(*pd), GFP_KERNEL);
+	if (!pd)
+		return NULL;
+
+	pd->version = XELINK_VERSION;
+	pd->parent = xe;
+	pd->product = XELINK_PONTEVECCHIO;
+	pd->index = xe->xelink.index & 0xFFFF;
+	pd->sd_cnt = xe->info.tile_count;
+	pd->socket_id = xe->xelink.socket_id;
+	pd->slot = PCI_SLOT(to_pci_dev(xe->drm.dev)->devfn);
+
+	pd->resources = NULL;
+	pd->num_resources = 0;
+	pd->register_dev = register_dev;
+	pd->unregister_dev = unregister_dev;
+	pd->dev_event = dev_event;
+
+	/*
+	 * Calculate the actual DPA offset and size (in GB) for the device.
+	 * Each tile will have the same amount of memory, so we only need to
+	 * read the first one.
+	 */
+	reg = xe_gt_mcr_unicast_read_any(xe_device_get_root_tile(xe)->primary_gt,
+					 XEHP_TILE_ADDR_RANGE(0)) & XEHP_TILE_LMEM_RANGE_MASK;
+
+	/* TILE0 is < 8Gb, PVC needs 8GB */
+	if (reg >> XEHP_TILE_LMEM_RANGE_SHIFT < 8) {
+		drm_err(&xe->drm, "XEHP_TILE0_ADDR_RANGE: %x\n", reg);
+		return NULL;
+	}
+	pd->dpa.pkg_offset = (u32)xe->xelink.index * MAX_DPA_SIZE;
+	pd->dpa.pkg_size = (reg >> XEHP_TILE_LMEM_RANGE_SHIFT) * pd->sd_cnt;
+
+	return pd;
+}
+
+/**
+ * init_resource - Create the resource array, and apply the appropriate data
+ * @xe: valid xe instance
+ * @res_cnt: pointer to return number of allocated resources
+ *
+ * First resource [0] is for the IRQ(s).  Each device gets 1 IRQ. Subsequent
+ * resources describe the IO memory space for the device(s).
+ *
+ * Make sure to set the gt->xelink_irq value.
+ *
+ * Return:
+ * * res - Initialized resource array
+ * * NULL - Allocaction failure
+ */
+static struct resource *init_resource(struct xe_device *xe,
+				      u32 *res_cnt)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct xe_gt *gt;
+	struct resource *res_base, *res;
+	u32 cnt = xe->info.tile_count * 2;
+	unsigned int i;
+
+	/* Each sd gets one resource for IRQ and one for MEM */
+	res_base = kcalloc(cnt, sizeof(*res_base), GFP_KERNEL);
+	if (!res_base)
+		return NULL;
+
+	res = res_base;
+	for_each_gt(gt, xe, i) {
+		res->start = xe->xelink.irq_base + i;
+		res->end = xe->xelink.irq_base + i;
+		res->flags = IORESOURCE_IRQ;
+		res++;
+
+		res->start = pci_resource_start(pdev, GTTMMADR_BAR) + CD_BASE_OFFSET +
+			     i * gt_to_tile(gt)->mmio.size;
+		res->end = res->start + CD_BAR_SIZE - 1;
+		res->flags = IORESOURCE_MEM;
+		drm_info(&xe->drm, "XeLink: mem_resource = %pR\n", res);
+		res++;
+		gt->xelink_irq = xe->xelink.irq_base + i;
+	}
+
+	*res_cnt = cnt;
+	return res_base;
+}
+
+/**
+ * xelink_irq_mask - Null callback.  Masking/unmasking happens in the parent
+ * driver
+ * @d: Valid irq_data information
+ */
+static void xelink_irq_mask(struct irq_data *d)
+{
+}
+
+static void xelink_irq_unmask(struct irq_data *d)
+{
+}
+
+static struct irq_chip xelink_irq_chip = {
+	.name = "xelink_irq_chip",
+	.irq_mask = xelink_irq_mask,
+	.irq_unmask = xelink_irq_unmask,
+};
+
+/**
+ * init_irq_desc - Allocate IRQ descriptors to use for the xelink
+ * @xe: Valid xe instance
+ *
+ * Allocate the required IRQ descriptor(s) and initialize the
+ * appropriate state.
+ *
+ * Return:
+ * * 0 - Success
+ * * errno - Error that occurred
+ */
+static int init_irq_desc(struct xe_device *xe)
+{
+	unsigned int num_subdevs = xe->info.tile_count;
+	int err;
+	int irq;
+	int irq_base;
+
+	irq_base = irq_alloc_descs(-1, 0, num_subdevs, 0);
+	if (irq_base < 0) {
+		err = irq_base;
+		goto cleanup;
+	}
+
+	err = 0;
+	for (irq = irq_base; !err && irq < irq_base + num_subdevs; irq++) {
+		irq_set_chip_and_handler_name(irq, &xelink_irq_chip,
+					      handle_simple_irq,
+					      "xelink_irq_handler");
+		err = irq_set_chip_data(irq, xe);
+	}
+
+	if (err) {
+		irq_free_descs(irq_base, num_subdevs);
+		goto cleanup;
+	}
+
+	drm_info(&xe->drm, "XeLink: IRQ base: %d  cnt: %d\n", irq_base,
+		 num_subdevs);
+
+	xe->xelink.irq_base = irq_base;
+
+	return 0;
+
+cleanup:
+	xe->xelink.index = err;
+	drm_err(&xe->drm, "XeLink: Failed to allocate IRQ data: %d\n", err);
+	return err;
+}
+
+/**
+ * xe_link_init_early - Set the XeLink info to the defaults
+ * @xe: valid xe instance
+ *
+ * index is set to ENODEV to show that, by default, there is no device.
+ * If any of the initialization steps fail, it will be set to the appropriate
+ * errno value.
+ */
+void xe_link_init_early(struct xe_device *xe)
+{
+	xe->xelink.ops = &default_ops;
+	xe->xelink.index = -ENODEV;
+}
+
+/**
+ * xe_link_init_mmio - check if XeLink is available via MMIO
+ * @xe: valid xe instance
+ *
+ * Read the relevant regs to check for XeLink availability and get the socket id
+ */
+void xe_link_init_mmio(struct xe_device *xe)
+{
+	u32 xelink_info;
+
+	if (!HAS_XELINK(xe))
+		return;
+
+	xelink_info = xe_mmio_read32(xe_device_get_root_tile(xe)->primary_gt,
+				     PUNIT_MMIO_CR_POC_STRAPS);
+
+	xe->xelink.socket_id = REG_FIELD_GET(SOCKET_ID_MASK, xelink_info);
+
+	if (REG_FIELD_GET(CD_ALIVE, xelink_info)) {
+		drm_info(&xe->drm, "XeLink available\n");
+		xe->xelink.present = true;
+	}
+}
+
+/**
+ * xe_link_init - Allocate device index and complete initial HW setup
+ * @xe: valid device instance
+ *
+ * NOTE: index is zero inited.  If the XeLink is not present, or an error occurs
+ * during setup, this must be 0 for the range registers.
+ *
+ */
+void xe_link_init(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	static u32 last_id;
+	unsigned int i;
+	u32 index = 0;
+	u32 range;
+	u32 base;
+	int err;
+
+	if (!HAS_XELINK(xe))
+		return;
+
+	if (!xe->xelink.present)
+		goto set_range;
+
+	err = init_irq_desc(xe);
+	if (err) {
+		xe->xelink.index = err;
+		goto set_range;
+	}
+
+	/*
+	 * Try the socket id first.  Systems with this feature, will
+	 * get a deterministic value.  If not, try with the cyclic.
+	 */
+	err = xa_insert(&intel_fdevs, xe->xelink.socket_id, xe,
+			GFP_KERNEL);
+	if (!err)
+		index = xe->xelink.socket_id;
+
+	/* socket_id is not available */
+	if (err == -EBUSY) {
+		/*
+		 * NOTE: index is only updated on success i.e. >= 0
+		 * < 0 err, 0 ok, > 0 wrapped
+		 */
+		err = xa_alloc_cyclic(&intel_fdevs, &index, xe,
+				      XA_LIMIT(0, MAX_DEVICE_COUNT - 1),
+				      &last_id, GFP_KERNEL);
+	}
+	if (err < 0) {
+		index = 0;
+		xe->xelink.index = err;
+		drm_err(&xe->drm,
+			"XeLink: Failed to allocate index: %d\n",
+			err);
+		irq_free_descs(xe->xelink.irq_base,
+			       xe->info.tile_count);
+		goto set_range;
+	}
+	xe->xelink.index = index;
+	xe->xelink.dpa = (u64)index * MAX_DPA_SIZE * SZ_1G;
+	drm_info(&xe->drm, "XeLink: [dpa 0x%llx-0x%llx\n", xe->xelink.dpa,
+		 ((u64)index + 1) * MAX_DPA_SIZE * SZ_1G - 1);
+
+	/*
+	 * Set range has to be done for all devices that support device
+	 * address space, regardless of presence or error.
+	 */
+set_range:
+	/* Set GAM address range registers */
+	range = index * MAX_DPA_SIZE << PKG_ADDR_RANGE_BASE_SHIFT;
+	range |= MAX_DPA_SIZE << PKG_ADDR_RANGE_RANGE_SHIFT;
+	range |= PKG_ADDR_RANGE_ENABLE;
+
+	/* set SGunit address range register */
+	base = index * MAX_DPA_SIZE << PKG_ADDR_BASE_BASE_SHIFT;
+	base |= MAX_DPA_SIZE << PKG_ADDR_BASE_RANGE_SHIFT;
+	base |= PKG_ADDR_BASE_ENABLE;
+
+	/* Needs to be set for each gt */
+	for_each_gt(gt, xe, i) {
+		xe_mmio_write32(gt, PKG_ADDR_RANGE, range);
+		xe_mmio_write32(gt, PKG_ADDR_BASE, base);
+	}
+}
+
+static void xe_link_release_dev(struct device *dev)
+{
+	struct auxiliary_device *aux = to_auxiliary_dev(dev);
+	struct xelink_pdata *pd = container_of(aux, struct xelink_pdata, aux_dev);
+
+	kfree(pd->resources);
+	pd->resources = NULL;
+
+	kfree(pd);
+}
+
+/**
+ * xe_link_init_aux - Initialize resources and add auxiliary bus interface
+ * @xe: valid xe instance
+ *
+ */
+void xe_link_init_aux(struct xe_device *xe)
+{
+	struct device *dev = &to_pci_dev(xe->drm.dev)->dev;
+	struct resource *res = NULL;
+	struct xelink_pdata *pd;
+	int err = -ENOMEM;
+	u32 res_cnt;
+
+	if (!xe->xelink.present)
+		return;
+
+	if (xe->xelink.index < 0) {
+		err = xe->xelink.index;
+		goto fail;
+	}
+
+	pd = init_pd(xe);
+	if (!pd)
+		goto cleanup;
+
+	res = init_resource(xe, &res_cnt);
+	if (!res)
+		goto cleanup;
+
+	pd->resources = res;
+	pd->num_resources = res_cnt;
+
+	pd->aux_dev.name = "xelink";
+	pd->aux_dev.id = pd->index;
+	pd->aux_dev.dev.parent = dev;
+	pd->aux_dev.dev.release = xe_link_release_dev;
+
+	err = auxiliary_device_init(&pd->aux_dev);
+	if (err)
+		goto cleanup;
+
+	err = auxiliary_device_add(&pd->aux_dev);
+	if (err) {
+		auxiliary_device_uninit(&pd->aux_dev);
+		goto cleanup;
+	}
+
+	xe->xelink.pd = pd;
+
+	return;
+
+cleanup:
+	xa_erase(&intel_fdevs, xe->xelink.index);
+	irq_free_descs(xe->xelink.irq_base, xe->info.tile_count);
+	kfree(res);
+	kfree(pd);
+	xe->xelink.index = err;
+fail:
+	drm_err(&xe->drm, "XeLink: Failed to initialize err: %d\n", err);
+}
+
+void xe_link_remove(struct xe_device *xe)
+{
+	if (xe->xelink.index < 0)
+		return;
+
+	auxiliary_device_delete(&xe->xelink.pd->aux_dev);
+	auxiliary_device_uninit(&xe->xelink.pd->aux_dev);
+	xa_erase(&intel_fdevs, xe->xelink.index);
+	irq_free_descs(xe->xelink.irq_base, xe->info.tile_count);
+
+	xe->xelink.ops = &default_ops;
+}
diff --git a/drivers/gpu/drm/xe/xe_link.h b/drivers/gpu/drm/xe/xe_link.h
new file mode 100644
index 000000000000..2d3642166aed
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_link.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2019 - 2023 Intel Corporation
+ */
+
+#ifndef _XE_LINK_H_
+#define _XE_LINK_H_
+
+/*
+ * Define the maximum number of devices instances based on the amount of
+ * FID space.
+ *
+ * XARRAY limits are "inclusive", but using this value as a range check
+ * outside of xarray, makes the exclusive upper bound a little easier to
+ * deal with.
+ *
+ * I.e.:
+ * [0 - 256)
+ *
+ * Less than HW supports, but more than will be currently possible.
+ *
+ */
+#define MAX_DEVICE_COUNT 256
+
+/* Fixed Device Physical Address (DPA) size for a device/package (in GB) */
+#define MAX_DPA_SIZE 128
+
+struct xe_device;
+
+void xe_link_init_early(struct xe_device *xe);
+void xe_link_init_mmio(struct xe_device *xe);
+void xe_link_init(struct xe_device *xe);
+void xe_link_init_aux(struct xe_device *xe);
+void xe_link_remove(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index f660cfb79f50..7529c6057e5e 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -153,8 +153,7 @@ static int xe_determine_lmem_bar_size(struct xe_device *xe)
 	if (!xe->mem.vram.io_size)
 		return -EIO;
 
-	/* XXX: Need to change when xe link code is ready */
-	xe->mem.vram.dpa_base = 0;
+	xe->mem.vram.dpa_base = xe->xelink.dpa;
 
 	/* set up a map to the total memory area. */
 	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b75b629db886..f230df220d67 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -149,6 +149,7 @@ static const struct xe_graphics_desc graphics_xehpc = {
 	.has_asid = 1,
 	.has_flat_ccs = 0,
 	.has_usm = 1,
+	.has_xelink = 1,
 };
 
 static const struct xe_graphics_desc graphics_xelpg = {
@@ -618,6 +619,7 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.va_bits = graphics_desc->va_bits;
 	xe->info.vm_max_level = graphics_desc->vm_max_level;
 	xe->info.has_asid = graphics_desc->has_asid;
+	xe->info.has_xelink = graphics_desc->has_xelink;
 	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
 	xe->info.has_usm = graphics_desc->has_usm;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index b1ad12fa22d6..d3b5f5766f07 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -25,6 +25,7 @@ struct xe_graphics_desc {
 	u8 max_remote_tiles:2;
 
 	u8 has_asid:1;
+	u8 has_xelink:1;
 	u8 has_flat_ccs:1;
 	u8 has_range_tlb_invalidation:1;
 	u8 has_usm:1;
diff --git a/include/drm/xelink_platform.h b/include/drm/xelink_platform.h
new file mode 100644
index 000000000000..81f33a38097a
--- /dev/null
+++ b/include/drm/xelink_platform.h
@@ -0,0 +1,140 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019 - 2023 Intel Corporation.
+ */
+
+#ifndef __XELINK_PLATFORM_H
+#define __XELINK_PLATFORM_H
+
+#define XELINK_VERSION 1
+
+#include <linux/auxiliary_bus.h>
+#include <linux/types.h>
+
+/**
+ * enum product_type - Product type identifying the parent
+ * @XELINK_UNDEFINED: no product type hints
+ * @XELINK_PONTEVECCHIO: parent is a PVC
+ * @XELINK_PRODUCTS: end of the list
+ *
+ */
+enum product_type {
+	XELINK_UNDEFINED,
+	XELINK_PONTEVECCHIO,
+	XELINK_PRODUCTS
+};
+
+/**
+ * enum xelink_dev_event - events generated to the parent device
+ * @XELINK_DEV_REMOVE: Xelink device was removed
+ * @XELINK_DEV_ERROR: An error occurred
+ * @XELINK_DEV_EVENTS: end of list
+ *
+ * Connectivity events, possible errors, etc.
+ */
+enum xelink_dev_event {
+	XELINK_DEV_REMOVE,
+	XELINK_DEV_EVENTS
+};
+
+/**
+ * enum xelink_parent_event - Events generated by the parent device
+ * @XELINK_PARENT_PCIE_ERR: Parent had a PCI error
+ * @XELINK_PARENT_MAPPING_GET: Notify XeLink of buffer mapping
+ * @XELINK_PARENT_MAPPING_PUT: Notify XeLink of buffer unmapping
+ *
+ * These are examples.
+ */
+enum xelink_parent_event {
+	XELINK_PARENT_PCIE_ERR,
+	XELINK_PARENT_MAPPING_GET,
+	XELINK_PARENT_MAPPING_PUT,
+};
+
+/**
+ * struct sd2sd_info - Subdevice to subdevice connectivity info
+ * @bandwidth: in Gbps units not factoring in width or quality degredation
+ * @latency: in 1/10 hops units
+ */
+struct sd2sd_info {
+	u16 bandwidth;
+	u16 latency;
+};
+
+/**
+ * struct query_info - connectivity query response information
+ * @src_cnt: Requester subdevice count
+ * @dst_cnt: Destination path count
+ * @sd2sd: array of src/dst bandwidth/latency information
+ *
+ * Query info will be a variably sized data structure allocated by the
+ * XeLink driver.  The access will be indexed by
+ *    (src_index * dst_cnt) + dst_index
+ *
+ * The caller will need to free the buffer when done.
+ */
+struct query_info {
+	u8 src_cnt;
+	u8 dst_cnt;
+	struct sd2sd_info sd2sd[];
+};
+
+/**
+ * struct xelink_ops - Communication path from parent to XeLink instance
+ * @connectivity_query: Query a device for xelink_id connectivity
+ * @parent_event: Any events needed by the XeLink device
+ *
+ * connectivity_query() returns:
+ *   a populated query_info on success,
+ *   an ERR_PTR() on failure
+ *
+ */
+struct xelink_ops {
+	struct query_info *(*connectivity_query)(void *handle, u32 xelink_id);
+	int (*parent_event)(void *handle, enum xelink_parent_event event);
+};
+
+struct dpa_space {
+	u32 pkg_offset;
+	u16 pkg_size;
+};
+
+/**
+ * struct xelink_pdata - Platform specific data that needs to be shared
+ * @version: PSD version information
+ * @parent: Handle to use when calling the parent device
+ * @product: a product hint for any necessary special case requirements
+ * @index: unique device index. This will be part of the device name
+ * @dpa: Device physical address offset and size
+ * @sd_cnt: parent subdevice count
+ * @socket_id: device socket information
+ * @slot: PCI/CXL slot number
+ * @aux_dev: Auxiliary bus device
+ * @resources: Array of resources (Assigned by Xe, the IRQ/MEM for the device)
+ * @num_resources: number of resources in resources array
+ * @register_dev: Register a XeLink instance and ops with the parent device
+ * @unregister_dev: Unregister a XeLink instance from the parent device
+ * @dev_event: Notify parent that an event has occurred
+ */
+struct xelink_pdata {
+	u16 version;
+	void *parent;
+	enum product_type product;
+	u16 index;
+	struct dpa_space dpa;
+	u8 sd_cnt;
+	u8 socket_id;
+	u8 slot;
+
+	struct auxiliary_device aux_dev;
+	struct resource *resources;
+	u32 num_resources;
+
+	int (*register_dev)(void *parent, void *handle, u32 xelink_id,
+			    const struct xelink_ops *ops);
+	void (*unregister_dev)(void *parent, const void *handle);
+	int (*dev_event)(void *parent, void *handle,
+			 enum xelink_dev_event event, void *event_data);
+};
+
+#endif /* __XELINK_PLATFORM_H */
-- 
2.38.1

