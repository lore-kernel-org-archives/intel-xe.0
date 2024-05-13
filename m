Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38026C25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 06:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0DC310E3FB;
	Mon, 13 May 2024 06:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MOXTxCUt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366F910E3F3
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 06:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715583246; x=1747119246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UN4D72X1gJYQT+vV/LVzsj9Y8i1WpZq1JT3Flrk0oOM=;
 b=MOXTxCUts/hAbgtyjDa0l6WGr9jGATt+cHBCt+z3s8kibEcIkEL+9Yjt
 qmnOKwkdtM5gbNbIU7cL4tcA8fq7VqwkKQTbMlUjyrFD+sELVD1Tr2Xwl
 T9KFs+GT9rnY4JQ36TOUIJbn9jCk8f49jArMlUBCYB9LuJxXn7bBo8PiH
 zhBxiTQQ7aZUuWMMArxu7zQJKvM2M2ivMBBJ+i4bdKUeKoB1PqhWek1yY
 GN4ifEZZCmmAgR8aAj+kIRGcKkG2QJdPyiKswnzajBVsZ/DTciQfs5JZe
 yDJZ4nfN8hUPTOwXZwvlFrH1irDm8gNo+f2x4UHJ+jq7KiLjHy4BVKCnM Q==;
X-CSE-ConnectionGUID: HguzNI01Q8yzEPderG+xvw==
X-CSE-MsgGUID: p8fCDgCzTDOlr7gpyLV5Uw==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11657845"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="11657845"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 23:54:06 -0700
X-CSE-ConnectionGUID: fIfsPEsTS/mffOqSb0ZSvw==
X-CSE-MsgGUID: xJaYc48pSuSgkQnob1KVQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="30321394"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 23:54:04 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, vinay.belgaumkar@intel.com
Subject: [PATCH 2/2] drm/xe: move disable_c6 call
Date: Mon, 13 May 2024 12:35:46 +0530
Message-Id: <20240513070546.3754640-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240513070546.3754640-1-riana.tauro@intel.com>
References: <20240513070546.3754640-1-riana.tauro@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

disable c6 called from guc pc fini on skipping GuC PC is unreachable.

GuC pc init call returns earlier if skip_guc_pc is true and never
registers the finish call thus making disable_c6 unreachable.

move this call to gt idle.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c | 11 +++++++++--
 drivers/gpu/drm/xe/xe_guc_pc.c  |  5 -----
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 2f247cb910d1..0fc865e07965 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -145,9 +145,16 @@ static const struct attribute *gt_idle_attrs[] = {
 	NULL,
 };
 
-static void gt_idle_sysfs_fini(struct drm_device *drm, void *arg)
+static void gt_idle_fini(struct drm_device *drm, void *arg)
 {
 	struct kobject *kobj = arg;
+	struct xe_gt *gt = kobj_to_gt(kobj->parent);
+
+	if (gt_to_xe(gt)->info.skip_guc_pc) {
+		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
+		xe_gt_idle_disable_c6(gt);
+		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	}
 
 	sysfs_remove_files(kobj, gt_idle_attrs);
 	kobject_put(kobj);
@@ -182,7 +189,7 @@ int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
 		return err;
 	}
 
-	return drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);
+	return drmm_add_action_or_reset(&xe->drm, gt_idle_fini, kobj);
 }
 
 void xe_gt_idle_enable_c6(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index d10aab29651e..d0bc5e3090bd 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -898,11 +898,6 @@ static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
 	struct xe_guc_pc *pc = arg;
 	struct xe_device *xe = pc_to_xe(pc);
 
-	if (xe->info.skip_guc_pc) {
-		xe_gt_idle_disable_c6(pc_to_gt(pc));
-		return;
-	}
-
 	if (xe_device_wedged(xe))
 		return;
 
-- 
2.40.0

