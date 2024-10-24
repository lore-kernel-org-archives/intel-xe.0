Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3244ECE8E77
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 13:45:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41B110E258;
	Thu, 24 Oct 2024 13:45:57 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C8910E258
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 13:45:57 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH] drm/xe: Initialise display before GT and tile init
Date: Thu, 24 Oct 2024 15:46:04 +0200
Message-ID: <20241024134604.130664-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241021103823.83948-1-maarten.lankhorst@linux.intel.com>
References: <20241021103823.83948-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
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

Display needs to be initialised first, because we need to preserve the
initial framebuffer. It will be overwritten by any allocation we do,
especially on discrete where the framebuffer is not in stolen memory.

On integrated even if we still recover the initial framebuffer after
allocating, it still shows up as temporary corruption on-screen.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 33 ++++++++++++++++----------
 drivers/gpu/drm/xe/xe_gt.c     | 43 ++++++++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_gt.h     |  1 +
 drivers/gpu/drm/xe/xe_guc_ct.c | 24 ++++++++++---------
 4 files changed, 68 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d145f1376069e..99f1122c0340e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -683,20 +683,12 @@ int xe_device_probe(struct xe_device *xe)
 		err = xe_ggtt_init_early(tile->mem.ggtt);
 		if (err)
 			return err;
-		err = xe_memirq_init(&tile->memirq);
-		if (err)
-			return err;
-	}
-
-	for_each_gt(gt, xe, id) {
-		err = xe_gt_init_hwconfig(gt);
-		if (err)
-			return err;
 	}
 
 	err = xe_devcoredump_init(xe);
 	if (err)
 		return err;
+
 	err = devm_add_action_or_reset(xe->drm.dev, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
@@ -705,9 +697,11 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	err = xe_irq_install(xe);
-	if (err)
-		goto err;
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_init_mcr(gt);
+		if (err)
+			return err;
+	}
 
 	err = probe_has_flat_ccs(xe);
 	if (err)
@@ -740,12 +734,27 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err;
 
+	/* Now we initialise the rest of GT and tiles, and enable interrupts. */
 	for_each_tile(tile, xe, id) {
+		err = xe_memirq_init(&tile->memirq);
+		if (err)
+			return err;
+
 		err = xe_tile_init(tile);
 		if (err)
 			goto err;
 	}
 
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_init_hwconfig(gt);
+		if (err)
+			return err;
+	}
+
+	err = xe_irq_install(xe);
+	if (err)
+		goto err;
+
 	for_each_gt(gt, xe, id) {
 		last_gt = id;
 
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 89e9d9d4db060..a0f125fba24fa 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -542,6 +542,34 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	return err;
 }
 
+int xe_gt_init_mcr(struct xe_gt *gt)
+{
+	/* Init enough GT for display init to go through */
+	unsigned int fw_ref;
+	int err = 0;
+
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
+		return -ETIMEDOUT;
+
+	xe_gt_mcr_init_early(gt);
+	xe_pat_init(gt);
+
+	/* TODO: This is not ideal, we should ideally always initialise UC at the same time */
+	if (IS_SRIOV_VF(gt_to_xe(gt))) {
+		err = xe_uc_init(&gt->uc);
+		if (err)
+			goto out_fw;
+	}
+
+	xe_gt_topology_init(gt);
+	xe_gt_mcr_init(gt);
+	xe_gt_enable_host_l2_vram(gt);
+
+out_fw:
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	return err;
+}
 /*
  * Initialize enough GT to be able to load GuC in order to obtain hwconfig and
  * enable CTB communication.
@@ -555,21 +583,16 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 	if (!fw_ref)
 		return -ETIMEDOUT;
 
-	xe_gt_mcr_init_early(gt);
-	xe_pat_init(gt);
-
-	err = xe_uc_init(&gt->uc);
-	if (err)
-		goto out_fw;
+	if (!IS_SRIOV_VF(gt_to_xe(gt))) {
+		err = xe_uc_init(&gt->uc);
+		if (err)
+			goto out_fw;
+	}
 
 	err = xe_uc_init_hwconfig(&gt->uc);
 	if (err)
 		goto out_fw;
 
-	xe_gt_topology_init(gt);
-	xe_gt_mcr_init(gt);
-	xe_gt_enable_host_l2_vram(gt);
-
 out_fw:
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	return err;
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 82b9b7f82fcab..58aa95fe0aa61 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -29,6 +29,7 @@ static inline bool xe_fault_inject_gt_reset(void)
 
 struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
 int xe_gt_init_hwconfig(struct xe_gt *gt);
+int xe_gt_init_mcr(struct xe_gt *gt);
 int xe_gt_init_early(struct xe_gt *gt);
 int xe_gt_init(struct xe_gt *gt);
 void xe_gt_mmio_init(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index c260d88409907..444771e7ba820 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -207,8 +207,6 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 {
 	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_gt *gt = ct_to_gt(ct);
-	struct xe_tile *tile = gt_to_tile(gt);
-	struct xe_bo *bo;
 	int err;
 
 	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
@@ -234,15 +232,6 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 
 	primelockdep(ct);
 
-	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
-					  XE_BO_FLAG_SYSTEM |
-					  XE_BO_FLAG_GGTT |
-					  XE_BO_FLAG_GGTT_INVALIDATE);
-	if (IS_ERR(bo))
-		return PTR_ERR(bo);
-
-	ct->bo = bo;
-
 	err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
 	if (err)
 		return err;
@@ -434,10 +423,23 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 {
 	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_gt *gt = ct_to_gt(ct);
+	struct xe_tile *tile = gt_to_tile(gt);
 	int err;
 
 	xe_gt_assert(gt, !xe_guc_ct_enabled(ct));
 
+	if (!ct->bo) {
+		struct xe_bo *bo;
+
+		bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
+						XE_BO_FLAG_SYSTEM |
+						XE_BO_FLAG_GGTT |
+						XE_BO_FLAG_GGTT_INVALIDATE);
+		if (IS_ERR(bo))
+			return PTR_ERR(bo);
+		ct->bo = bo;
+	}
+
 	xe_map_memset(xe, &ct->bo->vmap, 0, 0, ct->bo->size);
 	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
 	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
-- 
2.45.2

