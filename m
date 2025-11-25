Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97DDCFD37F
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 10:33:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D15F10E3AB;
	Tue, 25 Nov 2025 10:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U6ecXiCa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ECF110E3AB
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 10:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764066795; x=1795602795;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yNBIgOBUOBIPISj8718OBAb/v+uW2tU9rDv0MBmYncQ=;
 b=U6ecXiCaEmGjaf2Qtz0mvwib/MM6OpOs5PatVy+Tbss/31HyUHOn3D2i
 NNdI98+JoYo8xg+JEt3w611S9gp7jgKPEGnQ+/0Ews/SLESdfAaCWp/td
 VJEG4q/6Z9EjcaGqVFLa1wk8ELoMBBeytkUFaMlJEjbLZr1tFvQqrGsRa
 gaLsG1Xhw3BtqU5vKR/3p3qG7esXEDI59l5C37Fg1pRJHFa7U1G2mlP2B
 pICKcCw6ac/1bqP/9Z3VOHD5E4H8vsJ/7+C8XnGrxWTvBHF130qeNiILd
 jyh+SzDO07yLreTYXGYpG6cZa8q4YE4zaGHNkgKQM//Rzr/B7kiLt0ua0 w==;
X-CSE-ConnectionGUID: ENWw+J5QSumfxpYXh0uTHw==
X-CSE-MsgGUID: MhsM/LNeSLmUqmfDI44anQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66025889"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="66025889"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 02:33:14 -0800
X-CSE-ConnectionGUID: xOgLGfysTJKmuvNhGfJlCg==
X-CSE-MsgGUID: sq6lgmF0TEu+gx42/0kZRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="193401979"
Received: from naresh-nuc8i7beh.iind.intel.com (HELO
 nkumarg-desk.iind.intel.com) ([10.190.216.171])
 by fmviesa010.fm.intel.com with ESMTP; 25 Nov 2025 02:33:12 -0800
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: naresh.kumar.g@intel.com,
	Michal.Wajdeczko@intel.com
Subject: [V6 PATCH] Due to SLA agreement between PF and VFs,
 multi CCS mode can't be enabled when VFs are already enabled.
 Similarly, enabling VFs must be blocked when multi CCS mode enabled.
Date: Tue, 25 Nov 2025 15:56:44 +0530
Message-ID: <20251125102643.2326137-2-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015142820.2519054-2>
References: <20251015142820.2519054-2>
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

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 47 ++++++++++++++++++++++++-----
 1 file changed, 39 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index 50fffc9ebf62..495bf517a6d3 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -13,6 +13,7 @@
 #include "xe_gt_sysfs.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
+#include "xe_sriov_pf_helpers.h"
 
 static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
 {
@@ -108,6 +109,30 @@ ccs_mode_show(struct device *kdev,
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
+		return xe_sriov_pf_arm_guard(xe, &xe->sriov.pf.guard_vfs_enabling,
+					     true, NULL);
+	return 0;
+}
+
+static void xe_gt_finish_ccs_mode_enabling(struct xe_device *xe,
+					   struct xe_gt *gt)
+{
+	/* disarm the guard, if CCS mode is reverted to default */
+	if (!(gt->ccs_mode > 1))
+		xe_sriov_pf_disarm_guard(xe, &xe->sriov.pf.guard_vfs_enabling,
+					 true, NULL);
+}
+
 static ssize_t
 ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	       const char *buff, size_t count)
@@ -117,15 +142,13 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
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
@@ -135,7 +158,8 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	if (!num_engines || num_engines > num_slices || num_slices % num_engines) {
 		xe_gt_dbg(gt, "Invalid compute config, %d engines %d slices\n",
 			  num_engines, num_slices);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err;
 	}
 
 	/* CCS mode can only be updated when there are no drm clients */
@@ -143,7 +167,8 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	if (!list_empty(&xe->drm.filelist)) {
 		mutex_unlock(&xe->drm.filelist_mutex);
 		xe_gt_dbg(gt, "Rejecting compute mode change as there are active drm clients\n");
-		return -EBUSY;
+		ret = -EBUSY;
+		goto err;
 	}
 
 	if (gt->ccs_mode != num_engines) {
@@ -155,7 +180,13 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 
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
-- 
2.43.0

