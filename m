Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C651DC197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 21:55:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931F710E6F7;
	Thu, 16 Nov 2023 21:55:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1560310E6F7
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 21:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700171752; x=1731707752;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8eI+qzosAbOvv0kxYw9KMKOhs3WoHLFF1/Ltft/mDvc=;
 b=ZlcMJLWJ/ovnMmZO4/ZhxEVaqC+kF3GbFAb8w/ZOfPpiceZdICEE92ED
 nX2D/nqFrq65/WnCCBpoKJm072uXUwl3oIp9l1e3HKyu1lb2LIiLQogNd
 CwZnHZd9v3YETCT2cMEWvWA0Q7n5fCxlQiNnuxRAcAKyKkvUAeOr/0voN
 ohdND1oO4OiJPVFnSEnUO8qTnlfVysjRkZFK1DZmJ7qK1JEJDjIfaxcX3
 cTsASrxJgK8MEBnrRt94A2L2NS+NbeduedUFvk7mGI7qWxLrX603omo8M
 tYAQ863x2h9g9wPu+FMDwpO9tvZjtJJJ3QqHUEIEkholJ7TRMq36pSdOd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="381583102"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="381583102"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 13:55:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="13263854"
Received: from ravi-nuc8i7beh.iind.intel.com ([10.145.169.75])
 by orviesa001.jf.intel.com with ESMTP; 16 Nov 2023 13:55:49 -0800
From: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
To: intel-xe@lists.freedesktop.org, janga.rahul.kumar@intel.com,
 ramadevi.gandi@intel.com
Date: Fri, 17 Nov 2023 03:21:52 +0530
Message-Id: <20231116215152.2248859-1-ruthuvikas.ravikumar@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v14] drm/xe: Add mocs kunit
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
Cc: matthew.d.roper@intel.com, ruthuvikas.ravikumar@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This kunit verifies the hardware values of mocs and
l3cc registers with the KMD programmed values.

v14: Fix CHECK.

v13: Remove ret after forcewake.

v11: Add KUNIT_ASSERT_EQ_MSG for Forcewake.

v9/v10: Add Forcewake Fail.

v8: Remove xe_bo.h and xe_pm.h
    Remove mocs and l3cc from live_mocs.
    Pull debug and err msg for mocs/l3cc out of if else block.
    Add HAS_LNCF_MOCS.

v7: correct checkpath

v6: Change ssize_t type.
    Change forcewake domain to XE_FW_GT.
    Update change of MOCS registers are multicast on Xe_HP and beyond
    patch.

v5: Release forcewake.
    Remove single statement braces.
    Fix debug statements.

v4: Drop stratch and vaddr.
    Fix debug statements.
    Fix indentation.

v3: Fix checkpath.

v2: Fix checkpath.

Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mathew D Roper <matthew.d.roper@intel.com>
Reviewed-by: Mathew D Roper <matthew.d.roper@intel.com>
Signed-off-by: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
---
 drivers/gpu/drm/xe/tests/Makefile       |   1 +
 drivers/gpu/drm/xe/tests/xe_mocs.c      | 130 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_mocs_test.c |  24 +++++
 drivers/gpu/drm/xe/tests/xe_mocs_test.h |  13 +++
 drivers/gpu/drm/xe/xe_mocs.c            |   4 +
 5 files changed, 172 insertions(+)
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
index 000000000000..7dd34f94e809
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -0,0 +1,130 @@
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
+#include "xe_gt.h"
+#include "xe_mocs.h"
+#include "xe_device.h"
+
+struct live_mocs {
+	struct xe_mocs_info table;
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
+	return flags;
+}
+
+static void read_l3cc_table(struct xe_gt *gt,
+			    const struct xe_mocs_info *info)
+{
+	unsigned int i;
+	u32 l3cc;
+	u32 reg_val;
+	u32 ret;
+
+	struct kunit *test = xe_cur_kunit();
+
+	xe_device_mem_access_get(gt_to_xe(gt));
+	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
+	mocs_dbg(&gt_to_xe(gt)->drm, "L3CC entries:%d\n", info->n_entries);
+	for (i = 0;
+	     i < (info->n_entries + 1) / 2 ?
+	     (l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
+				  get_entry_l3cc(info, 2 * i + 1))), 1 : 0;
+	     i++) {
+		if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250)
+			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
+		else
+			reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
+		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x 0x%x\n", i,
+			 XELP_LNCFCMOCS(i).addr, reg_val, l3cc);
+		if (reg_val != l3cc)
+			KUNIT_FAIL(test, "l3cc reg 0x%x has incorrect val.\n",
+				   XELP_LNCFCMOCS(i).addr);
+	}
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_device_mem_access_put(gt_to_xe(gt));
+}
+
+static void read_mocs_table(struct xe_gt *gt,
+			    const struct xe_mocs_info *info)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	unsigned int i;
+	u32 mocs;
+	u32 reg_val;
+	u32 ret;
+
+	struct kunit *test = xe_cur_kunit();
+
+	xe_device_mem_access_get(gt_to_xe(gt));
+	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
+	mocs_dbg(&gt_to_xe(gt)->drm, "Global MOCS entries:%d\n", info->n_entries);
+	drm_WARN_ONCE(&xe->drm, !info->unused_entries_index,
+		      "Unused entries index should have been defined\n");
+	for (i = 0;
+	     i < info->n_entries ? (mocs = get_entry_control(info, i)), 1 : 0;
+	     i++) {
+		if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250)
+			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
+		else
+			reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
+		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x 0x%x\n", i,
+			 XELP_GLOBAL_MOCS(i).addr, reg_val, mocs);
+		if (reg_val != mocs)
+			KUNIT_FAIL(test, "mocs reg 0x%x has incorrect val.\n",
+				   XELP_GLOBAL_MOCS(i).addr);
+	}
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
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
+			read_mocs_table(gt, &mocs.table);
+		if (flags & HAS_LNCF_MOCS)
+			read_l3cc_table(gt, &mocs.table);
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
index 46e999257862..409f21b72761 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -588,3 +588,7 @@ void xe_mocs_init(struct xe_gt *gt)
 	if (flags & HAS_LNCF_MOCS)
 		init_l3cc_table(gt, &table);
 }
+
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_mocs.c"
+#endif
-- 
2.25.1

