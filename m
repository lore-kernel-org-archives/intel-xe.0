Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3189C77B7C
	for <intel-xe@archiver.kernel.org>; Thu, 19 Jun 2025 10:49:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62DE110E9FA;
	Thu, 19 Jun 2025 10:49:38 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC86E10E9F6
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Jun 2025 10:49:34 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v4 03/11] drm/xe: Simplify GuC early initialization
Date: Thu, 19 Jun 2025 12:49:02 +0200
Message-ID: <20250619104858.418440-16-dev@lankhorst.se>
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

Add a 2-stage GuC init. An early one for everything that is needed
for VF, and a full one that loads GuC and is allowed to do allocations.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_gt.c     |  2 +-
 drivers/gpu/drm/xe/xe_guc.c    | 51 +++++++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_guc.h    |  1 +
 drivers/gpu/drm/xe/xe_guc_ct.c | 28 ++++++++++++-------
 drivers/gpu/drm/xe/xe_guc_ct.h |  1 +
 drivers/gpu/drm/xe/xe_uc.c     | 16 +++++++++++
 drivers/gpu/drm/xe/xe_uc.h     |  1 +
 7 files changed, 70 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 4370a4db95e05..6bc793043b400 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -426,7 +426,7 @@ int xe_gt_init_early(struct xe_gt *gt)
 	 */
 	xe_gt_mmio_init(gt);
 
-	return 0;
+	return xe_uc_init_noalloc(&gt->uc);
 }
 
 static void dump_pat_on_error(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 81b22b6fb2493..eeb23f8aa9de8 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -627,21 +627,11 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
 	return 0;
 }
 
-static int vf_guc_init(struct xe_guc *guc)
+static int vf_guc_init_noalloc(struct xe_guc *guc)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
 	int err;
 
-	xe_guc_comm_init_early(guc);
-
-	err = xe_guc_ct_init(&guc->ct);
-	if (err)
-		return err;
-
-	err = xe_guc_relay_init(&guc->relay);
-	if (err)
-		return err;
-
 	err = xe_gt_sriov_vf_bootstrap(gt);
 	if (err)
 		return err;
@@ -653,6 +643,35 @@ static int vf_guc_init(struct xe_guc *guc)
 	return 0;
 }
 
+int xe_guc_init_noalloc(struct xe_guc *guc)
+{
+	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_gt *gt = guc_to_gt(guc);
+	int ret;
+
+	xe_guc_comm_init_early(guc);
+
+	ret = xe_guc_ct_init_noalloc(&guc->ct);
+	if (ret)
+		goto out;
+
+	ret = xe_guc_relay_init(&guc->relay);
+	if (ret)
+		goto out;
+
+	if (IS_SRIOV_VF(xe)) {
+		ret = vf_guc_init_noalloc(guc);
+		if (ret)
+			goto out;
+	}
+
+	return 0;
+
+out:
+	xe_gt_err(gt, "GuC init failed with %pe\n", ERR_PTR(ret));
+	return ret;
+}
+
 int xe_guc_init(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
@@ -662,13 +681,13 @@ int xe_guc_init(struct xe_guc *guc)
 	guc->fw.type = XE_UC_FW_TYPE_GUC;
 	ret = xe_uc_fw_init(&guc->fw);
 	if (ret)
-		goto out;
+		return ret;
 
 	if (!xe_uc_fw_is_enabled(&guc->fw))
 		return 0;
 
 	if (IS_SRIOV_VF(xe)) {
-		ret = vf_guc_init(guc);
+		ret = xe_guc_ct_init(&guc->ct);
 		if (ret)
 			goto out;
 		return 0;
@@ -690,10 +709,6 @@ int xe_guc_init(struct xe_guc *guc)
 	if (ret)
 		goto out;
 
-	ret = xe_guc_relay_init(&guc->relay);
-	if (ret)
-		goto out;
-
 	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOADABLE);
 
 	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
@@ -702,8 +717,6 @@ int xe_guc_init(struct xe_guc *guc)
 
 	guc_init_params(guc);
 
-	xe_guc_comm_init_early(guc);
-
 	return 0;
 
 out:
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 58338be445585..965bf72912009 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -26,6 +26,7 @@
 struct drm_printer;
 
 void xe_guc_comm_init_early(struct xe_guc *guc);
+int xe_guc_init_noalloc(struct xe_guc *guc);
 int xe_guc_init(struct xe_guc *guc);
 int xe_guc_init_post_hwconfig(struct xe_guc *guc);
 int xe_guc_post_load_init(struct xe_guc *guc);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 37509f6195035..20359a8d4bd85 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -207,12 +207,10 @@ static void primelockdep(struct xe_guc_ct *ct)
 	fs_reclaim_release(GFP_KERNEL);
 }
 
-int xe_guc_ct_init(struct xe_guc_ct *ct)
+int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
 {
 	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_gt *gt = ct_to_gt(ct);
-	struct xe_tile *tile = gt_to_tile(gt);
-	struct xe_bo *bo;
 	int err;
 
 	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
@@ -238,6 +236,23 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 
 	primelockdep(ct);
 
+	err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
+	if (err)
+		return err;
+
+	xe_gt_assert(gt, ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED);
+	ct->state = XE_GUC_CT_STATE_DISABLED;
+	return 0;
+}
+ALLOW_ERROR_INJECTION(xe_guc_ct_init_noalloc, ERRNO); /* See xe_pci_probe() */
+
+int xe_guc_ct_init(struct xe_guc_ct *ct)
+{
+	struct xe_device *xe = ct_to_xe(ct);
+	struct xe_gt *gt = ct_to_gt(ct);
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_bo *bo;
+
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
 					  XE_BO_FLAG_SYSTEM |
 					  XE_BO_FLAG_GGTT |
@@ -247,13 +262,6 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 		return PTR_ERR(bo);
 
 	ct->bo = bo;
-
-	err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
-	if (err)
-		return err;
-
-	xe_gt_assert(gt, ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED);
-	ct->state = XE_GUC_CT_STATE_DISABLED;
 	return 0;
 }
 ALLOW_ERROR_INJECTION(xe_guc_ct_init, ERRNO); /* See xe_pci_probe() */
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 99c5dec446f23..18d4225e65024 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -11,6 +11,7 @@
 struct drm_printer;
 struct xe_device;
 
+int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
 int xe_guc_ct_init(struct xe_guc_ct *ct);
 int xe_guc_ct_enable(struct xe_guc_ct *ct);
 void xe_guc_ct_disable(struct xe_guc_ct *ct);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 3a8751a8b92dd..0e9ea57fcc88c 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -33,6 +33,22 @@ uc_to_xe(struct xe_uc *uc)
 }
 
 /* Should be called once at driver load only */
+int xe_uc_init_noalloc(struct xe_uc *uc)
+{
+	int ret;
+
+	ret = xe_guc_init_noalloc(&uc->guc);
+	if (ret)
+		goto err;
+
+	/* HuC and GSC have no early dependencies and can be completely initialized during full xe_uc_init(). */
+	return 0;
+
+err:
+	xe_gt_err(uc_to_gt(uc), "Failed to early initialize uC (%pe)\n", ERR_PTR(ret));
+	return ret;
+}
+
 int xe_uc_init(struct xe_uc *uc)
 {
 	int ret;
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index c23e6f5e25141..b573b7731f62e 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -8,6 +8,7 @@
 
 struct xe_uc;
 
+int xe_uc_init_noalloc(struct xe_uc *uc);
 int xe_uc_init(struct xe_uc *uc);
 int xe_uc_init_hwconfig(struct xe_uc *uc);
 int xe_uc_init_post_hwconfig(struct xe_uc *uc);
-- 
2.45.2

