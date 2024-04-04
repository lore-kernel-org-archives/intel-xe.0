Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C124CD1292
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 15:56:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D93511328C;
	Thu,  4 Apr 2024 15:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cvKSuQnU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33BE113283
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 15:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712246205; x=1743782205;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sl7NxldvGj1HwRAHah9xDlko1GGr95lMSMxr8ZLBd+U=;
 b=cvKSuQnUoPEQFYtPzEBvDCplOZhDR71UepxHVnGNPTUsw6tVNopAUUCk
 QIqmIqaChG8QxhYaIDSUl/+G54s7TpcvDM6AALLFpldJzmDT4rBPAm1Gg
 JNGCa5squFh9b26O4XPqfQ0l4I/yGXa/+hO1xFXCwqpKZcgAijvBWUL4k
 fJQtf2xueVuAa9eHEOri4h20NadlwqxJn8wfwkn841MpLlgiLogJgVJW5
 HD36sI5QN/exyG9aSkkIzgtU11qO0loGq0It+TucBgCzxLlnQIyFOCVlf
 0VAhLB2TiUv0/JL3qV70utsI52jZJbXel71OT4LikRVuKSJFQArkZ3Hdm Q==;
X-CSE-ConnectionGUID: ukietSV2ToOgdmvgoZo4eQ==
X-CSE-MsgGUID: 1AXaSDy+RoiclqCeNL7f+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="8119121"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="8119121"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 08:54:45 -0700
X-CSE-ConnectionGUID: DjIYzvg8SQ6r+cbfAbrwmQ==
X-CSE-MsgGUID: mId15OWSRISeVLHJoHlnMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="41992433"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.158.68])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 08:44:44 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/3] drm/xe: Add proper detection of the SR-IOV PF mode
Date: Thu,  4 Apr 2024 17:44:30 +0200
Message-Id: <20240404154431.583-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240404154431.583-1-michal.wajdeczko@intel.com>
References: <20240404154431.583-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

SR-IOV PF mode detection is based on PCI capability as reported by
the PCI dev_is_pf() function and additionally on 'max_vfs' module
parameter which could be also used to disable PF capability even
if SR-IOV PF capability is reported by the hardware.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |  3 +-
 drivers/gpu/drm/xe/xe_device_types.h |  4 ++
 drivers/gpu/drm/xe/xe_sriov.c        |  3 +
 drivers/gpu/drm/xe/xe_sriov_pf.c     | 89 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf.h     | 24 ++++++++
 drivers/gpu/drm/xe/xe_sriov_types.h  | 15 +++++
 6 files changed, 137 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index e5b1715f721e..8d79df05b84f 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -159,7 +159,8 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_gt_sriov_pf_control.o \
 	xe_lmtt.o \
 	xe_lmtt_2l.o \
-	xe_lmtt_ml.o
+	xe_lmtt_ml.o \
+	xe_sriov_pf.o
 
 # include helpers for tests even when XE is built-in
 ifdef CONFIG_DRM_XE_KUNIT_TEST
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index c710cec835a7..8244b177a6a3 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -321,6 +321,10 @@ struct xe_device {
 	struct {
 		/** @sriov.__mode: SR-IOV mode (Don't access directly!) */
 		enum xe_sriov_mode __mode;
+
+		/** @sriov.pf: PF specific data */
+		struct xe_device_pf pf;
+
 		/** @sriov.wq: workqueue used by the virtualization workers */
 		struct workqueue_struct *wq;
 	} sriov;
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index 3e103edf7174..94fa98d8206e 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -11,6 +11,7 @@
 #include "xe_device.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
+#include "xe_sriov_pf.h"
 
 /**
  * xe_sriov_mode_to_string - Convert enum value to string.
@@ -58,6 +59,8 @@ void xe_sriov_probe_early(struct xe_device *xe)
 	if (has_sriov) {
 		if (test_is_vf(xe))
 			mode = XE_SRIOV_MODE_VF;
+		else if (xe_sriov_pf_readiness(xe))
+			mode = XE_SRIOV_MODE_PF;
 	}
 
 	xe_assert(xe, !xe->sriov.__mode);
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
new file mode 100644
index 000000000000..030c2b69ecc4
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023-2024 Intel Corporation
+ */
+
+#include "xe_assert.h"
+#include "xe_device.h"
+#include "xe_module.h"
+#include "xe_sriov.h"
+#include "xe_sriov_pf.h"
+#include "xe_sriov_printk.h"
+
+static unsigned int wanted_max_vfs(struct xe_device *xe)
+{
+	return xe_modparam.max_vfs;
+}
+
+static int pf_reduce_totalvfs(struct xe_device *xe, int limit)
+{
+	struct device *dev = xe->drm.dev;
+	struct pci_dev *pdev = to_pci_dev(dev);
+	int err;
+
+	err = pci_sriov_set_totalvfs(pdev, limit);
+	if (err)
+		xe_sriov_notice(xe, "Failed to set number of VFs to %d (%pe)\n",
+				limit, ERR_PTR(err));
+	return err;
+}
+
+static bool pf_continue_as_native(struct xe_device *xe, const char *why)
+{
+	xe_sriov_dbg(xe, "%s, continuing as native\n", why);
+	pf_reduce_totalvfs(xe, 0);
+	return false;
+}
+
+/**
+ * xe_sriov_pf_readiness - Check if PF functionality can be enabled.
+ * @xe: the &xe_device to check
+ *
+ * This function is called as part of the SR-IOV probe to validate if all
+ * PF prerequisites are satisfied and we can continue with enabling PF mode.
+ *
+ * Return: true if the PF mode can be turned on.
+ */
+bool xe_sriov_pf_readiness(struct xe_device *xe)
+{
+	struct device *dev = xe->drm.dev;
+	struct pci_dev *pdev = to_pci_dev(dev);
+	int totalvfs = pci_sriov_get_totalvfs(pdev);
+	int newlimit = min_t(u16, wanted_max_vfs(xe), totalvfs);
+
+	xe_assert(xe, totalvfs <= U16_MAX);
+
+	if (!dev_is_pf(dev))
+		return false;
+
+	if (!xe_device_uc_enabled(xe))
+		return pf_continue_as_native(xe, "Guc submission disabled");
+
+	if (!newlimit)
+		return pf_continue_as_native(xe, "all VFs disabled");
+
+	pf_reduce_totalvfs(xe, newlimit);
+
+	xe->sriov.pf.device_total_vfs = totalvfs;
+	xe->sriov.pf.driver_max_vfs = newlimit;
+
+	return true;
+}
+
+/**
+ * xe_sriov_pf_print_vfs_summary - Print SR-IOV PF information.
+ * @xe: the &xe_device to print info from
+ * @p: the &drm_printer
+ *
+ * Print SR-IOV PF related information into provided DRM printer.
+ */
+void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	drm_printf(p, "total: %u\n", xe->sriov.pf.device_total_vfs);
+	drm_printf(p, "supported: %u\n", xe->sriov.pf.driver_max_vfs);
+	drm_printf(p, "enabled: %u\n", pci_num_vf(pdev));
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.h b/drivers/gpu/drm/xe/xe_sriov_pf.h
new file mode 100644
index 000000000000..ebef2e01838a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023-2024 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_PF_H_
+#define _XE_SRIOV_PF_H_
+
+#include <linux/types.h>
+
+struct drm_printer;
+struct xe_device;
+
+#ifdef CONFIG_PCI_IOV
+bool xe_sriov_pf_readiness(struct xe_device *xe);
+void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p);
+#else
+static inline bool xe_sriov_pf_readiness(struct xe_device *xe)
+{
+	return false;
+}
+#endif
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
index 1a138108d139..fa583e8fa0c2 100644
--- a/drivers/gpu/drm/xe/xe_sriov_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_types.h
@@ -7,6 +7,7 @@
 #define _XE_SRIOV_TYPES_H_
 
 #include <linux/build_bug.h>
+#include <linux/types.h>
 
 /**
  * VFID - Virtual Function Identifier
@@ -37,4 +38,18 @@ enum xe_sriov_mode {
 };
 static_assert(XE_SRIOV_MODE_NONE);
 
+/**
+ * struct xe_device_pf - Xe PF related data
+ *
+ * The data in this structure is valid only if driver is running in the
+ * @XE_SRIOV_MODE_PF mode.
+ */
+struct xe_device_pf {
+	/** @device_total_vfs: Maximum number of VFs supported by the device. */
+	u16 device_total_vfs;
+
+	/** @driver_max_vfs: Maximum number of VFs supported by the driver. */
+	u16 driver_max_vfs;
+};
+
 #endif
-- 
2.43.0

