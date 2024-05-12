Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3428CC25B78
	for <intel-xe@archiver.kernel.org>; Sun, 12 May 2024 15:49:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC8A10E2CF;
	Sun, 12 May 2024 15:49:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kxrywDpO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27AFE10E2F8
 for <intel-xe@lists.freedesktop.org>; Sun, 12 May 2024 15:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715528973; x=1747064973;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=S4G/Fb+45jy/pk/Cdyao2CWuYTC4I39rUIAv8MG1OGE=;
 b=kxrywDpOt5Nqt4yX3X+32nokbQDFfG3Tx/Lt44ReFf4BHuJwfzAFAuag
 iQvz5AunsS5VlfCxe/2nL1gKsjaDOOepOJrkWqJ9jHEOnVM8GINCJcx1c
 0z9+v6de4WKBfONdqENOIkbniWUw60g1RQrU+Ku+Im/ZEspllRpoB827x
 Pvrrxe5pMBU755ZiOIrujHrlhY890Xl0/NSxZ8ErPdJaJmTqEi96Gmm4Q
 XqSmfm8eLoQxdz4nMhiAwoFO04uiEsb7zFHZrDIySlAff6VWo2onV2VSu
 LOoUi4HLHMGPIeH+U/ayclI+SCWe53baDt54wfz5ZLVOWMgj2tYHNy1X4 g==;
X-CSE-ConnectionGUID: JuClrDN9REy0RRICluuPGw==
X-CSE-MsgGUID: 9jT9uebySguS/0/bwVjPcw==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22039947"
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; d="scan'208";a="22039947"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 08:49:33 -0700
X-CSE-ConnectionGUID: m+GdkhywRGG36ETbYOOOrg==
X-CSE-MsgGUID: JDkjLoroSF2/YYOcjyYBzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; d="scan'208";a="53332501"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.25.139])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 08:49:32 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 6/6] drm/xe/vf: Expose SR-IOV VF attributes to GT debugfs
Date: Sun, 12 May 2024 17:49:15 +0200
Message-Id: <20240512154915.2040-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240512154915.2040-1-michal.wajdeczko@intel.com>
References: <20240512154915.2040-1-michal.wajdeczko@intel.com>
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

For debug purposes we might want to view actual VF configuration
(including GGTT range, LMEM size, number of GuC contexts IDs or
doorbells) and the negotiated ABI versions (with GuC and PF).

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/Makefile                 |  1 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c          |  3 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c | 72 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.h | 14 ++++
 4 files changed, 90 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index aaa3bce7390f..04c94629b349 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -156,6 +156,7 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
 # graphics virtualization (SR-IOV) support
 xe-y += \
 	xe_gt_sriov_vf.o \
+	xe_gt_sriov_vf_debugfs.o \
 	xe_guc_relay.o \
 	xe_memirq.o \
 	xe_sriov.o
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index c5e562e143fd..66f897a9b6ca 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -16,6 +16,7 @@
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_sriov_pf_debugfs.h"
+#include "xe_gt_sriov_vf_debugfs.h"
 #include "xe_gt_topology.h"
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
@@ -306,4 +307,6 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 
 	if (IS_SRIOV_PF(xe))
 		xe_gt_sriov_pf_debugfs_register(gt, root);
+	else if (IS_SRIOV_VF(xe))
+		xe_gt_sriov_vf_debugfs_register(gt, root);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
new file mode 100644
index 000000000000..f3ddcbefc6bc
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023-2024 Intel Corporation
+ */
+
+#include <linux/debugfs.h>
+
+#include <drm/drm_debugfs.h>
+
+#include "xe_gt_debugfs.h"
+#include "xe_gt_sriov_vf.h"
+#include "xe_gt_sriov_vf_debugfs.h"
+#include "xe_gt_types.h"
+#include "xe_sriov.h"
+
+/*
+ *      /sys/kernel/debug/dri/0/
+ *      ├── gt0
+ *      │   ├── vf
+ *      │   │   ├── self_config
+ *      │   │   ├── abi_versions
+ *      │   │   ├── runtime_regs
+ */
+
+static const struct drm_info_list vf_info[] = {
+	{
+		"self_config",
+		.show = xe_gt_debugfs_simple_show,
+		.data = xe_gt_sriov_vf_print_config,
+	},
+	{
+		"abi_versions",
+		.show = xe_gt_debugfs_simple_show,
+		.data = xe_gt_sriov_vf_print_version,
+	},
+#if defined(CONFIG_DRM_XE_DEBUG) || defined(CONFIG_DRM_XE_DEBUG_SRIOV)
+	{
+		"runtime_regs",
+		.show = xe_gt_debugfs_simple_show,
+		.data = xe_gt_sriov_vf_print_runtime,
+	},
+#endif
+};
+
+/**
+ * xe_gt_sriov_vf_debugfs_register - Register SR-IOV VF specific entries in GT debugfs.
+ * @gt: the &xe_gt to register
+ * @root: the &dentry that represents the GT directory
+ *
+ * Register SR-IOV VF entries that are GT related and must be shown under GT debugfs.
+ */
+void xe_gt_sriov_vf_debugfs_register(struct xe_gt *gt, struct dentry *root)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	struct drm_minor *minor = xe->drm.primary;
+	struct dentry *vfdentry;
+
+	xe_assert(xe, IS_SRIOV_VF(xe));
+	xe_assert(xe, root->d_inode->i_private == gt);
+
+	/*
+	 *      /sys/kernel/debug/dri/0/
+	 *      ├── gt0
+	 *      │   ├── vf
+	 */
+	vfdentry = debugfs_create_dir("vf", root);
+	if (IS_ERR(vfdentry))
+		return;
+	vfdentry->d_inode->i_private = gt;
+
+	drm_debugfs_create_files(vf_info, ARRAY_SIZE(vf_info), vfdentry, minor);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.h
new file mode 100644
index 000000000000..b2cff7ef5c78
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023-2024 Intel Corporation
+ */
+
+#ifndef _XE_GT_SRIOV_VF_DEBUGFS_H_
+#define _XE_GT_SRIOV_VF_DEBUGFS_H_
+
+struct xe_gt;
+struct dentry;
+
+void xe_gt_sriov_vf_debugfs_register(struct xe_gt *gt, struct dentry *root);
+
+#endif
-- 
2.43.0

