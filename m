Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B541C7114C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 21:52:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D798E10E5FB;
	Wed, 28 Aug 2024 21:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MT1SA1Yo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E84CF10E5FA
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 21:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724881930; x=1756417930;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5VeW9/UQh8wL0N7RRSQj+ZcYKoJKfleRHeIbC8vJVmE=;
 b=MT1SA1YoiEamu/tnR6Cxfggnevvt5eO5BDNPHzJg8dl5CxAaIIhQff1r
 ESwsl/fHswtlTll6kOYtV1vG7Rc8RFuWYNzcIjQqa5kWnjeII3WhYUjKQ
 xVvzMGD9aAgY43cN8RGlbT6oM65CsGyEEQRtLCGh5ivRHgUCqyNbdGndD
 eTQLc6dp1VDuaL9iHQbU4mdh3RPTR9KNE+utJEubC6nFJyO48+GLOw2vj
 ZgckkWz/zzwP1yc/v3weVvwFsgNf2r3hTwxLZeHrWAWMNtIWwh81cxThF
 Fi64XTmDNQMA9ASMm4INkSGeYu+4Ip/BflNxjdbVrUgkREE/xKfnooU25 w==;
X-CSE-ConnectionGUID: U+RdCZysStqbcQJd4SUSCg==
X-CSE-MsgGUID: SYGdoWn3S9OdzBJivM+XfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23330694"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; d="scan'208";a="23330694"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 14:52:10 -0700
X-CSE-ConnectionGUID: 4Ub7jfUIRJCgKGx/etDplA==
X-CSE-MsgGUID: 2rfzapk4RzSG25+NvUfvnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; d="scan'208";a="63356539"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 14:52:11 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 4/4] drm/xe/gsc: Add debugfs to print GSC info
Date: Wed, 28 Aug 2024 14:51:57 -0700
Message-ID: <20240828215158.2743994-5-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240828215158.2743994-1-daniele.ceraolospurio@intel.com>
References: <20240828215158.2743994-1-daniele.ceraolospurio@intel.com>
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

This is useful for debug, in case something goes wrong with the GSC. The
info includes the version information and the current value of the HECI1
status registers.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/Makefile           |  1 +
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h |  4 ++
 drivers/gpu/drm/xe/xe_gsc.c           | 33 +++++++++++++
 drivers/gpu/drm/xe/xe_gsc.h           |  3 ++
 drivers/gpu/drm/xe/xe_gsc_debugfs.c   | 71 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gsc_debugfs.h   | 14 ++++++
 drivers/gpu/drm/xe/xe_uc_debugfs.c    |  2 +
 7 files changed, 128 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gsc_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gsc_debugfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index b9670ae09a9e..edfd812e0f41 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -40,6 +40,7 @@ xe-y += xe_bb.o \
 	xe_ggtt.o \
 	xe_gpu_scheduler.o \
 	xe_gsc.o \
+	xe_gsc_debugfs.o \
 	xe_gsc_proxy.o \
 	xe_gsc_submit.o \
 	xe_gt.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
index e2a925be137c..7702364b65f1 100644
--- a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
@@ -32,8 +32,12 @@
 #define   HECI1_FWSTS1_CURRENT_STATE_RESET		0
 #define   HECI1_FWSTS1_PROXY_STATE_NORMAL		5
 #define   HECI1_FWSTS1_INIT_COMPLETE			REG_BIT(9)
+#define HECI_FWSTS2(base)				XE_REG((base) + 0xc48)
+#define HECI_FWSTS3(base)				XE_REG((base) + 0xc60)
+#define HECI_FWSTS4(base)				XE_REG((base) + 0xc64)
 #define HECI_FWSTS5(base)				XE_REG((base) + 0xc68)
 #define   HECI1_FWSTS5_HUC_AUTH_DONE			REG_BIT(19)
+#define HECI_FWSTS6(base)				XE_REG((base) + 0xc6c)
 
 #define HECI_H_GS1(base)	XE_REG((base) + 0xc4c)
 #define   HECI_H_GS1_ER_PREP	REG_BIT(0)
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 50ff43f5426a..648786afffe0 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -8,6 +8,7 @@
 #include <linux/delay.h>
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 #include <generated/xe_wa_oob.h>
 
@@ -587,3 +588,35 @@ void xe_gsc_wa_14015076503(struct xe_gt *gt, bool prep)
 		msleep(200);
 	}
 }
+
+/**
+ * xe_gsc_print_info - print info about GSC FW status
+ * @gsc: the GSC structure
+ * @p: the printer to be used to print the info
+ */
+void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
+{
+	struct xe_gt *gt = gsc_to_gt(gsc);
+	int err;
+
+	xe_uc_fw_print(&gsc->fw, p);
+
+	drm_printf(p, "\tfound security version %u\n", gsc->security_version);
+
+	if (!xe_uc_fw_is_enabled(&gsc->fw))
+		return;
+
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
+	if (err)
+		return;
+
+	drm_printf(p, "\nHECI1 FWSTS: 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x\n",
+			xe_mmio_read32(gt, HECI_FWSTS1(MTL_GSC_HECI1_BASE)),
+			xe_mmio_read32(gt, HECI_FWSTS2(MTL_GSC_HECI1_BASE)),
+			xe_mmio_read32(gt, HECI_FWSTS3(MTL_GSC_HECI1_BASE)),
+			xe_mmio_read32(gt, HECI_FWSTS4(MTL_GSC_HECI1_BASE)),
+			xe_mmio_read32(gt, HECI_FWSTS5(MTL_GSC_HECI1_BASE)),
+			xe_mmio_read32(gt, HECI_FWSTS6(MTL_GSC_HECI1_BASE)));
+
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
+}
diff --git a/drivers/gpu/drm/xe/xe_gsc.h b/drivers/gpu/drm/xe/xe_gsc.h
index 1c7a623faf11..e282b9ef6ec4 100644
--- a/drivers/gpu/drm/xe/xe_gsc.h
+++ b/drivers/gpu/drm/xe/xe_gsc.h
@@ -8,6 +8,7 @@
 
 #include <linux/types.h>
 
+struct drm_printer;
 struct xe_gsc;
 struct xe_gt;
 struct xe_hw_engine;
@@ -21,4 +22,6 @@ void xe_gsc_hwe_irq_handler(struct xe_hw_engine *hwe, u16 intr_vec);
 
 void xe_gsc_wa_14015076503(struct xe_gt *gt, bool prep);
 
+void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gsc_debugfs.c b/drivers/gpu/drm/xe/xe_gsc_debugfs.c
new file mode 100644
index 000000000000..461d7e99c2b3
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gsc_debugfs.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#include "xe_gsc_debugfs.h"
+
+#include <drm/drm_debugfs.h>
+#include <drm/drm_managed.h>
+
+#include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_gsc.h"
+#include "xe_macros.h"
+#include "xe_pm.h"
+
+static struct xe_gt *
+gsc_to_gt(struct xe_gsc *gsc)
+{
+	return container_of(gsc, struct xe_gt, uc.gsc);
+}
+
+static struct xe_device *
+gsc_to_xe(struct xe_gsc *gsc)
+{
+	return gt_to_xe(gsc_to_gt(gsc));
+}
+
+static struct xe_gsc *node_to_gsc(struct drm_info_node *node)
+{
+	return node->info_ent->data;
+}
+
+static int gsc_info(struct seq_file *m, void *data)
+{
+	struct xe_gsc *gsc = node_to_gsc(m->private);
+	struct xe_device *xe = gsc_to_xe(gsc);
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	xe_pm_runtime_get(xe);
+	xe_gsc_print_info(gsc, &p);
+	xe_pm_runtime_put(xe);
+
+	return 0;
+}
+
+static const struct drm_info_list debugfs_list[] = {
+	{"gsc_info", gsc_info, 0},
+};
+
+void xe_gsc_debugfs_register(struct xe_gsc *gsc, struct dentry *parent)
+{
+	struct drm_minor *minor = gsc_to_xe(gsc)->drm.primary;
+	struct drm_info_list *local;
+	int i;
+
+#define DEBUGFS_SIZE	(ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list))
+	local = drmm_kmalloc(&gsc_to_xe(gsc)->drm, DEBUGFS_SIZE, GFP_KERNEL);
+	if (!local)
+		return;
+
+	memcpy(local, debugfs_list, DEBUGFS_SIZE);
+#undef DEBUGFS_SIZE
+
+	for (i = 0; i < ARRAY_SIZE(debugfs_list); ++i)
+		local[i].data = gsc;
+
+	drm_debugfs_create_files(local,
+				 ARRAY_SIZE(debugfs_list),
+				 parent, minor);
+}
diff --git a/drivers/gpu/drm/xe/xe_gsc_debugfs.h b/drivers/gpu/drm/xe/xe_gsc_debugfs.h
new file mode 100644
index 000000000000..c2e2645dc705
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gsc_debugfs.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_GSC_DEBUGFS_H_
+#define _XE_GSC_DEBUGFS_H_
+
+struct dentry;
+struct xe_gsc;
+
+void xe_gsc_debugfs_register(struct xe_gsc *gsc, struct dentry *parent);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_uc_debugfs.c b/drivers/gpu/drm/xe/xe_uc_debugfs.c
index 78eb8db73791..24a4209051ee 100644
--- a/drivers/gpu/drm/xe/xe_uc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_uc_debugfs.c
@@ -8,6 +8,7 @@
 #include <drm/drm_debugfs.h>
 
 #include "xe_gt.h"
+#include "xe_gsc_debugfs.h"
 #include "xe_guc_debugfs.h"
 #include "xe_huc_debugfs.h"
 #include "xe_macros.h"
@@ -23,6 +24,7 @@ void xe_uc_debugfs_register(struct xe_uc *uc, struct dentry *parent)
 		return;
 	}
 
+	xe_gsc_debugfs_register(&uc->gsc, root);
 	xe_guc_debugfs_register(&uc->guc, root);
 	xe_huc_debugfs_register(&uc->huc, root);
 }
-- 
2.43.0

