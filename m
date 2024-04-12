Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F6EC00A94
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 07:49:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5EC510E009;
	Fri, 12 Apr 2024 07:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JmBc4aJU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1F110F164
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 07:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712908149; x=1744444149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8U+p3UARe8bjDC1rRqhfm5bgklcPmmYAhXl5pjqUQU4=;
 b=JmBc4aJUBDWOvsRtD3tVZRNldHLNgjbc6RvHnIw9M1VnrHddmTWxpxqE
 g1kPJUozUpD+hR28Ju9xMVtcunaV2KQBbzz+pl+cuxaPPYxfqw5CScEuc
 bi6V4A9Izxno0KO8CKq+Yu/YV+zd6MGip8WVqSwQOGzXo6GmytUiCBvjV
 EzTunnJku7DQf1BsqdpBTWvJ743ulicViOPR6OgoqLD400NNMMjSb5euK
 6R0UEiCL6msN10s/0h3O/I5ZPEvuvU/3H8CQlQNymisYj8/Cm0bbF5Vg6
 8l7HtvhDweEM0svCVgVqXGa7YZG5nTDXdtPext1aB80JGENzM3Xih/I7Q g==;
X-CSE-ConnectionGUID: /aVOnWclTbqMNAh4WFxoCg==
X-CSE-MsgGUID: M/GrJ6uvRU6PzVN8CfUe4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="11317212"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="11317212"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 00:49:09 -0700
X-CSE-ConnectionGUID: NO+vtHpTQtefRhjU4lNpaA==
X-CSE-MsgGUID: neF8BQv3T46BLK/f24q0AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="21220733"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa009.fm.intel.com with ESMTP; 12 Apr 2024 00:49:08 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 5/7] drm/xe/gt: Abort driver load for sysfs creation failure
Date: Fri, 12 Apr 2024 13:32:43 +0530
Message-Id: <20240412080245.1044902-6-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
References: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
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

Instead of allowing the driver to load with incomplete sysfs entries in
case of sysfs creation failure, we should terminate the driver loading.
This change ensures that the status of all gt associated sysfs entries
creation is relayed to xe_gt_init, leading to a driver load abort if any
sysfs creation failures occur.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c                    | 16 ++++++----
 drivers/gpu/drm/xe/xe_gt_freq.c               | 29 ++++++++++---------
 drivers/gpu/drm/xe/xe_gt_freq.h               |  2 +-
 drivers/gpu/drm/xe/xe_gt_idle.c               | 17 ++++-------
 drivers/gpu/drm/xe/xe_gt_idle.h               |  2 +-
 drivers/gpu/drm/xe/xe_gt_sysfs.c              | 15 ++++------
 drivers/gpu/drm/xe/xe_gt_sysfs.h              |  2 +-
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c     | 11 +++----
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h     |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c |  6 ++--
 10 files changed, 47 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index dca0e9fb3315..089e4513c7e3 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -360,7 +360,9 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 			xe_lmtt_init(&gt_to_tile(gt)->sriov.pf.lmtt);
 	}
 
-	xe_gt_idle_sysfs_init(&gt->gtidle);
+	err = xe_gt_idle_sysfs_init(&gt->gtidle);
+	if (err)
+		goto err_gt_sysfs_create;
 
 	/* Enable per hw engine IRQs */
 	xe_irq_enable_hwe(gt);
@@ -374,9 +376,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 
 	err = xe_hw_engine_class_sysfs_init(gt);
 	if (err)
-		drm_warn(&gt_to_xe(gt)->drm,
-			 "failed to register engines sysfs directory, err: %d\n",
-			 err);
+		goto err_gt_sysfs_create;
 
 	/* Initialize CCS mode sysfs after early initialization of HW engines */
 	err = xe_gt_ccs_mode_sysfs_init(gt);
@@ -549,13 +549,17 @@ int xe_gt_init(struct xe_gt *gt)
 
 	xe_mocs_init_early(gt);
 
-	xe_gt_sysfs_init(gt);
+	err = xe_gt_sysfs_init(gt);
+	if (err)
+		return err;
 
 	err = gt_fw_domain_init(gt);
 	if (err)
 		return err;
 
-	xe_gt_freq_init(gt);
+	err = xe_gt_freq_init(gt);
+	if (err)
+		return err;
 
 	xe_force_wake_init_engines(gt, gt_to_fw(gt));
 
diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index 32b9a743629c..a0c57332d362 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -222,33 +222,34 @@ static void freq_fini(struct drm_device *drm, void *arg)
  * @gt: Xe GT object
  *
  * It needs to be initialized after GT Sysfs and GuC PC components are ready.
+ *
+ * Returns: Returns error value for failure and 0 for success.
  */
-void xe_gt_freq_init(struct xe_gt *gt)
+int xe_gt_freq_init(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
 	if (xe->info.skip_guc_pc)
-		return;
+		return 0;
 
 	gt->freq = kobject_create_and_add("freq0", gt->sysfs);
 	if (!gt->freq) {
-		drm_warn(&xe->drm, "failed to add freq0 directory to %s\n",
-			 kobject_name(gt->sysfs));
-		return;
+		drm_err(&xe->drm, "failed to add freq0 directory to %s\n",
+			kobject_name(gt->sysfs));
+		return -ENOMEM;
 	}
 
 	err = drmm_add_action_or_reset(&xe->drm, freq_fini, gt->freq);
-	if (err) {
-		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
-			 __func__, err);
-		return;
-	}
+	if (err)
+		return err;
 
 	err = sysfs_create_files(gt->freq, freq_attrs);
-	if (err)
-		drm_warn(&xe->drm,  "failed to add freq attrs to %s, err: %d\n",
-			 kobject_name(gt->freq), err);
+	if (err) {
+		drm_err(&xe->drm,  "failed to add freq attrs to %s, err: %d\n",
+			kobject_name(gt->freq), err);
+		return err;
+	}
 
-	xe_gt_throttle_sysfs_init(gt);
+	return xe_gt_throttle_sysfs_init(gt);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_freq.h b/drivers/gpu/drm/xe/xe_gt_freq.h
index f3fe3c90491a..b7fddbe7b9b6 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.h
+++ b/drivers/gpu/drm/xe/xe_gt_freq.h
@@ -8,6 +8,6 @@
 
 struct xe_gt;
 
-void xe_gt_freq_init(struct xe_gt *gt);
+int xe_gt_freq_init(struct xe_gt *gt);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index bc1426f8d731..581c8ce75858 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -152,7 +152,7 @@ static void gt_idle_sysfs_fini(struct drm_device *drm, void *arg)
 	kobject_put(kobj);
 }
 
-void xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
+int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
 {
 	struct xe_gt *gt = gtidle_to_gt(gtidle);
 	struct xe_device *xe = gt_to_xe(gt);
@@ -160,10 +160,8 @@ void xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
 	int err;
 
 	kobj = kobject_create_and_add("gtidle", gt->sysfs);
-	if (!kobj) {
-		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
-		return;
-	}
+	if (!kobj)
+		return -ENOMEM;
 
 	if (xe_gt_is_media_type(gt)) {
 		snprintf(gtidle->name, sizeof(gtidle->name), "gt%d-mc", gt->info.id);
@@ -180,14 +178,11 @@ void xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
 	err = sysfs_create_files(kobj, gt_idle_attrs);
 	if (err) {
 		kobject_put(kobj);
-		drm_warn(&xe->drm, "failed to register gtidle sysfs, err: %d\n", err);
-		return;
+		drm_err(&xe->drm, "failed to register gtidle sysfs, err: %d\n", err);
+		return err;
 	}
 
-	err = drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);
-	if (err)
-		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
-			 __func__, err);
+	return drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);
 }
 
 void xe_gt_idle_enable_c6(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
index 69280fd16b03..75bd99659b1b 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.h
+++ b/drivers/gpu/drm/xe/xe_gt_idle.h
@@ -10,7 +10,7 @@
 
 struct xe_gt;
 
-void xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle);
+int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle);
 void xe_gt_idle_enable_c6(struct xe_gt *gt);
 void xe_gt_idle_disable_c6(struct xe_gt *gt);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
index c69d2e8a0fe1..21ed87715da7 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
@@ -29,7 +29,7 @@ static void gt_sysfs_fini(struct drm_device *drm, void *arg)
 	kobject_put(gt->sysfs);
 }
 
-void xe_gt_sysfs_init(struct xe_gt *gt)
+int xe_gt_sysfs_init(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_device *xe = gt_to_xe(gt);
@@ -38,24 +38,19 @@ void xe_gt_sysfs_init(struct xe_gt *gt)
 
 	kg = kzalloc(sizeof(*kg), GFP_KERNEL);
 	if (!kg)
-		return;
+		return -ENOMEM;
 
 	kobject_init(&kg->base, &xe_gt_sysfs_kobj_type);
 	kg->gt = gt;
 
 	err = kobject_add(&kg->base, tile->sysfs, "gt%d", gt->info.id);
 	if (err) {
-		drm_warn(&xe->drm, "failed to add GT sysfs directory, err: %d\n", err);
+		drm_err(&xe->drm, "failed to add GT sysfs directory, err: %d\n", err);
 		kobject_put(&kg->base);
-		return;
+		return err;
 	}
 
 	gt->sysfs = &kg->base;
 
-	err = drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
-	if (err) {
-		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
-			 __func__, err);
-		return;
-	}
+	return drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.h b/drivers/gpu/drm/xe/xe_gt_sysfs.h
index e3ec278ca0be..ecbfcc5c7d42 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.h
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.h
@@ -8,7 +8,7 @@
 
 #include "xe_gt_sysfs_types.h"
 
-void xe_gt_sysfs_init(struct xe_gt *gt);
+int xe_gt_sysfs_init(struct xe_gt *gt);
 
 static inline struct xe_gt *
 kobj_to_gt(struct kobject *kobj)
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
index 9c33045ff1ef..93d08d682dd8 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
@@ -236,19 +236,16 @@ static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
 	sysfs_remove_group(gt->freq, &throttle_group_attrs);
 }
 
-void xe_gt_throttle_sysfs_init(struct xe_gt *gt)
+int xe_gt_throttle_sysfs_init(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
 	err = sysfs_create_group(gt->freq, &throttle_group_attrs);
 	if (err) {
-		drm_warn(&xe->drm, "failed to register throttle sysfs, err: %d\n", err);
-		return;
+		drm_err(&xe->drm, "failed to register throttle sysfs, err: %d\n", err);
+		return err;
 	}
 
-	err = drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, gt);
-	if (err)
-		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
-			 __func__, err);
+	return drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, gt);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
index 3ecfd4beffe1..6c61e6f228a8 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
+++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
@@ -10,7 +10,7 @@
 
 struct xe_gt;
 
-void xe_gt_throttle_sysfs_init(struct xe_gt *gt);
+int xe_gt_throttle_sysfs_init(struct xe_gt *gt);
 
 #endif /* _XE_GT_THROTTLE_SYSFS_H_ */
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index daab970f8be8..62ce4fd1775d 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -691,9 +691,9 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
 		keclass->eclass = hwe->eclass;
 		err = xe_add_hw_engine_class_defaults(xe, &keclass->base);
 		if (err) {
-			drm_warn(&xe->drm,
-				 "Add .defaults to engines failed!, err: %d\n",
-				 err);
+			drm_err(&xe->drm,
+				"Add .defaults to engines failed!, err: %d\n",
+				err);
 			goto err_object;
 		}
 
-- 
2.25.1

