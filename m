Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B486C71136
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 18:02:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA98210E781;
	Tue, 17 Jun 2025 18:02:07 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F5B10E778
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 18:02:04 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v3 6/9] drm/xe/gt: Inline gt_fw_domain_init
Date: Tue, 17 Jun 2025 20:01:39 +0200
Message-ID: <20250617180132.7059-17-dev@lankhorst.se>
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

Have only a single init function for whole of GT to keep things
readable.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_gt.c | 100 +++++++++++++++++--------------------
 1 file changed, 45 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 98360986df7db..1b239d185fc93 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -440,59 +440,6 @@ static void dump_pat_on_error(struct xe_gt *gt)
 	xe_pat_dump(gt, &p);
 }
 
-static int gt_fw_domain_init(struct xe_gt *gt)
-{
-	unsigned int fw_ref;
-	int err;
-
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
-		return -ETIMEDOUT;
-
-	if (!xe_gt_is_media_type(gt)) {
-		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
-		if (err)
-			goto err_force_wake;
-		if (IS_SRIOV_PF(gt_to_xe(gt)))
-			xe_lmtt_init(&gt_to_tile(gt)->sriov.pf.lmtt);
-	}
-
-	/* Enable per hw engine IRQs */
-	xe_irq_enable_hwe(gt);
-
-	/* Rerun MCR init as we now have hw engine list */
-	xe_gt_mcr_init(gt);
-
-	err = xe_hw_engines_init_early(gt);
-	if (err) {
-		dump_pat_on_error(gt);
-		goto err_force_wake;
-	}
-
-	err = xe_hw_engine_class_sysfs_init(gt);
-	if (err)
-		goto err_force_wake;
-
-	/* Initialize CCS mode sysfs after early initialization of HW engines */
-	err = xe_gt_ccs_mode_sysfs_init(gt);
-	if (err)
-		goto err_force_wake;
-
-	/*
-	 * Stash hardware-reported version.  Since this register does not exist
-	 * on pre-MTL platforms, reading it there will (correctly) return 0.
-	 */
-	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
-
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	return 0;
-
-err_force_wake:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-
-	return err;
-}
-
 static int all_fw_domain_init(struct xe_gt *gt)
 {
 	unsigned int fw_ref;
@@ -626,6 +573,7 @@ static void xe_gt_fini(void *arg)
 
 int xe_gt_init(struct xe_gt *gt)
 {
+	unsigned int fw_ref;
 	int err;
 	int i;
 
@@ -648,9 +596,46 @@ int xe_gt_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
-	err = gt_fw_domain_init(gt);
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
+		return -ETIMEDOUT;
+
+	if (!xe_gt_is_media_type(gt)) {
+		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
+		if (err)
+			goto err_force_wake;
+
+		if (IS_SRIOV_PF(gt_to_xe(gt)))
+			xe_lmtt_init(&gt_to_tile(gt)->sriov.pf.lmtt);
+	}
+
+	/* Enable per hw engine IRQs */
+	xe_irq_enable_hwe(gt);
+
+	/* Rerun MCR init as we now have hw engine list */
+	xe_gt_mcr_init(gt);
+
+	err = xe_hw_engines_init_early(gt);
+	if (err) {
+		dump_pat_on_error(gt);
+		goto err_force_wake;
+	}
+
+	err = xe_hw_engine_class_sysfs_init(gt);
+	if (err)
+		goto err_force_wake;
+
+	/* Initialize CCS mode sysfs after early initialization of HW engines */
+	err = xe_gt_ccs_mode_sysfs_init(gt);
 	if (err)
-		return err;
+		goto err_force_wake;
+
+	/*
+	 * Stash hardware-reported version.  Since this register does not exist
+	 * on pre-MTL platforms, reading it there will (correctly) return 0.
+	 */
+	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 
 	err = xe_gt_idle_init(&gt->gtidle);
 	if (err)
@@ -662,6 +647,7 @@ int xe_gt_init(struct xe_gt *gt)
 
 	xe_force_wake_init_engines(gt, gt_to_fw(gt));
 
+	/* With forcewake initialised on engines, call remainder with all forcewake enabled */
 	err = all_fw_domain_init(gt);
 	if (err)
 		return err;
@@ -673,6 +659,10 @@ int xe_gt_init(struct xe_gt *gt)
 		return err;
 
 	return 0;
+
+err_force_wake:
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	return err;
 }
 
 /**
-- 
2.45.2

