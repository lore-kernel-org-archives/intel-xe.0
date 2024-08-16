Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E300C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 19:01:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188FE10E82D;
	Fri, 16 Aug 2024 19:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DxPWTCUa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2B910E831
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 19:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723834855; x=1755370855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8lsR5KSEV3tnWeEsPWiL4Oi1nJvhrzGMIxXgbJ0JE28=;
 b=DxPWTCUa0mwNZJ+FXXBvXI7dU0vthkt/FRVl9zIWb6wmhgfWhRAaQXht
 m/vnb+qt2qSD0z8/9lAMzebIsMzqhasLNKObK4kLVbwx06Sl/vz5acpcB
 VCK4PQQsVY8EQyD5cTjafGq5xiDoPjQSx7LjL8olIe3MCSHohmCDIQryw
 d3oppDlZh73Pr7mxQf5GZX2dxeOrf33dKlVzUtt0cHhtx0TkuhxT4AT0V
 D1EHfyHkfz/hg05LoZFCirT4AI4uO7/ls67ZRhWQ8kXaG5X3wZ/Wh0Hqn
 75dAacAfRYUK6lFAQfrD5xiiXLbC26a/otd0L8YaETljUb3N/uJVo/ikt Q==;
X-CSE-ConnectionGUID: BwcNPnNtS1S0lA4o8ahBoQ==
X-CSE-MsgGUID: 8TWieOL8Q3yiOf5BGcdFvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="21772468"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="21772468"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 12:00:55 -0700
X-CSE-ConnectionGUID: bb1EnYZST7yili4wC6Vtow==
X-CSE-MsgGUID: jFroDtpmTTG1a09Vp8rKBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="59767984"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 12:00:54 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 11/12] drm/xe/pxp: Add PXP debugfs support
Date: Fri, 16 Aug 2024 12:00:20 -0700
Message-ID: <20240816190024.2176976-12-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
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

This patch introduces 2 PXP debugfs entries:

- info: prints the current PXP status and key instance
- terminate: simulate a termination interrupt

The first one is useful for debug, while the second one can be used for
testing the termination flow.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/Makefile         |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c     |   3 +
 drivers/gpu/drm/xe/xe_pxp_debugfs.c | 120 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pxp_debugfs.h |  13 +++
 4 files changed, 137 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_pxp_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_pxp_debugfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a508b9166b88..7cc65f419710 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -84,6 +84,7 @@ xe-y += xe_bb.o \
 	xe_pt.o \
 	xe_pt_walk.o \
 	xe_pxp.o \
+	xe_pxp_debugfs.o \
 	xe_pxp_submit.o \
 	xe_query.o \
 	xe_range_fence.o \
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 1011e5d281fa..a04f9c2d886b 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -17,6 +17,7 @@
 #include "xe_gt_printk.h"
 #include "xe_guc_ads.h"
 #include "xe_pm.h"
+#include "xe_pxp_debugfs.h"
 #include "xe_sriov.h"
 #include "xe_step.h"
 
@@ -214,6 +215,8 @@ void xe_debugfs_register(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_debugfs_register(gt);
 
+	xe_pxp_debugfs_register(xe->pxp);
+
 #ifdef CONFIG_FAULT_INJECTION
 	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pxp_debugfs.c b/drivers/gpu/drm/xe/xe_pxp_debugfs.c
new file mode 100644
index 000000000000..00c8179a9f0f
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pxp_debugfs.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include "xe_pxp_debugfs.h"
+
+#include <linux/debugfs.h>
+
+#include <drm/drm_debugfs.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_print.h>
+
+#include "xe_device.h"
+#include "xe_pxp.h"
+#include "xe_pxp_types.h"
+#include "regs/xe_gt_regs.h"
+
+static struct xe_pxp *node_to_pxp(struct drm_info_node *node)
+{
+	return node->info_ent->data;
+}
+
+static const char *pxp_status_to_str(struct xe_pxp *pxp)
+{
+	lockdep_assert_held(&pxp->mutex);
+
+	switch (pxp->status) {
+	case XE_PXP_ERROR:
+		return "error";
+	case XE_PXP_NEEDS_TERMINATION:
+		return "needs termination";
+	case XE_PXP_TERMINATION_IN_PROGRESS:
+		return "termination in progress";
+	case XE_PXP_READY_TO_START:
+		return "ready to start";
+	case XE_PXP_ACTIVE:
+		return "active";
+	case XE_PXP_SUSPENDED:
+		return "suspended";
+	default:
+		return "unknown";
+	}
+};
+
+static int pxp_info(struct seq_file *m, void *data)
+{
+	struct xe_pxp *pxp = node_to_pxp(m->private);
+	struct drm_printer p = drm_seq_file_printer(m);
+	const char *status;
+
+	if (!xe_pxp_is_enabled(pxp))
+		return -ENODEV;
+
+	mutex_lock(&pxp->mutex);
+	status = pxp_status_to_str(pxp);
+	mutex_unlock(&pxp->mutex);
+
+	drm_printf(&p, "status: %s\n", status);
+	drm_printf(&p, "instance counter: %u\n", pxp->key_instance);
+
+	return 0;
+}
+
+static int pxp_terminate(struct seq_file *m, void *data)
+{
+	struct xe_pxp *pxp = node_to_pxp(m->private);
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	if (!xe_pxp_is_enabled(pxp))
+		return -ENODEV;
+
+	/* simulate a termination interrupt */
+	spin_lock_irq(&pxp->xe->irq.lock);
+	xe_pxp_irq_handler(pxp->xe, KCR_PXP_STATE_TERMINATED_INTERRUPT);
+	spin_unlock_irq(&pxp->xe->irq.lock);
+
+	drm_printf(&p, "Termination queued\n");
+
+	return 0;
+}
+
+static const struct drm_info_list debugfs_list[] = {
+	{"info", pxp_info, 0},
+	{"terminate", pxp_terminate, 0},
+};
+
+void xe_pxp_debugfs_register(struct xe_pxp *pxp)
+{
+	struct drm_minor *minor;
+	struct drm_info_list *local;
+	struct dentry *root;
+	int i;
+
+	if (!xe_pxp_is_enabled(pxp))
+		return;
+
+	minor = pxp->xe->drm.primary;
+	if (!minor->debugfs_root)
+		return;
+
+#define DEBUGFS_SIZE	(ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list))
+	local = drmm_kmalloc(&pxp->xe->drm, DEBUGFS_SIZE, GFP_KERNEL);
+	if (!local)
+		return;
+
+	memcpy(local, debugfs_list, DEBUGFS_SIZE);
+#undef DEBUGFS_SIZE
+
+	for (i = 0; i < ARRAY_SIZE(debugfs_list); ++i)
+		local[i].data = pxp;
+
+	root = debugfs_create_dir("pxp", minor->debugfs_root);
+	if (IS_ERR(root))
+		return;
+
+	drm_debugfs_create_files(local,
+				 ARRAY_SIZE(debugfs_list),
+				 root, minor);
+}
diff --git a/drivers/gpu/drm/xe/xe_pxp_debugfs.h b/drivers/gpu/drm/xe/xe_pxp_debugfs.h
new file mode 100644
index 000000000000..988466aad50b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pxp_debugfs.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef __XE_PXP_DEBUGFS_H__
+#define __XE_PXP_DEBUGFS_H__
+
+struct xe_pxp;
+
+void xe_pxp_debugfs_register(struct xe_pxp *pxp);
+
+#endif /* __XE_PXP_DEBUGFS_H__ */
-- 
2.43.0

