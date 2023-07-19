Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722CEC001DC
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 08:39:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C58010E432;
	Wed, 19 Jul 2023 08:39:04 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908A410E42F
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 08:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689755942; x=1721291942;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8ATRULBmLrPvMzob8JyX2RSqYpHX4jf7gT7fmQk5jJQ=;
 b=aNIVrL+4b6C6c6bejFOeEKvBojCMJWH3Gg9aWc955wSWzX7bousHLnb2
 qd+DGNmAIWPAISxYiB0XIiG98ytblXkXNCZcvmJ1RKMKIZgz3j8vGZmY1
 2XkLgZ3sfNqquxbZrWTDF59NaPBc5n+DfCLWj8YcWyGZe0L1awpuh9MEm
 ZiXIu2CY3g6+22nxUHnLhF7R81gcE46Lg3+XaIxExt1hbbDPa5uYm9cqg
 6Lm8t1768x1kRBHj/foN9bAhGoaRTA+j2baHbVXMQZc/8yBu/hf1cPW3+
 iCMkxtrHIVDJkgzs6WqaOzwDVJFk4YPKeVwhKE+b2iPEb24qdrH3XTYkZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="345999042"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="345999042"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 01:39:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="837603354"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="837603354"
Received: from gtroy-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.29.95])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 01:39:00 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Jul 2023 09:38:08 +0100
Message-ID: <20230719083801.182123-18-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230719083801.182123-12-matthew.auld@intel.com>
References: <20230719083801.182123-12-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v15 06/10] drm/xe: ensure correct access_put
 ordering
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Only call access_put after dropping the forcewake. In theory the device
could suspend, but really we want to start asserting that we have a
mem_access.ref when touching mmio.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c         | 8 ++++----
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c     | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index b31ef2a8ff17..3e32d38aeeea 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -535,8 +535,8 @@ static int gt_reset(struct xe_gt *gt)
 	if (err)
 		goto err_out;
 
-	xe_device_mem_access_put(gt_to_xe(gt));
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	xe_device_mem_access_put(gt_to_xe(gt));
 	XE_WARN_ON(err);
 
 	xe_gt_info(gt, "reset done\n");
@@ -579,8 +579,8 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
 
 	xe_uc_stop_prepare(&gt->uc);
 
-	xe_device_mem_access_put(gt_to_xe(gt));
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_device_mem_access_put(gt_to_xe(gt));
 }
 
 int xe_gt_suspend(struct xe_gt *gt)
@@ -602,8 +602,8 @@ int xe_gt_suspend(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
-	xe_device_mem_access_put(gt_to_xe(gt));
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_info(gt, "suspended\n");
 
 	return 0;
@@ -630,8 +630,8 @@ int xe_gt_resume(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
-	xe_device_mem_access_put(gt_to_xe(gt));
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_info(gt, "resumed\n");
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index d0092d714ffe..f9f653243f20 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -45,8 +45,8 @@ static int hw_engines(struct seq_file *m, void *data)
 	for_each_hw_engine(hwe, gt, id)
 		xe_hw_engine_print(hwe, &p);
 
-	xe_device_mem_access_put(xe);
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	xe_device_mem_access_put(xe);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 0927cb669603..91a3967fd799 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -848,8 +848,8 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	ret = pc_action_setup_gucrc(pc, XE_GUCRC_FIRMWARE_CONTROL);
 
 out:
-	xe_device_mem_access_put(pc_to_xe(pc));
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_device_mem_access_put(pc_to_xe(pc));
 	return ret;
 }
 
-- 
2.41.0

