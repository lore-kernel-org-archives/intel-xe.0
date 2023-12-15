Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEEDC4332F
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 05:08:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0DCF10E312;
	Fri, 15 Dec 2023 05:08:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC2610E312
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 05:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702616891; x=1734152891;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ymFm2piVAGY0O/0L25EtNOLq0xgue/X+XPv9im2GnKA=;
 b=HXeI4W9FHa52Yp+ZzrLJIpFr0qU/F1CynaAu0Sws70nVBB+UVLIEl5kA
 bfHhMOK7OhltJlBvb9Mi6/jbjJxYaDpm+sog+cI8WaflR5R/6LGJgwGE7
 VZWzqyTgGzn0+YO4czx+Sb46nF2Nab6ihVEn992fxT1ILr1+imop04by4
 n3r6onL82jVQNq9gm+HwwrytlS/MCyIA0K/2i9X+vWfRoLLF4JR7DoAKN
 ccrwuhqBZLZseAvb5Ev/xICMiK+ZQJfZE6RBQv5Sc+1OYh1IXUV+5Z62v
 9Iz2rbKvjaTnUO7ARxBM54T90R8ssv3POFv+Mua7WPBtPK6c+TnzIp2CC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="398019503"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; d="scan'208";a="398019503"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 21:08:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; d="scan'208";a="16162218"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 21:08:09 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Add wait for completion after gt force reset
Date: Fri, 15 Dec 2023 10:45:41 +0530
Message-Id: <20231215051541.2536859-1-karthik.poosa@intel.com>
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
Cc: Karthik Poosa <karthik.poosa@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Wait for gt reset to complete before returning from force_reset
sysfs call. Without this igt test freq_reset_multiple fails
sporadically in case xe_guc_pc is not started.

Testcase: igt@xe_guc_pc@freq_reset_multiple
Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c         |  3 +++
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 10 ++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h   |  3 +++
 3 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index dfd9cf01a5d5..eb7552b6dfa5 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -65,6 +65,7 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
 
 	gt->tile = tile;
 	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
+	init_completion(&gt->reset_done);
 
 	return gt;
 }
@@ -647,6 +648,8 @@ static int gt_reset(struct xe_gt *gt)
 	xe_device_mem_access_put(gt_to_xe(gt));
 	XE_WARN_ON(err);
 
+	complete(&gt->reset_done);
+
 	xe_gt_info(gt, "reset done\n");
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index c4b67cf09f8f..49b30937a28b 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -23,6 +23,8 @@
 #include "xe_uc_debugfs.h"
 #include "xe_wa.h"
 
+#define XE_GT_RESET_TIMEOUT_MS	(msecs_to_jiffies(5*1000))
+
 static struct xe_gt *node_to_gt(struct drm_info_node *node)
 {
 	return node->info_ent->data;
@@ -58,9 +60,17 @@ static int hw_engines(struct seq_file *m, void *data)
 static int force_reset(struct seq_file *m, void *data)
 {
 	struct xe_gt *gt = node_to_gt(m->private);
+	struct xe_device *xe = gt_to_xe(gt);
+	unsigned long timeout;
 
 	xe_gt_reset_async(gt);
 
+	timeout = wait_for_completion_timeout(&gt->reset_done, XE_GT_RESET_TIMEOUT_MS);
+	if (timeout == 0) {
+		drm_err(&xe->drm, "gt reset timed out");
+		return -ETIMEDOUT;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index f74684660475..6f2fb9e3cfea 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -358,6 +358,9 @@ struct xe_gt {
 		/** @oob: bitmap with active OOB workaroudns */
 		unsigned long *oob;
 	} wa_active;
+
+	/** @reset_done : Completion of GT reset */
+	struct completion reset_done;
 };
 
 #endif
-- 
2.25.1

