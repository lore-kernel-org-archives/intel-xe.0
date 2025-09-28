Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E23CAC5B5
	for <intel-xe@archiver.kernel.org>; Sun, 28 Sep 2025 14:00:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB9810E127;
	Sun, 28 Sep 2025 14:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cWR2h2fA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE62710E124
 for <intel-xe@lists.freedesktop.org>; Sun, 28 Sep 2025 14:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759068043; x=1790604043;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NTs8WuvV0/vDpdTAbFfnsKaG7bSXB+MXMrwdp8RXbFs=;
 b=cWR2h2fA6eNfBNBfFIuyuW024u0qwzQlCN3V0NTIbwCWsIgODawG7bc2
 lfVRa1PObmOTVf0V8CUuDVH+u3z2b2ixTg5raUV60HeE/xgUWBYdFsILP
 KYsX9lvHYDpXuC7F+tokNQ7CRri6wmpYFUuSuYg7EdHvI2ivjZxj4AL0S
 qWKwvAyyt1UYIl2pksUoouoL973foYGVCKMdXRujmQYU6cPQiG7z4WtXa
 ncwPVRDChXoK1zXc8szrHTepeFx009K42nT9Ho2t5QEKSLQpFuFjaLsRt
 9284ky2ImSOhgSDu1fY6gE2MDE9a6G1sN70oUHmxgBncGGKhDN33+m5Cs w==;
X-CSE-ConnectionGUID: ZG8mOvrkTcadz5KxzKN4dw==
X-CSE-MsgGUID: Cw/+5JCeT9S1gl14/hhFDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="48893871"
X-IronPort-AV: E=Sophos;i="6.18,299,1751266800"; d="scan'208";a="48893871"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 07:00:43 -0700
X-CSE-ConnectionGUID: WlMdKa3yQveUr4rKMl1gtA==
X-CSE-MsgGUID: 4Y1pYOugSn+7gWH8bqh7qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,299,1751266800"; d="scan'208";a="178761820"
Received: from jkhalil-mobl.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.85])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 07:00:42 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 1/6] drm/xe/pf: Promote PF debugfs function to its own file
Date: Sun, 28 Sep 2025 16:00:23 +0200
Message-ID: <20250928140029.198847-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250928140029.198847-1-michal.wajdeczko@intel.com>
References: <20250928140029.198847-1-michal.wajdeczko@intel.com>
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

In upcoming patches, we will build on the PF separate debugfs
tree for all SR-IOV related files and this new code will need
dedicated file. To minimize large diffs later, move existing
function now as-is, so any future modifications will be done
directly in target file.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/Makefile              |  1 +
 drivers/gpu/drm/xe/xe_debugfs.c          |  2 +-
 drivers/gpu/drm/xe/xe_sriov_pf.c         | 42 ------------------
 drivers/gpu/drm/xe/xe_sriov_pf.h         |  5 ---
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c | 54 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.h | 18 ++++++++
 6 files changed, 74 insertions(+), 48 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index d9c6cf0f189e..534355c23e80 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -174,6 +174,7 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_lmtt_ml.o \
 	xe_pci_sriov.o \
 	xe_sriov_pf.o \
+	xe_sriov_pf_debugfs.o \
 	xe_sriov_pf_service.o
 
 # include helpers for tests even when XE is built-in
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index cd977dbd1ef6..dba0a9c4a4d2 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -23,7 +23,7 @@
 #include "xe_psmi.h"
 #include "xe_pxp_debugfs.h"
 #include "xe_sriov.h"
-#include "xe_sriov_pf.h"
+#include "xe_sriov_pf_debugfs.h"
 #include "xe_sriov_vf.h"
 #include "xe_step.h"
 #include "xe_tile_debugfs.h"
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index 27ddf3cc80e9..4698348c010a 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -146,45 +146,3 @@ void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p)
 	drm_printf(p, "supported: %u\n", xe->sriov.pf.driver_max_vfs);
 	drm_printf(p, "enabled: %u\n", pci_num_vf(pdev));
 }
-
-static int simple_show(struct seq_file *m, void *data)
-{
-	struct drm_printer p = drm_seq_file_printer(m);
-	struct drm_info_node *node = m->private;
-	struct dentry *parent = node->dent->d_parent;
-	struct xe_device *xe = parent->d_inode->i_private;
-	void (*print)(struct xe_device *, struct drm_printer *) = node->info_ent->data;
-
-	print(xe, &p);
-	return 0;
-}
-
-static const struct drm_info_list debugfs_list[] = {
-	{ .name = "vfs", .show = simple_show, .data = xe_sriov_pf_print_vfs_summary },
-	{ .name = "versions", .show = simple_show, .data = xe_sriov_pf_service_print_versions },
-};
-
-/**
- * xe_sriov_pf_debugfs_register - Register PF debugfs attributes.
- * @xe: the &xe_device
- * @root: the root &dentry
- *
- * Prepare debugfs attributes exposed by the PF.
- */
-void xe_sriov_pf_debugfs_register(struct xe_device *xe, struct dentry *root)
-{
-	struct drm_minor *minor = xe->drm.primary;
-	struct dentry *parent;
-
-	/*
-	 *      /sys/kernel/debug/dri/0/
-	 *      ├── pf
-	 *      │   ├── ...
-	 */
-	parent = debugfs_create_dir("pf", root);
-	if (IS_ERR(parent))
-		return;
-	parent->d_inode->i_private = xe;
-
-	drm_debugfs_create_files(debugfs_list, ARRAY_SIZE(debugfs_list), parent, minor);
-}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.h b/drivers/gpu/drm/xe/xe_sriov_pf.h
index e3b34f8f5e04..e6cf930ecde4 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.h
@@ -16,7 +16,6 @@ struct xe_device;
 bool xe_sriov_pf_readiness(struct xe_device *xe);
 int xe_sriov_pf_init_early(struct xe_device *xe);
 int xe_sriov_pf_wait_ready(struct xe_device *xe);
-void xe_sriov_pf_debugfs_register(struct xe_device *xe, struct dentry *root);
 void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p);
 #else
 static inline bool xe_sriov_pf_readiness(struct xe_device *xe)
@@ -28,10 +27,6 @@ static inline int xe_sriov_pf_init_early(struct xe_device *xe)
 {
 	return 0;
 }
-
-static inline void xe_sriov_pf_debugfs_register(struct xe_device *xe, struct dentry *root)
-{
-}
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
new file mode 100644
index 000000000000..2a1316048439
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/debugfs.h>
+#include <drm/drm_debugfs.h>
+
+#include "xe_device_types.h"
+#include "xe_sriov_pf.h"
+#include "xe_sriov_pf_debugfs.h"
+#include "xe_sriov_pf_service.h"
+
+static int simple_show(struct seq_file *m, void *data)
+{
+	struct drm_printer p = drm_seq_file_printer(m);
+	struct drm_info_node *node = m->private;
+	struct dentry *parent = node->dent->d_parent;
+	struct xe_device *xe = parent->d_inode->i_private;
+	void (*print)(struct xe_device *, struct drm_printer *) = node->info_ent->data;
+
+	print(xe, &p);
+	return 0;
+}
+
+static const struct drm_info_list debugfs_list[] = {
+	{ .name = "vfs", .show = simple_show, .data = xe_sriov_pf_print_vfs_summary },
+	{ .name = "versions", .show = simple_show, .data = xe_sriov_pf_service_print_versions },
+};
+
+/**
+ * xe_sriov_pf_debugfs_register - Register PF debugfs attributes.
+ * @xe: the &xe_device
+ * @root: the root &dentry
+ *
+ * Prepare debugfs attributes exposed by the PF.
+ */
+void xe_sriov_pf_debugfs_register(struct xe_device *xe, struct dentry *root)
+{
+	struct drm_minor *minor = xe->drm.primary;
+	struct dentry *parent;
+
+	/*
+	 *      /sys/kernel/debug/dri/0/
+	 *      ├── pf
+	 *      │   ├── ...
+	 */
+	parent = debugfs_create_dir("pf", root);
+	if (IS_ERR(parent))
+		return;
+	parent->d_inode->i_private = xe;
+
+	drm_debugfs_create_files(debugfs_list, ARRAY_SIZE(debugfs_list), parent, minor);
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.h b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.h
new file mode 100644
index 000000000000..93db13585b82
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_PF_DEBUGFS_H_
+#define _XE_SRIOV_PF_DEBUGFS_H_
+
+struct dentry;
+struct xe_device;
+
+#ifdef CONFIG_PCI_IOV
+void xe_sriov_pf_debugfs_register(struct xe_device *xe, struct dentry *root);
+#else
+static inline void xe_sriov_pf_debugfs_register(struct xe_device *xe, struct dentry *root) { }
+#endif
+
+#endif
-- 
2.47.1

