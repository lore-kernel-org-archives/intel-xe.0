Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAC2D743F5
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 23:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B602910E3E6;
	Wed, 20 Nov 2024 23:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JDitXhAD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05A210E813
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Nov 2024 23:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732146251; x=1763682251;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TE1qkcV2oEfhEK0PQ3//PT4trrdBo9Spcq7J0WalmSU=;
 b=JDitXhADAf8N4WYsC0Ar/BkS7e3tZwthDbtxr+tB8GCnv+G+yvUuG4sy
 mH9sXTIRKQI+9vT6zDNRvP9AECwlALO+s7mp6GDK5Isjfo/H4MRRD5r4x
 2KcASWVUpIspafb6tzn0nUm6s0zslbXq0ypNKv+PcVGhQ6mfneTAncppc
 NNw5PEOe6g3PF6H4O7gGc+MYJ05A3uByIDVuoxTN/lEHYMWdYDU835Bek
 93jtnxzw7XYLAHy2S0349K1CZSPE5K/i882KKaHKWGaz+ofDobqjNEhF6
 MMzxcDzUdbQGJOoR0UGDSNPO7M6JrYjIRLizLh38CC3XyFIryawBxvgkw w==;
X-CSE-ConnectionGUID: ymbwF3GeSDqYqVVAjm9FAg==
X-CSE-MsgGUID: 5kdtRa5XSl+gn8hdNGJICQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="54733287"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="54733287"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 15:44:10 -0800
X-CSE-ConnectionGUID: LVp/jvrgTzqu1O49qPVSIw==
X-CSE-MsgGUID: uRjACTBMSGKULIQPOc58tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="90453674"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 15:44:10 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 11/12] drm/xe/pxp: Add PXP debugfs support
Date: Wed, 20 Nov 2024 15:43:51 -0800
Message-ID: <20241120234353.1037180-12-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
References: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
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

v2: move the info prints inside the lock (John)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/Makefile         |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c     |   3 +
 drivers/gpu/drm/xe/xe_pxp_debugfs.c | 120 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pxp_debugfs.h |  13 +++
 4 files changed, 137 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_pxp_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_pxp_debugfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 126c8f1ab673..28b5c9e6379c 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -87,6 +87,7 @@ xe-y += xe_bb.o \
 	xe_pt.o \
 	xe_pt_walk.o \
 	xe_pxp.o \
+	xe_pxp_debugfs.o \
 	xe_pxp_submit.o \
 	xe_query.o \
 	xe_range_fence.o \
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 492b4877433f..56cb3788e752 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -18,6 +18,7 @@
 #include "xe_gt_printk.h"
 #include "xe_guc_ads.h"
 #include "xe_pm.h"
+#include "xe_pxp_debugfs.h"
 #include "xe_sriov.h"
 #include "xe_step.h"
 
@@ -230,5 +231,7 @@ void xe_debugfs_register(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_debugfs_register(gt);
 
+	xe_pxp_debugfs_register(xe->pxp);
+
 	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
 }
diff --git a/drivers/gpu/drm/xe/xe_pxp_debugfs.c b/drivers/gpu/drm/xe/xe_pxp_debugfs.c
new file mode 100644
index 000000000000..ccfbacf08efc
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
+#include "regs/xe_irq_regs.h"
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
+
+	drm_printf(&p, "status: %s\n", status);
+	drm_printf(&p, "instance counter: %u\n", pxp->key_instance);
+	mutex_unlock(&pxp->mutex);
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
+	drm_printf(&p, "PXP termination queued\n");
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

