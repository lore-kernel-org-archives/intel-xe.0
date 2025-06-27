Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFC8C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 12:49:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24C710EA16;
	Fri, 27 Jun 2025 12:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hX5CQoGx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E573710EA16
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 12:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751028574; x=1782564574;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rft1Q5ftodioRjZAO+CTuJ6NJApV75Eh2I9Nkcvy1hE=;
 b=hX5CQoGxm2TXLhOmTi3av2z8O//r1EvxwvjzyZrfdty+dEurxt9LvdRq
 84JoUUpEuS2vC9K8RIzeCbzJ97W9+t86bjbMmNyBfldrrcmiKCu66PXKm
 GkslH30KGrcF4GYIL0BmnZX1wY2GOjHIwrKq2Vx0a0yqJbyd04IrZ/TRH
 3SYpkN/kXQfKEzGQWlML5xOL2b8of1u6qWsLjC0ODWXCG5l3oLATvQcis
 8C8JtuNRJyMFSJK/+Sdf+JjT1oH+8ca3ysRRo8uc29gM6wD8HGnYOvReQ
 y3Uud0tnB28OJsEvM6/Jd2RKWT+bO+4NaCYcVym+2TS9aEmVDb3zl/c3B g==;
X-CSE-ConnectionGUID: u4qBRQJ2SQCu4fQA93ZmAQ==
X-CSE-MsgGUID: 38RaLkRMSXuAHP+59HMAHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64031924"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="64031924"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 05:49:34 -0700
X-CSE-ConnectionGUID: 5ft6cZ5lRFayFfVOsBdtpw==
X-CSE-MsgGUID: d0aNtv2sS1GP1hYSnDWwAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="152969723"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 05:49:32 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 5/7] drm/xe/pf: Expose basic info about VFs in debugfs
Date: Fri, 27 Jun 2025 14:49:14 +0200
Message-Id: <20250627124916.1392-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250627124916.1392-1-michal.wajdeczko@intel.com>
References: <20250627124916.1392-1-michal.wajdeczko@intel.com>
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

