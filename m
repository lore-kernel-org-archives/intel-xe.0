Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E30CD6E79
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:18:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E819710F6C0;
	Mon,  8 Jun 2026 16:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eaMmsF6V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2AFF10F6C0
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780935509; x=1812471509;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K93gZBRAWQzSor3dhdmWZQQ/uDKufj25tFXwB6T0Tus=;
 b=eaMmsF6V3NPOry5HrxEm1mYeOLQBXfbWNI1FQ8+ZwTwmqEJSZ+kFTJfj
 RY+4KnvYStJccBYpWo/+ROCBHzqO+VuXZ3BDBblBPpSBKgibcxBDWp3Ue
 MHIRZ1RxPjTrR7O2H/pXksHSuDUGRliFHHHBzxbWfpPjfG9GtK3vDq/gL
 qI5sf4VGR5LYFJPplSMib3qzR4PSgHNbkViFXvX1cPxwNXHJzEGw1BV5h
 C4lTn3YG1dGCDrB+mbpZeDjG8EkX2IYdpDBgQQpoqHolVjpeT3bvcSyLv
 cec1FZtigiCmjB2ro3pVVsWohJ3aRSA4D7UHU9JO5U059smqq/C8xwUsp g==;
X-CSE-ConnectionGUID: VVVexLvOQwugqkkuZBbCTA==
X-CSE-MsgGUID: G74PufM9TJuPvyYOwFkCPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="85532024"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="85532024"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:18:28 -0700
X-CSE-ConnectionGUID: NQvzbIpIRMmSMbbWJ0I6DA==
X-CSE-MsgGUID: HTMBShaRRxmzqSXWdxM2Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="247459059"
Received: from ikozitz-mobl3.ger.corp.intel.com (HELO mkuoppal-desk.intel.com)
 ([10.245.251.97])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:18:23 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 16/18] drm/xe/eudebug_test: Introduce eudebug live tests
Date: Mon,  8 Jun 2026 19:16:34 +0300
Message-ID: <20260608161639.1652127-17-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608161639.1652127-1-mika.kuoppala@linux.intel.com>
References: <20260608161639.1652127-1-mika.kuoppala@linux.intel.com>
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
v4: enforce kunit rules and naming (Michal)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_eudebug_test.c  | 195 ++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c |   5 +
 drivers/gpu/drm/xe/xe_eudebug.c             |   4 +
 3 files changed, 204 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_eudebug_test.c

diff --git a/drivers/gpu/drm/xe/tests/xe_eudebug_test.c b/drivers/gpu/drm/xe/tests/xe_eudebug_test.c
new file mode 100644
index 000000000000..c7c1ce3e0a26
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_eudebug_test.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <kunit/visibility.h>
+
+#include "regs/xe_gt_regs.h"
+#include "xe_force_wake.h"
+#include "xe_gt_mcr.h"
+#include "xe_mmio.h"
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
+static u32 get_reg_mask(struct xe_device *xe, struct xe_reg reg, struct kunit *test)
+{
+	u32 val = 0;
+
+	if (reg.raw == TD_CTL.__reg.raw) {
+		val = TD_CTL_BREAKPOINT_ENABLE |
+		      TD_CTL_FORCE_THREAD_BREAKPOINT_ENABLE |
+		      TD_CTL_FEH_AND_FEE_ENABLE;
+		if (GRAPHICS_VERx100(xe) >= 1250)
+			val |= TD_CTL_GLOBAL_DEBUG_ENABLE;
+	} else if (reg.raw == ROW_CHICKEN.__reg.raw) {
+		val = STALL_DOP_GATING_DISABLE;
+	} else if (reg.raw == ROW_CHICKEN2.__reg.raw) {
+		val = XEHPC_DISABLE_BTB;
+	} else if (reg.raw == ROW_CHICKEN3.__reg.raw) {
+		val = XE2_EUPEND_CHK_FLUSH_DIS;
+	} else {
+		KUNIT_FAIL(test, "Invalid register selection: 0x%x\n", reg.raw);
+	}
+
+	return val;
+}
+
+static u32 get_reg_expected(struct xe_device *xe, struct xe_reg reg,
+			    bool enable_eudebug, struct kunit *test)
+{
+	const u32 reg_mask = get_reg_mask(xe, reg, test);
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
+static void check_reg(struct xe_gt *gt, bool enable_eudebug,
+		      struct xe_reg reg, struct kunit *test)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	const u32 reg_bits_expected = get_reg_expected(xe, reg, enable_eudebug, test);
+	const u32 reg_mask = get_reg_mask(xe, reg, test);
+	u32 reg_bits = 0;
+
+	if (reg.mcr)
+		reg_bits = xe_gt_mcr_unicast_read_any(gt, (struct xe_reg_mcr){.__reg = reg});
+	else
+		reg_bits = xe_mmio_read32(&gt->mmio, reg);
+
+	reg_bits &= reg_mask;
+
+	KUNIT_EXPECT_EQ_MSG(test, reg_bits_expected, reg_bits,
+			    "Invalid bits set for %s\n", reg_to_str(reg));
+}
+
+static void __check_regs(struct xe_gt *gt, bool enable_eudebug, struct kunit *test)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (GRAPHICS_VERx100(xe) >= 1200)
+		check_reg(gt, enable_eudebug, TD_CTL.__reg, test);
+
+	if (GRAPHICS_VERx100(xe) >= 1250 && GRAPHICS_VERx100(xe) <= 1274)
+		check_reg(gt, enable_eudebug, ROW_CHICKEN.__reg, test);
+
+	if (xe->info.platform == XE_PVC)
+		check_reg(gt, enable_eudebug, ROW_CHICKEN2.__reg, test);
+
+	if (GRAPHICS_VERx100(xe) >= 2000 && GRAPHICS_VERx100(xe) <= 2004)
+		check_reg(gt, enable_eudebug, ROW_CHICKEN3.__reg, test);
+}
+
+static void check_regs(struct xe_device *xe, bool enable_eudebug, struct kunit *test)
+{
+	struct xe_gt *gt;
+	unsigned int fw_ref;
+	u8 id;
+
+	kunit_printk(KERN_DEBUG, test, "Check regs for eudebug %s\n",
+		     enable_eudebug ? "enabled" : "disabled");
+
+	for_each_gt(gt, xe, id) {
+		if (xe_gt_is_media_type(gt))
+			continue;
+
+		/* XXX: Figure out per platform proper domain */
+		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+		KUNIT_ASSERT_TRUE_MSG(test, fw_ref, "Forcewake failed.\n");
+
+		__check_regs(gt, enable_eudebug, test);
+
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	}
+}
+
+static int toggle_reg_value(struct xe_device *xe, struct kunit *test)
+{
+	const bool enable_eudebug = xe_eudebug_is_enabled(xe);
+
+	kunit_printk(KERN_DEBUG, test, "Test eudebug WAs for graphics version: %u\n",
+		     GRAPHICS_VERx100(xe));
+
+	check_regs(xe, enable_eudebug, test);
+
+	xe_eudebug_enable(xe, !enable_eudebug);
+	check_regs(xe, !enable_eudebug, test);
+
+	xe_eudebug_enable(xe, enable_eudebug);
+	check_regs(xe, enable_eudebug, test);
+
+	return 0;
+}
+
+static void toggle_reg(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+
+	toggle_reg_value(xe, test);
+}
+
+static bool xe_eudebug_has_regs(struct xe_device *xe)
+{
+	u32 ver = GRAPHICS_VERx100(xe);
+
+	return ver >= 1200 ||
+	       (ver >= 1250 && ver <= 1274) ||
+	       xe->info.platform == XE_PVC ||
+	       (ver >= 2000 && ver <= 2004);
+}
+
+static int xe_eudebug_test_init(struct kunit *test)
+{
+	struct xe_device *xe;
+	int ret;
+
+	ret = xe_kunit_helper_xe_device_live_test_init(test);
+	if (ret)
+		return ret;
+
+	xe = test->priv;
+	kunit_info(test, "running on graphics version: %u\n", GRAPHICS_VERx100(xe));
+
+	if (!xe_eudebug_has_regs(xe))
+		kunit_skip(test, "hardware not supported: 0x%x\n", GRAPHICS_VERx100(xe));
+
+	return 0;
+}
+
+static struct kunit_case xe_eudebug_tests[] = {
+	KUNIT_CASE_PARAM(toggle_reg, xe_pci_live_device_gen_param),
+	{}
+};
+
+VISIBLE_IF_KUNIT
+struct kunit_suite xe_eudebug_test_suite = {
+	.name = "xe_eudebug",
+	.test_cases = xe_eudebug_tests,
+	.init = xe_eudebug_test_init,
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
index a0489bec2457..a4f80a73c305 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -2322,3 +2322,7 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
 
 	return xe_eudebug_connect(xe, file, param);
 }
+
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_eudebug_test.c"
+#endif
-- 
2.43.0

