Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D16C77B7A
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 14:25:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F0D10E6A5;
	Fri,  2 Jun 2023 14:25:28 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8783A10E6A5
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 14:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685715926; x=1717251926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EdmIzWXGy6LJWEoJQLwB7B2nWiiFhvsW8ZpHzedhtpI=;
 b=QHh80JdZma9kAI4Hv//U6YD++dybHHf5xnX4TZ33NYM2pCn1/+88iUoq
 LIQmQ7bMLyleJrvlXhGsNKdU7arl/qQ2KvhVzKT2f0g5CQqahp7wgCFMr
 fwJ7JOq4XQaGUfuQQgxPQlSpeBfQKduCyTmDXFIDGjrDjhc7A/O5wrZvZ
 AADP3XRkkGfAIu/1Mv7i7ZG5eeZYGSbw2n6wUbFhBpUT7KZWxQiA58GNI
 X2aEraF3BNTkcTXc6natckVH220+RQP8jG99QdwqvkOw0HnHGIi3FTf7J
 n79zsGQ29TEbFnsD/jut5i3YfQcihLXCfmJN7bfaDZwJ9Sh6D/ZLqQi/L Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354726242"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="354726242"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 07:25:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="832000701"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="832000701"
Received: from pbabu1x-mobl.ger.corp.intel.com (HELO db6d3cf1941b.intel.com)
 ([10.252.57.1])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 07:25:24 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  2 Jun 2023 14:25:01 +0000
Message-Id: <20230602142501.6-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602142501.6-1-francois.dugast@intel.com>
References: <20230602142501.6-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 1/1] drm/xe: Introduce function pointers for
 MMIO functions
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
Cc: ofir1.bitton@intel.com, ohadshar@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

A local structure of function pointers is used as a minimal hardware
abstraction layer to prepare for platform independent MMIO calls.

Cc: Oded Gabbay <ogabbay@kernel.org>
Cc: Ofir Bitton <ofir1.bitton@intel.com>
Cc: Ohad Sharabi <ohadshar@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  3 ++
 drivers/gpu/drm/xe/xe_mmio.c         | 81 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mmio.h         | 35 ++++++------
 3 files changed, 99 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 17b6b1cc5adb..3f8fd0d8129b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -378,6 +378,9 @@ struct xe_device {
 	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
 	bool d3cold_allowed;
 
+	/** @mmio_funcs: function pointers for MMIO related functions */
+	const struct xe_mmio_funcs *mmio_funcs;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 475b14fe4356..f3d08676a77a 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -25,6 +25,62 @@
 
 #define BAR_SIZE_SHIFT 20
 
+static void xe_mmio_write32_device(struct xe_gt *gt,
+				   struct xe_reg reg, u32 val);
+static u32 xe_mmio_read32_device(struct xe_gt *gt, struct xe_reg reg);
+static void xe_mmio_write64_device(struct xe_gt *gt,
+				   struct xe_reg reg, u64 val);
+static u64 xe_mmio_read64_device(struct xe_gt *gt, struct xe_reg reg);
+
+static const struct xe_mmio_funcs xe_mmio_funcs_device = {
+	.write32 = xe_mmio_write32_device,
+	.read32 = xe_mmio_read32_device,
+	.write64 = xe_mmio_write64_device,
+	.read64 = xe_mmio_read64_device,
+};
+
+static inline void xe_mmio_write32_device(struct xe_gt *gt,
+				   struct xe_reg reg, u32 val)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+
+	if (reg.addr < gt->mmio.adj_limit)
+		reg.addr += gt->mmio.adj_offset;
+
+	writel(val, tile->mmio.regs + reg.addr);
+}
+
+static inline u32 xe_mmio_read32_device(struct xe_gt *gt, struct xe_reg reg)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+
+	if (reg.addr < gt->mmio.adj_limit)
+		reg.addr += gt->mmio.adj_offset;
+
+	return readl(tile->mmio.regs + reg.addr);
+}
+
+static inline void xe_mmio_write64_device(struct xe_gt *gt,
+				   struct xe_reg reg, u64 val)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+
+	if (reg.addr < gt->mmio.adj_limit)
+		reg.addr += gt->mmio.adj_offset;
+
+	writeq(val, tile->mmio.regs + reg.addr);
+}
+
+static inline u64 xe_mmio_read64_device(struct xe_gt *gt, struct xe_reg reg)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+
+	if (reg.addr < gt->mmio.adj_limit)
+		reg.addr += gt->mmio.adj_offset;
+
+	return readq(tile->mmio.regs + reg.addr);
+}
+
 static int xe_set_dma_info(struct xe_device *xe)
 {
 	unsigned int mask_size = xe->info.dma_mask_size;
@@ -377,6 +433,29 @@ static void mmio_fini(struct drm_device *drm, void *arg)
 		iounmap(xe->mem.vram.mapping);
 }
 
+static void xe_mmio_set_funcs(struct xe_device *xe)
+{
+	/* For now all platforms use the set of MMIO functions for a
+	 * physical device.
+	 */
+	switch (xe->info.platform) {
+	case XE_TIGERLAKE:
+	case XE_ROCKETLAKE:
+	case XE_ALDERLAKE_S:
+	case XE_ALDERLAKE_P:
+	case XE_ALDERLAKE_N:
+	case XE_DG1:
+	case XE_DG2:
+	case XE_PVC:
+	case XE_METEORLAKE:
+		xe->mmio_funcs = &xe_mmio_funcs_device;
+		break;
+	default:
+		DRM_ERROR("Unsupported platform\n");
+		break;
+	}
+}
+
 int xe_mmio_init(struct xe_device *xe)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
@@ -384,6 +463,8 @@ int xe_mmio_init(struct xe_device *xe)
 	const int mmio_bar = 0;
 	int err;
 
+	xe_mmio_set_funcs(xe);
+
 	/*
 	 * Map the first 16MB of th BAR, which includes the registers (0-4MB),
 	 * reserved space (4MB-8MB), and GGTT (8MB-16MB) for a single tile.
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 3c547d78afba..80ce9de7aac4 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -19,6 +19,13 @@ struct xe_device;
 
 #define GEN12_LMEM_BAR		2
 
+struct xe_mmio_funcs {
+	u32 (*read32)(struct xe_gt *gt, struct xe_reg reg);
+	u64 (*read64)(struct xe_gt *gt, struct xe_reg reg);
+	void (*write32)(struct xe_gt *gt, struct xe_reg reg, u32 val);
+	void (*write64)(struct xe_gt *gt, struct xe_reg reg, u64 val);
+};
+
 int xe_mmio_init(struct xe_device *xe);
 
 static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
@@ -34,22 +41,16 @@ static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
 static inline void xe_mmio_write32(struct xe_gt *gt,
 				   struct xe_reg reg, u32 val)
 {
-	struct xe_tile *tile = gt_to_tile(gt);
-
-	if (reg.addr < gt->mmio.adj_limit)
-		reg.addr += gt->mmio.adj_offset;
+	struct xe_device *xe = gt_to_xe(gt);
 
-	writel(val, tile->mmio.regs + reg.addr);
+	xe->mmio_funcs->write32(gt, reg, val);
 }
 
 static inline u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
 {
-	struct xe_tile *tile = gt_to_tile(gt);
-
-	if (reg.addr < gt->mmio.adj_limit)
-		reg.addr += gt->mmio.adj_offset;
+	struct xe_device *xe = gt_to_xe(gt);
 
-	return readl(tile->mmio.regs + reg.addr);
+	return xe->mmio_funcs->read32(gt, reg);
 }
 
 static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
@@ -67,22 +68,16 @@ static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
 static inline void xe_mmio_write64(struct xe_gt *gt,
 				   struct xe_reg reg, u64 val)
 {
-	struct xe_tile *tile = gt_to_tile(gt);
-
-	if (reg.addr < gt->mmio.adj_limit)
-		reg.addr += gt->mmio.adj_offset;
+	struct xe_device *xe = gt_to_xe(gt);
 
-	writeq(val, tile->mmio.regs + reg.addr);
+	xe->mmio_funcs->write64(gt, reg, val);
 }
 
 static inline u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
 {
-	struct xe_tile *tile = gt_to_tile(gt);
-
-	if (reg.addr < gt->mmio.adj_limit)
-		reg.addr += gt->mmio.adj_offset;
+	struct xe_device *xe = gt_to_xe(gt);
 
-	return readq(tile->mmio.regs + reg.addr);
+	return xe->mmio_funcs->read64(gt, reg);
 }
 
 static inline int xe_mmio_write32_and_verify(struct xe_gt *gt,
-- 
2.34.1

