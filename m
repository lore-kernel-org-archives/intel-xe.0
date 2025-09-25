Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D861CCAC5B9
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 22:04:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A65F10E9C5;
	Thu, 25 Sep 2025 22:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L0vFANKd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E2610E9C1
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 22:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758837891; x=1790373891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wC4nq778BaFKRaPOow8L6zmgYCXukMZvX1xoK7/BiQw=;
 b=L0vFANKdcW+lO4t8eksN6vJ3drG54qWDJpTL2C/KG1eOJvYR4xbua0A4
 R3NgVm2hsyfO+hA3/3U3SEVRusYwEZng07Ao2HgC+83CWjETt8Fh85lKk
 y/s8MLuoCVLmnVP6zLqSWQtmGV4KenZF76fK+Uda9VBsxMfWdJE4WTmob
 dfSMSTRKqqxjDQQ+k1taevBFTYzqUWApuNPyqnk9oIQApuZe+rLU2QY9l
 Mwyihu5U5Kg/iLseA6vxiWAHy8T3Z7k9w0gwHKUanqrcwmCnBBF5JHs08
 Vzn03bxdzq/PaWPzEoTPa0HgICqYfBw65w3ShASHxqrI2LOTSCS9A4MQp A==;
X-CSE-ConnectionGUID: jpXxx7IaRByjM8c8yX2+qA==
X-CSE-MsgGUID: iztMSZ7BS1KDM6PfWdZXcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61222123"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="61222123"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 15:04:51 -0700
X-CSE-ConnectionGUID: Ulrcb1PKQzWZi5yR3jqQgQ==
X-CSE-MsgGUID: JkdLbDXvSzqTcTp9NeSvwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="201129423"
Received: from krychlik-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.173])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 15:04:43 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/6] drm/xe/pf: Promote PF debugfs function to its own file
Date: Fri, 26 Sep 2025 00:04:18 +0200
Message-ID: <20250925220425.196860-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250925220425.196860-1-michal.wajdeczko@intel.com>
References: <20250925220425.196860-1-michal.wajdeczko@intel.com>
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

