Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD298EB64DA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 13:21:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F24010E4A5;
	Wed, 19 Jul 2023 13:21:24 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280FF10E4A5
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 13:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689772882; x=1721308882;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D02BAtqtnUiHVpuaEjAAG2PktZq0SIXZbwtudbE4ziI=;
 b=ZdlqMH0ZIjlfuv+Kb9sWHwctAK6Q9S/ds9UGU/MlZPTeIAtEoqfR8bUb
 5uuzOf6wxxQicRm+nFn8hem50H7iDcJAibjzqwWIurR6KdtkMHoQrY8SF
 xGYiejL6d1LwYdonDVO4y1xm3gksZWz8pCh8MPi9IFzotQ56O3cWkbShR
 QZ7B0qWRWxlVcBz8SBA0IFrFEner+ZtfXOkcN6djLp2gK0wxrOroH1S56
 Z1u49TqQOelHEournulIqJvhVCMkPgT00yZx08C7m7mkAPruL9Vg5iRX/
 JxPP1C7W1JrbhyoWk5HyCznUb2Sk5b3ZOiwwEgXGzwlkk3Lvw68/S6wyX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="397319071"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="397319071"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 06:21:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="837720021"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="837720021"
Received: from vshulan-mobl1.ccr.corp.intel.com (HELO ef8fe21ced7c.intel.com)
 ([10.251.223.230])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 06:21:07 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Jul 2023 13:20:59 +0000
Message-Id: <20230719132059.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Rely on kmalloc/kzalloc log message
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Those messages are unnecessary because a generic message is already
produced in case of allocation failure. Besides, this also removes a
misuse of the XE_IOCTL_DBG macro.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c  | 1 -
 drivers/gpu/drm/xe/xe_guc_debugfs.c | 1 -
 drivers/gpu/drm/xe/xe_huc_debugfs.c | 1 -
 drivers/gpu/drm/xe/xe_query.c       | 8 ++++----
 4 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index f9f653243f20..30a031356b4e 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -174,7 +174,6 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 #define DEBUGFS_SIZE	(ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list))
 	local = drmm_kmalloc(&gt_to_xe(gt)->drm, DEBUGFS_SIZE, GFP_KERNEL);
 	if (!local) {
-		XE_WARN_ON("Couldn't allocate memory");
 		return;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index 0178b1a2d367..069afb52343c 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -90,7 +90,6 @@ void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
 #define DEBUGFS_SIZE	(ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list))
 	local = drmm_kmalloc(&guc_to_xe(guc)->drm, DEBUGFS_SIZE, GFP_KERNEL);
 	if (!local) {
-		XE_WARN_ON("Couldn't allocate memory");
 		return;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_huc_debugfs.c b/drivers/gpu/drm/xe/xe_huc_debugfs.c
index ae3c21315d59..9478edc4c39a 100644
--- a/drivers/gpu/drm/xe/xe_huc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_huc_debugfs.c
@@ -56,7 +56,6 @@ void xe_huc_debugfs_register(struct xe_huc *huc, struct dentry *parent)
 #define DEBUGFS_SIZE	(ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list))
 	local = drmm_kmalloc(&huc_to_xe(huc)->drm, DEBUGFS_SIZE, GFP_KERNEL);
 	if (!local) {
-		XE_WARN_ON("Couldn't allocate memory");
 		return;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 4b7869596ba8..f880c9af1651 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -65,7 +65,7 @@ static int query_engines(struct xe_device *xe,
 	}
 
 	hw_engine_info = kmalloc(size, GFP_KERNEL);
-	if (XE_IOCTL_DBG(xe, !hw_engine_info))
+	if (!hw_engine_info)
 		return -ENOMEM;
 
 	for_each_gt(gt, xe, gt_id)
@@ -182,7 +182,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	}
 
 	config = kzalloc(size, GFP_KERNEL);
-	if (XE_IOCTL_DBG(xe, !config))
+	if (!config)
 		return -ENOMEM;
 
 	config->num_params = num_params;
@@ -231,7 +231,7 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
 	}
 
 	gts = kzalloc(size, GFP_KERNEL);
-	if (XE_IOCTL_DBG(xe, !gts))
+	if (!gts)
 		return -ENOMEM;
 
 	gts->num_gt = xe->info.gt_count;
@@ -278,7 +278,7 @@ static int query_hwconfig(struct xe_device *xe,
 	}
 
 	hwconfig = kzalloc(size, GFP_KERNEL);
-	if (XE_IOCTL_DBG(xe, !hwconfig))
+	if (!hwconfig)
 		return -ENOMEM;
 
 	xe_device_mem_access_get(xe);
-- 
2.34.1

