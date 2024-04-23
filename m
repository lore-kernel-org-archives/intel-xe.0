Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757B0C10F15
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 13:13:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F14B10F8F6;
	Tue, 23 Apr 2024 13:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="leweSrX0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA1A10F679
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 13:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713877985; x=1745413985;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xUkyXZDkQJctiHzDS8vyyGgh7unNpkwdOxLY7sDjIvo=;
 b=leweSrX0oZvLde4GkWi8xysqqC1r4MXvkthrPwc6oMI86QQ5oR3vYrdx
 ezuDj5t/PQHBZqjPVvp1c23SUuc70iZLfCFezsvXK/08TJ0tYyaVoNVLI
 rkLyoloZCRyvvWxO1f8KpuvESC9n/4jkAfMP+v8jECs1lvHHtx/SCOvRN
 gTQBLkCM+cKWBNnW3I8sqVwTyMLwAF+IJdBTbADVUlNw63i2VgNWldUMj
 qk5qT/t/tRpNQAxEGgbeDKw5XoHbY/9nJKilMFjtFATIyaN7whRhSNqEQ
 VodoT86SGmRH2DgE4SwcP8yyp53o4ut1y+QwoPCETMPqQVuAGbzUsEw4u Q==;
X-CSE-ConnectionGUID: pibVtUZEQgCZOe1P03mOTw==
X-CSE-MsgGUID: faAicSF2TACyjREpLvNqow==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20070871"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="20070871"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 06:13:02 -0700
X-CSE-ConnectionGUID: yYrTl59PQ5SI9oaQffG9+g==
X-CSE-MsgGUID: 3BbqDf3ETLu0+qUm99YPzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="55321532"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.48.128])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 06:12:59 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 1/3] drm/xe/pf: Expose SR-IOV VFs configuration over debugfs
Date: Tue, 23 Apr 2024 15:12:42 +0200
Message-Id: <20240423131244.2045-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240423131244.2045-1-michal.wajdeczko@intel.com>
References: <20240423131244.2045-1-michal.wajdeczko@intel.com>
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

We already have functions to configure VF resources and to print
actual provisioning details. Expose this functionality in debugfs
to allow experiment with different settings or inspect details in
case of unexpected issues with the provisioning.

As debugfs attributes are per-VF, we use parent d_inode->i_private
to store VFID, similarly how we did for per-GT attributes.

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c          |   5 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 203 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.h |  18 ++
 4 files changed, 227 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 8321ec4f9b46..94107b1bf2a4 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -163,6 +163,7 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_gt_sriov_pf.o \
 	xe_gt_sriov_pf_config.o \
 	xe_gt_sriov_pf_control.o \
+	xe_gt_sriov_pf_debugfs.o \
 	xe_gt_sriov_pf_policy.o \
 	xe_lmtt.o \
 	xe_lmtt_2l.o \
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index ff7f4cf52fa9..599aed47f2ba 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -13,6 +13,7 @@
 #include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
+#include "xe_gt_sriov_pf_debugfs.h"
 #include "xe_gt_topology.h"
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
@@ -21,6 +22,7 @@
 #include "xe_pm.h"
 #include "xe_reg_sr.h"
 #include "xe_reg_whitelist.h"
+#include "xe_sriov.h"
 #include "xe_uc_debugfs.h"
 #include "xe_wa.h"
 
@@ -288,4 +290,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 				 root, minor);
 
 	xe_uc_debugfs_register(&gt->uc, root);
+
+	if (IS_SRIOV_PF(xe))
+		xe_gt_sriov_pf_debugfs_register(gt, root);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
new file mode 100644
index 000000000000..32ce98698690
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -0,0 +1,203 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023-2024 Intel Corporation
+ */
+
+#include <linux/debugfs.h>
+
+#include <drm/drm_print.h>
+#include <drm/drm_debugfs.h>
+
+#include "xe_bo.h"
+#include "xe_debugfs.h"
+#include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_gt_debugfs.h"
+#include "xe_gt_sriov_pf_config.h"
+#include "xe_gt_sriov_pf_debugfs.h"
+#include "xe_gt_sriov_pf_helpers.h"
+#include "xe_pm.h"
+
+/*
+ *      /sys/kernel/debug/dri/0/
+ *      ├── gt0		# d_inode->i_private = gt
+ *      │   ├── pf	# d_inode->i_private = gt
+ *      │   ├── vf1	# d_inode->i_private = VFID(1)
+ *      :   :
+ *      │   ├── vfN	# d_inode->i_private = VFID(N)
+ */
+
+static void *extract_priv(struct dentry *d)
+{
+	return d->d_inode->i_private;
+}
+
+static struct xe_gt *extract_gt(struct dentry *d)
+{
+	return extract_priv(d->d_parent);
+}
+
+static unsigned int extract_vfid(struct dentry *d)
+{
+	return extract_priv(d) == extract_gt(d) ? PFID : (uintptr_t)extract_priv(d);
+}
+
+/*
+ *      /sys/kernel/debug/dri/0/
+ *      ├── gt0
+ *      │   ├── pf
+ *      │   │   ├── ggtt_available
+ *      │   │   ├── ggtt_provisioned
+ *      │   │   ├── contexts_provisioned
+ *      │   │   ├── doorbells_provisioned
+ */
+
+static const struct drm_info_list pf_info[] = {
+	{
+		"ggtt_available",
+		.show = xe_gt_debugfs_simple_show,
+		.data = xe_gt_sriov_pf_config_print_available_ggtt,
+	},
+	{
+		"ggtt_provisioned",
+		.show = xe_gt_debugfs_simple_show,
+		.data = xe_gt_sriov_pf_config_print_ggtt,
+	},
+	{
+		"contexts_provisioned",
+		.show = xe_gt_debugfs_simple_show,
+		.data = xe_gt_sriov_pf_config_print_ctxs,
+	},
+	{
+		"doorbells_provisioned",
+		.show = xe_gt_debugfs_simple_show,
+		.data = xe_gt_sriov_pf_config_print_dbs,
+	},
+};
+
+/*
+ *      /sys/kernel/debug/dri/0/
+ *      ├── gt0
+ *      │   ├── pf
+ *      │   │   ├── ggtt_spare
+ *      │   │   ├── lmem_spare
+ *      │   │   ├── doorbells_spare
+ *      │   │   ├── contexts_spare
+ *      │   │   ├── exec_quantum_ms
+ *      │   │   ├── preempt_timeout_us
+ *      │   ├── vf1
+ *      │   │   ├── ggtt_quota
+ *      │   │   ├── lmem_quota
+ *      │   │   ├── doorbells_quota
+ *      │   │   ├── contexts_quota
+ *      │   │   ├── exec_quantum_ms
+ *      │   │   ├── preempt_timeout_us
+ */
+
+#define DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(CONFIG, TYPE, FORMAT)		\
+										\
+static int CONFIG##_set(void *data, u64 val)					\
+{										\
+	struct xe_gt *gt = extract_gt(data);					\
+	unsigned int vfid = extract_vfid(data);					\
+	struct xe_device *xe = gt_to_xe(gt);					\
+	int err;								\
+										\
+	if (val > (TYPE)~0ull)							\
+		return -EOVERFLOW;						\
+										\
+	xe_pm_runtime_get(xe);							\
+	err = xe_gt_sriov_pf_config_set_##CONFIG(gt, vfid, val);		\
+	xe_pm_runtime_put(xe);							\
+										\
+	return err;								\
+}										\
+										\
+static int CONFIG##_get(void *data, u64 *val)					\
+{										\
+	struct xe_gt *gt = extract_gt(data);					\
+	unsigned int vfid = extract_vfid(data);					\
+										\
+	*val = xe_gt_sriov_pf_config_get_##CONFIG(gt, vfid);			\
+	return 0;								\
+}										\
+										\
+DEFINE_DEBUGFS_ATTRIBUTE(CONFIG##_fops, CONFIG##_get, CONFIG##_set, FORMAT)
+
+DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(ggtt, u64, "%llu\n");
+DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(lmem, u64, "%llu\n");
+DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(ctxs, u32, "%llu\n");
+DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(dbs, u32, "%llu\n");
+DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(exec_quantum, u32, "%llu\n");
+DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(preempt_timeout, u32, "%llu\n");
+
+static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigned int vfid)
+{
+	xe_gt_assert(gt, gt == extract_gt(parent));
+	xe_gt_assert(gt, vfid == extract_vfid(parent));
+
+	if (!xe_gt_is_media_type(gt)) {
+		debugfs_create_file_unsafe(vfid ? "ggtt_quota" : "ggtt_spare",
+					   0644, parent, parent, &ggtt_fops);
+		if (IS_DGFX(gt_to_xe(gt)))
+			debugfs_create_file_unsafe(vfid ? "lmem_quota" : "lmem_spare",
+						   0644, parent, parent, &lmem_fops);
+	}
+	debugfs_create_file_unsafe(vfid ? "doorbells_quota" : "doorbells_spare",
+				   0644, parent, parent, &dbs_fops);
+	debugfs_create_file_unsafe(vfid ? "contexts_quota" : "contexts_spare",
+				   0644, parent, parent, &ctxs_fops);
+	debugfs_create_file_unsafe("exec_quantum_ms", 0644, parent, parent,
+				   &exec_quantum_fops);
+	debugfs_create_file_unsafe("preempt_timeout_us", 0644, parent, parent,
+				   &preempt_timeout_fops);
+}
+
+/**
+ * xe_gt_sriov_pf_debugfs_register - Register SR-IOV PF specific entries in GT debugfs.
+ * @gt: the &xe_gt to register
+ * @root: the &dentry that represents the GT directory
+ *
+ * Register SR-IOV PF entries that are GT related and must be shown under GT debugfs.
+ */
+void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	struct drm_minor *minor = xe->drm.primary;
+	int n, totalvfs = xe_sriov_pf_get_totalvfs(xe);
+	struct dentry *pfdentry;
+	struct dentry *vfdentry;
+	char buf[14]; /* should be enough up to "vf%u\0" for 2^32 - 1 */
+
+	xe_gt_assert(gt, IS_SRIOV_PF(xe));
+	xe_gt_assert(gt, root->d_inode->i_private == gt);
+
+	/*
+	 *      /sys/kernel/debug/dri/0/
+	 *      ├── gt0
+	 *      │   ├── pf
+	 */
+	pfdentry = debugfs_create_dir("pf", root);
+	if (IS_ERR(pfdentry))
+		return;
+	pfdentry->d_inode->i_private = gt;
+
+	drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), pfdentry, minor);
+	pf_add_config_attrs(gt, pfdentry, PFID);
+
+	for (n = 1; n <= totalvfs; n++) {
+		/*
+		 *      /sys/kernel/debug/dri/0/
+		 *      ├── gt0
+		 *      │   ├── vf1
+		 *      │   ├── vf2
+		 */
+		snprintf(buf, sizeof(buf), "vf%u", n);
+		vfdentry = debugfs_create_dir(buf, root);
+		if (IS_ERR(vfdentry))
+			break;
+		vfdentry->d_inode->i_private = (void *)(uintptr_t)n;
+
+		pf_add_config_attrs(gt, vfdentry, VFID(n));
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.h
new file mode 100644
index 000000000000..038cc8ddc244
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023-2024 Intel Corporation
+ */
+
+#ifndef _XE_GT_SRIOV_PF_DEBUGFS_H_
+#define _XE_GT_SRIOV_PF_DEBUGFS_H_
+
+struct xe_gt;
+struct dentry;
+
+#ifdef CONFIG_PCI_IOV
+void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root);
+#else
+static inline void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root) { }
+#endif
+
+#endif
-- 
2.43.0

