Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A92C46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 27 Dec 2023 08:24:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4377410E21D;
	Wed, 27 Dec 2023 08:24:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE06410E21D
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Dec 2023 08:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703665460; x=1735201460;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xcbVHHiRKe/PMwIja8e4FiayFdv3ofZ79KmlH5jrsfY=;
 b=aLYtjHUlvDfIi4bXtliovFyJdgoMZ5bB4CR9ypyB2ORgtvGKbPqQOezS
 OEbyGBoYtym7/UzbPwK7DmIvtUbwTL2xH79KnZLWuzoVPF5wUpoOXFWDG
 hdgool7N5bTZ20/HzlnJYHlNpbn77hea9Pgw9E8k35utMlxceg8AFzRro
 lHyxtO29v/Csjg2PoPOLlHQA/NuZiARTpBwYeFxYYh23xS2dor5J4L5Ug
 Ai/pNGjUn+/fGkogAOfCbf9IXjHYLgONCyQcdEpCdDgJPp6zAt63e1EsD
 QU5z7kHV8SC9ykIho+LICnjunDTNwYk5udWjvOmh4Ylzd/BSMA5vgS0E5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="386853271"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="386853271"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 00:24:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="844092002"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="844092002"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 00:24:17 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/debugfs: Make sysfs gt force reset synchronous
Date: Wed, 27 Dec 2023 14:02:04 +0530
Message-Id: <20231227083204.3982491-1-karthik.poosa@intel.com>
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

Testcase: igt@xe_guc_pc@freq_reset_multiple
Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c         |  2 ++
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h   |  6 ++++++
 3 files changed, 20 insertions(+)

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
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index c4b67cf09f8f..fbda886c8a95 100644
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
+						msecs_to_jiffies(gt->reset_timeout_ms));
+	if (ret <= 0) {
+		drm_err(&xe->drm, "gt reset timed out/interrputed, ret %ld\n", ret);
+		return -ETIMEDOUT;
+	}
 
 	return 0;
 }
@@ -225,6 +233,10 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 		return;
 	}
 
+	/* set a default timeout */
+	gt->reset_timeout_ms = 1000;
+	debugfs_create_u32("gt_reset_timeout_ms", 0600, root,
+					&gt->reset_timeout_ms);
 	/*
 	 * Allocate local copy as we need to pass in the GT to the debugfs
 	 * entry and drm_debugfs_create_files just references the drm_info_list
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index f74684660475..824cefde20d2 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -358,6 +358,12 @@ struct xe_gt {
 		/** @oob: bitmap with active OOB workaroudns */
 		unsigned long *oob;
 	} wa_active;
+
+	/** @reset_done : completion for GT reset */
+	struct completion reset_done;
+
+	/** @gt_reset_timeout_ms : gt reset timeout in ms */
+	u32 reset_timeout_ms;
 };
 
 #endif
-- 
2.25.1

