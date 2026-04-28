Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA8DFF8874
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 14:27:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5965610ECA6;
	Tue, 28 Apr 2026 14:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pg8560Lv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03BA10EBDB
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 14:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777386474; x=1808922474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FRvmfRraeOdrPDnPhnAS5nGT4i3HEfdJnoZavIFUTzQ=;
 b=Pg8560LvzNMPTqRn1cBJT9ndStMdS71JqeI+pqHntdqiqONcsJ8Pbf/U
 qvbv7WRTHwOnMy9LdXobwMfNmJlChr0KcXFY+0x0BT8QR9vGSTfZqduuP
 IbBwIss/M4ey/Gpb8crtIpPjqWgBiNv76tsQ68Wqntnq0dWTfzKT1iF0p
 3uLvzDPONO6+ZZZLAsAPCOQdYbq4cWKJXNq63YC1vQljM+tEmNpbMVLJq
 q+FsaK4TsjURq2XK8B+7aNGwym2ugcgVVCCOgP2oDbXBaCyrCGSzZPQYm
 wxvPz2gprK71+xcoRJAFWcTH+VpoWFiASPOTVsWmlaL/3lQOsiXBckQr3 Q==;
X-CSE-ConnectionGUID: HJvn5UToTwSv/IcDslowrA==
X-CSE-MsgGUID: 431OgRYSTLmJYmT1teeiXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95862345"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="95862345"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:27:54 -0700
X-CSE-ConnectionGUID: muQubJKxSmySY8YJkdBu6Q==
X-CSE-MsgGUID: rgaBqzMURjKGCrRQIRIXXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="238942446"
Received: from orenpaz-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.20.98])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:27:52 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 13/13] drm/xe/tests: Add kunit tests for memory based
 interrupts
Date: Tue, 28 Apr 2026 16:27:20 +0200
Message-ID: <20260428142722.582-14-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260428142722.582-1-michal.wajdeczko@intel.com>
References: <20260428142722.582-1-michal.wajdeczko@intel.com>
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

Add basic kunit tests for the memory based interrupts. For maximum
coverage, we will use non-real device definition with custom mix of
GT IPs that are defined with the largest number of engines.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_memirq_kunit.c | 276 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_memirq.c             |   4 +
 2 files changed, 280 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_memirq_kunit.c

diff --git a/drivers/gpu/drm/xe/tests/xe_memirq_kunit.c b/drivers/gpu/drm/xe/tests/xe_memirq_kunit.c
new file mode 100644
index 000000000000..c60b8fb1edc9
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_memirq_kunit.c
@@ -0,0 +1,276 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <kunit/static_stub.h>
+#include <kunit/test.h>
+#include <kunit/test-bug.h>
+
+#include "xe_device.h"
+#include "xe_hw_engine.h"
+#include "xe_kunit_helpers.h"
+#include "xe_pci_test.h"
+#include "xe_uc_fw.h"
+
+static int __memirq_test_init(struct kunit *test, bool msix)
+{
+	struct xe_pci_fake_data fake = {
+		.sriov_mode = XE_SRIOV_MODE_VF,
+		.platform = XE_PANTHERLAKE, /* platform known to use memirq */
+		.subplatform = XE_SUBPLATFORM_NONE,
+		.graphics_verx100 = msix ? 3511 : 3000, /* either all BCS/CCS or RCS */
+		.media_verx100 = 3000,
+		.ggtt_start = SZ_1M,
+		.ggtt_size = SZ_64K,
+		.mmio_read = ~0, /* to cheat fuse readings */
+	};
+	struct xe_memirq *memirq;
+	struct xe_device *xe;
+	struct xe_gt *gt;
+	int id;
+
+	test->priv = &fake;
+	xe_kunit_helper_xe_device_test_init(test);
+
+	xe = test->priv;
+	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
+
+	/* sufficient to claim MSI-X support */
+	xe->irq.msix.nvec = msix ? 2 : 0;
+	KUNIT_EXPECT_EQ(test, msix, xe_device_has_msix(xe));
+
+	for_each_gt(gt, xe, id) {
+		xe_uc_fw_change_status(&gt->uc.gsc.fw, XE_UC_FIRMWARE_NOT_SUPPORTED);
+		xe_hw_engines_init_early(gt);
+	}
+
+	memirq = &xe_device_get_root_tile(xe)->memirq;
+	KUNIT_ASSERT_EQ(test, xe_memirq_init(memirq), 0);
+	KUNIT_EXPECT_TRUE(test, memirq->bo);
+	KUNIT_EXPECT_NE(test, xe_bo_ggtt_addr(memirq->bo), 0);
+
+	test->priv = memirq;
+	return 0;
+}
+
+static int memirq_test_init(struct kunit *test)
+{
+	return __memirq_test_init(test, false);
+}
+
+static int memirq_msix_test_init(struct kunit *test)
+{
+	return __memirq_test_init(test, true);
+}
+
+static u32 source_byte_offset(struct xe_memirq *memirq, u16 source, u16 instance)
+{
+	return memirq_source_page_offset(memirq, instance) + source;
+}
+
+static void set_source(struct xe_memirq *memirq, u16 source, u16 instance)
+{
+	iosys_map_wr(&memirq->bo->vmap,
+		     source_byte_offset(memirq, source, instance), u8, 0xFF);
+}
+
+static void set_status(struct xe_memirq *memirq, u16 source, u16 instance, u16 status)
+{
+	iosys_map_wr(&memirq->bo->vmap,
+		     memirq_status_vector_offset(memirq, source, instance) + status, u8, 0xFF);
+}
+
+static bool is_status_cleared(struct xe_memirq *memirq, u16 source, u16 instance, u16 status)
+{
+	struct iosys_map map =
+		IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
+				      memirq_status_vector_offset(memirq, source, instance));
+
+	return !memirq_received_noclear(memirq, &map, status, "kunit");
+}
+
+struct memirq_test_param {
+	const char *name;
+	u16 source;
+	u16 instance;
+	u16 source0;
+	u16 status;
+	u16 iir;
+};
+
+static void replacement_xe_guc_irq_handler(struct xe_guc *guc, const u16 iir)
+{
+	struct kunit *test = kunit_get_current_test();
+	const struct memirq_test_param *p = test->param_value;
+	unsigned int *counter = test->priv;
+
+	*counter += 1;
+	kunit_info(test, "handler %u: IIR %#x\n", *counter, iir);
+
+	KUNIT_EXPECT_EQ(test, p->source == ilog2(INTR_GUC), xe_gt_is_main_type(guc_to_gt(guc)));
+	KUNIT_EXPECT_EQ(test, p->source == ilog2(INTR_MGUC), xe_gt_is_media_type(guc_to_gt(guc)));
+	KUNIT_EXPECT_EQ(test, p->instance, 0);
+	KUNIT_EXPECT_EQ(test, p->iir, iir);
+}
+
+static void test_guc(struct kunit *test)
+{
+	const struct memirq_test_param *p = test->param_value;
+	struct xe_memirq *memirq = test->priv;
+	unsigned int counter = 0;
+
+	test->priv = &counter;
+	kunit_activate_static_stub(test, xe_guc_irq_handler,
+				   replacement_xe_guc_irq_handler);
+
+	set_source(memirq, p->source, 0);
+	set_status(memirq, p->source, 0, p->status);
+	KUNIT_ASSERT_FALSE(test, is_status_cleared(memirq, p->source, p->instance, p->status));
+
+	counter = 0;
+	xe_memirq_handler(memirq);
+	KUNIT_EXPECT_EQ(test, counter, 1);
+	KUNIT_EXPECT_TRUE(test, is_status_cleared(memirq, p->source, p->instance, p->status));
+}
+
+static void replacement_xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
+{
+	struct kunit *test = kunit_get_current_test();
+	const struct memirq_test_param *p = test->param_value;
+	unsigned int *counter = test->priv;
+	u16 source;
+
+	*counter += 1;
+	kunit_info(test, "handler %u: %s IIR %#x\n", *counter, hwe->name, intr_vec);
+
+	source = hw_reports_to_instance_zero(&hwe->gt->tile->memirq) ? p->source0 : p->source;
+
+	KUNIT_EXPECT_EQ(test, source, hwe->irq_offset);
+	KUNIT_EXPECT_EQ(test, p->instance, hwe->instance);
+	KUNIT_EXPECT_EQ(test, p->iir, intr_vec);
+}
+
+static bool has_hwe(struct xe_memirq *memirq, u16 source, u16 instance)
+{
+	struct xe_tile *tile = memirq_to_tile(memirq);
+	struct xe_hw_engine *hwe;
+	unsigned int gid, eid;
+	struct xe_gt *gt;
+
+	for_each_gt_on_tile(gt, tile, gid)
+		for_each_hw_engine(hwe, gt, eid)
+			if (hwe->irq_offset == source &&
+			    hwe->instance == instance)
+				return true;
+	return false;
+}
+
+static void test_hwe(struct kunit *test)
+{
+	const struct memirq_test_param *p = test->param_value;
+	struct xe_memirq *memirq = test->priv;
+	unsigned int counter = 0;
+	u16 source;
+
+	test->priv = &counter;
+	kunit_activate_static_stub(test, xe_hw_engine_handle_irq,
+				   replacement_xe_hw_engine_handle_irq);
+
+	source = hw_reports_to_instance_zero(memirq) ? p->source0 : p->source;
+	if (!has_hwe(memirq, source, p->instance))
+		kunit_skip(test, "engine not available");
+
+	set_source(memirq, source, p->instance);
+	set_status(memirq, source, p->instance, p->status);
+	KUNIT_EXPECT_FALSE(test, is_status_cleared(memirq, source, p->instance, p->status));
+
+	counter = 0;
+	xe_memirq_handler(memirq);
+	KUNIT_EXPECT_EQ(test, counter, 1);
+	KUNIT_EXPECT_TRUE(test, is_status_cleared(memirq, source, p->instance, p->status));
+}
+
+/* small hacks to allow magic macros work */
+#define INTR_rcs(n)	(INTR_RCS0 + BUILD_BUG_ON_ZERO(n))
+#define INTR_bcs(n)	((((n) < 8) ? INTR_BCS(n) : INTR_BCS8) + BUILD_BUG_ON_ZERO((n) > 8))
+
+#define MAKE_MEMIRQ_TEST_PARAM(NAME, SRC, S0, INST, IIR, ...) {	\
+	.name = (NAME),						\
+	.source = ilog2(INTR_##SRC) __VA_ARGS__,		\
+	.source0 = ilog2(INTR_##S0) __VA_ARGS__,		\
+	.instance = (INST),					\
+	.status = ilog2(IIR),					\
+	.iir = (IIR),						\
+}
+
+#define MAKE_MEMIRQ_TEST_PARAM_GUC(GUC, IIR, ...) \
+	MAKE_MEMIRQ_TEST_PARAM(#GUC " " #IIR, GUC, GUC, 0, GUC_INTR_##IIR)
+
+#define MAKE_MEMIRQ_TEST_PARAM_HWE(ENG, INST, IIR, ...) \
+	MAKE_MEMIRQ_TEST_PARAM(#ENG #INST " " #IIR, ENG(INST), ENG(0), (INST), \
+			       GT_##IIR, ##__VA_ARGS__)
+
+static const struct memirq_test_param guc_irqs[] = {
+	MAKE_MEMIRQ_TEST_PARAM_GUC(GUC, GUC2HOST),
+	MAKE_MEMIRQ_TEST_PARAM_GUC(GUC, SW_INT_0),
+	MAKE_MEMIRQ_TEST_PARAM_GUC(MGUC, GUC2HOST),
+	MAKE_MEMIRQ_TEST_PARAM_GUC(MGUC, SW_INT_0),
+};
+
+static const struct memirq_test_param hwe_irqs[] = {
+	MAKE_MEMIRQ_TEST_PARAM_HWE(rcs, 0, MI_USER_INTERRUPT),
+	MAKE_MEMIRQ_TEST_PARAM_HWE(bcs, 0, MI_USER_INTERRUPT),
+	MAKE_MEMIRQ_TEST_PARAM_HWE(bcs, 1, MI_USER_INTERRUPT),
+	MAKE_MEMIRQ_TEST_PARAM_HWE(bcs, 2, MI_USER_INTERRUPT),
+	MAKE_MEMIRQ_TEST_PARAM_HWE(bcs, 3, MI_USER_INTERRUPT),
+	MAKE_MEMIRQ_TEST_PARAM_HWE(bcs, 4, MI_USER_INTERRUPT),
+	MAKE_MEMIRQ_TEST_PARAM_HWE(bcs, 5, MI_USER_INTERRUPT),
+	MAKE_MEMIRQ_TEST_PARAM_HWE(bcs, 6, MI_USER_INTERRUPT),
+	MAKE_MEMIRQ_TEST_PARAM_HWE(bcs, 7, MI_USER_INTERRUPT),
+	MAKE_MEMIRQ_TEST_PARAM_HWE(bcs, 8, MI_USER_INTERRUPT),
+	MAKE_MEMIRQ_TEST_PARAM_HWE(CCS, 0, MI_USER_INTERRUPT),
+	MAKE_MEMIRQ_TEST_PARAM_HWE(CCS, 1, MI_USER_INTERRUPT),
+	MAKE_MEMIRQ_TEST_PARAM_HWE(CCS, 2, MI_USER_INTERRUPT),
+	MAKE_MEMIRQ_TEST_PARAM_HWE(CCS, 3, MI_USER_INTERRUPT),
+	MAKE_MEMIRQ_TEST_PARAM_HWE(VCS, 0, MI_USER_INTERRUPT, +32),
+	MAKE_MEMIRQ_TEST_PARAM_HWE(VCS, 1, MI_USER_INTERRUPT, +32),
+	MAKE_MEMIRQ_TEST_PARAM_HWE(VCS, 2, MI_USER_INTERRUPT, +32),
+	MAKE_MEMIRQ_TEST_PARAM_HWE(VCS, 3, MI_USER_INTERRUPT, +32),
+	MAKE_MEMIRQ_TEST_PARAM_HWE(VCS, 4, MI_USER_INTERRUPT, +32),
+	MAKE_MEMIRQ_TEST_PARAM_HWE(VCS, 5, MI_USER_INTERRUPT, +32),
+	MAKE_MEMIRQ_TEST_PARAM_HWE(VCS, 6, MI_USER_INTERRUPT, +32),
+	MAKE_MEMIRQ_TEST_PARAM_HWE(VCS, 7, MI_USER_INTERRUPT, +32),
+	MAKE_MEMIRQ_TEST_PARAM_HWE(VECS, 0, MI_USER_INTERRUPT, +32),
+	MAKE_MEMIRQ_TEST_PARAM_HWE(VECS, 1, MI_USER_INTERRUPT, +32),
+	MAKE_MEMIRQ_TEST_PARAM_HWE(VECS, 2, MI_USER_INTERRUPT, +32),
+	MAKE_MEMIRQ_TEST_PARAM_HWE(VECS, 3, MI_USER_INTERRUPT, +32),
+};
+
+static void memirq_test_param_get_desc(const struct memirq_test_param *p, char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s", p->name);
+}
+
+KUNIT_ARRAY_PARAM(guc_irqs, guc_irqs, memirq_test_param_get_desc);
+KUNIT_ARRAY_PARAM(hwe_irqs, hwe_irqs, memirq_test_param_get_desc);
+
+static struct kunit_case memirq_test_cases[] = {
+	KUNIT_CASE_PARAM(test_guc, guc_irqs_gen_params),
+	KUNIT_CASE_PARAM(test_hwe, hwe_irqs_gen_params),
+	{}
+};
+
+static struct kunit_suite memirq_suite = {
+	.name = "memirq",
+	.test_cases = memirq_test_cases,
+	.init = memirq_test_init,
+};
+
+static struct kunit_suite memirq_msix_suite = {
+	.name = "memirq_msix",
+	.test_cases = memirq_test_cases,
+	.init = memirq_msix_test_init,
+};
+
+kunit_test_suites(&memirq_suite, &memirq_msix_suite);
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index b6fdefaf9463..918a62a6fdf3 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -600,3 +600,7 @@ void xe_memirq_handler(struct xe_memirq *memirq)
 		memirq_dispatch_guc(memirq, &map, &tile->media_gt->uc.guc);
 	}
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_memirq_kunit.c"
+#endif
-- 
2.47.1

