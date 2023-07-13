Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C424EC001DD
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 13:23:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE4B10E6E0;
	Thu, 13 Jul 2023 13:23:21 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE1310E6DD
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 13:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689254599; x=1720790599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f3o+m4GvoyOs2RI21pcWBWwnIXNkuzCDda11w6/Lql8=;
 b=McUZywuupC6FzycAgVZE0jBkHpJv/QZna3iTomHTRg9oT2sbpHqh5Cfg
 vwJQHtORQkd/N2bdC9+5+H2IFO874SbdONbdzG1VmSUHj2CyANuB/WBYA
 Q6FfKhJiqpZNZTZX+iDJE6BZUqXLWBmABllf+H/GdY0dmXp9iMF8OExi+
 JerdDDZGWhOZ95dKY5Ks/nlTbYlfrNi+6VsZZOWTP/N3J5nBddArOBvWS
 e7jk1DZGRA/CLzQ/pAvxhHjYh3Y338XV3Jd2PDG9fN/dpGI965zWEv7H/
 gP+omwvaeZ+UD2X0j42Y7Pjpfr7TCdK2Ad7NtzEsTjHZpDtoI1HYCookc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="345497950"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="345497950"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 06:23:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="787455322"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="787455322"
Received: from rossdevx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.133])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 06:23:17 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jul 2023 14:22:51 +0100
Message-ID: <20230713132244.459605-18-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713132244.459605-12-matthew.auld@intel.com>
References: <20230713132244.459605-12-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v13 06/10] drm/xe: ensure correct access_put
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
index a21d44bfe9e8..7db8eaf311ec 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -534,8 +534,8 @@ static int gt_reset(struct xe_gt *gt)
 	if (err)
 		goto err_out;
 
-	xe_device_mem_access_put(gt_to_xe(gt));
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	xe_device_mem_access_put(gt_to_xe(gt));
 	XE_WARN_ON(err);
 
 	xe_gt_info(gt, "reset done\n");
@@ -578,8 +578,8 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
 
 	xe_uc_stop_prepare(&gt->uc);
 
-	xe_device_mem_access_put(gt_to_xe(gt));
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_device_mem_access_put(gt_to_xe(gt));
 }
 
 int xe_gt_suspend(struct xe_gt *gt)
@@ -601,8 +601,8 @@ int xe_gt_suspend(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
-	xe_device_mem_access_put(gt_to_xe(gt));
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_info(gt, "suspended\n");
 
 	return 0;
@@ -629,8 +629,8 @@ int xe_gt_resume(struct xe_gt *gt)
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
index a5aae624d11e..b34792f6c767 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -839,8 +839,8 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	ret = pc_action_setup_gucrc(pc, XE_GUCRC_FIRMWARE_CONTROL);
 
 out:
-	xe_device_mem_access_put(pc_to_xe(pc));
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_device_mem_access_put(pc_to_xe(pc));
 	return ret;
 }
 
-- 
2.41.0

