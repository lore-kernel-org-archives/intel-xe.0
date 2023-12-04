Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFBCC46CA3
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 05:37:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0D910E2C0;
	Mon,  4 Dec 2023 05:37:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A8710E22D
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Dec 2023 05:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701668233; x=1733204233;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ooaJbVZRKBXHWniT1InygnNAhOZdG/NT+Z36Fnv2bqk=;
 b=mk7V08dFwDcfq1Qqm8rHVOsGETDFYDFRzOu1gymzt91uizYi7qJHR9zw
 qP/K9HlPmJhgm6w+K2qSWd0TAO8Ody6Y9RvBSDFYrsiyfoHr3aFUzIQrL
 LuSTdbLi5MmB5FkDswFQHN8WsItpu5EXD4P60dzJ1MZp9qWg6B/MWJOaF
 NxlkuRD2KLTWx65G7OBwnbrPKcfxpXrxceddKZYBvN18Yxlg6TYTQAbXy
 jqE0MYwLz8scs0wg86k0+SCAdIgZtpyYqzRQ+GAV49JafWapRwuBdOLST
 bVj4aBgFX2xtrSS3cb1YI64JmvardTkND2Bz4jkmMUmG9ZaKoYh2QS0TQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="397574068"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; d="scan'208";a="397574068"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 21:37:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="914308804"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="914308804"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 21:37:12 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sun,  3 Dec 2023 21:37:08 -0800
Message-Id: <20231204053709.30013-3-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20231204053709.30013-1-niranjana.vishwanathapura@intel.com>
References: <20231204053709.30013-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 2/3] drm/xe: Allow userspace to configure CCS
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
v3: Separte out num_cslices sysfs interface and make
    xe_gt_ccs_mode_sysfs_init() return void

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c          |   3 +
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 103 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h |   1 +
 3 files changed, 107 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index dc05c7780848..b4bf6ca27a8a 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -380,6 +380,9 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 			 "failed to register engines sysfs directory, err: %d\n",
 			 err);
 
+	/* Initialize CCS mode sysfs after early initialization of HW engines */
+	xe_gt_ccs_mode_sysfs_init(gt);
+
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 	XE_WARN_ON(err);
 	xe_device_mem_access_put(gt_to_xe(gt));
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index 541c44c70a84..723cf77c830a 100644
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
@@ -76,3 +79,103 @@ void xe_gt_apply_ccs_mode(struct xe_gt *gt)
 
 	__xe_gt_apply_ccs_mode(gt, gt->ccs_mode);
 }
+
+static ssize_t
+num_cslices_show(struct device *kdev,
+		 struct device_attribute *attr, char *buf)
+{
+	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
+
+	return sysfs_emit(buf, "%u\n", hweight32(CCS_MASK(gt)));
+}
+
+static DEVICE_ATTR_RO(num_cslices);
+
+static ssize_t
+ccs_mode_show(struct device *kdev,
+	      struct device_attribute *attr, char *buf)
+{
+	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
+
+	return sysfs_emit(buf, "%u\n", gt->ccs_mode);
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
+	if (gt->ccs_mode != num_engines) {
+		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
+		gt->ccs_mode = num_engines;
+		xe_gt_reset_async(gt);
+	}
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(ccs_mode);
+
+static const struct attribute *gt_ccs_mode_attrs[] = {
+	&dev_attr_ccs_mode.attr,
+	&dev_attr_num_cslices.attr,
+	NULL,
+};
+
+static void xe_gt_ccs_mode_sysfs_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_gt *gt = arg;
+
+	sysfs_remove_files(gt->sysfs, gt_ccs_mode_attrs);
+}
+
+/**
+ * xe_gt_ccs_mode_sysfs_init - Initialize CCS mode sysfs interfaces
+ * @gt: GT structure
+ *
+ * Through a per-gt 'ccs_mode' sysfs interface, the user can enable a fixed
+ * number of compute hardware engines to which the available compute slices
+ * are to be allocated. This user configuration change triggers a gt reset
+ * and it is expected that there are no open drm clients while doing so.
+ * The number of available compute slices is exposed to user through a per-gt
+ * 'num_cslices' sysfs interface.
+ */
+void xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	int err;
+
+	if (!xe_gt_ccs_mode_enabled(gt))
+		return;
+
+	err = sysfs_create_files(gt->sysfs, gt_ccs_mode_attrs);
+	if (err) {
+		drm_warn(&xe->drm, "Sysfs creation for ccs_mode failed err: %d\n", err);
+		return;
+	}
+
+	err = drmm_add_action_or_reset(&xe->drm, xe_gt_ccs_mode_sysfs_fini, gt);
+	if (err) {
+		sysfs_remove_files(gt->sysfs, gt_ccs_mode_attrs);
+		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
+			 __func__, err);
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
index e8766879f6ec..f39975aaaab0 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
@@ -12,6 +12,7 @@
 #include "xe_platform_types.h"
 
 void xe_gt_apply_ccs_mode(struct xe_gt *gt);
+void xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt);
 
 static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
 {
-- 
2.21.0.rc0.32.g243a4c7e27

