Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD41C531FC
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 11:50:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7F910E046;
	Fri, 24 Jul 2026 11:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XvttsPnp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842A510F38C
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 11:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784893794; x=1816429794;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PTshEy8h+8vjnm3DpspldzuTxSE8JKTeBA3RnPOvYIU=;
 b=XvttsPnp5dnSD3/XGjt9P9oQQlBPxqIMJifZnZBE6474MNCGp/r7HPgj
 BxRMZ+2YrmpCRR07OZUf0XpAYGMdOqdPLR6jBEzB8MSf2G5D8Bvc1gGHh
 q79ZjTJ0qlA0y69BYO+lFhOO1LY9E+vsoxHcplwh2ummugzGNpgRAzBoT
 ruCM7r1OxhC1L22s1F74XAxpEXA0Wsb6F6WSquQMwxdozW4Xh0Xi2+JZJ
 5gkH6UhYn5ipVhfhOyD4pi/2gehOftV2xhPVRGfWECCJO+8zCdApUJIRl
 ow0EFjG8/wYUBNhQ56hmD0PzZUMbydMGnF5UhxipFiG7OqYkIrpJ+gxd3 w==;
X-CSE-ConnectionGUID: SvFYyLDETFCChSEA4bshNA==
X-CSE-MsgGUID: BhXd9uAQRsutxVOq+gj5BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="89385156"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="89385156"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 04:49:53 -0700
X-CSE-ConnectionGUID: Y/efcuZAT0KOi0Pjs+MHgQ==
X-CSE-MsgGUID: PV5riO9xRpG6eYZFtDxdbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="296909386"
Received: from gsd-build.iind.intel.com ([10.190.229.141])
 by orviesa001.jf.intel.com with ESMTP; 24 Jul 2026 04:49:52 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 4/4] drm/xe/tests: Add KUnit tests for VF provisioning
 error handling
Date: Fri, 24 Jul 2026 11:49:39 +0000
Message-ID: <20260724114939.1560743-10-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724114939.1560743-6-satyanarayana.k.v.p@intel.com>
References: <20260724114939.1560743-6-satyanarayana.k.v.p@intel.com>
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

VF relies on the PF to provide a valid hardware configuration via GuC
KLV responses. In unlikely event of PF malfunction or misconfiguration,
a VF may receive incomplete, zero, or out-of-range values for its
submission contexts, doorbells, VRAM or GGTT assignment.

Add KUnit test cases that use the guc_action_query_single_klv32() and
guc_action_query_single_klv64()static stubs to inject bad KLV responses
and verify that VF can survive without crashing for the invalid
configuration data received.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
V2 -> V3:
- Renamed the test names. (Michal W).
- Fixed review comments (Michal W).

V1 -> V2:
- Renamed the test file (Michal W).
- Fixed review comments (Michal W).
---
 .../gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c   | 213 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |   4 +
 2 files changed, 217 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
new file mode 100644
index 000000000000..abc2dcd6f0c3
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include "regs/xe_guc_regs.h"
+#include "xe_device.h"
+#include "xe_kunit_helpers.h"
+#include "xe_pci_test.h"
+#include "xe_vram_types.h"
+
+#define TEST_VRAM		SZ_8G
+#define TEST_GGTT_SIZE		SZ_2G
+#define TEST_CTXS		1024
+#define TEST_DBS		128
+#define TEST_GGTT_START	0xdeadbeef00aa00ccull
+
+struct config {
+	u32 orig;
+	u32 query;
+	int expected_ret;
+	const char *name;
+} vf_ctx_testcase[] = {
+	{0,		0,			-ENODATA,	"none",		},
+	{0,		GUC_ID_MAX + 1,		-EPROTO,	"overflow",	},
+	{TEST_CTXS,	0,			-EREMCHG,	"lost",		},
+	{TEST_CTXS,	TEST_CTXS / 2,		-EREMCHG,	"reduced",	},
+	{TEST_CTXS,	TEST_CTXS * 2,		-EREMCHG,	"increased",	},
+}, vf_db_testcase[] = {
+	{0,		0,			-ENODATA,	"none",		},
+	{0,		GUC_NUM_DOORBELLS,	-EPROTO,	"overflow",	},
+	{TEST_DBS,	0,			-EREMCHG,	"lost",		},
+	{TEST_DBS,	TEST_DBS / 2,		-EREMCHG,	"reduced",	},
+	{TEST_DBS,	GUC_NUM_DOORBELLS - 1,	-EREMCHG,	"increased",	},
+};
+
+struct config_vram {
+	u64 orig;
+	u64 query;
+	int expected_ret;
+	const char *name;
+} vf_vram_testcase[] = {
+	{0,		0,			-ENODATA,	"none",		},
+	{TEST_VRAM / 2,	TEST_VRAM + SZ_1G,	-EREMCHG,	"overflow",	},
+	{TEST_VRAM / 2,	0,			-EREMCHG,	"lost",		},
+	{TEST_VRAM / 2,	TEST_VRAM / 4,		-EREMCHG,	"reduced",	},
+	{TEST_VRAM / 2,	TEST_VRAM,		-EREMCHG,	"increased",	},
+};
+
+struct config_ggtt {
+	u64 start_orig;
+	u64 start_query;
+	u64 size_orig;
+	u64 size_query;
+	int expected_ret;
+	const char *name;
+} vf_ggtt_testcase[] = {
+	{0,			0,			0,
+		0,			-ENODATA,	"none",		},
+	{TEST_GGTT_START,	TEST_GGTT_START,	TEST_GGTT_SIZE,
+		TEST_GGTT_SIZE + SZ_1G, -EREMCHG,	"overflow",	},
+	{TEST_GGTT_START,	TEST_GGTT_START,	TEST_GGTT_SIZE,
+		0,			-ENODATA,	"lost",		},
+	{TEST_GGTT_START,	TEST_GGTT_START,	TEST_GGTT_SIZE,
+		TEST_GGTT_SIZE - SZ_1M,	-EREMCHG,	"reduced",	},
+	{TEST_GGTT_START,	TEST_GGTT_START,	TEST_GGTT_SIZE,
+		TEST_GGTT_SIZE + SZ_1M,	-EREMCHG,	"increased",	},
+};
+
+static void vf_testcase_desc(struct config *c, char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s", c->name);
+}
+
+static void vf_testcase_vram_desc(struct config_vram *c, char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s", c->name);
+}
+
+static void vf_testcase_ggtt_desc(struct config_ggtt *c, char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s", c->name);
+}
+
+KUNIT_ARRAY_PARAM(vf_ctx_testcase, vf_ctx_testcase, vf_testcase_desc);
+KUNIT_ARRAY_PARAM(vf_db_testcase, vf_db_testcase, vf_testcase_desc);
+KUNIT_ARRAY_PARAM(vf_vram_testcase, vf_vram_testcase, vf_testcase_vram_desc);
+KUNIT_ARRAY_PARAM(vf_ggtt_testcase, vf_ggtt_testcase, vf_testcase_ggtt_desc);
+
+static int guc_action_query_single_klv32_stub(struct xe_guc *guc, u32 key, u32 *value)
+{
+	struct kunit *test = kunit_get_current_test();
+	const struct config *c = test->param_value;
+
+	*value = c->query;
+	return 0;
+}
+
+static void test_ctx_config(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	const struct config *c = test->param_value;
+
+	kunit_activate_static_stub(test, guc_action_query_single_klv32,
+				   guc_action_query_single_klv32_stub);
+
+	gt->sriov.vf.self_config.num_ctxs = c->orig;
+	KUNIT_EXPECT_EQ(test, vf_get_ctx_submission_cfg(gt), c->expected_ret);
+}
+
+static void test_db_config(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	const struct config *c = test->param_value;
+
+	kunit_activate_static_stub(test, guc_action_query_single_klv32,
+				   guc_action_query_single_klv32_stub);
+
+	gt->sriov.vf.self_config.num_dbs = c->orig;
+	KUNIT_EXPECT_EQ(test, vf_get_db_submission_cfg(gt), c->expected_ret);
+}
+
+static int guc_action_query_single_klv64_vram_stub(struct xe_guc *guc, u32 key, u64 *value)
+{
+	struct kunit *test = kunit_get_current_test();
+	const struct config_vram *c = test->param_value;
+
+	*value = c->query;
+	return 0;
+}
+
+static void test_vram_config(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	struct xe_device *xe = gt_to_xe(gt);
+	const struct config_vram *c = test->param_value;
+
+	kunit_activate_static_stub(test, guc_action_query_single_klv64,
+				   guc_action_query_single_klv64_vram_stub);
+
+	xe->tiles[0].sriov.vf.self_config.lmem_size = c->orig;
+	KUNIT_EXPECT_EQ(test, vf_get_lmem_info(gt), c->expected_ret);
+}
+
+static int guc_action_query_single_klv64_ggtt_stub(struct xe_guc *guc, u32 key, u64 *value)
+{
+	struct kunit *test = kunit_get_current_test();
+	const struct config_ggtt *c = test->param_value;
+
+	if (key == GUC_KLV_VF_CFG_GGTT_START_KEY)
+		*value = c->start_query;
+	else if (key == GUC_KLV_VF_CFG_GGTT_SIZE_KEY)
+		*value = c->size_query;
+
+	return 0;
+}
+
+static void test_ggtt_size_config(struct kunit *test)
+{
+	const struct config_ggtt *c = test->param_value;
+	struct xe_gt *gt = test->priv;
+	struct xe_device *xe = gt_to_xe(gt);
+
+	kunit_activate_static_stub(test, guc_action_query_single_klv64,
+				   guc_action_query_single_klv64_ggtt_stub);
+
+	xe->tiles[0].sriov.vf.self_config.ggtt_base = c->start_orig;
+	xe->tiles[0].sriov.vf.self_config.ggtt_size = c->size_orig;
+	KUNIT_EXPECT_EQ(test, vf_get_ggtt_info(gt), c->expected_ret);
+}
+
+static int vf_gt_config_test_init(struct kunit *test)
+{
+	struct xe_pci_fake_data fake = {
+		.sriov_mode = XE_SRIOV_MODE_VF,
+		.platform = XE_BATTLEMAGE, /* any random DGFX platform with SR-IOV */
+		.subplatform = XE_SUBPLATFORM_NONE,
+		.graphics_verx100 = 2001,
+	};
+	struct xe_device *xe;
+	struct xe_gt *gt;
+
+	test->priv = &fake;
+	xe_kunit_helper_xe_device_test_init(test);
+
+	xe = test->priv;
+	KUNIT_ASSERT_TRUE(test, IS_SRIOV_VF(xe));
+
+	gt = xe_root_mmio_gt(xe);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
+	test->priv = gt;
+
+	KUNIT_ASSERT_TRUE(test, IS_DGFX(xe));
+	return 0;
+}
+
+static struct kunit_case vf_gt_config_test_cases[] = {
+	KUNIT_CASE_PARAM(test_ctx_config, vf_ctx_testcase_gen_params),
+	KUNIT_CASE_PARAM(test_db_config, vf_db_testcase_gen_params),
+	KUNIT_CASE_PARAM(test_vram_config, vf_vram_testcase_gen_params),
+	KUNIT_CASE_PARAM(test_ggtt_size_config, vf_ggtt_testcase_gen_params),
+	{}
+};
+
+static struct kunit_suite vf_gt_config_suite = {
+	.name = "vf_gt_config",
+	.test_cases = vf_gt_config_test_cases,
+	.init = vf_gt_config_test_init,
+};
+
+kunit_test_suite(vf_gt_config_suite);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 07f749bad271..b9786eab5c2b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1665,3 +1665,7 @@ int xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
 
 	return atomic_read(&gt->sriov.vf.migration.fixups_complete_count);
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_gt_sriov_vf_kunit.c"
+#endif
-- 
2.43.0

