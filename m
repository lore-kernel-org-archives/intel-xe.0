Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCF7C7EE30
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 12:57:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467D310E59D;
	Tue,  1 Jul 2025 12:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kakymRtK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0F410E2C1
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 12:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751374623; x=1782910623;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rft1Q5ftodioRjZAO+CTuJ6NJApV75Eh2I9Nkcvy1hE=;
 b=kakymRtKt/Z77O8IkjZQQ1JOOgT/4BMBhvLZM4Zmdl+LL2Izzv8EPpqA
 n1t7bzoNQmXZoz8WbvglB5glWJ7N3AKX4Ahw9zDJB1Yn1XDUG6aEWC8Pv
 B/WM9OKEYOLEalhdOuo691uTc9JxnLsqJKt6ppEjqV4PrKzf7NMYMNiWT
 BckgmdGKiwQAyDLwEdyjI40CaGMYn0JSc4AZyWNP3h4y9qB4+6WEvmX6X
 FbJ/g3WN5myd2s2Ku0yj1SUX3uoid/rp830V+gLKkHzS6Jlf9GgdfYWQj
 1UDTCIN5EE4utjCfuzrnO6FkdSRyHHl4Ga2L0tgKmC8+TQH0OQziR0i1n Q==;
X-CSE-ConnectionGUID: p0GcviIqRmKl7A6ks4J6/A==
X-CSE-MsgGUID: a2J7JSWhRPCvSlX6oEMejg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53745202"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53745202"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 05:57:03 -0700
X-CSE-ConnectionGUID: blOS9S4RQBCdyVI4vbpV0g==
X-CSE-MsgGUID: Zl79IeOjSieRU4zK16qolg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="153236565"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.176])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 05:57:01 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 5/7] drm/xe/pf: Expose basic info about VFs in debugfs
Date: Tue,  1 Jul 2025 14:56:44 +0200
Message-Id: <20250701125646.1568-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250701125646.1568-1-michal.wajdeczko@intel.com>
References: <20250701125646.1568-1-michal.wajdeczko@intel.com>
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
index d83cd6ed3fa8..24a5f99ed52f 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -20,6 +20,7 @@
 #include "xe_pm.h"
 #include "xe_pxp_debugfs.h"
 #include "xe_sriov.h"
+#include "xe_sriov_pf.h"
 #include "xe_step.h"
 
 #ifdef CONFIG_DRM_XE_DEBUG
@@ -273,4 +274,7 @@ void xe_debugfs_register(struct xe_device *xe)
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

