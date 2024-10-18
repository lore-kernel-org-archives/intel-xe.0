Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FB8D3F281
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 20:05:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7B910E97B;
	Fri, 18 Oct 2024 20:05:05 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3707810E97B
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 20:05:04 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [CI v2.2] drm/xe: Initialise display before GT and tile init
Date: Fri, 18 Oct 2024 22:05:15 +0200
Message-ID: <20241018200515.26129-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241018170631.6598-5-maarten.lankhorst@linux.intel.com>
References: <20241018170631.6598-5-maarten.lankhorst@linux.intel.com>
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
 drivers/gpu/drm/xe/xe_device.c | 40 ++++++++++++++++++++------------
 drivers/gpu/drm/xe/xe_gt.c     | 42 ++++++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_gt.h     |  1 +
 3 files changed, 61 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 76d8c6868d15e..330cdaf9db30e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -683,21 +683,9 @@ int xe_device_probe(struct xe_device *xe)
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
-	if (err)
-		return err;
-	err = devm_add_action_or_reset(xe->drm.dev, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
 
@@ -705,9 +693,11 @@ int xe_device_probe(struct xe_device *xe)
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
@@ -723,6 +713,11 @@ int xe_device_probe(struct xe_device *xe)
 			goto err;
 	}
 
+	/* Add FLR before xe_display_init_noaccel */
+	err = devm_add_action_or_reset(xe->drm.dev, xe_driver_flr_fini, xe);
+	if (err)
+		return err;
+
 	/* Allocate and map stolen after potential VRAM resize */
 	xe_ttm_stolen_mgr_init(xe);
 
@@ -736,12 +731,27 @@ int xe_device_probe(struct xe_device *xe)
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
index 89e9d9d4db060..7b65d502f948d 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -542,6 +542,38 @@ static int all_fw_domain_init(struct xe_gt *gt)
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
+
+		err = xe_uc_init_hwconfig(&gt->uc);
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
@@ -551,13 +583,13 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 	unsigned int fw_ref;
 	int err;
 
+	if (IS_SRIOV_VF(gt_to_xe(gt)))
+		return 0;
+
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref)
 		return -ETIMEDOUT;
 
-	xe_gt_mcr_init_early(gt);
-	xe_pat_init(gt);
-
 	err = xe_uc_init(&gt->uc);
 	if (err)
 		goto out_fw;
@@ -566,10 +598,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
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
-- 
2.45.2

