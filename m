Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D897C4167B
	for <intel-xe@archiver.kernel.org>; Sat, 16 Dec 2023 04:57:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 719F410E059;
	Sat, 16 Dec 2023 04:57:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF76D10E059
 for <intel-xe@lists.freedesktop.org>; Sat, 16 Dec 2023 04:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702702638; x=1734238638;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yNySEZQLkfUC3FH/aB69g0yZMPeLom/H7VmiuVrUBmc=;
 b=JT4bKL5X0MC/Q46qUlt/yZ35/Ztg2S80yN1atkSEv/khfj51xNJWpp7g
 Uq5Csl912JhEJXQVnMHXMvca6RvqbO5B2uENT5SUfPiOH1f+2uJ6GKUpR
 BPLtNve1Xw+ICw+lcIb6AxUIp0VZdNAb/qYfWNBZCReLadaktFXtisJSf
 D6KIM6vy3u6WYdRBC0Hrf+TfzjhTk+TsifVASKEONxn6RVi9mXtFwSblI
 sKZlcMUre5EFok1/W5/+El3p2xJ+vCTlABuYCjGrYvKfHKyuKVZt87DNo
 WKmWY77uEGF7+qTu9TrxPKKrSWIkAG0dmpmL065K1+vS8vL3DQaRBCFNa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="2534662"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="2534662"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 20:57:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="768223494"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="768223494"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 20:57:14 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Make sysfs gt force reset synchronous
Date: Sat, 16 Dec 2023 10:34:48 +0530
Message-Id: <20231216050448.2636222-1-karthik.poosa@intel.com>
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
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
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
index c4b67cf09f8f..f4ff0eef0468 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -23,6 +23,8 @@
 #include "xe_uc_debugfs.h"
 #include "xe_wa.h"
 
+#define XE_GT_RESET_TIMEOUT_MS	(msecs_to_jiffies(5 * 1000))
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

