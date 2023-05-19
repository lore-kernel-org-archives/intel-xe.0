Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A6BC77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 23:19:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B061E10E113;
	Fri, 19 May 2023 23:19:57 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73E910E547
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 23:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684538329; x=1716074329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wHhW5sXgN0mU5kc+pegX8QtK1wwp8D7XwyN0WuXvtsQ=;
 b=hwc7AVsQ+3wTs1h87rZ/a4mBgfoggTCmasC/lxBN+l//LgFWPokb0Vmx
 PnQK13zbxxT9qh8VrDatQRPQHjruLpTcQjZSURBrwUP+LtSsUwZ18XpWd
 nh0AimVmo3Vw5/k2kF4uxrRJ72K2Sx7wCrgPrSFAz4Vame/q7S0Rg7a/Q
 4GR/53ShBuLIQ3EJ1JJ44bdjURv4JoUlFgloSfsZJD99UbPO66kdW75t9
 LxyfOam0U/zmamPKfoncTk3uCA/p7DNHsDSmONzyubM9MapPFUyODnXVI
 8tZUNXFSwwS3Y8uBm95wtoHZtG7s1DtusIDDKkLGU4ZvI1EqZ6WIJAaJv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="352526364"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="352526364"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="696888725"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="696888725"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:41 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 19 May 2023 16:18:11 -0700
Message-Id: <20230519231827.3572452-15-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230519231827.3572452-1-matthew.d.roper@intel.com>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 14/30] drm/xe: Clarify 'gt' retrieval for
 primary tile
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

v2:
 - s/xe_primary_mmio_gt/xe_root_mmio_gt/ for more consistency with how
   we refer to tile 0.  (Lucas)

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h |  2 +-
 drivers/gpu/drm/xe/xe_device.c                        |  2 +-
 drivers/gpu/drm/xe/xe_device.h                        | 11 +++++++++--
 drivers/gpu/drm/xe/xe_irq.c                           |  6 +++---
 drivers/gpu/drm/xe/xe_mmio.c                          |  8 ++++----
 drivers/gpu/drm/xe/xe_query.c                         |  2 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c                |  4 ++--
 7 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
index 14f195fe275d..fae6213d26f1 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
@@ -14,7 +14,7 @@ static inline struct xe_gt *__fake_uncore_to_gt(struct fake_uncore *uncore)
 {
 	struct xe_device *xe = container_of(uncore, struct xe_device, uncore);
 
-	return to_gt(xe);
+	return xe_root_mmio_gt(xe);
 }
 
 static inline u32 intel_uncore_read(struct fake_uncore *uncore,
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index af165ad6f197..43a585b67581 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -394,7 +394,7 @@ static void device_kill_persistent_engines(struct xe_device *xe,
 
 void xe_device_wmb(struct xe_device *xe)
 {
-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
 
 	wmb();
 	if (IS_DGFX(xe))
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 745dbb16d417..42bc566c53d8 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -66,9 +66,16 @@ static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
 }
 
 /*
- * FIXME: Placeholder until multi-gt lands. Once that lands, kill this function.
+ * Provide a GT structure suitable for performing non-GT MMIO operations against
+ * the primary tile.  Primarily intended for early tile initialization, display
+ * handling, top-most interrupt enable/disable, etc.  Since anything using the
+ * MMIO handle returned by this function doesn't need GSI offset translation,
+ * we'll return the primary GT from the root tile.
+ *
+ * FIXME: Fix the driver design so that 'gt' isn't the target of all MMIO
+ * operations.
  */
-static inline struct xe_gt *to_gt(struct xe_device *xe)
+static inline struct xe_gt *xe_root_mmio_gt(struct xe_device *xe)
 {
 	return &xe_device_get_root_tile(xe)->primary_gt;
 }
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 5be31855d789..628057497cd5 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -285,7 +285,7 @@ static void gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
 static irqreturn_t xelp_irq_handler(int irq, void *arg)
 {
 	struct xe_device *xe = arg;
-	struct xe_gt *gt = xe_device_get_gt(xe, 0);	/* Only 1 GT here */
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
 	u32 master_ctl, gu_misc_iir;
 	long unsigned int intr_dw[2];
 	u32 identity[32];
@@ -311,7 +311,7 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
 
 static u32 dg1_intr_disable(struct xe_device *xe)
 {
-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
 	u32 val;
 
 	/* First disable interrupts */
@@ -329,7 +329,7 @@ static u32 dg1_intr_disable(struct xe_device *xe)
 
 static void dg1_intr_enable(struct xe_device *xe, bool stall)
 {
-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
 
 	xe_mmio_write32(gt, DG1_MSTR_TILE_INTR, DG1_MSTR_IRQ);
 	if (stall)
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 17b3a9880409..32427c10ba8a 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -150,7 +150,7 @@ static bool xe_pci_resource_valid(struct pci_dev *pdev, int bar)
 
 int xe_mmio_total_vram_size(struct xe_device *xe, u64 *vram_size, u64 *usable_size)
 {
-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	int err;
 	u32 reg_val;
@@ -287,7 +287,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 
 static void xe_mmio_probe_tiles(struct xe_device *xe)
 {
-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
 	u32 mtcfg;
 	u8 adj_tile_count;
 	u8 id;
@@ -339,7 +339,7 @@ static void mmio_fini(struct drm_device *drm, void *arg)
 int xe_mmio_init(struct xe_device *xe)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
 	const int mmio_bar = 0;
 	int err;
 
@@ -398,7 +398,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 		  struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
 	struct drm_xe_mmio *args = data;
 	unsigned int bits_flag, bytes;
 	struct xe_reg reg;
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index c81652d7f4ec..49fff425adcd 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -259,7 +259,7 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
 static int query_hwconfig(struct xe_device *xe,
 			  struct drm_xe_device_query *query)
 {
-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
 	size_t size = xe_guc_hwconfig_size(&gt->uc.guc);
 	void __user *query_ptr = u64_to_user_ptr(query->data);
 	void *hwconfig;
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index a3855870321f..012474a6c387 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -54,7 +54,7 @@ bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe)
 static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	struct xe_gt *gt = to_gt(xe);
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
 	u64 vram_size, stolen_size;
 	int err;
 
@@ -88,7 +88,7 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
 	u32 stolen_size;
 	u32 ggc, gms;
 
-	ggc = xe_mmio_read32(to_gt(xe), GGC);
+	ggc = xe_mmio_read32(xe_root_mmio_gt(xe), GGC);
 
 	/* check GGMS, should be fixed 0x3 (8MB) */
 	if (drm_WARN_ON(&xe->drm, (ggc & GGMS_MASK) != GGMS_MASK))
-- 
2.40.0

