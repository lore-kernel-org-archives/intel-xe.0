Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53499CEACDD
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 14:54:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CE510E640;
	Tue,  1 Oct 2024 14:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IXUwExE2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7417C10E64D
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 14:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727794438; x=1759330438;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UrFhlPq9yhV/Uv85WRcBmalpAQYhEM+T7/NLaTV7mSg=;
 b=IXUwExE21IikldMiwr3t6OWpRqkdfEV9mh6alh9N4AWHeajpcnhxoYq5
 yuYY9tLe7HKWcF+Te4Oa9lMWARP4xwZHM3NEFxpf6RIP54BBh2S/HId7t
 biwR/qmzj+upOUccpgjjxhmV54W2BaodT3IyLYjgSLrWwvcJ5ImH37Jb5
 GK5OdfcrrM+tHFgSbS0RUSTjtRdyjNPtagLz5wYM8xJGCwls2EK0cwtbV
 J3kFJocfoh+46Jg1aL803EONhZsY/aKf3Apxl0JApEIOz8qGCMDLlEQRK
 dPSDPVzkAX/jI9e0JY9cHaLLhX1o9eYd1bp71LZNeUqhBzKWohFzJDk3y g==;
X-CSE-ConnectionGUID: xvd9OCrSSEmGoKzGm1wsMw==
X-CSE-MsgGUID: U4DwHaI5QbaaPndfiu+CZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27091440"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="27091440"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:53:58 -0700
X-CSE-ConnectionGUID: YOzbXxbTTrevQC1BIQQrHQ==
X-CSE-MsgGUID: H2yo+NSUTduEs9vyZLbKNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="97048795"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:53:57 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Christoph Manszewski <christoph.manszewski@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 18/18] drm/xe/eudebug_test: Introduce xe_eudebug wa kunit test
Date: Tue,  1 Oct 2024 17:43:06 +0300
Message-Id: <20241001144306.1991001-19-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
References: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
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

From: Christoph Manszewski <christoph.manszewski@intel.com>

Introduce kunit test for eudebug. For now it checks the dynamic
application of WAs.

v2: adapt to removal of call_for_each_device (Mika)

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_eudebug.c       | 175 ++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c |   5 +
 drivers/gpu/drm/xe/xe_eudebug.c             |   4 +
 3 files changed, 184 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_eudebug.c

diff --git a/drivers/gpu/drm/xe/tests/xe_eudebug.c b/drivers/gpu/drm/xe/tests/xe_eudebug.c
new file mode 100644
index 000000000000..3e78b6a9d056
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_eudebug.c
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <kunit/visibility.h>
+
+#include "tests/xe_kunit_helpers.h"
+#include "tests/xe_pci_test.h"
+#include "tests/xe_test.h"
+
+#undef XE_REG_MCR
+#define XE_REG_MCR(r_, ...)	((const struct xe_reg_mcr){					\
+				 .__reg = XE_REG_INITIALIZER(r_,  ##__VA_ARGS__, .mcr = 1)	\
+				 })
+
+static const char *reg_to_str(struct xe_reg reg)
+{
+	if (reg.raw == TD_CTL.__reg.raw)
+		return "TD_CTL";
+	else if (reg.raw == CS_DEBUG_MODE2(RENDER_RING_BASE).raw)
+		return "CS_DEBUG_MODE2";
+	else if (reg.raw == ROW_CHICKEN.__reg.raw)
+		return "ROW_CHICKEN";
+	else if (reg.raw == ROW_CHICKEN2.__reg.raw)
+		return "ROW_CHICKEN2";
+	else if (reg.raw == ROW_CHICKEN3.__reg.raw)
+		return "ROW_CHICKEN3";
+	else
+		return "UNKNOWN REG";
+}
+
+static u32 get_reg_mask(struct xe_device *xe, struct xe_reg reg)
+{
+	struct kunit *test = kunit_get_current_test();
+	u32 val = 0;
+
+	if (reg.raw == TD_CTL.__reg.raw) {
+		val = TD_CTL_BREAKPOINT_ENABLE |
+		      TD_CTL_FORCE_THREAD_BREAKPOINT_ENABLE |
+		      TD_CTL_FEH_AND_FEE_ENABLE;
+
+		if (GRAPHICS_VERx100(xe) >= 1250)
+			val |= TD_CTL_GLOBAL_DEBUG_ENABLE;
+
+	} else if (reg.raw == CS_DEBUG_MODE2(RENDER_RING_BASE).raw) {
+		val = GLOBAL_DEBUG_ENABLE;
+	} else if (reg.raw == ROW_CHICKEN.__reg.raw) {
+		val = STALL_DOP_GATING_DISABLE;
+	} else if (reg.raw == ROW_CHICKEN2.__reg.raw) {
+		val = XEHPC_DISABLE_BTB;
+	} else if (reg.raw == ROW_CHICKEN3.__reg.raw) {
+		val = XE2_EUPEND_CHK_FLUSH_DIS;
+	} else {
+		kunit_warn(test, "Invalid register selection: %u\n", reg.raw);
+	}
+
+	return val;
+}
+
+static u32 get_reg_expected(struct xe_device *xe, struct xe_reg reg, bool enable_eudebug)
+{
+	u32 reg_mask = get_reg_mask(xe, reg);
+	u32 reg_bits = 0;
+
+	if (enable_eudebug || reg.raw == ROW_CHICKEN3.__reg.raw)
+		reg_bits = reg_mask;
+	else
+		reg_bits = 0;
+
+	return reg_bits;
+}
+
+static void check_reg(struct xe_gt *gt, bool enable_eudebug, struct xe_reg reg)
+{
+	struct kunit *test = kunit_get_current_test();
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 reg_bits_expected = get_reg_expected(xe, reg, enable_eudebug);
+	u32 reg_mask = get_reg_mask(xe, reg);
+	u32 reg_bits = 0;
+
+	if (reg.mcr)
+		reg_bits = xe_gt_mcr_unicast_read_any(gt, (struct xe_reg_mcr){.__reg = reg});
+	else
+		reg_bits = xe_mmio_read32(&gt->mmio, reg);
+
+	reg_bits &= reg_mask;
+
+	kunit_printk(KERN_DEBUG, test, "%s bits: expected == 0x%x; actual == 0x%x\n",
+		     reg_to_str(reg), reg_bits_expected, reg_bits);
+	KUNIT_EXPECT_EQ_MSG(test, reg_bits_expected, reg_bits,
+			    "Invalid bits set for %s\n", reg_to_str(reg));
+}
+
+static void __check_regs(struct xe_gt *gt, bool enable_eudebug)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (GRAPHICS_VERx100(xe) >= 1200)
+		check_reg(gt, enable_eudebug, TD_CTL.__reg);
+
+	if (GRAPHICS_VERx100(xe) >= 1250 && GRAPHICS_VERx100(xe) <= 1274)
+		check_reg(gt, enable_eudebug, ROW_CHICKEN.__reg);
+
+	if (xe->info.platform == XE_PVC)
+		check_reg(gt, enable_eudebug, ROW_CHICKEN2.__reg);
+
+	if (GRAPHICS_VERx100(xe) >= 2000 && GRAPHICS_VERx100(xe) <= 2004)
+		check_reg(gt, enable_eudebug, ROW_CHICKEN3.__reg);
+}
+
+static void check_regs(struct xe_device *xe, bool enable_eudebug)
+{
+	struct kunit *test = kunit_get_current_test();
+	struct xe_gt *gt;
+	u8 id;
+	int ret = 0;
+
+	kunit_printk(KERN_DEBUG, test, "Check regs for eudebug %s\n",
+		     enable_eudebug ? "enabled" : "disabled");
+
+	xe_pm_runtime_get(xe);
+	for_each_gt(gt, xe, id) {
+		if (xe_gt_is_media_type(gt))
+			continue;
+
+		ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_RENDER);
+		KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake failed.\n");
+
+		__check_regs(gt, enable_eudebug);
+
+		xe_force_wake_put(gt_to_fw(gt), XE_FW_RENDER);
+	}
+	xe_pm_runtime_put(xe);
+}
+
+static int toggle_reg_value(struct xe_device *xe)
+{
+	struct kunit *test = kunit_get_current_test();
+	bool enable_eudebug = xe->eudebug.enable;
+
+	kunit_printk(KERN_DEBUG, test, "Test eudebug WAs for graphics version: %u\n",
+		     GRAPHICS_VERx100(xe));
+
+	check_regs(xe, enable_eudebug);
+
+	xe_eudebug_enable(xe, !enable_eudebug);
+	check_regs(xe, !enable_eudebug);
+
+	xe_eudebug_enable(xe, enable_eudebug);
+	check_regs(xe, enable_eudebug);
+
+	return 0;
+}
+
+static void xe_eudebug_toggle_reg_kunit(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+
+	toggle_reg_value(xe);
+}
+
+static struct kunit_case xe_eudebug_tests[] = {
+	KUNIT_CASE_PARAM(xe_eudebug_toggle_reg_kunit,
+			 xe_pci_live_device_gen_param),
+	{}
+};
+
+VISIBLE_IF_KUNIT
+struct kunit_suite xe_eudebug_test_suite = {
+	.name = "xe_eudebug",
+	.test_cases = xe_eudebug_tests,
+	.init = xe_kunit_helper_xe_device_live_test_init,
+};
+EXPORT_SYMBOL_IF_KUNIT(xe_eudebug_test_suite);
diff --git a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
index 5f14737c8210..7dd8a0a4bdfd 100644
--- a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
+++ b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
@@ -15,6 +15,11 @@ kunit_test_suite(xe_dma_buf_test_suite);
 kunit_test_suite(xe_migrate_test_suite);
 kunit_test_suite(xe_mocs_test_suite);
 
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+extern struct kunit_suite xe_eudebug_test_suite;
+kunit_test_suite(xe_eudebug_test_suite);
+#endif
+
 MODULE_AUTHOR("Intel Corporation");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("xe live kunit tests");
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 6e26245556d4..4d81955d0169 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -3885,3 +3885,7 @@ xe_eudebug_vm_open_ioctl(struct xe_eudebug *d, unsigned long arg)
 
 	return ret;
 }
+
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_eudebug.c"
+#endif
-- 
2.34.1

