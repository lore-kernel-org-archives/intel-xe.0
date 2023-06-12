Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F891C88CB4
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jun 2023 17:14:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCB510E2BB;
	Mon, 12 Jun 2023 17:14:47 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E46410E2BB
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jun 2023 17:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686590084; x=1718126084;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2TO4MaATp+a6+d/Ul0vxkXLqb0XvJrhs65HrLDGesik=;
 b=UAGxUaIqG4SBtQ66sAEDgl0UEo+GugXoznWj66I19KLNCGp1R7W9/YBh
 +8ni9/JZXjYzxh15cGnd5/9fqbyxbhAytdulfxUyU7z4q/pKJA8ClPGJP
 5jDPgwaiuW24C1fRoqDqj22Jq5wVyZwobFhRonnRHfCK9k5qiEWjzbGhe
 iLS/gdBMS6z0LyhOQF9yeqz+chSjAbc3MjJXEMLcbKXhM1EVfv8Fl2Tdj
 8Klx2bUN1mLP52ihityVWx4C9JSbnxl8liD5Jk7wwKu4EEX/rHX4kzPBu
 NuvedW/Hq4XAzQcjMe0cG5WE+aTdJagJcxZwq/x3lJJ8y5ql/CBwObehD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="342792763"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="342792763"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 10:14:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="688715207"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="688715207"
Received: from mgutier2-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.22.12])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 10:14:43 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 12 Jun 2023 18:12:18 +0100
Message-Id: <20230612171225.88689-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612171225.88689-1-matthew.auld@intel.com>
References: <20230612171225.88689-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v11 05/12] drm/xe: ensure correct access_put
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
index 67faa9ee0006..0991a3c49480 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -835,8 +835,8 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	ret = pc_action_setup_gucrc(pc, XE_GUCRC_FIRMWARE_CONTROL);
 
 out:
-	xe_device_mem_access_put(pc_to_xe(pc));
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_device_mem_access_put(pc_to_xe(pc));
 	return ret;
 }
 
-- 
2.40.1

