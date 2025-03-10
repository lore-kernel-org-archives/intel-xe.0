Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2131EC28B30
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 20:07:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17C410E4E3;
	Mon, 10 Mar 2025 20:07:28 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F9D10E4E2
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 20:07:24 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 7/8] drm/xe/gt: Inline all_fw_domain_init
Date: Mon, 10 Mar 2025 21:06:52 +0100
Message-ID: <20250310200653.89731-8-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250310200653.89731-1-dev@lankhorst.se>
References: <20250310200653.89731-1-dev@lankhorst.se>
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
 drivers/gpu/drm/xe/xe_gt.c | 161 +++++++++++++++++--------------------
 1 file changed, 72 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index dfe0def966e71..31aee3301a76c 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -396,93 +396,6 @@ static void dump_pat_on_error(struct xe_gt *gt)
 	xe_pat_dump(gt, &p);
 }
 
-static int all_fw_domain_init(struct xe_gt *gt)
-{
-	unsigned int fw_ref;
-	int err;
-
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
-		err = -ETIMEDOUT;
-		goto err_force_wake;
-	}
-
-	xe_gt_mcr_set_implicit_defaults(gt);
-	xe_wa_process_gt(gt);
-	xe_tuning_process_gt(gt);
-	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
-
-	err = xe_gt_clock_init(gt);
-	if (err)
-		goto err_force_wake;
-
-	xe_mocs_init(gt);
-	err = xe_execlist_init(gt);
-	if (err)
-		goto err_force_wake;
-
-	err = xe_hw_engines_init(gt);
-	if (err)
-		goto err_force_wake;
-
-	err = xe_uc_init_post_hwconfig(&gt->uc);
-	if (err)
-		goto err_force_wake;
-
-	if (!xe_gt_is_media_type(gt)) {
-		/*
-		 * USM has its only SA pool to non-block behind user operations
-		 */
-		if (gt_to_xe(gt)->info.has_usm) {
-			struct xe_device *xe = gt_to_xe(gt);
-
-			gt->usm.bb_pool = xe_sa_bo_manager_init(gt_to_tile(gt),
-								IS_DGFX(xe) ? SZ_1M : SZ_512K, 16);
-			if (IS_ERR(gt->usm.bb_pool)) {
-				err = PTR_ERR(gt->usm.bb_pool);
-				goto err_force_wake;
-			}
-		}
-	}
-
-	if (!xe_gt_is_media_type(gt)) {
-		struct xe_tile *tile = gt_to_tile(gt);
-
-		tile->migrate = xe_migrate_init(tile);
-		if (IS_ERR(tile->migrate)) {
-			err = PTR_ERR(tile->migrate);
-			goto err_force_wake;
-		}
-	}
-
-	err = xe_uc_init_hw(&gt->uc);
-	if (err)
-		goto err_force_wake;
-
-	/* Configure default CCS mode of 1 engine with all resources */
-	if (xe_gt_ccs_mode_enabled(gt)) {
-		gt->ccs_mode = 1;
-		xe_gt_apply_ccs_mode(gt);
-	}
-
-	if (IS_SRIOV_PF(gt_to_xe(gt)) && !xe_gt_is_media_type(gt))
-		xe_lmtt_init_hw(&gt_to_tile(gt)->sriov.pf.lmtt);
-
-	if (IS_SRIOV_PF(gt_to_xe(gt))) {
-		xe_gt_sriov_pf_init(gt);
-		xe_gt_sriov_pf_init_hw(gt);
-	}
-
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-
-	return 0;
-
-err_force_wake:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-
-	return err;
-}
-
 /*
  * Initialize enough GT to be able to load GuC in order to obtain hwconfig and
  * enable CTB communication.
@@ -606,9 +519,79 @@ int xe_gt_init(struct xe_gt *gt)
 	xe_force_wake_init_engines(gt, gt_to_fw(gt));
 
 	/* With forcewake initialised on engines, call remainder with all forcewake enabled */
-	err = all_fw_domain_init(gt);
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
+		err = -ETIMEDOUT;
+		goto err_force_wake;
+	}
+
+	xe_gt_mcr_set_implicit_defaults(gt);
+	xe_wa_process_gt(gt);
+	xe_tuning_process_gt(gt);
+	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
+
+	err = xe_gt_clock_init(gt);
 	if (err)
-		return err;
+		goto err_force_wake;
+
+	xe_mocs_init(gt);
+	err = xe_execlist_init(gt);
+	if (err)
+		goto err_force_wake;
+
+	err = xe_hw_engines_init(gt);
+	if (err)
+		goto err_force_wake;
+
+	err = xe_uc_init_post_hwconfig(&gt->uc);
+	if (err)
+		goto err_force_wake;
+
+	if (!xe_gt_is_media_type(gt)) {
+		/*
+		 * USM has its only SA pool to non-block behind user operations
+		 */
+		if (gt_to_xe(gt)->info.has_usm) {
+			struct xe_device *xe = gt_to_xe(gt);
+
+			gt->usm.bb_pool = xe_sa_bo_manager_init(gt_to_tile(gt),
+								IS_DGFX(xe) ? SZ_1M : SZ_512K, 16);
+			if (IS_ERR(gt->usm.bb_pool)) {
+				err = PTR_ERR(gt->usm.bb_pool);
+				goto err_force_wake;
+			}
+		}
+	}
+
+	if (!xe_gt_is_media_type(gt)) {
+		struct xe_tile *tile = gt_to_tile(gt);
+
+		tile->migrate = xe_migrate_init(tile);
+		if (IS_ERR(tile->migrate)) {
+			err = PTR_ERR(tile->migrate);
+			goto err_force_wake;
+		}
+	}
+
+	err = xe_uc_init_hw(&gt->uc);
+	if (err)
+		goto err_force_wake;
+
+	/* Configure default CCS mode of 1 engine with all resources */
+	if (xe_gt_ccs_mode_enabled(gt)) {
+		gt->ccs_mode = 1;
+		xe_gt_apply_ccs_mode(gt);
+	}
+
+	if (IS_SRIOV_PF(gt_to_xe(gt)) && !xe_gt_is_media_type(gt))
+		xe_lmtt_init_hw(&gt_to_tile(gt)->sriov.pf.lmtt);
+
+	if (IS_SRIOV_PF(gt_to_xe(gt))) {
+		xe_gt_sriov_pf_init(gt);
+		xe_gt_sriov_pf_init_hw(gt);
+	}
+
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 
 	xe_gt_record_user_engines(gt);
 
-- 
2.45.2

