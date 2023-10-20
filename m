Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E233C001DF
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 17:11:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB9310E055;
	Fri, 20 Oct 2023 17:11:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6144910E055
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 17:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697821871; x=1729357871;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HJhmZ4jHs0QLvWYpjN9BasOas5OvI27TwJGIklseMSI=;
 b=n/5TX9ZpWjlKdi4gSceczIs+JYDu6X9XGABLs8adVpvOK+F3Smje4dT1
 c8o+obAD/X4gk+zJhgbn4vnjAtBoT3gT1hZXntyC4D2xxhZaUR9LmmZaY
 5oQ2UGV250WQxNnwbJJqrmYKLVHQevzefUnJSnf1ny+bNnhz93RWtJVoG
 lyhMxPflriUY9euQ9l73O3rOTcnQTGXiv1NriUANoy+1n3DfbVZdcGC+n
 A1Jd2eU50nzPGipHgeI/cKCsOA2E0ptPn1RvEupSw6AF9SFiBayDjy+KI
 oXcLJa8U+wNF6Xj8MA43wydLSJ7Juj3UQf6Hm7mumL1XtIqSh5TSyrlD0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="385424423"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="385424423"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 10:11:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="5163896"
Received: from ravi-nuc8i7beh.iind.intel.com ([10.145.169.75])
 by orviesa001.jf.intel.com with ESMTP; 20 Oct 2023 10:09:55 -0700
From: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
To: intel-xe@lists.freedesktop.org, janga.rahul.kumar@intel.com,
 ramadevi.gandi@intel.com
Date: Fri, 20 Oct 2023 22:37:58 +0530
Message-Id: <20231020170758.1783024-1-ruthuvikas.ravikumar@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Add mocs kunit
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This kunit verifies the hardware values of mocs and
l3cc registers with the KMD programmed values.

Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mathew D Roper <matthew.d.roper@intel.com>
Signed-off-by: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
---
 drivers/gpu/drm/xe/tests/Makefile       |   1 +
 drivers/gpu/drm/xe/tests/xe_mocs.c      | 142 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_mocs_test.c |  24 ++++
 drivers/gpu/drm/xe/tests/xe_mocs_test.h |  13 +++
 drivers/gpu/drm/xe/xe_mocs.c            |   4 +
 5 files changed, 184 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_mocs.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_mocs_test.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_mocs_test.h

diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
index 51f1a7f017d4..39d8a0892274 100644
--- a/drivers/gpu/drm/xe/tests/Makefile
+++ b/drivers/gpu/drm/xe/tests/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_DRM_XE_KUNIT_TEST) += \
 	xe_bo_test.o \
 	xe_dma_buf_test.o \
 	xe_migrate_test.o \
+	xe_mocs_test.o \
 	xe_pci_test.o \
 	xe_rtp_test.o \
 	xe_wa_test.o
diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
new file mode 100644
index 000000000000..c5d002526da7
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#include <kunit/test.h>
+#include <kunit/visibility.h>
+
+#include "tests/xe_mocs_test.h"
+#include "tests/xe_pci_test.h"
+#include "tests/xe_test.h"
+
+#include "xe_pci.h"
+#include "xe_pm.h"
+#include "xe_gt.h"
+#include "xe_mocs.h"
+#include "xe_bo.h"
+#include "xe_device.h"
+
+struct live_mocs {
+	struct xe_mocs_info table;
+	struct xe_mocs_info *mocs;
+	struct xe_mocs_info *l3cc;
+};
+
+static int live_mocs_init(struct live_mocs *arg, struct xe_gt *gt)
+{
+	unsigned int flags;
+	struct kunit *test = xe_cur_kunit();
+
+	memset(arg, 0, sizeof(*arg));
+
+	flags = get_mocs_settings(gt_to_xe(gt), &arg->table);
+
+	kunit_info(test, "table size %d", arg->table.size);
+	kunit_info(test, "table uc_index %d", arg->table.uc_index);
+	kunit_info(test, "table n_entries %d", arg->table.n_entries);
+
+	if (flags & HAS_GLOBAL_MOCS)
+		arg->mocs = &arg->table;
+
+	arg->l3cc = &arg->table;
+
+	return flags;
+}
+
+static void read_l3cc_table(struct xe_gt *gt, const struct xe_mocs_info *info)
+{
+	unsigned int i;
+	u32 l3cc;
+	u32 reg;
+	ssize_t ret;
+
+	struct kunit *test = xe_cur_kunit();
+
+	xe_device_mem_access_get(gt_to_xe(gt));
+	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (ret)
+		goto out;
+
+	mocs_dbg(&gt_to_xe(gt)->drm, "L3CC entries:%d\n", info->n_entries);
+	for (i = 0; i < (info->n_entries + 1) / 2 ?
+		    (l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
+					 get_entry_l3cc(info, 2 * i + 1))),
+	    1 : 0;
+	     i++) {
+		reg = xe_mmio_read32(gt, LNCFCMOCS(i));
+		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x 0x%x\n", i,
+			 LNCFCMOCS(i).addr, reg, l3cc);
+
+		if (reg != l3cc) {
+			KUNIT_FAIL(test, "l3cc reg 0x%x has incorrect val:\n",
+				   LNCFCMOCS(i).addr);
+		}
+	}
+
+out:
+	xe_device_mem_access_put(gt_to_xe(gt));
+}
+
+static void read_mocs_table(struct xe_gt *gt, const struct xe_mocs_info *info,
+			    u32 addr)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	unsigned int i;
+	u32 mocs;
+	u32 reg_val;
+
+	ssize_t ret;
+
+	struct kunit *test = xe_cur_kunit();
+
+	xe_device_mem_access_get(gt_to_xe(gt));
+	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (ret)
+		goto out;
+
+	mocs_dbg(&gt_to_xe(gt)->drm, "Global MOCS entries:%d\n", info->n_entries);
+	drm_WARN_ONCE(&xe->drm, !info->unused_entries_index,
+		      "Unused entries index should have been defined\n");
+	for (i = 0;
+	     i < info->n_entries ? (mocs = get_entry_control(info, i)), 1 : 0;
+	     i++) {
+		struct xe_reg reg = XE_REG(addr + i * 4);
+
+		reg_val = xe_mmio_read32(gt, reg);
+		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i, reg.addr,
+			 reg_val);
+		if (reg_val != mocs) {
+			KUNIT_FAIL(test, "mocs reg 0x%x has incorrect val:\n",
+				   reg.addr);
+		}
+	}
+out:
+	xe_device_mem_access_put(gt_to_xe(gt));
+}
+
+static int mocs_kernel_test_run_device(struct xe_device *xe)
+{
+	/* Basic check the system is configured with the expected mocs table */
+
+	struct live_mocs mocs;
+	struct xe_gt *gt;
+
+	unsigned int flags;
+	int id;
+
+	for_each_gt(gt, xe, id) {
+		flags = live_mocs_init(&mocs, gt);
+		if (flags & HAS_GLOBAL_MOCS)
+			read_mocs_table(gt, mocs.mocs, GLOBAL_MOCS(0).addr);
+		read_l3cc_table(gt, mocs.l3cc);
+	}
+	return 0;
+}
+
+void xe_live_mocs_kernel_kunit(struct kunit *test)
+{
+	xe_call_for_each_device(mocs_kernel_test_run_device);
+}
+EXPORT_SYMBOL_IF_KUNIT(xe_live_mocs_kernel_kunit);
diff --git a/drivers/gpu/drm/xe/tests/xe_mocs_test.c b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
new file mode 100644
index 000000000000..ef56bd517b28
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#include "xe_mocs_test.h"
+
+#include <kunit/test.h>
+
+static struct kunit_case xe_mocs_tests[] = {
+	KUNIT_CASE(xe_live_mocs_kernel_kunit),
+	{}
+};
+
+static struct kunit_suite xe_mocs_test_suite = {
+	.name = "xe_mocs",
+	.test_cases = xe_mocs_tests,
+};
+
+kunit_test_suite(xe_mocs_test_suite);
+
+MODULE_AUTHOR("Intel Corporation");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
diff --git a/drivers/gpu/drm/xe/tests/xe_mocs_test.h b/drivers/gpu/drm/xe/tests/xe_mocs_test.h
new file mode 100644
index 000000000000..7faa3575e6c3
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_mocs_test.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 AND MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_MOCS_TEST_H_
+#define _XE_MOCS_TEST_H_
+
+struct kunit;
+
+void xe_live_mocs_kernel_kunit(struct kunit *test);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 19a8146ded9a..a73419ea0711 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -579,3 +579,7 @@ void xe_mocs_init(struct xe_gt *gt)
 	if (table.table)
 		init_l3cc_table(gt, &table);
 }
+
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_mocs.c"
+#endif
-- 
2.25.1

