Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B64D116E2
	for <intel-xe@archiver.kernel.org>; Fri, 28 Nov 2025 17:17:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046A810E8F3;
	Fri, 28 Nov 2025 17:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="keuzWKP8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0F010E8F3
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Nov 2025 17:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764350230; x=1795886230;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cEybpietGmNv6Iy9l9HB7QiD9kaAU9dnEtVYRGySBAk=;
 b=keuzWKP8SsjcuK0pNBevBv/NMmUjpROVKP1AIaHDQSQQQA0DE/u6RmeJ
 e0JuWG0R0U0z+6Qlt1esQhTZ5EsxH0yZX2kIKBZhJNn2kK8F81Z1hIj4L
 k3dZg2yBzAom8RMGmwx5Z+ULbrvX1PViMsm1IfLflTR1ZAbMnV14oJtzi
 MgII0BoJZLALF3vL3gWD3t9//wDo+CK5IwXLC3zn3TnoxwhUzCsslmN3N
 3bfUR3O2ULEtNZsS/WAqQuA2R8FILrwJwhpTOMBD6gb7LjrW+OAN7IpgE
 01nDKbpBsh0kAlfZDTyn08tAQxP2dJaLstBzyFE918Ln9rK+OzKt4Y0ci A==;
X-CSE-ConnectionGUID: VbtqjBBKSO6gTqA4NZxMzQ==
X-CSE-MsgGUID: qpbux/mfTPmExMNm5tYSyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="77071455"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="77071455"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 09:17:09 -0800
X-CSE-ConnectionGUID: 8D9xatJvR3G4MKv3ka1RmQ==
X-CSE-MsgGUID: g3CED/laQIG1nuj1bJpj3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="216853628"
Received: from naresh-nuc8i7beh.iind.intel.com (HELO
 nkumarg-desk.iind.intel.com) ([10.190.216.171])
 by fmviesa002.fm.intel.com with ESMTP; 28 Nov 2025 09:17:08 -0800
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v1 2/2] drm/xe: Mutual exclusivity between CCS-mode and PF
Date: Fri, 28 Nov 2025 22:40:33 +0530
Message-ID: <20251128171030.2774942-6-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251128171030.2774942-4-naresh.kumar.g@intel.com>
References: <20251128123843.2763356-2-naresh.kumar.g@intel.com>
 <20251128171030.2774942-4-naresh.kumar.g@intel.com>
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
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 59 ++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h | 12 ++++++
 2 files changed, 57 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index e146e00b0ca2..6652c468e1be 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -13,6 +13,7 @@
 #include "xe_gt_sysfs.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
+#include "xe_sriov_pf.h"
 
 static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
 {
@@ -108,6 +109,36 @@ ccs_mode_show(struct device *kdev,
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
+	if (!IS_SRIOV_PF(xe))
+		return;
+
+	/* Allow enabling VFs, if CCS-mode changed to default mode */
+	if (xe_gt_ccs_mode_default(gt))
+		xe_sriov_pf_end_lockdown(xe);
+}
+
 static ssize_t
 ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	       const char *buff, size_t count)
@@ -117,12 +148,6 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
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
@@ -139,21 +164,27 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
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
+	ret = gt_prepare_ccs_mode_enabling(gt);
+	if (ret) {
+		xe_gt_dbg(gt, "Rejecting compute mode change as VFs are enabled\n");
+		return ret;
 	}
 
-	mutex_unlock(&xe->drm.filelist_mutex);
+	xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
+	gt->ccs_mode = num_engines;
+	xe_gt_record_user_engines(gt);
+	xe_gt_reset(gt);
+
+	gt_finish_ccs_mode_enabling(gt);
 
 	return count;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
index f8779852cf0d..53a595b0882c 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
@@ -20,5 +20,17 @@ static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
 	return hweight32(CCS_MASK(gt)) > 1;
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

