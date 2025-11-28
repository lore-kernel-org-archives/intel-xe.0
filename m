Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1993CFD376
	for <intel-xe@archiver.kernel.org>; Fri, 28 Nov 2025 12:45:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD1C10E139;
	Fri, 28 Nov 2025 12:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lm2byuOa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B69A10E139
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Nov 2025 12:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764333912; x=1795869912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a5wxVxE+QilZgH5VSBw46BOLhAu2gdZldPVzjYycgVc=;
 b=lm2byuOaUwGsLT4jicQjI8AKMX9Ied2GxhUA1FOeCq7kKW0QfX5uyJqt
 bxNZ0E8Npi3DVinqOii/WXe8qqvOZfI/0FSRhi3Mh8RbcfYCAza5fU1AK
 0PNAmcFKGGGaqcs2xuiI2PhghLv0Q5e650jxKDiiKaayCaDdVL+ISMOGZ
 LLffDGm+OhdMszoRxvVWagDMoWNBK7WfC6xhGrsiEQ47BxPUtqz2Q45c/
 17XbdSTd5gOxkkK2PDYkes8TSjbsmTQG9i4b59yGphR4Qk6KLl5/SATir
 kLA1fMALSll40UtdpaMwDlNAodravMwfIEjyMtpcD012sbJ2OMoqdrfaB g==;
X-CSE-ConnectionGUID: AhRNHW53TeaDVA1tVI/aPg==
X-CSE-MsgGUID: JAGQELjoQbOFCIyjGAF28A==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="65373136"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="65373136"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 04:45:12 -0800
X-CSE-ConnectionGUID: cTTPjVG7R0KAvV1v713Sdg==
X-CSE-MsgGUID: XT+tFcWpRb6RO5G8m9Tx+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="224409931"
Received: from naresh-nuc8i7beh.iind.intel.com (HELO
 nkumarg-desk.iind.intel.com) ([10.190.216.171])
 by fmviesa001.fm.intel.com with ESMTP; 28 Nov 2025 04:45:10 -0800
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [V9 PATCH] drm/xe: Mutual exclusivity between CCS-mode and PF
Date: Fri, 28 Nov 2025 18:08:44 +0530
Message-ID: <20251128123843.2763356-2-naresh.kumar.g@intel.com>
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

Due to SLA agreement between PF and VFs,the alternate CCS-mode
cannot be changed when VFs are already enabled.
Similarly, enabling VFs is not permitted when the alternate
CCS-mode is active. Additionally, the sysfs entry for
CCS-mode is not created for SR-IOV VF mode.

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
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

v8:(Michal)
- updated short subject and few comments
- used guard for mutex
- Add a check of PF Mode to ensure use of xe_sriov_pf_lockdown only in
  PF Mode
- Added default CCS mode check to xe_gt_ccs_mode_default(gt) function

v9:(Michal)
- Added xe_gt_ccs_mode_default(gt) as static inline and it can be used
  across driver to use between default or alternate CCS mode
- removed comment from obvious code
---
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 47 +++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h | 12 ++++++++
 2 files changed, 49 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index 50fffc9ebf62..8621c39cdf58 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -13,6 +13,7 @@
 #include "xe_gt_sysfs.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
+#include "xe_sriov_pf.h"
 
 static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
 {
@@ -108,6 +109,35 @@ ccs_mode_show(struct device *kdev,
 	return sysfs_emit(buf, "%u\n", gt->ccs_mode);
 }
 
+static int gt_prepare_ccs_mode_enabling(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (!IS_SRIOV_PF(xe))
+		return 0;
+
+	/*
+	 * We can't change CCS-mode when VFs are already enabled
+	 * and we must prevent enabling VFs when alternate
+	 * CCS-mode is active
+	 */
+	if (xe_gt_ccs_mode_default(gt))
+		return xe_sriov_pf_lockdown(xe);
+
+	return 0;
+}
+
+static void gt_finish_ccs_mode_enabling(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (IS_SRIOV_PF(xe)) {
+		/* Allow enabling VFs, if CCS-mode changed to default mode */
+		if (xe_gt_ccs_mode_default(gt))
+			xe_sriov_pf_end_lockdown(xe);
+	}
+}
+
 static ssize_t
 ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	       const char *buff, size_t count)
@@ -117,12 +147,6 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
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
@@ -139,13 +163,16 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	}
 
 	/* CCS mode can only be updated when there are no drm clients */
-	mutex_lock(&xe->drm.filelist_mutex);
+	guard(mutex)(&xe->drm.filelist_mutex);
 	if (!list_empty(&xe->drm.filelist)) {
-		mutex_unlock(&xe->drm.filelist_mutex);
 		xe_gt_dbg(gt, "Rejecting compute mode change as there are active drm clients\n");
 		return -EBUSY;
 	}
 
+	ret = gt_prepare_ccs_mode_enabling(gt);
+	if (ret)
+		return ret;
+
 	if (gt->ccs_mode != num_engines) {
 		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
 		gt->ccs_mode = num_engines;
@@ -153,7 +180,7 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 		xe_gt_reset(gt);
 	}
 
-	mutex_unlock(&xe->drm.filelist_mutex);
+	gt_finish_ccs_mode_enabling(gt);
 
 	return count;
 }
@@ -191,7 +218,7 @@ int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
-	if (!xe_gt_ccs_mode_enabled(gt))
+	if (!xe_gt_ccs_mode_enabled(gt) || IS_SRIOV_VF(xe))
 		return 0;
 
 	err = sysfs_create_files(gt->sysfs, gt_ccs_mode_attrs);
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
index f8779852cf0d..c5b459ef2f79 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
@@ -20,5 +20,17 @@ static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
 	return hweight32(CCS_MASK(gt)) > 1;
 }
 
+/**
+ * xe_gt_ccs_mode_default - check if CCS mode is default (single CCS mode)
+ * @gt: GT structure
+ * Return:
+ * %true if CCS mode is default(i.e. single CCS mode)
+ * %false if alternate/multi CCS mode
+ */
+static inline bool xe_gt_ccs_mode_default(struct xe_gt *gt)
+{
+	return gt->ccs_mode == 1;
+}
+
 #endif
 
-- 
2.43.0

