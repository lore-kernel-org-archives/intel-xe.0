Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338CAC77B75
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 23:18:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B433310E626;
	Fri, 19 May 2023 23:18:49 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364DD10E4D4
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 23:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684538326; x=1716074326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rldJx9/2EkdBiQsc5Q1i360V21p+xzPA/rv0WHidaZU=;
 b=MbulwO8wpcTbYX7CPuTSSxQexBI6CNhgXkzAtqPmzwDe3rSbO/O0axrC
 Tvja+4Tzvd15f60LwvrLOJcHA9ZdeEfHTL6M2RO5+Eykvi0APaNiiAkPM
 rrXE4YGu/jKxzcx1K9NMGea/uLNPlCqYCmB0B8/hExhGwYUwrLUqOKDRu
 5MtTxndVXaYh7EN3cUcMaBT99Ox1us/hUAj8XehcruSxt7eZkGP7D4Bxv
 L1ULosITJk1r/UwpLmzZ7VQnAtPQeQ7nV6es76Hfg4kD0Ej8gAZYbCQht
 my4bFqgqgCd30hMC76Zvo1SiXE2b/GycXTRvz5q7A6CMSXKSbpQRqsNPL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="352526338"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="352526338"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="696888685"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="696888685"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:40 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 19 May 2023 16:17:59 -0700
Message-Id: <20230519231827.3572452-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230519231827.3572452-1-matthew.d.roper@intel.com>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 02/30] drm/xe: Introduce xe_tile
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Create a new xe_tile structure to begin separating the concept of "tile"
from "GT."  A tile is effectively a complete GPU, and a GT is just one
part of that.  On platforms like MTL, there's only a single full GPU
(tile) which has its IP blocks provided by two GTs.  In contrast, a
"multi-tile" platform like PVC is basically multiple complete GPUs
packed behind a single PCI device.

For now, just create xe_tile as a simple wrapper around xe_gt.  The
items in xe_gt that are truly tied to the tile rather than the GT will
be moved in future patches.  Support for multiple GTs per tile (i.e.,
the MTL standalone media case) will also be re-introduced in a future
patch.

v2:
 - Fix kunit test build
 - Move hunk from next patch to use local tile variable rather than
   direct xe->tiles[id] accesses.  (Lucas)
 - Mention compute in kerneldoc.  (Rodrigo)

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c       |  2 +-
 drivers/gpu/drm/xe/tests/xe_rtp_test.c |  6 ++--
 drivers/gpu/drm/xe/xe_device.h         | 11 +++++--
 drivers/gpu/drm/xe/xe_device_types.h   | 40 ++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_types.h       | 15 ++++++----
 drivers/gpu/drm/xe/xe_mmio.c           | 13 +++++----
 drivers/gpu/drm/xe/xe_pci.c            |  7 ++++-
 drivers/gpu/drm/xe/xe_vm.c             |  2 +-
 drivers/gpu/drm/xe/xe_vm_types.h       |  8 +++---
 9 files changed, 78 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 9bd381e5b7a6..6075f12a1962 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -174,7 +174,7 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
 	struct xe_bo *bo, *external;
 	unsigned int bo_flags = XE_BO_CREATE_USER_BIT |
 		XE_BO_CREATE_VRAM_IF_DGFX(gt);
-	struct xe_vm *vm = xe_migrate_get_vm(xe->gt[0].migrate);
+	struct xe_vm *vm = xe_migrate_get_vm(xe_device_get_root_tile(xe)->primary_gt.migrate);
 	struct ww_acquire_ctx ww;
 	int err, i;
 
diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index 4b2aac5ccf28..7f8153df43ac 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -13,6 +13,7 @@
 
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_reg_defs.h"
+#include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_pci_test.h"
 #include "xe_reg_sr.h"
@@ -236,12 +237,13 @@ static void xe_rtp_process_tests(struct kunit *test)
 {
 	const struct rtp_test_case *param = test->param_value;
 	struct xe_device *xe = test->priv;
-	struct xe_reg_sr *reg_sr = &xe->gt[0].reg_sr;
+	struct xe_gt *gt = &xe_device_get_root_tile(xe)->primary_gt;
+	struct xe_reg_sr *reg_sr = &gt->reg_sr;
 	const struct xe_reg_sr_entry *sre, *sr_entry = NULL;
 	unsigned long idx, count = 0;
 
 	xe_reg_sr_init(reg_sr, "xe_rtp_tests", xe);
-	xe_rtp_process(param->entries, reg_sr, &xe->gt[0], NULL);
+	xe_rtp_process(param->entries, reg_sr, gt, NULL);
 
 	xa_for_each(&reg_sr->xa, idx, sre) {
 		if (idx == param->expected_reg.addr)
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index cbae480a2092..f7acaf51a1fc 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -48,12 +48,17 @@ static inline struct xe_file *to_xe_file(const struct drm_file *file)
 	return file->driver_priv;
 }
 
+static inline struct xe_tile *xe_device_get_root_tile(struct xe_device *xe)
+{
+	return &xe->tiles[0];
+}
+
 static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
 {
 	struct xe_gt *gt;
 
-	XE_BUG_ON(gt_id > XE_MAX_GT);
-	gt = xe->gt + gt_id;
+	XE_BUG_ON(gt_id > XE_MAX_TILES_PER_DEVICE);
+	gt = &xe->tiles[gt_id].primary_gt;
 	XE_BUG_ON(gt->info.id != gt_id);
 	XE_BUG_ON(gt->info.type == XE_GT_TYPE_UNINITIALIZED);
 
@@ -65,7 +70,7 @@ static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
  */
 static inline struct xe_gt *to_gt(struct xe_device *xe)
 {
-	return xe->gt;
+	return &xe_device_get_root_tile(xe)->primary_gt;
 }
 
 static inline bool xe_device_guc_submission_enabled(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 77d1cc6514c4..11d973508d6c 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -35,7 +35,7 @@
 
 #define XE_GT0		0
 #define XE_GT1		1
-#define XE_MAX_GT	(XE_GT1 + 1)
+#define XE_MAX_TILES_PER_DEVICE	(XE_GT1 + 1)
 
 #define XE_MAX_ASID	(BIT(20))
 
@@ -49,6 +49,40 @@
 	 (_xe)->info.step.graphics >= (min_step) &&			\
 	 (_xe)->info.step.graphics < (max_step))
 
+#define tile_to_xe(tile__)								\
+	_Generic(tile__,								\
+		 const struct xe_tile *: (const struct xe_device *)((tile__)->xe),	\
+		 struct xe_tile *: (tile__)->xe)
+
+/**
+ * struct xe_tile - hardware tile structure
+ *
+ * From a driver perspective, a "tile" is effectively a complete GPU, containing
+ * an SGunit, 1-2 GTs, and (for discrete platforms) VRAM.
+ *
+ * Multi-tile platforms effectively bundle multiple GPUs behind a single PCI
+ * device and designate one "root" tile as being responsible for external PCI
+ * communication.  PCI BAR0 exposes the GGTT and MMIO register space for each
+ * tile in a stacked layout, and PCI BAR2 exposes the local memory associated
+ * with each tile similarly.  Device-wide interrupts can be enabled/disabled
+ * at the root tile, and the MSTR_TILE_INTR register will report which tiles
+ * have interrupts that need servicing.
+ */
+struct xe_tile {
+	/** @xe: Backpointer to tile's PCI device */
+	struct xe_device *xe;
+
+	/** @id: ID of the tile */
+	u8 id;
+
+	/**
+	 * @primary_gt: Primary GT
+	 */
+	struct xe_gt primary_gt;
+
+	/* TODO: Add media GT here */
+};
+
 /**
  * struct xe_device - Top level struct of XE device
  */
@@ -252,8 +286,8 @@ struct xe_device {
 	/** @ordered_wq: used to serialize compute mode resume */
 	struct workqueue_struct *ordered_wq;
 
-	/** @gt: graphics tile */
-	struct xe_gt gt[XE_MAX_GT];
+	/** @tiles: device tiles */
+	struct xe_tile tiles[XE_MAX_TILES_PER_DEVICE];
 
 	/**
 	 * @mem_access: keep track of memory access in the device, possibly
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 7c47d67aa8be..cac676353ac6 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -77,12 +77,17 @@ enum xe_steering_type {
 };
 
 /**
- * struct xe_gt - Top level struct of a graphics tile
+ * struct xe_gt - A "Graphics Technology" unit of the GPU
  *
- * A graphics tile may be a physical split (duplicate pieces of silicon,
- * different GGTT + VRAM) or a virtual split (shared GGTT + VRAM). Either way
- * this structure encapsulates of everything a GT is (MMIO, VRAM, memory
- * management, microcontrols, and a hardware set of engines).
+ * A GT ("Graphics Technology") is the subset of a GPU primarily responsible
+ * for implementing the graphics, compute, and/or media IP.  It encapsulates
+ * the hardware engines, programmable execution units, and GuC.   Each GT has
+ * its own handling of power management (RC6+forcewake) and multicast register
+ * steering.
+ *
+ * A GPU/tile may have a single GT that supplies all graphics, compute, and
+ * media functionality, or the graphics/compute and media may be split into
+ * separate GTs within a tile.
  */
 struct xe_gt {
 	/** @xe: backpointer to XE device */
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 4804616a3c44..254b4a63d901 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -399,6 +399,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 		  struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
+	struct xe_gt *gt = xe_device_get_gt(xe, 0);
 	struct drm_xe_mmio *args = data;
 	unsigned int bits_flag, bytes;
 	struct xe_reg reg;
@@ -440,7 +441,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 	 */
 	reg = XE_REG(args->addr);
 
-	xe_force_wake_get(gt_to_fw(&xe->gt[0]), XE_FORCEWAKE_ALL);
+	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 
 	if (args->flags & DRM_XE_MMIO_WRITE) {
 		switch (bits_flag) {
@@ -449,10 +450,10 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 				ret = -EINVAL;
 				goto exit;
 			}
-			xe_mmio_write32(to_gt(xe), reg, args->value);
+			xe_mmio_write32(gt, reg, args->value);
 			break;
 		case DRM_XE_MMIO_64BIT:
-			xe_mmio_write64(to_gt(xe), reg, args->value);
+			xe_mmio_write64(gt, reg, args->value);
 			break;
 		default:
 			drm_dbg(&xe->drm, "Invalid MMIO bit size");
@@ -467,10 +468,10 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 	if (args->flags & DRM_XE_MMIO_READ) {
 		switch (bits_flag) {
 		case DRM_XE_MMIO_32BIT:
-			args->value = xe_mmio_read32(to_gt(xe), reg);
+			args->value = xe_mmio_read32(gt, reg);
 			break;
 		case DRM_XE_MMIO_64BIT:
-			args->value = xe_mmio_read64(to_gt(xe), reg);
+			args->value = xe_mmio_read64(gt, reg);
 			break;
 		default:
 			drm_dbg(&xe->drm, "Invalid MMIO bit size");
@@ -482,7 +483,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 	}
 
 exit:
-	xe_force_wake_put(gt_to_fw(&xe->gt[0]), XE_FORCEWAKE_ALL);
+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 116569910e58..fc7984e4b40c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -492,6 +492,7 @@ static int xe_info_init(struct xe_device *xe,
 {
 	const struct xe_graphics_desc *graphics_desc = NULL;
 	const struct xe_media_desc *media_desc = NULL;
+	struct xe_tile *tile;
 	struct xe_gt *gt;
 	u8 id;
 
@@ -549,7 +550,11 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.step = xe_step_get(xe);
 
 	for (id = 0; id < xe->info.tile_count; ++id) {
-		gt = xe->gt + id;
+		tile = &xe->tiles[id];
+		tile->xe = xe;
+		tile->id = id;
+
+		gt = &tile->primary_gt;
 		gt->info.id = id;
 		gt->xe = xe;
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a0306526b269..b8fc30c3f370 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3350,7 +3350,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	struct xe_device *xe = vma->vm->xe;
 	struct xe_gt *gt;
 	u32 gt_needs_invalidate = 0;
-	int seqno[XE_MAX_GT];
+	int seqno[XE_MAX_TILES_PER_DEVICE];
 	u8 id;
 	int ret;
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index fada7896867f..203ba9d946b8 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -159,7 +159,7 @@ struct xe_vm {
 	struct kref refcount;
 
 	/* engine used for (un)binding vma's */
-	struct xe_engine *eng[XE_MAX_GT];
+	struct xe_engine *eng[XE_MAX_TILES_PER_DEVICE];
 
 	/** Protects @rebind_list and the page-table structures */
 	struct dma_resv resv;
@@ -167,9 +167,9 @@ struct xe_vm {
 	u64 size;
 	struct rb_root vmas;
 
-	struct xe_pt *pt_root[XE_MAX_GT];
-	struct xe_bo *scratch_bo[XE_MAX_GT];
-	struct xe_pt *scratch_pt[XE_MAX_GT][XE_VM_MAX_LEVEL];
+	struct xe_pt *pt_root[XE_MAX_TILES_PER_DEVICE];
+	struct xe_bo *scratch_bo[XE_MAX_TILES_PER_DEVICE];
+	struct xe_pt *scratch_pt[XE_MAX_TILES_PER_DEVICE][XE_VM_MAX_LEVEL];
 
 	/** @flags: flags for this VM, statically setup a creation time */
 #define XE_VM_FLAGS_64K			BIT(0)
-- 
2.40.0

