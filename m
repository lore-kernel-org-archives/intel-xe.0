Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67271E82CAE
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 16:50:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD1E10E577;
	Wed, 27 Sep 2023 16:50:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E1F10E575
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 16:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695833413; x=1727369413;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f+D53CEOHBMT6UfaVl2ZOslZuVidq4anAhwg75Olr3w=;
 b=ZqQGUVcOyyuX3qDw/iaTPSZY9hfmd0CnpWjMihEHKAz771jFz1RXKAb1
 gYxfpIO1Kvgf0OgL/nNfNC/d/dxgINvREsqkGeO6/TcAs+qBCA7ncAMDT
 kG8InznE1r8JUx/nsTYxf3YNod9aPI85WN6yfDWse/L13zC445HE0MqTR
 E6ivVJ8UROsCvLV4euOQflSuYmrG/Z/xKVXl6T/rwXlDTmzj2xI50TB4m
 fQKcRYyy0vfHjrBl3/odAx838n04yTTc+p7jzXS6RUwiCXAjVsND6gcSl
 M47sBQT1lhDsMBozXiIkGIj+ghdCyA64+Icn3vwXy1yr7K/3KllwxJINa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="448367991"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="448367991"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 09:50:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="839520061"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="839520061"
Received: from dut125tglh.fm.intel.com ([10.105.23.10])
 by FMSMGA003.fm.intel.com with ESMTP; 27 Sep 2023 09:50:12 -0700
From: Bommithi Sakeena <bommithi.sakeena@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 27 Sep 2023 16:50:11 +0000
Message-Id: <20230927165012.9048-1-bommithi.sakeena@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Ensure mutex are destroyed
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

Add missing mutex_destroy calls to fini functions or convert to
drmm_mutex_init where fini function is not available.

Fixes: c639b8b60dfe ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Bommithi Sakeena <bommithi.sakeena@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c     | 2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c     | 1 +
 drivers/gpu/drm/xe/xe_guc_submit.c | 1 +
 drivers/gpu/drm/xe/xe_pcode.c      | 4 +++-
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 2046bd269bbd..8b686c8b3339 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -137,7 +137,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 
 	xe_assert(xe, !(guc_ct_size() % PAGE_SIZE));
 
-	mutex_init(&ct->lock);
+	drmm_mutex_init(&xe->drm, &ct->lock);
 	spin_lock_init(&ct->fast_lock);
 	xa_init(&ct->fence_lookup);
 	INIT_WORK(&ct->g2h_worker, g2h_worker_func);
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 8a4d299d6cb0..d9375d1d582f 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -890,6 +890,7 @@ void xe_guc_pc_fini(struct xe_guc_pc *pc)
 	XE_WARN_ON(xe_guc_pc_stop(pc));
 	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
 	xe_bo_unpin_map_no_vm(pc->bo);
+	mutex_destroy(&pc->freq_lock);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index ac5fc2c797a7..f7bb3d0eed56 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -194,6 +194,7 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
 	xa_destroy(&guc->submission_state.exec_queue_lookup);
 	ida_destroy(&guc->submission_state.guc_ids);
 	bitmap_free(guc->submission_state.guc_ids_bitmap);
+	mutex_destroy(&guc->submission_state.lock);
 }
 
 #define GUC_ID_MAX		65535
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 7f1bf2297f51..4a240acf7625 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -8,6 +8,8 @@
 #include <linux/delay.h>
 #include <linux/errno.h>
 
+#include <drm/drm_managed.h>
+
 #include "xe_gt.h"
 #include "xe_mmio.h"
 #include "xe_pcode_api.h"
@@ -276,7 +278,7 @@ int xe_pcode_init(struct xe_gt *gt)
  */
 int xe_pcode_probe(struct xe_gt *gt)
 {
-	mutex_init(&gt->pcode.lock);
+	drmm_mutex_init(&gt_to_xe(gt)->drm, &gt->pcode.lock);
 
 	if (!IS_DGFX(gt_to_xe(gt)))
 		return 0;
-- 
2.34.1

