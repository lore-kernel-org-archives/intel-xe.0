Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878ECC46CD8
	for <intel-xe@archiver.kernel.org>; Thu, 21 Dec 2023 17:09:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F1110E6E6;
	Thu, 21 Dec 2023 17:09:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED6F10E375
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Dec 2023 17:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703178597; x=1734714597;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ORh0DbHygx8eyYbaEpXZ+GemMrXYdrkc4brKrpS+nPk=;
 b=eRo9zDygB/+4fP1L3/JGHw8SB5NWRrwmkdl9IHEMjsC9wzfENO94o6Yu
 LThTKFSjkvblPw8SzSyXzIeHCyNqcMz42Qv2l3h046aoxjrPD+4RMOGsa
 SZQC4C4vDgw+KgW2X2gBytUSk8v6Ud8XoTA3HNCOX+C1lYiAbolJb2hQD
 MZyHEOhHWx0ZaL8Wd53GaIwvybm9Gt/tv2X7wLqeJ04qkmj2URj9lpe0j
 WYeLAy46L0DxF9wpB4t7Vk2eoyd0bWtUswQszoUbQX6+yVXbCa0dqP9t7
 BY4ybciIzGrncKFMouyHc38/EUBPoArSoXUgjB8Cc5DLpPqtyIHmmwqGV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="482188842"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="482188842"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 09:09:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="770008545"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="770008545"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 09:09:00 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Make sysfs gt force reset synchronous
Date: Thu, 21 Dec 2023 22:46:41 +0530
Message-Id: <20231221171641.3336898-1-karthik.poosa@intel.com>
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

v2:
- Rebase.
- Changed wait for completion to interruptible (Anshuman).
- Moved timeout to xe_gt.h (Anshuman).

Testcase: igt@xe_guc_pc@freq_reset_multiple
Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c         | 2 ++
 drivers/gpu/drm/xe/xe_gt.h         | 1 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 8 ++++++++
 drivers/gpu/drm/xe/xe_gt_types.h   | 3 +++
 4 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3af2adec1295..47abb9336c58 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -65,6 +65,7 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
 
 	gt->tile = tile;
 	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
+	init_completion(&gt->reset_done);
 
 	return gt;
 }
@@ -633,6 +634,7 @@ static int gt_reset(struct xe_gt *gt)
 	xe_device_mem_access_put(gt_to_xe(gt));
 	XE_WARN_ON(err);
 
+	complete(&gt->reset_done);
 	xe_gt_info(gt, "reset done\n");
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 4486e083f5ef..591f5271c07d 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -17,6 +17,7 @@
 			  xe_hw_engine_is_valid((hwe__)))
 
 #define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
+#define XE_GT_RESET_TIMEOUT_MS (msecs_to_jiffies(5 * 1000))
 
 #ifdef CONFIG_FAULT_INJECTION
 #include <linux/fault-inject.h> /* XXX: fault-inject.h is broken */
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index c4b67cf09f8f..543515e91c3d 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -58,8 +58,16 @@ static int hw_engines(struct seq_file *m, void *data)
 static int force_reset(struct seq_file *m, void *data)
 {
 	struct xe_gt *gt = node_to_gt(m->private);
+	struct xe_device *xe = gt_to_xe(gt);
+	long ret;
 
 	xe_gt_reset_async(gt);
+	ret = wait_for_completion_interruptible_timeout(&gt->reset_done,
+							XE_GT_RESET_TIMEOUT_MS);
+	if (ret <= 0) {
+		drm_err(&xe->drm, "gt reset timed out/interrputed, ret %ld\n", ret);
+		return -ETIMEDOUT;
+	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index f74684660475..58396561fd6c 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -358,6 +358,9 @@ struct xe_gt {
 		/** @oob: bitmap with active OOB workaroudns */
 		unsigned long *oob;
 	} wa_active;
+
+	/** @reset_done : completion for GT reset */
+	struct completion reset_done;
 };
 
 #endif
-- 
2.25.1

