Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC04EA4FC2
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 14:04:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E5C10E447;
	Mon, 23 Feb 2026 14:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RKOUa5oi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9F310E447
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 14:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771855483; x=1803391483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1yNvh5CvACpA2RL7OrUik2j0oAoJw9QQYJO2puK4nAk=;
 b=RKOUa5oihZd7xYLgwPcK9lRFzyCNcPWMP3UWGLpXMc6MT9QDhzCWxID+
 h+y1nUsZVZKfSC0AQheA+eV8ZUfPh7Mv7g7WJSrMsNqgj57OJ+Zou/fby
 6z6ZuBtyYVpZauV/Bbim4qmwt4Xufzj/jsZo1coHZkXgRldXS7UyPcIk9
 LZaIwlgZuCjollqPNU1L+ig7ENXw55g3TSsRWSjwSJfyLilF0cu2NdWh7
 DF287tr8Z31nIvIlHxMHZ1Npczj1kUDE3UP1j/x3aXHsqckB/FevlaeOK
 /j41rRwbH4el+taNqJ6l1vw28v8mV/f3FuGuqT1J/d36uxw3kHTyvGIEb g==;
X-CSE-ConnectionGUID: hnQgA1K/RK+YAf4ogzjXxQ==
X-CSE-MsgGUID: RvSAAZ8BShSxwG+7Kij6Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76460943"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="76460943"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:04:43 -0800
X-CSE-ConnectionGUID: qZIkYJtEQPmzho9scnwjLA==
X-CSE-MsgGUID: k4Pmag7pQMaGOVV9hhRIEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="214656434"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.3])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:04:39 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 16/22] drm/xe/eudebug_test: Introduce xe_eudebug wa kunit test
Date: Mon, 23 Feb 2026 16:03:11 +0200
Message-ID: <20260223140318.1822138-17-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223140318.1822138-1-mika.kuoppala@linux.intel.com>
References: <20260223140318.1822138-1-mika.kuoppala@linux.intel.com>
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
index 0c67db86f009..bd1f186f496c 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -2205,3 +2205,7 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
 
 	return xe_eudebug_connect(xe, file, param);
 }
+
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_eudebug.c"
+#endif
-- 
2.43.0

