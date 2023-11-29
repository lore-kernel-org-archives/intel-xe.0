Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D4AC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 02:57:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92F210E5E8;
	Wed, 29 Nov 2023 02:57:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA6D10E5E8
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 02:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701226641; x=1732762641;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Q08PSao33YbH3xIgsNIEC2iw1fvco2CT7URwFr6IcnE=;
 b=aGhHxt4+XGhinxRm//iXtp3JNq0wDlAPC3aI1Zc9Oz9ZLeYiEE0w9MaV
 +VRAgpSfzHvFPiRKeeqtGMlJ1Vnk7dmkXDMVVJRr5OoHyAI6ZXprRHG3D
 8xeNlqgHsusBDOCua0T6s7Lc2i5gklWCDLr3UH21X35Sa+Ary6lcQrsgV
 m57R+Htbo5ibt8lgicCJU2s8jmSJqd2SupbbLjWZFqypD5JXzPsMKjFQi
 dT3lUBSbwv8txNp5sPsE3B1hdy6189eV2K//Cej29NnMSLaV/dFTw52ZS
 tEKGQY3E+KmmfkcKk64pT5TGqAr1xdwfvPDXrftnQi95vvyn6bEfAiQ1i A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="373265515"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="373265515"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 18:57:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="762140432"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="762140432"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 18:57:19 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Nov 2023 18:57:15 -0800
Message-Id: <20231129025716.9094-3-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20231129025716.9094-1-niranjana.vishwanathapura@intel.com>
References: <20231129025716.9094-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/3] drm/xe: Allow userspace to configure CCS
 mode
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

Allow user to configure the CCS mode setting through a
'ccs_mode' sysfs interface. Also report the current
CCS mode configuration and number of compute slices
available through this interface.

v2: Rebase, make it platform agnostic

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c          |  6 +++
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 74 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h |  1 +
 3 files changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 1e534dd7e2a8..2622e6ea7f57 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -380,6 +380,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 			 "failed to register engines sysfs directory, err: %d\n",
 			 err);
 
+	err = xe_gt_ccs_mode_sysfs_init(gt);
+	if (err)
+		drm_warn(&gt_to_xe(gt)->drm,
+			 "Sysfs creation for ccs_mode setting failed err: %d\n",
+			 err);
+
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 	XE_WARN_ON(err);
 	xe_device_mem_access_put(gt_to_xe(gt));
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index 8441316bb35c..0ad97383aedd 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -3,10 +3,13 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <drm/drm_managed.h>
+
 #include "regs/xe_gt_regs.h"
 #include "xe_assert.h"
 #include "xe_gt.h"
 #include "xe_gt_ccs_mode.h"
+#include "xe_gt_sysfs.h"
 #include "xe_mmio.h"
 
 static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
@@ -71,3 +74,74 @@ void xe_gt_apply_ccs_mode(struct xe_gt *gt)
 	if (gt->ccs_mode.num_engines)
 		__xe_gt_apply_ccs_mode(gt, gt->ccs_mode.num_engines);
 }
+
+static ssize_t
+ccs_mode_show(struct device *kdev,
+	      struct device_attribute *attr, char *buf)
+{
+	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
+
+	return sysfs_emit(buf, "Enabled compute engines %d; Number of compute slices %d\n",
+			  gt->ccs_mode.num_engines, hweight32(CCS_MASK(gt)));
+}
+
+static ssize_t
+ccs_mode_store(struct device *kdev, struct device_attribute *attr,
+	       const char *buff, size_t count)
+{
+	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
+	u32 num_engines, num_slices;
+	int ret;
+
+	ret = kstrtou32(buff, 0, &num_engines);
+	if (ret)
+		return ret;
+
+	/*
+	 * Ensure number of engines specified is valid and there is an
+	 * exact multiple of engines for slices.
+	 */
+	num_slices = hweight32(CCS_MASK(gt));
+	if (!num_engines || num_engines > num_slices || num_slices % num_engines) {
+		xe_gt_dbg(gt, "Invalid compute config, %d engines %d slices\n",
+			  num_engines, num_slices);
+		return -EINVAL;
+	}
+
+	if (gt->ccs_mode.num_engines != num_engines) {
+		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
+		gt->ccs_mode.num_engines = num_engines;
+		xe_gt_reset_async(gt);
+	}
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(ccs_mode);
+
+static void xe_gt_ccs_mode_sysfs_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_gt *gt = arg;
+
+	sysfs_remove_file(gt->sysfs, &dev_attr_ccs_mode.attr);
+}
+
+int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	int err;
+
+	if (!xe_gt_ccs_mode_enabled(gt))
+		return 0;
+
+	err = sysfs_create_file(gt->sysfs, &dev_attr_ccs_mode.attr);
+	if (err)
+		return err;
+
+	err = drmm_add_action_or_reset(&xe->drm, xe_gt_ccs_mode_sysfs_fini, gt);
+	if (err)
+		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
+			 __func__, err);
+
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
index 9aa6223ca83b..d09e2f9ae50a 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
@@ -12,6 +12,7 @@
 #include "xe_platform_types.h"
 
 void xe_gt_apply_ccs_mode(struct xe_gt *gt);
+int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt);
 
 static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
 {
-- 
2.21.0.rc0.32.g243a4c7e27

