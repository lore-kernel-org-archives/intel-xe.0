Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F89BE7DF0F
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 17:14:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC40A10E515;
	Mon,  2 Feb 2026 17:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nfm6Ulw1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE38410E523
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 17:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770052443; x=1801588443;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NWb1EAwWPemOKRMG2005GSlqkTkiqiKodbU+H0mAue8=;
 b=nfm6Ulw1ff8NgYzC5Gb9KjJVFOL0pWFS1Zd2aeLnB/BqYYi/99t0m6VS
 bgqL15ZOsyEIq0pvjiYR/D4X4jf+sSzbq6gPxTf50NfhlcNtAhATG42vb
 Mjv6QPxUFoU0Nu5CbwnlIwaK+MsSsWklZ9Ev+2Gvt0KKfiU4UPyPRw7xq
 Jfy2v4DL00MxkBV3Spt7ZP4zOYUcMBZeB307KGCRSL7JPDsE9rWkUamam
 2WdZvuasde6GYPNX/OY0hFJ5P9iUK41zKBfr+CruqvsJMoVqK5qVPkZ9o
 eGvx/aV/lJNBkc7E6aygO8nGeHpQ83G9qXv25Cp7SfSLI29E2CCiIyTvn g==;
X-CSE-ConnectionGUID: 8kQHYrPDTw+PSamWrnK0Pw==
X-CSE-MsgGUID: m23JxPcDRfqZoDxVHeN7Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82641717"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="82641717"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 09:14:03 -0800
X-CSE-ConnectionGUID: t9mbAhMfQbuKRh8/yzWb7g==
X-CSE-MsgGUID: R1OTjn/qT7m5b4+qr0tgiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="208682922"
Received: from nkumarg-desk.iind.intel.com ([10.190.216.171])
 by orviesa006.jf.intel.com with ESMTP; 02 Feb 2026 09:14:01 -0800
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: naresh.kumar.g@intel.com, Michal.Wajdeczko@intel.com,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 2/2] drm/xe: Mutual exclusivity between CCS-mode and PF
Date: Mon,  2 Feb 2026 22:38:13 +0530
Message-ID: <20260202170810.1393147-6-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202170810.1393147-4-naresh.kumar.g@intel.com>
References: <20260202170810.1393147-4-naresh.kumar.g@intel.com>
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

Due to SLA agreement between PF and VFs, Currently we block CCS mode
changes if driver is running as PF, even if there are no VFs enabled yet.
Use lockdown mechanism provided by the PF to relax that limitation
and still enforce above VFs related requirements.

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

---
v2:(Michal) 
- Add direct code instead of gt_prepare_ccs_mode_enabling and
  gt_finish_ccs_mode_enabling function's for readability

v3:(Michal)
- Refactored commit message

---
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 42 +++++++++++++++++++----------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index fe944687728c..b35be36b0eaa 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -13,6 +13,7 @@
 #include "xe_gt_sysfs.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
+#include "xe_sriov_pf.h"
 
 static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
 {
@@ -88,6 +89,11 @@ void xe_gt_apply_ccs_mode(struct xe_gt *gt)
 	__xe_gt_apply_ccs_mode(gt, gt->ccs_mode);
 }
 
+static bool gt_ccs_mode_default(struct xe_gt *gt)
+{
+	return gt->ccs_mode == 1;
+}
+
 static ssize_t
 num_cslices_show(struct device *kdev,
 		 struct device_attribute *attr, char *buf)
@@ -117,12 +123,6 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
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
@@ -139,21 +139,35 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
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
+	if (gt_ccs_mode_default(gt) && IS_SRIOV_PF(xe)) {
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
+	if (gt_ccs_mode_default(gt) && IS_SRIOV_PF(xe))
+		xe_sriov_pf_end_lockdown(xe);
 
 	return count;
 }
-- 
2.43.0

