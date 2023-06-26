Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06CCEB64DC
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 10:51:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C34110E1EA;
	Mon, 26 Jun 2023 10:51:15 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A328610E1E7
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 10:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687776672; x=1719312672;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gpANvGhLX7n3hcgwUCPfER/6dRwty2MmDwPeaaakDYQ=;
 b=P20yJ0feS32nvbDlK7TL/5PtubhPuQa8TpczaI2e7z95HoS/BFVoThFp
 ozKoz0Zgog3O/8yOqwJp3CXStQQ01K8eVSGmPamNZOn3lcpXuF63ZR6Pk
 rPl7kw/+R1yNX14dBpX1LwoluDtPGUQK8THgoadG6Bk2bVOLYRh5+NnrW
 4NIiKaBYU6AVGLVW2DmAHRn0LHps+Wtc/ow2Q3T+Mepyvt+f6D4NMwBqz
 rA76MGUkFpJ8itTv+1oD8xxMMlH6eJ1Zi/LcXnAwR1n5WUzxfD4bS6Njn
 C11VckR+G1CjtidYMbx8ycWAuJIGo/0tTH6BNfGf3NJ/XK5GOQuCoaaIz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="361279987"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="361279987"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 03:51:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="829182798"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="829182798"
Received: from cbrady5x-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.8.226])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 03:51:11 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jun 2023 11:50:44 +0100
Message-ID: <20230626105037.43780-21-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626105037.43780-15-matthew.auld@intel.com>
References: <20230626105037.43780-15-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v12 06/13] drm/xe: ensure correct access_put
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
index 2458397ce8af..2b8a5b29d281 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -530,8 +530,8 @@ static int gt_reset(struct xe_gt *gt)
 	if (err)
 		goto err_out;
 
-	xe_device_mem_access_put(gt_to_xe(gt));
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	xe_device_mem_access_put(gt_to_xe(gt));
 	XE_WARN_ON(err);
 
 	xe_gt_info(gt, "reset done\n");
@@ -574,8 +574,8 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
 
 	xe_uc_stop_prepare(&gt->uc);
 
-	xe_device_mem_access_put(gt_to_xe(gt));
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_device_mem_access_put(gt_to_xe(gt));
 }
 
 int xe_gt_suspend(struct xe_gt *gt)
@@ -597,8 +597,8 @@ int xe_gt_suspend(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
-	xe_device_mem_access_put(gt_to_xe(gt));
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_info(gt, "suspended\n");
 
 	return 0;
@@ -625,8 +625,8 @@ int xe_gt_resume(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
-	xe_device_mem_access_put(gt_to_xe(gt));
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_info(gt, "resumed\n");
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index b5a5538ae630..98dd3b2506b1 100644
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
index e3722a805837..b2dd82a6681d 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -831,8 +831,8 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	ret = pc_action_setup_gucrc(pc, XE_GUCRC_FIRMWARE_CONTROL);
 
 out:
-	xe_device_mem_access_put(pc_to_xe(pc));
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_device_mem_access_put(pc_to_xe(pc));
 	return ret;
 }
 
-- 
2.41.0

