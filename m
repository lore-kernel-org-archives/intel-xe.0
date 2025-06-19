Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B33C7115B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Jun 2025 10:49:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6308710E9FB;
	Thu, 19 Jun 2025 10:49:38 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B1A10E9F7
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Jun 2025 10:49:36 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v4 09/11] drm/xe: Remove xe_uc_init_hwconfig()
Date: Thu, 19 Jun 2025 12:49:08 +0200
Message-ID: <20250619104858.418440-22-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250619104858.418440-13-dev@lankhorst.se>
References: <20250619104858.418440-13-dev@lankhorst.se>
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

This function is called immediately after xe_uc_init(), so just put it
there instead.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_gt.c |  4 ----
 drivers/gpu/drm/xe/xe_uc.c | 31 ++++++-------------------------
 drivers/gpu/drm/xe/xe_uc.h |  1 -
 3 files changed, 6 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3942f1ac253e7..14761849390d8 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -466,10 +466,6 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
-	err = xe_uc_init_hwconfig(&gt->uc);
-	if (err)
-		goto err_force_wake;
-
 	xe_gt_topology_init(gt);
 	xe_gt_mcr_init(gt);
 	xe_gt_enable_host_l2_vram(gt);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 0e9ea57fcc88c..8f56a5ef41e24 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -72,15 +72,17 @@ int xe_uc_init(struct xe_uc *uc)
 	if (!xe_device_uc_enabled(uc_to_xe(uc)))
 		return 0;
 
-	if (IS_SRIOV_VF(uc_to_xe(uc)))
-		return 0;
+	if (!IS_SRIOV_VF(uc_to_xe(uc))) {
+		ret = xe_wopcm_init(&uc->wopcm);
+		if (ret)
+			goto err;
+	}
 
-	ret = xe_wopcm_init(&uc->wopcm);
+	ret = xe_guc_min_load_for_hwconfig(&uc->guc);
 	if (ret)
 		goto err;
 
 	return 0;
-
 err:
 	xe_gt_err(uc_to_gt(uc), "Failed to initialize uC (%pe)\n", ERR_PTR(ret));
 	return ret;
@@ -142,27 +144,6 @@ int xe_uc_sanitize_reset(struct xe_uc *uc)
 	return uc_reset(uc);
 }
 
-/**
- * xe_uc_init_hwconfig - minimally init Uc, read and parse hwconfig
- * @uc: The UC object
- *
- * Return: 0 on success, negative error code on error.
- */
-int xe_uc_init_hwconfig(struct xe_uc *uc)
-{
-	int ret;
-
-	/* GuC submission not enabled, nothing to do */
-	if (!xe_device_uc_enabled(uc_to_xe(uc)))
-		return 0;
-
-	ret = xe_guc_min_load_for_hwconfig(&uc->guc);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
 static int vf_uc_init_hw(struct xe_uc *uc)
 {
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index b573b7731f62e..c13d705fe02c4 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -10,7 +10,6 @@ struct xe_uc;
 
 int xe_uc_init_noalloc(struct xe_uc *uc);
 int xe_uc_init(struct xe_uc *uc);
-int xe_uc_init_hwconfig(struct xe_uc *uc);
 int xe_uc_init_post_hwconfig(struct xe_uc *uc);
 int xe_uc_init_hw(struct xe_uc *uc);
 int xe_uc_fini_hw(struct xe_uc *uc);
-- 
2.45.2

