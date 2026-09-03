Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980D9C624D6
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:01:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559E010F66D;
	Thu,  3 Sep 2026 15:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jy99Qs0E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99CC10F66D
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788447694; x=1819983694;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ubO6LUS+tsLWwcUSy3H+mV9i8w+9M+qI7pDyvLB69Sg=;
 b=jy99Qs0EECs0ZBmgGV1nRdX5kiWOhcx2HsTSb4RsMYdok20zr/sxrSFo
 okkqy8Mzq+Ct76TpZ8eY9CgLxKkb/9WuxnTRVfB0YI+Zwj9isKNMrIVe7
 YbP72JaxRaLl6EO5whnSptPegv3wIeY+4GkMbYZw8Qg36UMUrcHzWnTnT
 eedBpqrtUL0AbVmUdHDW2wY5cwwPq63Z2jjL1YhQT6nzHYca1pnmqQdpg
 rJlFfF8OrHJD+GILEP6CLVfcQJTq4pKS1ARhtBwRUNqb9EljZZU0hHtvl
 2rt8eMqKxgQbViX07gKV4AfnOz1TJHuQZa9sATpthCfCwTDoIMkNlntXX g==;
X-CSE-ConnectionGUID: XHOGCOebQ9CPq6oGptWKqQ==
X-CSE-MsgGUID: YvzkQmtSRA2TOzadxeXhqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="76486828"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="76486828"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:01:25 -0700
X-CSE-ConnectionGUID: hqvYwvrDRrmJYPwF4FZnKw==
X-CSE-MsgGUID: Qt3roH50TkKx8/2GEMjLHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268441175"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:01:20 -0700
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
Subject: [PATCH v10 17/27] drm/xe/eudebug_test: Introduce eudebug live tests
Date: Thu,  3 Sep 2026 17:59:41 +0300
Message-ID: <20260903145952.848051-18-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
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

Introduce a kunit test for eudebug. For now it checks the dynamic
application of WAs.

v2: adapt to removal of call_for_each_device (Mika)
v3: s/FW_RENDER/FORCEWAKE_ALL (Mika)
v4: enforce kunit rules and naming (Michal)
v5: restore hw state if enable error (Sashiko)
    drop XE_MCR_REG def (Claude)
    fail if hw state can't be restored (Claude)

Assisted-by: Claude:claude-opus-4-8
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_eudebug_test.c  | 224 ++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c |   5 +
 drivers/gpu/drm/xe/xe_eudebug.c             |   4 +
 3 files changed, 233 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_eudebug_test.c

diff --git a/drivers/gpu/drm/xe/tests/xe_eudebug_test.c b/drivers/gpu/drm/xe/tests/xe_eudebug_test.c
new file mode 100644
index 000000000000..a207840fdb91
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_eudebug_test.c
@@ -0,0 +1,224 @@
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
+	/*
+	 * XXX ROW_CHICKEN3 is expected set either way, and it is the odd one
+	 * out here: xe_eudebug_init_hw_engine() programs ROW_CHICKEN,
+	 * ROW_CHICKEN2 and TD_CTL, but never ROW_CHICKEN3.
+	 * XE2_EUPEND_CHK_FLUSH_DIS is set by WA 14020338487 in xe_wa.c on all
+	 * Xe2 render and compute engines, with no reference to eudebug, so as
+	 * written this arm asserts that an unrelated workaround is applied.
+	 *
+	 * Pending a check against the hardware documentation on whether
+	 * eupend flush checking has to stay disabled for eudebug.
+	 */
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
+struct eudebug_state_restore {
+	struct xe_device *xe;
+	struct kunit *test;
+	bool enabled;
+};
+
+static void restore_eudebug_state(void *arg)
+{
+	struct eudebug_state_restore *r = arg;
+
+	KUNIT_EXPECT_EQ_MSG(r->test, 0, xe_eudebug_enable(r->xe, r->enabled),
+			    "Failed to restore eudebug to %s\n",
+			    r->enabled ? "enabled" : "disabled");
+}
+
+static void toggle_reg(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	const bool enable_eudebug = xe_eudebug_is_enabled(xe);
+	struct eudebug_state_restore *restore;
+	int ret;
+
+	/* Covers an SR-IOV VF too, xe_eudebug_init() marks one unsupported */
+	if (xe->eudebug.cap_state == XE_EUDEBUG_CAP_NOT_SUPPORTED)
+		kunit_skip(test, "eudebug not supported\n");
+
+	kunit_printk(KERN_DEBUG, test, "Test eudebug WAs for graphics version: %u\n",
+		     GRAPHICS_VERx100(xe));
+
+	check_regs(xe, enable_eudebug, test);
+
+	/* Nothing to restore until the first toggle below */
+	restore = kunit_kzalloc(test, sizeof(*restore), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, restore);
+	restore->xe = xe;
+	restore->test = test;
+	restore->enabled = enable_eudebug;
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, restore_eudebug_state,
+						  restore));
+
+	ret = xe_eudebug_enable(xe, !enable_eudebug);
+	if (ret == -EBUSY)
+		kunit_skip(test, "eudebug toggle busy\n");
+	KUNIT_ASSERT_EQ(test, 0, ret);
+
+	check_regs(xe, !enable_eudebug, test);
+
+	ret = xe_eudebug_enable(xe, enable_eudebug);
+	KUNIT_ASSERT_EQ(test, 0, ret);
+	check_regs(xe, enable_eudebug, test);
+}
+
+static bool xe_eudebug_has_regs(struct xe_device *xe)
+{
+	return GRAPHICS_VERx100(xe) >= 1200;
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
index 87cd7db20e5f..6d92aee38509 100644
--- a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
+++ b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
@@ -25,6 +25,11 @@ kunit_test_suite(xe_guc_g2g_test_suite);
 kunit_test_suite(xe_bo_page_size_alloc_suite);
 #endif
 
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+extern struct kunit_suite xe_eudebug_test_suite;
+kunit_test_suite(xe_eudebug_test_suite);
+#endif
+
 MODULE_AUTHOR("Intel Corporation");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("xe live kunit tests");
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 9cb02024bf51..470246af9810 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -2427,3 +2427,7 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
 
 	return xe_eudebug_connect(xe, file, param);
 }
+
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_eudebug_test.c"
+#endif
-- 
2.53.0

