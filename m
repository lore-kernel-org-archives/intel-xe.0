Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BF9C7EE33
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 03:47:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A6710E5A0;
	Thu, 11 May 2023 03:47:36 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2483210E590
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 03:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683776851; x=1715312851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FZrNPizaZdILMEF3AhGtWBOxlQSq/eCEDaBhi2Cmt2w=;
 b=bSkj0kF0Ldahc8bkV6ExCvaOYQW7m6Vyc42n5Vu5tT3M0PoA3aSAJrMr
 DlLuTKVLpHa+4fz52qlzeNKbbPC2TXalILPLzncqoIC92mClYmx8lpcN4
 UV3Ivw9a2OFoE9CH8YUQT1MF6ubJhXIrQR1f3KHSR4q36NajIVSBNpXjI
 i4muIeIbj3uiqDOfaBDWXHVbV27VDGgwZmpk1OWsNxfqquW4XrlsBVC/K
 3yKRxJWYkhTcLKLYmPz9Wx/1N4UX749TIPGizway1Jb2f55DM17lY/Z06
 VIRCeGxGRJHIofLwhlsiXLHSnCg814HQwkeEEhyhohGah7oMbpoMj2clQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="347850640"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="347850640"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="789203204"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="789203204"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 20:47:05 -0700
Message-Id: <20230511034722.1929038-10-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230511034722.1929038-1-matthew.d.roper@intel.com>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 09/26] drm/xe: Clarify 'gt' retrieval for primary
 tile
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

There are a bunch of places in the driver where we need to perform
non-GT MMIO against the platform's primary tile (display code, top-level
interrupt enable/disable, driver initialization, etc.).  Rename
'to_gt()' to 'xe_primary_mmio_gt()' to clarify that we're trying to get
a primary MMIO handle for these top-level operations.

In the future we need to move away from xe_gt as the target for MMIO
operations (most of which are completely unrelated to GT).

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h | 2 +-
 drivers/gpu/drm/xe/xe_device.c                        | 2 +-
 drivers/gpu/drm/xe/xe_device.h                        | 9 +++++++--
 drivers/gpu/drm/xe/xe_irq.c                           | 6 +++---
 drivers/gpu/drm/xe/xe_mmio.c                          | 8 ++++----
 drivers/gpu/drm/xe/xe_query.c                         | 2 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c                | 4 ++--
 7 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
index 14f195fe275d..6eff72311773 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
@@ -14,7 +14,7 @@ static inline struct xe_gt *__fake_uncore_to_gt(struct fake_uncore *uncore)
 {
 	struct xe_device *xe = container_of(uncore, struct xe_device, uncore);
 
-	return to_gt(xe);
+	return xe_primary_mmio_gt(xe);
 }
 
 static inline u32 intel_uncore_read(struct fake_uncore *uncore,
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 038074a90584..c93c8895862f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -397,7 +397,7 @@ static void device_kill_persistent_engines(struct xe_device *xe,
 
 void xe_device_wmb(struct xe_device *xe)
 {
-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
+	struct xe_gt *gt = xe_primary_mmio_gt(xe);
 
 	wmb();
 	if (IS_DGFX(xe))
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 745dbb16d417..fc2655484dfd 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -66,9 +66,14 @@ static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
 }
 
 /*
- * FIXME: Placeholder until multi-gt lands. Once that lands, kill this function.
+ * Provide a GT structure suitable for performing non-GT MMIO operations against
+ * the primary tile.  Primarily intended for early tile initialization, display
+ * handling, top-most interrupt enable/disable, etc.
+ *
+ * FIXME: Fix the driver design so that 'gt' isn't the target of all MMIO
+ * operations.
  */
-static inline struct xe_gt *to_gt(struct xe_device *xe)
+static inline struct xe_gt *xe_primary_mmio_gt(struct xe_device *xe)
 {
 	return &xe_device_get_root_tile(xe)->primary_gt;
 }
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 5be31855d789..806121009102 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -285,7 +285,7 @@ static void gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
 static irqreturn_t xelp_irq_handler(int irq, void *arg)
 {
 	struct xe_device *xe = arg;
-	struct xe_gt *gt = xe_device_get_gt(xe, 0);	/* Only 1 GT here */
+	struct xe_gt *gt = xe_primary_mmio_gt(xe);
 	u32 master_ctl, gu_misc_iir;
 	long unsigned int intr_dw[2];
 	u32 identity[32];
@@ -311,7 +311,7 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
 
 static u32 dg1_intr_disable(struct xe_device *xe)
 {
-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
+	struct xe_gt *gt = xe_primary_mmio_gt(xe);
 	u32 val;
 
 	/* First disable interrupts */
@@ -329,7 +329,7 @@ static u32 dg1_intr_disable(struct xe_device *xe)
 
 static void dg1_intr_enable(struct xe_device *xe, bool stall)
 {
-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
+	struct xe_gt *gt = xe_primary_mmio_gt(xe);
 
 	xe_mmio_write32(gt, DG1_MSTR_TILE_INTR, DG1_MSTR_IRQ);
 	if (stall)
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 17b3a9880409..90423c8c7e76 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -150,7 +150,7 @@ static bool xe_pci_resource_valid(struct pci_dev *pdev, int bar)
 
 int xe_mmio_total_vram_size(struct xe_device *xe, u64 *vram_size, u64 *usable_size)
 {
-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
+	struct xe_gt *gt = xe_primary_mmio_gt(xe);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	int err;
 	u32 reg_val;
@@ -287,7 +287,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 
 static void xe_mmio_probe_tiles(struct xe_device *xe)
 {
-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
+	struct xe_gt *gt = xe_primary_mmio_gt(xe);
 	u32 mtcfg;
 	u8 adj_tile_count;
 	u8 id;
@@ -339,7 +339,7 @@ static void mmio_fini(struct drm_device *drm, void *arg)
 int xe_mmio_init(struct xe_device *xe)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
+	struct xe_gt *gt = xe_primary_mmio_gt(xe);
 	const int mmio_bar = 0;
 	int err;
 
@@ -398,7 +398,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 		  struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
+	struct xe_gt *gt = xe_primary_mmio_gt(xe);
 	struct drm_xe_mmio *args = data;
 	unsigned int bits_flag, bytes;
 	struct xe_reg reg;
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index c81652d7f4ec..4d8473328962 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -259,7 +259,7 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
 static int query_hwconfig(struct xe_device *xe,
 			  struct drm_xe_device_query *query)
 {
-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
+	struct xe_gt *gt = xe_primary_mmio_gt(xe);
 	size_t size = xe_guc_hwconfig_size(&gt->uc.guc);
 	void __user *query_ptr = u64_to_user_ptr(query->data);
 	void *hwconfig;
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index a3855870321f..6d12e5dd9981 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -54,7 +54,7 @@ bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe)
 static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	struct xe_gt *gt = to_gt(xe);
+	struct xe_gt *gt = xe_primary_mmio_gt(xe);
 	u64 vram_size, stolen_size;
 	int err;
 
@@ -88,7 +88,7 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
 	u32 stolen_size;
 	u32 ggc, gms;
 
-	ggc = xe_mmio_read32(to_gt(xe), GGC);
+	ggc = xe_mmio_read32(xe_primary_mmio_gt(xe), GGC);
 
 	/* check GGMS, should be fixed 0x3 (8MB) */
 	if (drm_WARN_ON(&xe->drm, (ggc & GGMS_MASK) != GGMS_MASK))
-- 
2.40.0

