Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0B7CAC5B5
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 05:48:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB4410E152;
	Mon, 29 Sep 2025 05:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FFskXoou";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4941010E152
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 05:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759124902; x=1790660902;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2RAeBETVs1/KXrxnfI8JSHgmNa2bHGeDNeMm+sV4NRk=;
 b=FFskXoouzehpA1LohtN4puJ3P4bbhiCG79DDvHIWnOY5OL1xB3MBs04j
 ljAFW0u8AdxzfuFRE7sv2YWvqdgkOdNCjcdi+GowxC434eakhVTdVFY2n
 1af2U4ybJyVGQGoPye+8NcUW5Dkyygtd29l0qK5yQ+KSmjrZf7JhSUkC+
 hYMq609yYgCgwxMQXr6e5wZkMJ669TqvYZf3UfJR0LXpukbr6jAkFNC0Q
 c0K/lK4FbXdlih/okNHqFBwWAgUdDbTAIjYj7jJAk00BAeKwVoAy3TqMM
 GMpJsyP4WXrDf6J0nJeYn3vfxTRnzzRKFAHNf/FmQgpRhrHx3Lsb93R8Z Q==;
X-CSE-ConnectionGUID: G8N3LDF6TQKTEOFSGhOG2Q==
X-CSE-MsgGUID: lxycKrhXSsetnHuo80Tqlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="72459180"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="72459180"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 22:48:22 -0700
X-CSE-ConnectionGUID: zAzKvycDTcy5TchmWn9jnw==
X-CSE-MsgGUID: 4NvnMrF3Q9mWisWZq/26UA==
X-ExtLoop1: 1
Received: from naresh-nuc8i7beh.iind.intel.com (HELO
 nkumarg-desk.iind.intel.com) ([10.190.216.171])
 by fmviesa003.fm.intel.com with ESMTP; 28 Sep 2025 22:48:20 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: naresh.kumar.g@intel.com, Michal.Wajdeczko@intel.com, varun.gupta@intel.com
Subject: [PATCH] drm/xe/: Mutual Exclusivity b/w Multi CCS Mode & SRIOV VF
 Provisioning
Date: Mon, 29 Sep 2025 11:13:33 +0530
Message-ID: <20250929054332.599463-2-naresh.kumar.g@intel.com>
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

Due to SLA agreement between PF and VFs, multi CCS mode can't
be enabled when VFs are already enabled.
Similarly, enabling VFs is disabled when multi ccs mode enabled.

v2:function xe_device_is_vf_enabled has been refactored to
xe_sriov_pf_has_vfs_enabled and moved to xe_sriov_pf_helper.h.
The code now distinctly checks for SR-IOV VF mode and
SR-IOV PF with VFs enabled.
Log messages have been updated to explicitly state the current mode.
The function xe_multi_ccs_mode_enabled is moved to xe_device.h

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h           |  8 ++++++++
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c      | 14 +++++++++++---
 drivers/gpu/drm/xe/xe_pci_sriov.c        |  6 ++++++
 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h | 12 ++++++++++++
 4 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 32cc6323b7f6..986f9cabb897 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -172,6 +172,14 @@ static inline bool xe_device_has_lmtt(struct xe_device *xe)
 	return IS_DGFX(xe);
 }
 
+static inline bool xe_multi_ccs_mode_enabled(struct xe_device *xe)
+{
+	/* Multi CCS mode supported exclusively on GT0 */
+	struct xe_gt *gt = xe_device_get_gt(xe, 0);
+
+	return gt->ccs_mode > 1;
+}
+
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 
 void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index 50fffc9ebf62..584f3245fc7d 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -13,6 +13,7 @@
 #include "xe_gt_sysfs.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
+#include "xe_sriov_pf_helpers.h"
 
 static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
 {
@@ -117,9 +118,16 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	u32 num_engines, num_slices;
 	int ret;
 
-	if (IS_SRIOV(xe)) {
-		xe_gt_dbg(gt, "Can't change compute mode when running as %s\n",
-			  xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
+	/*
+	 * Check if the device is:
+	 * 1. Operating as an SR-IOV Virtual Function (VF), or
+	 * 2. An SR-IOV Physical Function (PF) with one or more VFs enabled.
+	 * Enabling multi CCS mode is not permitted in either scenario.
+	 */
+	if (IS_SRIOV_VF(xe) || xe_sriov_pf_has_vfs_enabled(xe)) {
+		const char *mode_str = !strcmp(xe_sriov_mode_to_string(xe_device_sriov_mode(xe)),
+					"SR-IOV VF") ? "SR-IOV VF" : "SR-IOV PF with VFs Enabled";
+		xe_gt_dbg(gt, "Can't change compute mode when running as %s\n", mode_str);
 		return -EOPNOTSUPP;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index af05db07162e..71c1d998ba82 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -155,6 +155,12 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	xe_assert(xe, num_vfs <= total_vfs);
 	xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs, str_plural(num_vfs));
 
+	if (xe_multi_ccs_mode_enabled(xe)) {
+		xe_sriov_info(xe, "Disable multi-ccs mode before enabling VF's\n");
+
+		return -ECANCELED;
+	}
+
 	err = xe_sriov_pf_wait_ready(xe);
 	if (err)
 		goto out;
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
index dd1df950b021..35aff4fab56b 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
@@ -43,4 +43,16 @@ static inline struct mutex *xe_sriov_pf_master_mutex(struct xe_device *xe)
 	return &xe->sriov.pf.master_lock;
 }
 
+/**
+ * xe_sriov_pf_has_vfs_enabled() - Determines if the PF has any VFs enabled
+ *
+ * Return: true if one or more VFs are enabled on the PF, false otherwise.
+ */
+static inline bool xe_sriov_pf_has_vfs_enabled(const struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+
+	return pci_num_vf(pdev) > 0;
+}
+
 #endif
-- 
2.43.0

