Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AAECAC597
	for <intel-xe@archiver.kernel.org>; Mon, 15 Sep 2025 14:38:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D57B10E4D3;
	Mon, 15 Sep 2025 14:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iq/RcsJ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E058710E4D3
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Sep 2025 14:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757947091; x=1789483091;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v6/+J5WLp5xiV+L62Dp/NdlSpqQFWPh/y1dgzyia30U=;
 b=Iq/RcsJ/7k8eCxnuynMImepAp/QY+FuDR3S2s73PL3kORrUx7m4WmOOr
 1nNtsFx8kewbwcWbSfgCkpAJJCuj7BOFiWm3o+VNa3ga2ebLsJJvFh/dc
 q0SsGOm9GpZSwR/XN0kZ8rZoRhc1n59k7vqHV5o+6yJGbwWCtsNu+Dic9
 2SIlQrYPWSQcnHIQ10p+liFHv4U/sAXEZMr3JbDVMTK3kjr4jyWCE0/9F
 JGod6Dtmv0Paf8/BRNvUlynniBIW4Uu+ohslxX8XM1JqM44RiqUxX1Wl1
 UEX5J+UiLB2SPhr16ZUzraFOv8Fgp3/0fSRgOHkvQ3Murplv663d0xL7a w==;
X-CSE-ConnectionGUID: F9PzTpF0TMG862FfzvujaA==
X-CSE-MsgGUID: SHAT5Sd3Toyv431koZmJVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="70452612"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="70452612"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 07:38:07 -0700
X-CSE-ConnectionGUID: JmbWSXKiTz6XPlDsxlUL1g==
X-CSE-MsgGUID: YDt8fePPQVifP2zoeQkq2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="211820776"
Received: from naresh-nuc8i7beh.iind.intel.com (HELO
 nkumarg-desk.iind.intel.com) ([10.190.216.171])
 by orviesa001.jf.intel.com with ESMTP; 15 Sep 2025 07:38:05 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: naresh.kumar.g@intel.com,
	tejas.upadhyay@intel.com
Subject: [PATCH] drm/xe/: Mutual Exclusivity b/w Multi CCS Mode & SRIOV VF
 Provisioning
Date: Mon, 15 Sep 2025 20:03:32 +0530
Message-ID: <20250915143331.3269895-2-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
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

Multi CCS mode can only be enabled when SRIOV is in PF mode with
no VFs provisioned.
Similarly, provisioning VFs is not allowed when Multi CCS mode is active.

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c |  7 ++++---
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h | 10 ++++++++++
 drivers/gpu/drm/xe/xe_pci_sriov.c   |  7 +++++++
 drivers/gpu/drm/xe/xe_sriov.h       | 12 ++++++++++++
 4 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index 50fffc9ebf62..39df801e9cd5 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -117,9 +117,10 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	u32 num_engines, num_slices;
 	int ret;
 
-	if (IS_SRIOV(xe)) {
-		xe_gt_dbg(gt, "Can't change compute mode when running as %s\n",
-			  xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
+	if (IS_SRIOV_VF_ENABLED(xe)) {
+		xe_gt_dbg(gt, "Can't change compute mode when running as %s / %s\n",
+			  xe_sriov_mode_to_string(xe_device_sriov_mode(xe)),
+			  "One or more VFs enabled");
 		return -EOPNOTSUPP;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
index f8779852cf0d..1a80a293daa2 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
@@ -20,5 +20,15 @@ static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
 	return hweight32(CCS_MASK(gt)) > 1;
 }
 
+static inline bool xe_is_primary_gt_multi_ccs_enabled(struct xe_device *xe)
+{
+	/* multi CCS mode supported exclusively on GT0 */
+	struct xe_gt *gt = xe_device_get_gt(xe, 0);
+
+	return (gt->ccs_mode > 1);
+}
+
+#define IS_PRIMARY_GT_MULTI_CCS_ENABLED(xe) xe_is_primary_gt_multi_ccs_enabled(xe)
+
 #endif
 
diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index af05db07162e..96e3fd51b8f5 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -19,6 +19,7 @@
 #include "xe_sriov_pf.h"
 #include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_printk.h"
+#include "xe_gt_ccs_mode.h"
 
 static int pf_needs_provisioning(struct xe_gt *gt, unsigned int num_vfs)
 {
@@ -153,6 +154,12 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	xe_assert(xe, IS_SRIOV_PF(xe));
 	xe_assert(xe, num_vfs > 0);
 	xe_assert(xe, num_vfs <= total_vfs);
+
+	if (IS_PRIMARY_GT_MULTI_CCS_ENABLED(xe)) {
+		xe_sriov_info(xe, "Can't change the number of VFs while multi-CCS mode is enabled.");
+
+		return -EOPNOTSUPP;
+	}
 	xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs, str_plural(num_vfs));
 
 	err = xe_sriov_pf_wait_ready(xe);
diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
index 6db45df55615..78019cee61fe 100644
--- a/drivers/gpu/drm/xe/xe_sriov.h
+++ b/drivers/gpu/drm/xe/xe_sriov.h
@@ -36,6 +36,16 @@ static inline bool xe_device_is_sriov_vf(const struct xe_device *xe)
 	return xe_device_sriov_mode(xe) == XE_SRIOV_MODE_VF;
 }
 
+static inline bool xe_device_is_vf_enabled(const struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+
+	if (xe_device_is_sriov_vf(xe))
+		return true;
+
+	return (pci_num_vf(pdev) > 0);
+}
+
 #ifdef CONFIG_PCI_IOV
 #define IS_SRIOV_PF(xe) xe_device_is_sriov_pf(xe)
 #else
@@ -45,4 +55,6 @@ static inline bool xe_device_is_sriov_vf(const struct xe_device *xe)
 
 #define IS_SRIOV(xe) (IS_SRIOV_PF(xe) || IS_SRIOV_VF(xe))
 
+#define IS_SRIOV_VF_ENABLED(xe) xe_device_is_vf_enabled(xe)
+
 #endif
-- 
2.43.0

