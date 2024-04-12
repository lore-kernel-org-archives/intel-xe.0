Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E4AC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 17:58:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACCB10F6A9;
	Fri, 12 Apr 2024 17:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jz/gNHul";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9265A10F6CC
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 17:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712944711; x=1744480711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9dGpiLA2LFZ2U1runFDsovtWrZPot/yc0cKdieX0b7E=;
 b=jz/gNHulxHaM/ibgIp9AHhhHj4dEMExxubVoerbiwINrXLxXNL9rLfv+
 lCRbq+Sd7X+pmezMVy8WjvUTYEMHA1PzsWeh5ZVM0n2YtSEaNqeyGes4D
 ZqLXDM4kWZ1JVvfeZnxamHhWd7LnpNMlss9ahPT5SyODyH5A2rBmWX+pU
 f7QDFzgNDmaohLeqgotDzYoV49czkCr84VnUr2CCUtfE98QQ+8DLOmiL2
 XvpYvHMEt3hNb5FmnZVxMOyp1vtmqvUxtb/lbR7YT8IqP3sfC6w6Zt+We
 YOHUz3YlajoW6SbRS2indDi+08mImzT5+ZGIF+B23Xh/lJzxMNiUJdCAY w==;
X-CSE-ConnectionGUID: QbyIV0eHS0+dogP9N+9g9w==
X-CSE-MsgGUID: r73c9HpERhabBV6Sf6l4WQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8628127"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8628127"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 10:58:31 -0700
X-CSE-ConnectionGUID: 0V5NJXNmRPm9FU2JiLPXQQ==
X-CSE-MsgGUID: W4lWd5NOS3u/9NLsndiDTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="21369096"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa007.fm.intel.com with ESMTP; 12 Apr 2024 10:58:29 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH v4 2/7] drm/xe: Remove sysfs only once on action add failure
Date: Fri, 12 Apr 2024 23:42:06 +0530
Message-Id: <20240412181211.1155732-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412181211.1155732-1-himal.prasad.ghimiray@intel.com>
References: <20240412181211.1155732-1-himal.prasad.ghimiray@intel.com>
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

The drmm_add_action_or_reset function automatically invokes the action
(sysfs removal) in the event of a failure; therefore, there's no
necessity to call it within the return check.

Modify the return type of xe_gt_ccs_mode_sysfs_init to int, allowing the
caller to pass errors up the call chain. Should sysfs creation or
drmm_add_action_or_reset fail, error propagation will prompt a driver
load abort.

-v2
Edit commit message (Nikula/Lucas)
use err_force_wake label instead of new. (Lucas)
Avoid unnecessary warn/error messages. (Lucas)

Fixes: f3bc5bb4d53d ("drm/xe: Allow userspace to configure CCS mode")
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c          |  4 +++-
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 19 +++++++------------
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h |  2 +-
 3 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 2421a8d34324..68534b7853f3 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -379,7 +379,9 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 			 err);
 
 	/* Initialize CCS mode sysfs after early initialization of HW engines */
-	xe_gt_ccs_mode_sysfs_init(gt);
+	err = xe_gt_ccs_mode_sysfs_init(gt);
+	if (err)
+		goto err_force_wake;
 
 	/*
 	 * Stash hardware-reported version.  Since this register does not exist
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index 529fc286cd06..396aeb5b9924 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -167,25 +167,20 @@ static void xe_gt_ccs_mode_sysfs_fini(struct drm_device *drm, void *arg)
  * and it is expected that there are no open drm clients while doing so.
  * The number of available compute slices is exposed to user through a per-gt
  * 'num_cslices' sysfs interface.
+ *
+ * Returns: Returns error value for failure and 0 for success.
  */
-void xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
+int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
 	if (!xe_gt_ccs_mode_enabled(gt))
-		return;
+		return 0;
 
 	err = sysfs_create_files(gt->sysfs, gt_ccs_mode_attrs);
-	if (err) {
-		drm_warn(&xe->drm, "Sysfs creation for ccs_mode failed err: %d\n", err);
-		return;
-	}
+	if (err)
+		return err;
 
-	err = drmm_add_action_or_reset(&xe->drm, xe_gt_ccs_mode_sysfs_fini, gt);
-	if (err) {
-		sysfs_remove_files(gt->sysfs, gt_ccs_mode_attrs);
-		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
-			 __func__, err);
-	}
+	return drmm_add_action_or_reset(&xe->drm, xe_gt_ccs_mode_sysfs_fini, gt);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
index f39975aaaab0..f8779852cf0d 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
@@ -12,7 +12,7 @@
 #include "xe_platform_types.h"
 
 void xe_gt_apply_ccs_mode(struct xe_gt *gt);
-void xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt);
+int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt);
 
 static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
 {
-- 
2.25.1

