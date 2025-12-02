Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF41D116F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 13:53:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC9C10E657;
	Tue,  2 Dec 2025 13:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lRsnug6B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E7410E659
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 13:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764683632; x=1796219632;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L8C5t3kYcAPhBE+ndMI0PkEfIOH+kW1A3SC3ZBxAv6Q=;
 b=lRsnug6BBNhvYPvQjLC8agAtQn71FRYEdX1hupCwrnN8rpwnXYVy+4XZ
 3Z8mqDfgh/tsnB/0kSKNM7i4ZNrvCHvmon6Ukbl3LwdpFDGEfSoIHf5TP
 jPzPpxaWqxZxAMauJ/JBKnze5XS4/Ldge0KX/YemJ03EBa0CcyVXLLJSa
 9cN7iMIYyjhsYCW8cz8uKC5NzCKVW+/EqOY87oHglli0sdrnUq3frgyY/
 5IOTVG8FeQuvolP1IJm/JxPG8kfTwL7WRkzuTxvcm7j4B4sD61d7jfv6d
 mLLD5pFsxqOBiFNvZA6vUhRfRae56BgKW+gqEX+6r4u6iXbuNdu56Wx7O w==;
X-CSE-ConnectionGUID: qFfwDlRnSNW3zizYEUwJzA==
X-CSE-MsgGUID: Aq2xb2fsRHaeAU7CUXgQuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66537116"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66537116"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:53:51 -0800
X-CSE-ConnectionGUID: EbC43He3QfCN6NBHplvD9w==
X-CSE-MsgGUID: yLucTgFgSxylfbon1bPMWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="199505744"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mkuoppal-desk.lan)
 ([10.245.246.189])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:53:48 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 14/20] drm/xe/eudebug_test: Introduce xe_eudebug wa kunit test
Date: Tue,  2 Dec 2025 15:52:33 +0200
Message-ID: <20251202135241.880267-15-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202135241.880267-1-mika.kuoppala@linux.intel.com>
References: <20251202135241.880267-1-mika.kuoppala@linux.intel.com>
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
v3: s/FW_RENDER/FORCEWAKE_ALL (Mika)

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_eudebug.c       | 183 ++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c |   5 +
 drivers/gpu/drm/xe/xe_eudebug.c             |   4 +
 3 files changed, 192 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_eudebug.c

diff --git a/drivers/gpu/drm/xe/tests/xe_eudebug.c b/drivers/gpu/drm/xe/tests/xe_eudebug.c
new file mode 100644
index 000000000000..f839fb292b9b
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_eudebug.c
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <kunit/visibility.h>
+
+#include "regs/xe_gt_regs.h"
+#include "regs/xe_engine_regs.h"
+
+#include "xe_force_wake.h"
+#include "xe_gt_mcr.h"
+#include "xe_mmio.h"
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
+	unsigned int fw_ref;
+	u8 id;
+
+	kunit_printk(KERN_DEBUG, test, "Check regs for eudebug %s\n",
+		     enable_eudebug ? "enabled" : "disabled");
+
+	xe_pm_runtime_get(xe);
+	for_each_gt(gt, xe, id) {
+		if (xe_gt_is_media_type(gt))
+			continue;
+
+		/* XXX: Figure out per platform proper domain */
+		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+		KUNIT_ASSERT_TRUE_MSG(test, fw_ref, "Forcewake failed.\n");
+
+		__check_regs(gt, enable_eudebug);
+
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	}
+	xe_pm_runtime_put(xe);
+}
+
+static int toggle_reg_value(struct xe_device *xe)
+{
+	struct kunit *test = kunit_get_current_test();
+	bool enable_eudebug = xe_eudebug_is_enabled(xe);
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
index c55e46f1ae92..dc83bb6a892d 100644
--- a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
+++ b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
@@ -19,6 +19,11 @@ kunit_test_suite(xe_migrate_test_suite);
 kunit_test_suite(xe_mocs_test_suite);
 kunit_test_suite(xe_guc_g2g_test_suite);
 
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+extern struct kunit_suite xe_eudebug_test_suite;
+kunit_test_suite(xe_eudebug_test_suite);
+#endif
+
 MODULE_AUTHOR("Intel Corporation");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("xe live kunit tests");
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 97e8a7ccef55..1c1fa02d1bd7 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -2101,3 +2101,7 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
 
 	return xe_eudebug_connect(xe, file, param);
 }
+
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_eudebug.c"
+#endif
-- 
2.43.0

