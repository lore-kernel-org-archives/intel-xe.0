Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2061D49C8D
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 09:50:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9862610E972;
	Fri, 30 Jan 2026 09:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XG8nim8L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23EB410E972
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 09:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769766616; x=1801302616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cJwGnhNWIRy0tKGQjaJHh6zMIijctVHE8plY/iNjYtM=;
 b=XG8nim8L9RRPnQ7Jzd8PvSP59oH1FS2tI+tEBkDz9QmP91LauS8GjVcf
 vc73Nv8hxWb3KIilLxn6QIgkEKZBqvdLZ6I3s6WJnXuJ4dkN7VvQcDHlo
 JLGT9Kh8tmN5LUtOvq9/o8GESSyOJJ6Jitq5NqpgPTjIY34uWe2FfJoGM
 K7nOnM2Ob/65w78rsdqIKkJlahnwqvADcm9Ks3085JrZnbkjzJA44f4bO
 34Dbtmj+wObtyV9CreIuQkCdtMs4kEOfFWFBpPRqJ96PpunjH8fSxfiXw
 DzXwPVFlL03XLVrNd38fBdi/XNFSiYtVSszmJ7/6FgIsvC4y89u83EWKk w==;
X-CSE-ConnectionGUID: Aj+PVXyHRsy/zUJBTQrFyA==
X-CSE-MsgGUID: 1b4YSEzcT3OV0AaPiKVOmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70035305"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="70035305"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 01:50:16 -0800
X-CSE-ConnectionGUID: 4mQztd7rSrGO2mbCCl11NA==
X-CSE-MsgGUID: leoqfaqVRV+qpNaukZ7Bmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="209238613"
Received: from nkumarg-desk.iind.intel.com ([10.190.216.171])
 by fmviesa009.fm.intel.com with ESMTP; 30 Jan 2026 01:50:14 -0800
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: naresh.kumar.g@intel.com,
	Michal.Wajdeczko@intel.com
Subject: [PATCH v2 2/2] drm/xe: Mutual exclusivity between CCS-mode and PF
Date: Fri, 30 Jan 2026 15:14:26 +0530
Message-ID: <20260130094423.1111201-6-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260130094423.1111201-4-naresh.kumar.g@intel.com>
References: <20260130094423.1111201-4-naresh.kumar.g@intel.com>
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

Due to SLA agreement between PF and VFs,the alternate CCS-mode
cannot be changed when VFs are already enabled.
Similarly, enabling VFs is not permitted when the alternate
CCS-mode is active.

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 37 ++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h | 12 ++++++++++
 2 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index fe944687728c..3db377c64d92 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -13,6 +13,7 @@
 #include "xe_gt_sysfs.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
+#include "xe_sriov_pf.h"
 
 static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
 {
@@ -117,12 +118,6 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	u32 num_engines, num_slices;
 	int ret;
 
-	if (IS_SRIOV(xe)) {
-		xe_gt_dbg(gt, "Can't change compute mode when running as %s\n",
-			  xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
-		return -EOPNOTSUPP;
-	}
-
 	ret = kstrtou32(buff, 0, &num_engines);
 	if (ret)
 		return ret;
@@ -139,21 +134,35 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	}
 
 	/* CCS mode can only be updated when there are no drm clients */
-	mutex_lock(&xe->drm.filelist_mutex);
+	guard(mutex)(&xe->drm.filelist_mutex);
 	if (!list_empty(&xe->drm.filelist)) {
-		mutex_unlock(&xe->drm.filelist_mutex);
 		xe_gt_dbg(gt, "Rejecting compute mode change as there are active drm clients\n");
 		return -EBUSY;
 	}
 
-	if (gt->ccs_mode != num_engines) {
-		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
-		gt->ccs_mode = num_engines;
-		xe_gt_record_user_engines(gt);
-		xe_gt_reset(gt);
+	if (gt->ccs_mode == num_engines)
+		return count;
+
+	/*
+	 * Changing default CCS mode is only allowed when there
+	 * are no VFs. Try to lockdown PF to find out.
+	 */
+	if (xe_gt_ccs_mode_default(gt) && IS_SRIOV_PF(xe)) {
+		ret = xe_sriov_pf_lockdown(xe);
+		if (ret) {
+			xe_gt_dbg(gt, "Can't change CCS Mode: VFs are enabled\n");
+			return ret;
+		}
 	}
 
-	mutex_unlock(&xe->drm.filelist_mutex);
+	xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
+	gt->ccs_mode = num_engines;
+	xe_gt_record_user_engines(gt);
+	xe_gt_reset(gt);
+
+	/* We may end PF lockdown once CCS mode is default again */
+	if (xe_gt_ccs_mode_default(gt) && IS_SRIOV_PF(xe))
+		xe_sriov_pf_end_lockdown(xe);
 
 	return count;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
index ef3b853f5c8c..64a8c730ca6d 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
@@ -20,5 +20,17 @@ static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
 	return hweight32(CCS_INSTANCES(gt)) > 1;
 }
 
+/**
+ * xe_gt_ccs_mode_default() - Check if CCS mode is default (single CCS mode)
+ * @gt: GT structure
+ *
+ * Return: %true if actual CCS mode is single mode, or
+ *         %false otherwise (CCS in alternate/multi mode)
+ */
+static inline bool xe_gt_ccs_mode_default(struct xe_gt *gt)
+{
+	return gt->ccs_mode == 1;
+}
+
 #endif
 
-- 
2.43.0

