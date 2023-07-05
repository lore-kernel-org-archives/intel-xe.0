Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2942FEB64DA
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jul 2023 08:37:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB92310E170;
	Wed,  5 Jul 2023 08:37:50 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1867610E170
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jul 2023 08:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688546269; x=1720082269;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TJASJiCbu0DaZBdG5PJt0mB8jOTBJpzqz40Aci0OCwc=;
 b=Y9urPzAlyqCU6dXsNsx5ghvN1S5tv2Kq4Oa3cmv5/uGMd25c4nG6fdTR
 Se2a4KBik8gHtEFl/aI0vWrXXVQapDEcIYNGqDbLy4rb3NJb94IEqaiCL
 fiVMVUm4kSRa5+JsIR33pooWKh8+/fVMVBrVfzAupax1XmKOuB0fDCf78
 4S15XNpnL0omCaLqbtiQpMAPfUCTsFk6kXQ981Ak385ZyzZ69G5NvedXZ
 8eE8k/61eBLvgIT4nkMFVLTSKw6w4przQvb/CZyjfvpaUwe72PEXsVjmY
 kBscZbZeXUyXxiVm1JJnHjOkwS2/eXylNEHwoeR1QBIsPN/0Cmme86S7w w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="342875397"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="342875397"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 01:37:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="669329022"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="669329022"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga003.jf.intel.com with ESMTP; 05 Jul 2023 01:37:45 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Jul 2023 14:14:03 +0530
Message-Id: <20230705084403.3922130-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V2] drm/xe: make GT sysfs init return void
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
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Currently return from xe_gt_sysfs_init() is ignored
and also a failure in xe_gt_sysfs_init() isn't fatal
so make it return void.

V2 :
   - add drm_warn in error paths - Himal
   - Edit commit message - Nirmoy

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sysfs.c | 23 ++++++++++++++---------
 drivers/gpu/drm/xe/xe_gt_sysfs.h |  2 +-
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
index 13570987a756..cdfe5995259b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
@@ -29,30 +29,35 @@ static void gt_sysfs_fini(struct drm_device *drm, void *arg)
 	kobject_put(gt->sysfs);
 }
 
-int xe_gt_sysfs_init(struct xe_gt *gt)
+void xe_gt_sysfs_init(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_device *xe = gt_to_xe(gt);
 	struct kobj_gt *kg;
 	int err;
 
 	kg = kzalloc(sizeof(*kg), GFP_KERNEL);
-	if (!kg)
-		return -ENOMEM;
+	if (!kg) {
+		drm_warn(&xe->drm, "Allocating kobject failed.\n");
+		return;
+	}
 
 	kobject_init(&kg->base, &xe_gt_sysfs_kobj_type);
 	kg->gt = gt;
 
 	err = kobject_add(&kg->base, tile->sysfs, "gt%d", gt->info.id);
 	if (err) {
+		drm_warn(&xe->drm, "failed to add GT sysfs directory, err: %d\n", err);
 		kobject_put(&kg->base);
-		return err;
+		return;
 	}
 
 	gt->sysfs = &kg->base;
 
-	err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_sysfs_fini, gt);
-	if (err)
-		return err;
-
-	return 0;
+	err = drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
+	if (err) {
+		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
+			 __func__, err);
+		return;
+	}
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.h b/drivers/gpu/drm/xe/xe_gt_sysfs.h
index ecbfcc5c7d42..e3ec278ca0be 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.h
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.h
@@ -8,7 +8,7 @@
 
 #include "xe_gt_sysfs_types.h"
 
-int xe_gt_sysfs_init(struct xe_gt *gt);
+void xe_gt_sysfs_init(struct xe_gt *gt);
 
 static inline struct xe_gt *
 kobj_to_gt(struct kobject *kobj)
-- 
2.25.1

