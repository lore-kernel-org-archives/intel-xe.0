Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DE9C71157
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 18:02:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5545F10E787;
	Tue, 17 Jun 2025 18:02:13 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD26710E778
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 18:02:05 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v3 8/9] drm/xe: Split init of xe_gt_init_hwconfig to
 xe_gt_init and *_early
Date: Tue, 17 Jun 2025 20:01:41 +0200
Message-ID: <20250617180132.7059-19-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250617180132.7059-11-dev@lankhorst.se>
References: <20250617180132.7059-11-dev@lankhorst.se>
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

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_device.c |  6 ----
 drivers/gpu/drm/xe/xe_gt.c     | 60 +++++++++++++++-------------------
 drivers/gpu/drm/xe/xe_gt.h     |  1 -
 3 files changed, 26 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 44f0b5b46adc2..c8595cc0300fb 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -798,12 +798,6 @@ int xe_device_probe(struct xe_device *xe)
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
index 39a37bf743c96..bbf967a653cd2 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -390,6 +390,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 
 int xe_gt_init_early(struct xe_gt *gt)
 {
+	unsigned int fw_ref;
 	int err;
 
 	if (IS_SRIOV_PF(gt_to_xe(gt))) {
@@ -426,28 +427,9 @@ int xe_gt_init_early(struct xe_gt *gt)
 	 */
 	xe_gt_mmio_init(gt);
 
-	return xe_uc_init_noalloc(&gt->uc);
-}
-
-static void dump_pat_on_error(struct xe_gt *gt)
-{
-	struct drm_printer p;
-	char prefix[32];
-
-	snprintf(prefix, sizeof(prefix), "[GT%u Error]", gt->info.id);
-	p = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, prefix);
-
-	xe_pat_dump(gt, &p);
-}
-
-/*
- * Initialize enough GT to be able to load GuC in order to obtain hwconfig and
- * enable CTB communication.
- */
-int xe_gt_init_hwconfig(struct xe_gt *gt)
-{
-	unsigned int fw_ref;
-	int err;
+	err = xe_uc_init_noalloc(&gt->uc);
+	if (err)
+		return err;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref)
@@ -455,22 +437,20 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 
 	xe_gt_mcr_init_early(gt);
 	xe_pat_init(gt);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 
-	err = xe_uc_init(&gt->uc);
-	if (err)
-		goto out_fw;
+	return 0;
+}
 
-	err = xe_uc_init_hwconfig(&gt->uc);
-	if (err)
-		goto out_fw;
+static void dump_pat_on_error(struct xe_gt *gt)
+{
+	struct drm_printer p;
+	char prefix[32];
 
-	xe_gt_topology_init(gt);
-	xe_gt_mcr_init(gt);
-	xe_gt_enable_host_l2_vram(gt);
+	snprintf(prefix, sizeof(prefix), "[GT%u Error]", gt->info.id);
+	p = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, prefix);
 
-out_fw:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	return err;
+	xe_pat_dump(gt, &p);
 }
 
 static void xe_gt_fini(void *arg)
@@ -513,6 +493,18 @@ int xe_gt_init(struct xe_gt *gt)
 	if (!fw_ref)
 		return -ETIMEDOUT;
 
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
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 187fa6490eafc..8128ddfdd7886 100644
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

