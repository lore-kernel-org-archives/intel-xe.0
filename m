Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA01D1269D
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 12:19:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A42A10E58C;
	Tue,  5 Nov 2024 12:19:01 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FAA10E0A1;
 Tue,  5 Nov 2024 12:18:59 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 9/9] drm/xe: Split init of xe_gt_init_hwconfig to xe_gt_init
 and *_early
Date: Tue,  5 Nov 2024 13:18:57 +0100
Message-ID: <20241105121857.17389-9-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241105121857.17389-1-maarten.lankhorst@linux.intel.com>
References: <20241105121857.17389-1-maarten.lankhorst@linux.intel.com>
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

Now that we added the separate step of initialising GUC in
xe_gt_init_early, it should be ok to initialise the minimum during early
init, and the rest after allocations are allowed.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  6 ----
 drivers/gpu/drm/xe/xe_gt.c     | 66 +++++++++++++++++-----------------
 drivers/gpu/drm/xe/xe_gt.h     |  1 -
 3 files changed, 32 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5dafd48d5478b..e11acd5475867 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -654,12 +654,6 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
-	for_each_gt(gt, xe, id) {
-		err = xe_gt_init_hwconfig(gt);
-		if (err)
-			return err;
-	}
-
 	err = xe_devcoredump_init(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index dc6901255dc91..a6154d1bad9f0 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -364,6 +364,21 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 	return err;
 }
 
+static int gt_init_mcr(struct xe_gt *gt)
+{
+	unsigned int fw_ref;
+
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
+		return -ETIMEDOUT;
+
+	xe_gt_mcr_init_early(gt);
+	xe_pat_init(gt);
+
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	return 0;
+}
+
 int xe_gt_init_early(struct xe_gt *gt)
 {
 	int err;
@@ -394,7 +409,11 @@ int xe_gt_init_early(struct xe_gt *gt)
 	 */
 	xe_gt_mmio_init(gt);
 
-	return xe_uc_init_noalloc(&gt->uc);
+	err = xe_uc_init_noalloc(&gt->uc);
+	if (err)
+		return err;
+
+	return gt_init_mcr(gt);
 }
 
 static void dump_pat_on_error(struct xe_gt *gt)
@@ -419,6 +438,18 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 		goto err_hw_fence_irq;
 	}
 
+	err = xe_uc_init(&gt->uc);
+	if (err)
+		goto err_force_wake;
+
+	err = xe_uc_init_hwconfig(&gt->uc);
+	if (err)
+		goto err_force_wake;
+
+	xe_gt_topology_init(gt);
+	xe_gt_mcr_init(gt);
+	xe_gt_enable_host_l2_vram(gt);
+
 	if (!xe_gt_is_media_type(gt)) {
 		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
 		if (err)
@@ -550,39 +581,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	return err;
 }
 
-/*
- * Initialize enough GT to be able to load GuC in order to obtain hwconfig and
- * enable CTB communication.
- */
-int xe_gt_init_hwconfig(struct xe_gt *gt)
-{
-	unsigned int fw_ref;
-	int err;
-
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
-		return -ETIMEDOUT;
-
-	xe_gt_mcr_init_early(gt);
-	xe_pat_init(gt);
-
-	err = xe_uc_init(&gt->uc);
-	if (err)
-		goto out_fw;
-
-	err = xe_uc_init_hwconfig(&gt->uc);
-	if (err)
-		goto out_fw;
-
-	xe_gt_topology_init(gt);
-	xe_gt_mcr_init(gt);
-	xe_gt_enable_host_l2_vram(gt);
-
-out_fw:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	return err;
-}
-
 int xe_gt_init(struct xe_gt *gt)
 {
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 82b9b7f82fcab..0c026cc91ffe9 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -28,7 +28,6 @@ static inline bool xe_fault_inject_gt_reset(void)
 }
 
 struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
-int xe_gt_init_hwconfig(struct xe_gt *gt);
 int xe_gt_init_early(struct xe_gt *gt);
 int xe_gt_init(struct xe_gt *gt);
 void xe_gt_mmio_init(struct xe_gt *gt);
-- 
2.45.2

