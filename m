Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE50C83F1D
	for <intel-xe@archiver.kernel.org>; Sun, 13 Jul 2025 10:36:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F176E10E175;
	Sun, 13 Jul 2025 10:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SblCLTKQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B0510E16C
 for <intel-xe@lists.freedesktop.org>; Sun, 13 Jul 2025 10:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752403003; x=1783939003;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2vg/T8Vbf1jt5JtEoxULkJB+yxNYUXhcFd9YeY2Gu4g=;
 b=SblCLTKQ5p+fL5kt3gwbxnvzqBcaDsAtxRlujCcoG+HqtwQGTT60od3G
 FkMw/jPv90DgcLIBOMxl5abU6H986EwSthnZW9yA0ZhWzvcqKj0Fipr3T
 yBjfx90reyXn0C3Y9r6jwogyb/KgqqCWFSZgipOO7LnOxfsBXrMbD+T1X
 GBcvFio8135O5fdZV/ZMoUelBkrr9JrVekPhjcyQRfS2BQyvbJ5kV2lue
 rH/peb+wOv5jKevV8DODuZ1eg7ATVmKNKXTU2b/O4AZjIC1oeYyUOQNb4
 oZ/FLkcXIj0jKVrfbqSg3ydB2n3lNZeWN7gyXe5Ye/Oui+PTZxqwERTQ9 w==;
X-CSE-ConnectionGUID: wlUxba1sRpiPVPtGJi5YOw==
X-CSE-MsgGUID: hdu/I+4fQH+HSN3jRt2KGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="64883045"
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; d="scan'208";a="64883045"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2025 03:36:43 -0700
X-CSE-ConnectionGUID: wYpo5ZjCR9iVN5MxjGSl9A==
X-CSE-MsgGUID: pv//WAM9StGaEHG1AXTb1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; d="scan'208";a="156802486"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.176])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2025 03:36:42 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [CI v4 5/7] drm/xe/pf: Expose basic info about VFs in debugfs
Date: Sun, 13 Jul 2025 12:36:23 +0200
Message-Id: <20250713103625.1964-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250713103625.1964-1-michal.wajdeczko@intel.com>
References: <20250713103625.1964-1-michal.wajdeczko@intel.com>
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

We already have function to print summary about VFs, but we missed
to add debugfs attribute to make it visible. Do it now.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
v2: don't WARN on missed mandatory print func (Piotr)
---
 drivers/gpu/drm/xe/xe_debugfs.c  |  4 +++
 drivers/gpu/drm/xe/xe_sriov_pf.c | 43 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf.h |  6 +++++
 3 files changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 0e26658bcf7e..26e9d146ccbf 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -20,6 +20,7 @@
 #include "xe_pm.h"
 #include "xe_pxp_debugfs.h"
 #include "xe_sriov.h"
+#include "xe_sriov_pf.h"
 #include "xe_step.h"
 #include "xe_wa.h"
 
@@ -293,4 +294,7 @@ void xe_debugfs_register(struct xe_device *xe)
 	xe_pxp_debugfs_register(xe->pxp);
 
 	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
+
+	if (IS_SRIOV_PF(xe))
+		xe_sriov_pf_debugfs_register(xe, root);
 }
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index 0f721ae17b26..331755843e10 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -3,6 +3,8 @@
  * Copyright © 2023-2024 Intel Corporation
  */
 
+#include <linux/debugfs.h>
+#include <drm/drm_debugfs.h>
 #include <drm/drm_managed.h>
 
 #include "xe_assert.h"
@@ -102,3 +104,44 @@ void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p)
 	drm_printf(p, "supported: %u\n", xe->sriov.pf.driver_max_vfs);
 	drm_printf(p, "enabled: %u\n", pci_num_vf(pdev));
 }
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
+	 *      │   ├── ...
+	 */
+	parent = debugfs_create_dir("pf", root);
+	if (IS_ERR(parent))
+		return;
+	parent->d_inode->i_private = xe;
+
+	drm_debugfs_create_files(debugfs_list, ARRAY_SIZE(debugfs_list), parent, minor);
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.h b/drivers/gpu/drm/xe/xe_sriov_pf.h
index d1220e70e1c0..c392c3fcf085 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.h
@@ -8,12 +8,14 @@
 
 #include <linux/types.h>
 
+struct dentry;
 struct drm_printer;
 struct xe_device;
 
 #ifdef CONFIG_PCI_IOV
 bool xe_sriov_pf_readiness(struct xe_device *xe);
 int xe_sriov_pf_init_early(struct xe_device *xe);
+void xe_sriov_pf_debugfs_register(struct xe_device *xe, struct dentry *root);
 void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p);
 #else
 static inline bool xe_sriov_pf_readiness(struct xe_device *xe)
@@ -25,6 +27,10 @@ static inline int xe_sriov_pf_init_early(struct xe_device *xe)
 {
 	return 0;
 }
+
+static inline void xe_sriov_pf_debugfs_register(struct xe_device *xe, struct dentry *root)
+{
+}
 #endif
 
 #endif
-- 
2.47.1

