Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1E8D0EE0D
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 17:04:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA9A10E55E;
	Tue, 25 Nov 2025 17:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g+QjqbbH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D30010E55E
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 17:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764090266; x=1795626266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lqbvPv2KWI8LlIdhzky/pYHQpaGkDT6GtO5ddTkff8o=;
 b=g+QjqbbHLZcOSCGSJAG4LvAwg5btuZc1TbEZPWtVEi38ieJ+rkbhNeS1
 cR8FiIiMkNR+ws2JoTfj30oBDJXUPFF8WI4hgkbwt+pM6KDZQXUSPczWO
 4wDtEAIIGm2BMQE8PW/JF9wm7lYZsmJbi8Ltw7H0vxSYcfJmdyRo4M0qd
 lW1U+xmCLypg3rBsh5uLK5abTG+72E4tWPGly66NskVMPvFTgsZW3IuIi
 y0HCZfdHFIOLEE5Hfz5lEHsrFHjE4CiPr1QeIrCML3B8LGobMdKPmgIDI
 yyjNNxZSsu/9B7PSIk+oajE0Q3UBV04iyH/jThnh9h0Ymn99VljR9xl8T Q==;
X-CSE-ConnectionGUID: V7jyJOYhTOy8RNq1X+98RA==
X-CSE-MsgGUID: sTRzL67KSNyqqESKFEpkWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66149951"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="66149951"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 09:04:25 -0800
X-CSE-ConnectionGUID: cwr4G8UPS6mF20GRmM7wRw==
X-CSE-MsgGUID: dGA6pBqZQz6hl1MhIWICpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="192578104"
Received: from naresh-nuc8i7beh.iind.intel.com (HELO
 nkumarg-desk.iind.intel.com) ([10.190.216.171])
 by fmviesa006.fm.intel.com with ESMTP; 25 Nov 2025 09:04:23 -0800
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com,
	naresh.kumar.g@intel.com
Subject: [V7 PATCH] drm/xe/xe_gt_ccs_mode:Mutual Exclusivity b/w Multi CCS
 Mode & SRIOV VF Provisioning
Date: Tue, 25 Nov 2025 22:27:50 +0530
Message-ID: <20251125165749.2616038-2-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015142820.2519054-2-naresh.kumar.g@intel.com>
References: <20251015142820.2519054-2-naresh.kumar.g@intel.com>
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

Use PF lockdown supported functions to enforce mutual exclusivity between
CCS Mode and SRIOV VF enabling/provisioning during CCS Mode enabling.

v2:
- function xe_device_is_vf_enabled has been refactored to
  xe_sriov_pf_has_vfs_enabled and moved to xe_sriov_pf_helper.h.
- The code now distinctly checks for SR-IOV VF mode and
  SR-IOV PF with VFs enabled.
- Log messages have been updated to explicitly state the current mode.
- The function xe_multi_ccs_mode_enabled is moved to xe_device.h

v3: Described missed arg documentation for xe_sriov_pf_has_vfs_enabled

v4:
- sysfs interface for CCS mode is not initialized
  when operating in SRIOV VF Mode.
- xe_sriov_pf_has_vfs_enabled() check is sufficient while CCS mode
  enablement.
- remove unnecessary comments as flow is self explanatory.

v5:(review comments from Michal)
- Add xe device level CCS mode block with mutex lock and CCS mode state
- necessesary functions to manage ccs mode state to provide strict mutual
  exclusive support b/w CCS mode & SRIOV VF enabling

v6:
- Re modeled implementation based on lockdown the PF using custom guard
  supported functions by Michal

v7:
- Corrected patch style as message written as subject
- Used public PF lockdown functions instead internal funcions(Michal)
- Creating CCS Mode entries only on PF Mode

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 48 +++++++++++++++++++++++------
 1 file changed, 39 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index 50fffc9ebf62..468c3a6790d0 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -13,6 +13,7 @@
 #include "xe_gt_sysfs.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
+#include "xe_sriov_pf.h"
 
 static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
 {
@@ -108,6 +109,29 @@ ccs_mode_show(struct device *kdev,
 	return sysfs_emit(buf, "%u\n", gt->ccs_mode);
 }
 
+static int xe_gt_prepare_ccs_mode_enabling(struct xe_device *xe,
+					   struct xe_gt *gt)
+{
+	/*
+	 * The arm guard is only activated during CCS mode enabling,
+	 * and this shuould happen when CCS mode is in default mode.
+	 * lockdown arm guard ensures there is no VFS enabling
+	 * as CCS mode enabling in progress/enabled.
+	 */
+	if (!(gt->ccs_mode > 1))
+		return xe_sriov_pf_lockdown(xe);
+
+	return 0;
+}
+
+static void xe_gt_finish_ccs_mode_enabling(struct xe_device *xe,
+					   struct xe_gt *gt)
+{
+	/* disarm the guard, if CCS mode is reverted to default */
+	if (!(gt->ccs_mode > 1))
+		xe_sriov_pf_end_lockdown(xe);
+}
+
 static ssize_t
 ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	       const char *buff, size_t count)
@@ -117,15 +141,13 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	u32 num_engines, num_slices;
 	int ret;
 
-	if (IS_SRIOV(xe)) {
-		xe_gt_dbg(gt, "Can't change compute mode when running as %s\n",
-			  xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
-		return -EOPNOTSUPP;
-	}
+	ret = xe_gt_prepare_ccs_mode_enabling(xe, gt);
+	if (ret)
+		return ret;
 
 	ret = kstrtou32(buff, 0, &num_engines);
 	if (ret)
-		return ret;
+		goto err;
 
 	/*
 	 * Ensure number of engines specified is valid and there is an
@@ -135,7 +157,8 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	if (!num_engines || num_engines > num_slices || num_slices % num_engines) {
 		xe_gt_dbg(gt, "Invalid compute config, %d engines %d slices\n",
 			  num_engines, num_slices);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err;
 	}
 
 	/* CCS mode can only be updated when there are no drm clients */
@@ -143,7 +166,8 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	if (!list_empty(&xe->drm.filelist)) {
 		mutex_unlock(&xe->drm.filelist_mutex);
 		xe_gt_dbg(gt, "Rejecting compute mode change as there are active drm clients\n");
-		return -EBUSY;
+		ret = -EBUSY;
+		goto err;
 	}
 
 	if (gt->ccs_mode != num_engines) {
@@ -155,7 +179,13 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 
 	mutex_unlock(&xe->drm.filelist_mutex);
 
+	xe_gt_finish_ccs_mode_enabling(xe, gt);
+
 	return count;
+err:
+	xe_gt_finish_ccs_mode_enabling(xe, gt);
+
+	return ret;
 }
 
 static DEVICE_ATTR_RW(ccs_mode);
@@ -191,7 +221,7 @@ int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
-	if (!xe_gt_ccs_mode_enabled(gt))
+	if (!xe_gt_ccs_mode_enabled(gt) || IS_SRIOV_VF(xe))
 		return 0;
 
 	err = sysfs_create_files(gt->sysfs, gt_ccs_mode_attrs);
-- 
2.43.0

