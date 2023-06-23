Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD400EB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jun 2023 04:13:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8293810E5D2;
	Fri, 23 Jun 2023 04:13:06 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A6A10E5D1
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jun 2023 04:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687493585; x=1719029585;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=qGDPM8JPsSgeLs13yyDfn2fr0CoqJ0ed6GWbFDp1Y9Q=;
 b=PrP6RpM7YZD0mXjPj6kmWZywQ4eLYjJwSzBJXW2MRsctdnLrVI7/2Qh7
 gSiXyVu7Q9KMEQ4qP8Nwfe0HMB9MirzSeKiYCPieCrXeGvCYkrg9AKY2a
 2qF83stq6xi9tbf2Lk98H+dDWKqvjou3s/p9h/QmYD3SRydOG/tfSCsPl
 nl02ish/SpC4C7G4g/DDNdm2wdhsrh0V/aO6/7h/gjG2Tn1rMZ9bvyWa+
 ew8KJTe7GdY97Tg4JLgsBWAYmYQIFjlNpWw9Z8qUYeTYeitcgAsqQ9uJY
 C5FQOoWnlPp7AF++8yaTDN2oUBp2xefFKDLbawW+RvP6glWy0W6kpUiAa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="447056729"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; d="scan'208";a="447056729"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 21:13:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="828226808"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; d="scan'208";a="828226808"
Received: from awvttsim-04.aw.intel.com (HELO awvttsim-04.ph.intel.com)
 ([10.228.212.165])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 21:13:04 -0700
From: David Kershner <david.kershner@intel.com>
To: david.kershner@intel.com, intel-xe@lists.freedesktop.org,
 michael.j.ruhl@intel.com, john.fleck@intel.com
Date: Fri, 23 Jun 2023 00:12:56 -0400
Message-Id: <20230623041257.3550266-3-david.kershner@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230623041257.3550266-1-david.kershner@intel.com>
References: <20230623041257.3550266-1-david.kershner@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 2/3] drm/xe: Introduce Intel Accelerated
 Fabric device
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

Add accelerator fabric driver support for PVC devices.

Introduce the initial platform data structure that will be shared
between the Xe driver and the IAF driver.

If the device is PVC, and there is an accelerator fabric present,
add and initialize an Auxbus device with the appropriate resources.

Add the accelerator fabric information register.

Add package address register for defining the Device Physical Address
space (DPA).

Add initial interrupt support.

The package address register defines the device physical
address (DPA) space for the given device.

Using the "unique" xa_array index, generate a DPA address
for the device and program the package register appropriately.

Update the LMEM offset to use the DPA address.

Signed-off-by: David Kershner <david.kershner@intel.com>
---
 drivers/gpu/drm/xe/Kconfig           |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  20 ++
 drivers/gpu/drm/xe/xe_device.c       |  13 +-
 drivers/gpu/drm/xe/xe_device_types.h |  25 ++
 drivers/gpu/drm/xe/xe_gt_types.h     |   2 +
 drivers/gpu/drm/xe/xe_iaf.c          | 461 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_iaf.h          |  39 +++
 drivers/gpu/drm/xe/xe_irq.c          |  28 +-
 drivers/gpu/drm/xe/xe_mmio.c         |   2 +-
 drivers/gpu/drm/xe/xe_pci.c          |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h    |   1 +
 include/drm/intel_iaf_platform.h     | 143 +++++++++
 12 files changed, 733 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_iaf.h
 create mode 100644 include/drm/intel_iaf_platform.h

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index d44794f99338..e4be3749778a 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -36,6 +36,7 @@ config DRM_XE
 	select DRM_SCHED
 	select MMU_NOTIFIER
 	select WANT_DEV_COREDUMP
+	select AUXILIARY_BUS
 	help
 	  Experimental driver for Intel Xe series GPUs
 
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 3f664011eaea..d9f68065ca70 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -76,6 +76,11 @@
 #define GLOBAL_MOCS(i)				XE_REG(0x4000 + (i) * 4) /* Global MOCS regs */
 #define GFX_CCS_AUX_NV				XE_REG(0x4208)
 
+#define PKG_ADDR_RANGE				XE_REG(0x41B0)
+#define   PKG_ADDR_RANGE_RANGE_SHIFT		20
+#define   PKG_ADDR_RANGE_BASE_SHIFT		1
+#define   PKG_ADDR_RANGE_ENABLE			1
+
 #define VD0_AUX_NV				XE_REG(0x4218)
 #define VE0_AUX_NV				XE_REG(0x4238)
 
@@ -83,6 +88,11 @@
 #define   AUX_INV				REG_BIT(0)
 
 #define XEHP_TILE_ADDR_RANGE(_idx)		XE_REG_MCR(0x4900 + (_idx) * 4)
+#define   XEHP_TILE_LMEM_RANGE_SHIFT            8
+#define   XEHP_TILE_LMEM_BASE_SHIFT             1
+#define   XEHP_TILE_LMEM_BASE_MASK              REG_GENMASK(7, 1)
+#define   XEHP_TILE_LMEM_RANGE_MASK             REG_GENMASK(14, 8)
+
 #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
 
 #define CHICKEN_RASTER_1			XE_REG_MCR(0x6204, XE_REG_OPTION_MASKED)
@@ -344,6 +354,11 @@
 #define RCU_MODE				XE_REG(0x14800, XE_REG_OPTION_MASKED)
 #define   RCU_MODE_CCS_ENABLE			REG_BIT(0)
 
+#define PKG_ADDR_BASE				XE_REG(0x108390)
+#define   PKG_ADDR_BASE_RANGE_SHIFT		20
+#define   PKG_ADDR_BASE_BASE_SHIFT		1
+#define   PKG_ADDR_BASE_ENABLE			1
+
 #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
 #define   FORCEWAKE_KERNEL			BIT(0)
 #define   FORCEWAKE_USER			BIT(1)
@@ -390,4 +405,9 @@
 #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
 #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
 
+#define PUNIT_MMIO_CR_POC_STRAPS		XE_REG(0x281078)
+#define NUM_TILES_MASK				REG_GENMASK(1, 0)
+#define CD_ALIVE				REG_BIT(2)
+#define SOCKET_ID_MASK				REG_GENMASK(7, 3)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c7985af85a53..bf2e370a12fc 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: MIT
 /*
- * Copyright © 2021 Intel Corporation
+ * Copyright © 2021 - 2023 Intel Corporation
  */
 
 #include "xe_device.h"
@@ -22,6 +22,7 @@
 #include "xe_engine.h"
 #include "xe_exec.h"
 #include "xe_gt.h"
+#include "xe_iaf.h"
 #include "xe_irq.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
@@ -255,6 +256,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	xe_iaf_init_early(xe);
+
 	for_each_tile(tile, xe, id) {
 		err = xe_tile_alloc(tile);
 		if (err)
@@ -265,6 +268,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	xe_iaf_init_mmio(xe);
+
 	for_each_gt(gt, xe, id) {
 		err = xe_pcode_probe(gt);
 		if (err)
@@ -285,6 +290,8 @@ int xe_device_probe(struct xe_device *xe)
 			goto err_irq_shutdown;
 	}
 
+	xe_iaf_init(xe);
+
 	err = xe_mmio_probe_vram(xe);
 	if (err)
 		goto err_irq_shutdown;
@@ -326,6 +333,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_display_register(xe);
 
+	xe_iaf_init_aux(xe);
+
 	xe_debugfs_register(xe);
 
 	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
@@ -358,6 +367,8 @@ void xe_device_remove(struct xe_device *xe)
 
 	xe_display_unlink(xe);
 
+	xe_iaf_remove(xe);
+
 	xe_irq_shutdown(xe);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 0226d44a6af2..7de55a6712ad 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -14,6 +14,7 @@
 
 #include "xe_devcoredump_types.h"
 #include "xe_gt_types.h"
+#include "xe_iaf.h"
 #include "xe_platform_types.h"
 #include "xe_step_types.h"
 
@@ -202,6 +203,8 @@ struct xe_device {
 		u8 supports_usm:1;
 		/** @has_asid: Has address space ID */
 		u8 has_asid:1;
+		/** @has_iaf: Has Intel Accelerated Fabric */
+		u8 has_iaf:1;
 		/** @enable_guc: GuC submission enabled */
 		u8 enable_guc:1;
 		/** @has_flat_ccs: Whether flat CCS metadata is used */
@@ -329,6 +332,28 @@ struct xe_device {
 		bool hold_rpm;
 	} mem_access;
 
+	/** @intel_iaf: fabric information, for those gpus with fabric connectivity */
+	struct {
+		/** @ops: shared interface operations */
+		const struct iaf_ops *ops;
+		/** @handle: fabric device handle */
+		void *handle;
+		/** @pd: platform data needed for auxiliary bus */
+		struct iaf_pdata *pd;
+		/** @dpa: base device physical address */
+		u64 dpa;
+		/** @irq_base: base IRQ for multi tile devices */
+		int irq_base;
+		/** @index: internal index for xe devices */
+		int index;
+		/** @fabric_id: fabric id generated by the fabric device */
+		u32 fabric_id;
+		/** @socket_id: socket from certain platforms */
+		u8 socket_id;
+		/* @present: Reflect PUNIT presence information */
+		bool present;
+	} intel_iaf;
+
 	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
 	bool d3cold_allowed;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 99ab7ec99ccd..0a56e982a6cd 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -334,6 +334,8 @@ struct xe_gt {
 		/** @oob: bitmap with active OOB workaroudns */
 		unsigned long *oob;
 	} wa_active;
+	/** @iaf_irq: IRQ value assigned to the ANR HW */
+	int iaf_irq;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_iaf.c b/drivers/gpu/drm/xe/xe_iaf.c
index 0049e6854f80..094ff8fffa43 100644
--- a/drivers/gpu/drm/xe/xe_iaf.c
+++ b/drivers/gpu/drm/xe/xe_iaf.c
@@ -3,7 +3,20 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/auxiliary_bus.h>
+#include <linux/firmware.h>
+#include <linux/irq.h>
 #include <linux/moduleparam.h>
+#include <linux/xarray.h>
+
+#include <drm/intel_iaf_platform.h>
+
+#include "xe_device.h"
+#include "xe_iaf.h"
+#include "xe_mmio.h"
+#include "xe_gt_mcr.h"
+#include "regs/xe_reg_defs.h"
+#include "regs/xe_gt_regs.h"
 
 /*
  * This module parameter is needed because SRIOV PF and IAF are mutually
@@ -13,6 +26,452 @@
  * SRIOV PF path, this parameter is needed to explicitly disable IAF when
  * SRIOV PF is required.
  */
-static bool xe_enable_iaf;
+static bool xe_enable_iaf = true;
 module_param_named(enable_iaf, xe_enable_iaf, bool, 0400);
 MODULE_PARM_DESC(enable_iaf, "Enable IAF feature (default: true)");
+
+#define HAS_IAF(xe) ((xe)->info.has_iaf)
+/* Define the BAR and offset for the accelerator fabric CSRs */
+#define GTTMMADR_BAR 0
+#define CD_BASE_OFFSET 0x291000
+#define CD_BAR_SIZE (256 * 1024)
+
+/* Xarray of fabric devices */
+static DEFINE_XARRAY_ALLOC(intel_fdevs);
+
+static struct query_info *default_query(void *handle, u32 fabric_id)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
+static int default_handle_event(void *handle, enum iaf_parent_event event)
+{
+	return -EOPNOTSUPP;
+}
+
+static const struct iaf_ops default_ops = {
+	.connectivity_query = default_query,
+	.parent_event = default_handle_event,
+};
+
+static int register_dev(void *parent, void *handle, u32 fabric_id,
+			const struct iaf_ops *ops)
+{
+	struct xe_device *xe = parent;
+
+	WARN(xe->intel_iaf.ops != &default_ops, "IAF: already registered");
+
+	xe->intel_iaf.handle = handle;
+	xe->intel_iaf.fabric_id = fabric_id;
+	xe->intel_iaf.ops = ops;
+
+	drm_info(&xe->drm, "IAF: registered fabric: 0x%x\n", fabric_id);
+
+	return 0;
+}
+
+static void unregister_dev(void *parent, const void *handle)
+{
+	struct xe_device *xe = parent;
+
+	WARN(xe->intel_iaf.handle != handle, "IAF: invalid handle");
+
+	drm_info(&xe->drm, "IAF: unregistered fabric: 0x%x\n",
+		 xe->intel_iaf.fabric_id);
+	xe->intel_iaf.handle = NULL;
+	xe->intel_iaf.ops = &default_ops;
+}
+
+static int dev_event(void *parent, void *handle, enum iaf_dev_event event,
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
+ * * pd - initialized iaf_pdata,
+ * * NULL - Allocation failure
+ */
+static struct iaf_pdata *init_pd(struct xe_device *xe)
+{
+	struct iaf_pdata *pd;
+	u32 reg;
+
+	pd = kzalloc(sizeof(*pd), GFP_KERNEL);
+	if (!pd)
+		return NULL;
+
+	pd->version = IAF_VERSION;
+	pd->parent = xe;
+	pd->product = IAF_PONTEVECCHIO;
+	pd->index = xe->intel_iaf.index & 0xFFFF;
+	pd->sd_cnt = xe->info.tile_count;
+	pd->socket_id = xe->intel_iaf.socket_id;
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
+	// FIXME: On some systems, TILE0 is < 8Gb, PVC needs 8GB, so fake it.
+	if (reg >> XEHP_TILE_LMEM_RANGE_SHIFT < 8) {
+		drm_err(&xe->drm, "XEHP_TILE0_ADDR_RANGE: %x\n", reg);
+		reg = 8 << XEHP_TILE_LMEM_RANGE_SHIFT;
+	}
+	pd->dpa.pkg_offset = (u32)xe->intel_iaf.index * MAX_DPA_SIZE;
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
+ * Make sure to set the gt->iaf_irq value.
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
+		res->start = xe->intel_iaf.irq_base + i;
+		res->end = xe->intel_iaf.irq_base + i;
+		res->flags = IORESOURCE_IRQ;
+		res++;
+
+		res->start = pci_resource_start(pdev, GTTMMADR_BAR) + CD_BASE_OFFSET +
+			     i * gt_to_tile(gt)->mmio.size;
+		res->end = res->start + CD_BAR_SIZE - 1;
+		res->flags = IORESOURCE_MEM;
+		drm_info(&xe->drm, "IAF: mem_resource = %pR\n", res);
+		res++;
+		gt->iaf_irq = xe->intel_iaf.irq_base + i;
+	}
+
+	*res_cnt = cnt;
+	return res_base;
+}
+
+/**
+ * iaf_irq_mask - Null callback.  Masking/unmasking happens in the parent
+ * driver
+ * @d: Valid irq_data information
+ */
+static void iaf_irq_mask(struct irq_data *d)
+{
+}
+
+static void iaf_irq_unmask(struct irq_data *d)
+{
+}
+
+static struct irq_chip iaf_irq_chip = {
+	.name = "iaf_irq_chip",
+	.irq_mask = iaf_irq_mask,
+	.irq_unmask = iaf_irq_unmask,
+};
+
+/**
+ * init_irq_desc - Allocate IRQ descriptors to use for the iaf
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
+		irq_set_chip_and_handler_name(irq, &iaf_irq_chip,
+					      handle_simple_irq,
+					      "iaf_irq_handler");
+		err = irq_set_chip_data(irq, xe);
+	}
+
+	if (err) {
+		irq_free_descs(irq_base, num_subdevs);
+		goto cleanup;
+	}
+
+	drm_info(&xe->drm, "IAF: IRQ base: %d  cnt: %d\n", irq_base,
+		 num_subdevs);
+
+	xe->intel_iaf.irq_base = irq_base;
+
+	return 0;
+
+cleanup:
+	xe->intel_iaf.index = err;
+	drm_err(&xe->drm, "IAF: Failed to allocate IRQ data: %d\n", err);
+	return err;
+}
+
+/**
+ * xe_iaf_init_early - Set the iaf info to the defaults
+ * @xe: valid xe instance
+ *
+ * index is set to ENODEV to show that, by default, there is no device.
+ * If any of the initialization steps fail, it will be set to the appropriate
+ * errno value.
+ */
+void xe_iaf_init_early(struct xe_device *xe)
+{
+	xe->intel_iaf.ops = &default_ops;
+	xe->intel_iaf.index = -ENODEV;
+}
+
+/**
+ * xe_iaf_init_mmio - check if iaf is available via MMIO
+ * @xe: valid xe instance
+ *
+ * Read the relevant regs to check for IAF availability and get the socket id
+ */
+void xe_iaf_init_mmio(struct xe_device *xe)
+{
+	u32 iaf_info;
+
+	if (!HAS_IAF(xe) || !xe_enable_iaf)
+		return;
+
+	iaf_info = xe_mmio_read32(xe_device_get_root_tile(xe)->primary_gt,
+				  PUNIT_MMIO_CR_POC_STRAPS);
+
+	xe->intel_iaf.socket_id = REG_FIELD_GET(SOCKET_ID_MASK, iaf_info);
+
+	if (REG_FIELD_GET(CD_ALIVE, iaf_info)) {
+		drm_info(&xe->drm, "IAF available\n");
+		xe->intel_iaf.present = true;
+	}
+}
+
+/**
+ * xe_iaf_init - Allocate device index and complete initial HW setup
+ * @xe: valid device instance
+ *
+ * NOTE: index is zero inited.  If the IAF is not present, or an error occurs
+ * during setup, this must be 0 for the range registers.
+ *
+ */
+void xe_iaf_init(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	static u32 last_id;
+	unsigned int i;
+	u32 index = 0;
+	u32 range;
+	u32 base;
+	int err;
+
+	if (!HAS_IAF(xe))
+		return;
+
+	if (!xe->intel_iaf.present)
+		goto set_range;
+
+	err = init_irq_desc(xe);
+	if (err) {
+		xe->intel_iaf.index = err;
+		goto set_range;
+	}
+
+	/*
+	 * Try the socket id first.  Systems with this feature, will
+	 * get a deterministic value.  If not, try with the cyclic.
+	 */
+	err = xa_insert(&intel_fdevs, xe->intel_iaf.socket_id, xe,
+			GFP_KERNEL);
+	if (!err)
+		index = xe->intel_iaf.socket_id;
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
+		xe->intel_iaf.index = err;
+		drm_err(&xe->drm,
+			"IAF: Failed to allocate fabric index: %d\n",
+			err);
+		irq_free_descs(xe->intel_iaf.irq_base,
+			       xe->info.tile_count);
+		goto set_range;
+	}
+	xe->intel_iaf.index = index;
+	xe->intel_iaf.dpa = (u64)index * MAX_DPA_SIZE * SZ_1G;
+	drm_info(&xe->drm, "IAF: [dpa 0x%llx-0x%llx\n", xe->intel_iaf.dpa,
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
+static void xe_iaf_release_dev(struct device *dev)
+{
+	struct auxiliary_device *aux = to_auxiliary_dev(dev);
+	struct iaf_pdata *pd = container_of(aux, struct iaf_pdata, aux_dev);
+
+	kfree(pd->resources);
+	pd->resources = NULL;
+
+	kfree(pd);
+}
+
+/**
+ * xe_iaf_init_aux - Initialize resources and add auxiliary bus interface
+ * @xe: valid xe instance
+ *
+ */
+void xe_iaf_init_aux(struct xe_device *xe)
+{
+	struct device *dev = &to_pci_dev(xe->drm.dev)->dev;
+	struct resource *res = NULL;
+	struct iaf_pdata *pd;
+	int err = -ENOMEM;
+	u32 res_cnt;
+
+	if (!xe->intel_iaf.present)
+		return;
+
+	if (xe->intel_iaf.index < 0) {
+		err = xe->intel_iaf.index;
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
+	pd->aux_dev.name = "iaf";
+	pd->aux_dev.id = pd->index;
+	pd->aux_dev.dev.parent = dev;
+	pd->aux_dev.dev.release = xe_iaf_release_dev;
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
+	xe->intel_iaf.pd = pd;
+
+	return;
+
+cleanup:
+	xa_erase(&intel_fdevs, xe->intel_iaf.index);
+	irq_free_descs(xe->intel_iaf.irq_base, xe->info.tile_count);
+	kfree(res);
+	kfree(pd);
+	xe->intel_iaf.index = err;
+fail:
+	drm_err(&xe->drm, "IAF: Failed to initialize fabric: %d\n", err);
+}
+
+void xe_iaf_remove(struct xe_device *xe)
+{
+	if (xe->intel_iaf.index < 0)
+		return;
+
+	auxiliary_device_delete(&xe->intel_iaf.pd->aux_dev);
+	auxiliary_device_uninit(&xe->intel_iaf.pd->aux_dev);
+	xa_erase(&intel_fdevs, xe->intel_iaf.index);
+	irq_free_descs(xe->intel_iaf.irq_base, xe->info.tile_count);
+
+	xe->intel_iaf.ops = &default_ops;
+}
+
+int xe_iaf_mapping_get(struct xe_device *xe)
+{
+	return xe->intel_iaf.ops->parent_event(xe->intel_iaf.handle,
+					       IAF_PARENT_MAPPING_GET);
+}
+
+int xe_iaf_mapping_put(struct xe_device *xe)
+{
+	return xe->intel_iaf.ops->parent_event(xe->intel_iaf.handle,
+					       IAF_PARENT_MAPPING_PUT);
+}
diff --git a/drivers/gpu/drm/xe/xe_iaf.h b/drivers/gpu/drm/xe/xe_iaf.h
new file mode 100644
index 000000000000..7a383406ec4d
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_iaf.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2019 - 2023 Intel Corporation
+ */
+
+#ifndef _XE_IAF_H_
+#define _XE_IAF_H_
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
+void xe_iaf_init_early(struct xe_device *xe);
+void xe_iaf_init_mmio(struct xe_device *xe);
+void xe_iaf_init(struct xe_device *xe);
+void xe_iaf_init_aux(struct xe_device *xe);
+void xe_iaf_remove(struct xe_device *xe);
+int xe_iaf_pcie_error_notify(struct xe_device *xe);
+int xe_iaf_mapping_get(struct xe_device *xe);
+int xe_iaf_mapping_put(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index b4ed1e4a3388..edcdb1017c9a 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -1,10 +1,11 @@
 // SPDX-License-Identifier: MIT
 /*
- * Copyright © 2021 Intel Corporation
+ * Copyright © 2021 - 2023 Intel Corporation
  */
 
 #include "xe_irq.h"
 
+#include <linux/irq.h>
 #include <linux/sched/clock.h>
 
 #include <drm/drm_managed.h>
@@ -27,6 +28,15 @@
 #define IIR(offset)				XE_REG(offset + 0x8)
 #define IER(offset)				XE_REG(offset + 0xc)
 
+/* Define the BAR and offset for the accelerator fabric CSRs */
+#define XE_IAF_IRQ BIT(8)
+#define CD_BASE_OFFSET 0x291000
+#define CD_BAR_SIZE (256 * 1024)
+
+#define CPORT_MBDB_CSRS				XE_REG(CD_BASE_OFFSET + 0x6000)
+#define CPORT_MBDB_CSRS_END			XE_REG(CD_BASE_OFFSET + 0x1000)
+#define CPORT_MBDB_INT_ENABLE_MASK		XE_REG(CD_BASE_OFFSET + 0x8)
+
 static void assert_iir_is_zero(struct xe_gt *mmio, struct xe_reg reg)
 {
 	u32 val = xe_mmio_read32(mmio, reg);
@@ -355,6 +365,18 @@ static void dg1_intr_enable(struct xe_device *xe, bool stall)
 		xe_mmio_read32(mmio, DG1_MSTR_TILE_INTR);
 }
 
+/*
+ * iaf_irq_handler - handle accelerator fabric IRQs
+ *
+ * PVC can have an accelerator fabric attached.  Handle the IRQs that are
+ * sourced by the device supporting the fabric.
+ */
+static void iaf_irq_handler(struct xe_gt *gt, const u32 master_ctl)
+{
+	if (master_ctl & XE_IAF_IRQ)
+		generic_handle_irq(gt->iaf_irq);
+}
+
 /*
  * Top-level interrupt handler for Xe_LP+ and beyond.  These platforms have
  * a "master tile" interrupt register which must be consulted before the
@@ -409,6 +431,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 			xe_display_irq_handler(xe, master_ctl);
 			gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
 		}
+		iaf_irq_handler(mmio, master_ctl);
 	}
 
 	dg1_intr_enable(xe, false);
@@ -455,6 +478,9 @@ static void gt_irq_reset(struct xe_tile *tile)
 	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_MASK,  ~0);
 	xe_mmio_write32(mmio, GUC_SG_INTR_ENABLE,	 0);
 	xe_mmio_write32(mmio, GUC_SG_INTR_MASK,		~0);
+
+	if (tile->xe->intel_iaf.present)
+		xe_mmio_write64(mmio, CPORT_MBDB_INT_ENABLE_MASK, 0);
 }
 
 static void xelp_irq_reset(struct xe_tile *tile)
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index f1336803b915..c962a697e86b 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -173,7 +173,7 @@ static int xe_determine_lmem_bar_size(struct xe_device *xe)
 	if (!xe->mem.vram.io_size)
 		return -EIO;
 
-	xe->mem.vram.base = 0; /* DPA offset */
+	xe->mem.vram.base = xe->intel_iaf.dpa;
 
 	/* set up a map to the total memory area. */
 	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 2991cf5365d5..e38c62ed9a6c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -135,6 +135,7 @@ static const struct xe_graphics_desc graphics_xehpc = {
 
 	.has_asid = 1,
 	.has_flat_ccs = 0,
+	.has_iaf = 1,
 	.has_link_copy_engine = 1,
 	.supports_usm = 1,
 };
@@ -529,6 +530,7 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.vm_max_level = graphics_desc->vm_max_level;
 	xe->info.supports_usm = graphics_desc->supports_usm;
 	xe->info.has_asid = graphics_desc->has_asid;
+	xe->info.has_iaf = graphics_desc->has_iaf;
 	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
 	xe->info.has_link_copy_engine = graphics_desc->has_link_copy_engine;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index ba31b933eb8e..54d78cbbc70e 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -22,6 +22,7 @@ struct xe_graphics_desc {
 	u8 max_remote_tiles:2;
 
 	u8 has_asid:1;
+	u8 has_iaf:1;
 	u8 has_flat_ccs:1;
 	u8 has_link_copy_engine:1;
 	u8 has_range_tlb_invalidation:1;
diff --git a/include/drm/intel_iaf_platform.h b/include/drm/intel_iaf_platform.h
new file mode 100644
index 000000000000..b2a1e75b1f75
--- /dev/null
+++ b/include/drm/intel_iaf_platform.h
@@ -0,0 +1,143 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019 - 2023 Intel Corporation.
+ */
+
+#ifndef __INTEL_IAF_PLATFORM_H
+#define __INTEL_IAF_PLATFORM_H
+
+#define IAF_VERSION 1
+
+#include <linux/auxiliary_bus.h>
+#include <linux/types.h>
+
+/**
+ * enum product_type - Product type identifying the parent
+ * @IAF_UNDEFINED: no product type hints
+ * @IAF_PONTEVECCHIO: parent is a PVC
+ * @IAF_PRODUCTS: end of the list
+ *
+ * i.e. Pontevecchio is the first product.  Other products would
+ * be next generation GPU, NIC, etc.
+ */
+enum product_type {
+	IAF_UNDEFINED,
+	IAF_PONTEVECCHIO,
+	IAF_PRODUCTS
+};
+
+/**
+ * enum iaf_dev_event - events generated to the parent device
+ * @IAF_DEV_CONNECTIVITY: Connectivity event occurred
+ * @IAF_DEV_ERROR: An error occurred
+ * @IAF_DEV_EVENTS: end of list
+ *
+ * Connectivity events, possible errors, etc.
+ */
+enum iaf_dev_event {
+	IAF_DEV_CONNECTIVITY,
+	IAF_DEV_ERROR,
+	IAF_DEV_EVENTS
+};
+
+/**
+ * enum iaf_parent_event - Events generated by the parent device
+ * @IAF_PARENT_PCIE_ERR: Parent had a PCI error
+ * @IAF_PARENT_MAPPING_GET: Notify IAF of buffer mapping
+ * @IAF_PARENT_MAPPING_PUT: Notify IAF of buffer unmapping
+ *
+ * These are examples.
+ */
+enum iaf_parent_event {
+	IAF_PARENT_PCIE_ERR,
+	IAF_PARENT_MAPPING_GET,
+	IAF_PARENT_MAPPING_PUT,
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
+ * IAF driver.  The access will be indexed by
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
+ * struct iaf_ops - Communication path from parent to IAF instance
+ * @connectivity_query: Query a device for fabric_id connectivity
+ * @parent_event: Any events needed by the IAF device
+ *
+ * connectivity_query() returns:
+ *   a populated query_info on success,
+ *   an ERR_PTR() on failure
+ *
+ */
+struct iaf_ops {
+	struct query_info *(*connectivity_query)(void *handle, u32 fabric_id);
+	int (*parent_event)(void *handle, enum iaf_parent_event event);
+};
+
+struct dpa_space {
+	u32 pkg_offset;
+	u16 pkg_size;
+};
+
+/**
+ * struct iaf_pdata - Platform specific data that needs to be shared
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
+ * @register_dev: Register an IAF instance and ops with the parent device
+ * @unregister_dev: Unregister an IAF instance from the parent device
+ * @dev_event: Notify parent that an event has occurred
+ */
+struct iaf_pdata {
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
+	int (*register_dev)(void *parent, void *handle, u32 fabric_id,
+			    const struct iaf_ops *ops);
+	void (*unregister_dev)(void *parent, const void *handle);
+	int (*dev_event)(void *parent, void *handle,
+			 enum iaf_dev_event event, void *event_data);
+};
+
+#endif /* __INTEL_IAF_PLATFORM_H */
-- 
2.35.1

