Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F18AC46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 27 Dec 2023 11:50:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2442510E251;
	Wed, 27 Dec 2023 11:50:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7816010E236
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Dec 2023 11:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703677837; x=1735213837;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S/KkDz+wX3hJUF5amLkqVvlhUUQfuPjv4R2KX4Moqcg=;
 b=gTyh0rl1Q0OtquKA0T6I8D66LmLix/JTDBbprIeJWwCdJTU9jeEgtyLo
 F5Zq0IsBV/xZbx+zmWsA3Aycnc9XJ+ywUHf2ZUsP65PHnqTI6DI2erHyl
 +kWr2mmn17a0M/aSIKPKfNnxdg9DT6+5lTiGoQ8tcIeFIya242+l3mHXc
 KM+kKYhibTO3xRShq9yPkYUqFAsYT5nRy/Bi8xHjREMxVgX9dxPvSijfd
 J4Q3ptwg2rlK5z/sYc9KnuDWavtKXKW8rfU0xfo4B4UnoUoKyJXnbe0ZQ
 +qZXNMv4Lu3DAK2ETxXtVpI8jV5pexS0rKiCOL0NhCf6/+9RdrCph/20V w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="9832876"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; 
   d="scan'208";a="9832876"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 03:50:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="778220218"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; d="scan'208";a="778220218"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 03:50:33 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/debugfs: Make sysfs gt force reset synchronous
Date: Wed, 27 Dec 2023 17:28:20 +0530
Message-Id: <20231227115820.4104261-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Karthik Poosa <karthik.poosa@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Wait for gt reset to complete before returning from force_reset
sysfs call. Without this igt test freq_reset_multiple fails
sporadically in case xe_guc_pc is not started.

v2:
- Changed wait for completion to interruptible (Anshuman).
- Moved timeout to xe_gt.h (Anshuman).
- Created a debugfs for updating timeout (Rodrigo).
- Moved completion and timeout under gt->reset struct (Badal).

Testcase: igt@xe_guc_pc@freq_reset_multiple
Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c         |  2 ++
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h   |  5 +++++
 3 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3af2adec1295..c8d2c18b0c62 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -65,6 +65,7 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
 
 	gt->tile = tile;
 	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
+	init_completion(&gt->reset.done);
 
 	return gt;
 }
@@ -633,6 +634,7 @@ static int gt_reset(struct xe_gt *gt)
 	xe_device_mem_access_put(gt_to_xe(gt));
 	XE_WARN_ON(err);
 
+	complete(&gt->reset.done);
 	xe_gt_info(gt, "reset done\n");
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index c4b67cf09f8f..223dedf5c2ab 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -58,8 +58,16 @@ static int hw_engines(struct seq_file *m, void *data)
 static int force_reset(struct seq_file *m, void *data)
 {
 	struct xe_gt *gt = node_to_gt(m->private);
+	struct xe_device *xe = gt_to_xe(gt);
+	long ret;
 
 	xe_gt_reset_async(gt);
+	ret = wait_for_completion_interruptible_timeout(&gt->reset.done,
+						msecs_to_jiffies(gt->reset.timeout_ms));
+	if (ret <= 0) {
+		drm_err(&xe->drm, "gt reset timed out/interrputed, ret %ld\n", ret);
+		return -ETIMEDOUT;
+	}
 
 	return 0;
 }
@@ -245,5 +253,9 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 				 ARRAY_SIZE(debugfs_list),
 				 root, minor);
 
+	/* set a default gt reset timeout value */
+	gt->reset.timeout_ms = 1000;
+	debugfs_create_u32("gt_reset_timeout_ms", 0600, root,
+					&gt->reset.timeout_ms);
 	xe_uc_debugfs_register(&gt->uc, root);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index f74684660475..210a376c0e46 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -148,6 +148,10 @@ struct xe_gt {
 		 * code to safely flush all code paths
 		 */
 		struct work_struct worker;
+		/** @done : completion for GT reset */
+		struct completion done;
+		/** @timeout_ms : gt reset timeout in ms */
+		u32 timeout_ms;
 	} reset;
 
 	/** @tlb_invalidation: TLB invalidation state */
@@ -358,6 +362,7 @@ struct xe_gt {
 		/** @oob: bitmap with active OOB workaroudns */
 		unsigned long *oob;
 	} wa_active;
+
 };
 
 #endif
-- 
2.25.1

