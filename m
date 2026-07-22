Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03C1C4453C
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 12:33:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 917AC10E446;
	Wed, 22 Jul 2026 12:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WuP5icm2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38BC10ED9B
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 12:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784723633; x=1816259633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=57VuMLDWmXgYNbUYl77pm534qRZ/5VMfyDAqmvAz4I8=;
 b=WuP5icm2sbq3EPeSoUefeFpQmC3yA/r1o6NdmXo3jPGbUfjXSAc6EwHz
 uTg43yWzcd+f0msetCiDtwxCVCaSefWy4scQDvNZpdnfjsX2SdWc9qeTA
 VlV89apXARG/LJYhRPSGZDRHRAm/bdV82ZxMrFOGx5+vgkddYR421Q6e0
 MpjuqqohQRUXAZ0UEeVZzvfQUEve3WdJnJp0a9RrQ69a7iT8ut8ZGVG8O
 RTqUOtoSiB9LXxPTHicUmjuXFQvXxjh5l9mNuryv5g2UHY3TGnjSqZpFh
 ZVCYD6EhkQOh7Uh1KpfhLTlK1V1YThSUqYEIf3UwaM8dYeCff4z7dL7GM g==;
X-CSE-ConnectionGUID: m7zX0nkzSL6BcVklkHBxGw==
X-CSE-MsgGUID: AAK+4QWOQR+f8rX8C0YwzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="96872763"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="96872763"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 05:33:53 -0700
X-CSE-ConnectionGUID: 3ONpNlnpRKqI3vh/hpvQnA==
X-CSE-MsgGUID: H6JGKJboSO+qna3RW/89Aw==
X-ExtLoop1: 1
Received: from gsd-build.iind.intel.com ([10.190.229.141])
 by fmviesa003.fm.intel.com with ESMTP; 22 Jul 2026 05:33:51 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 3/3] drm/xe/tests: Add KUnit tests for VF provisioning
 error handling
Date: Wed, 22 Jul 2026 12:33:44 +0000
Message-ID: <20260722123342.339623-8-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722123342.339623-5-satyanarayana.k.v.p@intel.com>
References: <20260722123342.339623-5-satyanarayana.k.v.p@intel.com>
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
submission contexts, doorbells, LMEM, or GGTT assignment.

Add KUnit test cases that use the guc_action_query_single_klv() static
stub to inject bad KLV responses and verify that VF can return a negative
error code rather than silently accepting the invalid configuration.

The following error scenarios are covered per resource:

  Contexts : zero, less-by-4K, invalid , one, more-by-4K
  Doorbells: zero, less-by-32, invalid , one, more-by-32
  LMEM     : zero, less-by-32M, invalid , one-GB, more-by-1G
  GGTT     : zero size, size-less-by-4K, size-invalid

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

---
V1 -> V2:
- Renamed the test file (Michal W).
- Fixed review comments (Michal W).
---
 .../gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c   | 268 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |   4 +
 2 files changed, 272 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
new file mode 100644
index 000000000000..a5c3b04c97c8
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
@@ -0,0 +1,268 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2025-2026 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include "regs/xe_guc_regs.h"
+#include "xe_device.h"
+#include "xe_kunit_helpers.h"
+#include "xe_pci_test.h"
+#include "xe_vram_types.h"
+#include "xe_sriov_pf_helpers.h"
+
+#define TEST_VRAM       0x80000000ull   /* random size that works on 32-bit */
+#define TEST_GGTT_SIZE  SZ_2G
+
+enum vf_test_case_type {
+	NO_RESOURCE,
+	OVERFLOW_RESOURCE,
+	LOST_RESOURCE,
+	REDUCED_RESOURCE,
+	INCREASED_RESOURCE,
+};
+
+struct config {
+	u32 orig;
+	u32 query;
+	int expected_ret;
+	int type;
+	const char *name;
+} vf_ctx_testcase[] = {
+	{0,		0,		-ENODATA,	NO_RESOURCE,		"none",		},
+	{10,		65536,		-EINVAL,	OVERFLOW_RESOURCE,	"overflow",	},
+	{1024,		0,		-EREMCHG,	LOST_RESOURCE,		"lost",		},
+	{1024,		512,		-EREMCHG,	REDUCED_RESOURCE,	"reduced",	},
+	{1024,		2048,		-EREMCHG,	INCREASED_RESOURCE,	"increased",	},
+}, vf_db_testcase[] = {
+	{0,		0,		-ENODATA,	NO_RESOURCE,		"none",		},
+	{10,		256,		-EINVAL,	OVERFLOW_RESOURCE,	"overflow",	},
+	{128,		0,		-EREMCHG,	LOST_RESOURCE,		"lost",		},
+	{128,		64,		-EREMCHG,	REDUCED_RESOURCE,	"reduced",	},
+	{128,		255,		-EREMCHG,	INCREASED_RESOURCE,	"increased",	},
+}, vf_vram_testcase[] = {
+	{0,		0,		-ENODATA,	NO_RESOURCE,		"none",		},
+	{0,		0x80000000,	-EINVAL,	OVERFLOW_RESOURCE,	"overflow",	},
+	{0x7a800000,	0,		-EREMCHG,	LOST_RESOURCE,		"lost",		},
+	{0x7a800000,	0x78000000,	-EREMCHG,	REDUCED_RESOURCE,	"reduced",	},
+	{0x7a800000,	0x7c800000,	-EREMCHG,	INCREASED_RESOURCE,	"increased",	},
+}, vf_ggtt_size_testcase[] = {
+	{0,		0,		-ENODATA,	NO_RESOURCE,		"none",		},
+	{0,		0x90000000,	-EINVAL,	OVERFLOW_RESOURCE,	"overflow",	},
+	{0x80000000,	0x1000,		-EREMCHG,	LOST_RESOURCE,		"lost",		},
+	{0x80000000,	0x7c000000,	-EREMCHG,	REDUCED_RESOURCE,	"reduced",	},
+	{0x70000000,	0x74000000,	-EREMCHG,	INCREASED_RESOURCE,	"increased",	},
+}, vf_ggtt_start_testcase[] = {
+	{0xdeadbeef,	0,		-ENODATA,	NO_RESOURCE,		"none",		},
+};
+
+static void vf_testcase_desc(struct config *c, char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s", c->name);
+}
+
+KUNIT_ARRAY_PARAM(vf_ctx_testcase, vf_ctx_testcase, vf_testcase_desc);
+KUNIT_ARRAY_PARAM(vf_db_testcase, vf_db_testcase, vf_testcase_desc);
+KUNIT_ARRAY_PARAM(vf_vram_testcase, vf_vram_testcase, vf_testcase_desc);
+KUNIT_ARRAY_PARAM(vf_ggtt_size_testcase, vf_ggtt_size_testcase, vf_testcase_desc);
+KUNIT_ARRAY_PARAM(vf_ggtt_start_testcase, vf_ggtt_start_testcase, vf_testcase_desc);
+
+static int guc_action_query_single_klv_stub_ctx(struct xe_guc *guc, u32 key,
+						u32 *value, u32 value_len)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	const struct config *c = kunit_get_current_test()->param_value;
+
+	if (key == GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY) {
+		*value = gt->sriov.vf.self_config.num_dbs;
+		return 0;
+	}
+
+	*value = c->query;
+	if (*value > GUC_ID_MAX)
+		return -EINVAL;
+
+	return 0;
+}
+
+static void ctx_1vf(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	const struct config *c = test->param_value;
+
+	kunit_activate_static_stub(test, guc_action_query_single_klv,
+				   guc_action_query_single_klv_stub_ctx);
+
+	gt->sriov.vf.self_config.num_ctxs = c->orig;
+	gt->sriov.vf.self_config.num_dbs = 128;
+	KUNIT_EXPECT_EQ(test, vf_get_ctx_submission_cfg(gt), c->expected_ret);
+}
+
+static int guc_action_query_single_klv_stub_db(struct xe_guc *guc, u32 key,
+					       u32 *value, u32 value_len)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	const struct config *c = kunit_get_current_test()->param_value;
+
+	if (key == GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY) {
+		*value = gt->sriov.vf.self_config.num_ctxs;
+		return 0;
+	}
+
+	*value = c->query;
+	if (*value >= GUC_NUM_DOORBELLS)
+		return -EINVAL;
+
+	return 0;
+}
+
+static void db_1vf(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	const struct config *c = test->param_value;
+
+	kunit_activate_static_stub(test, guc_action_query_single_klv,
+				   guc_action_query_single_klv_stub_db);
+
+	gt->sriov.vf.self_config.num_dbs = c->orig;
+	gt->sriov.vf.self_config.num_ctxs = SZ_32K;
+	KUNIT_EXPECT_EQ(test, vf_get_db_submission_cfg(gt), c->expected_ret);
+}
+
+static int guc_action_query_single_klv_stub_vram(struct xe_guc *guc, u32 key,
+						 u32 *value, u32 value_len)
+{
+	const struct config *c = kunit_get_current_test()->param_value;
+
+	if (key != GUC_KLV_VF_CFG_LMEM_SIZE_KEY || c->query >= TEST_VRAM)
+		return -EINVAL;
+
+	*value = c->query;
+
+	return 0;
+}
+
+static void vram_1vf(struct kunit *test)
+{
+	const struct config *c = test->param_value;
+	struct xe_gt *gt = test->priv;
+	struct xe_device *xe = gt_to_xe(gt);
+
+	kunit_activate_static_stub(test, guc_action_query_single_klv,
+				   guc_action_query_single_klv_stub_vram);
+
+	xe->tiles[0].sriov.vf.self_config.lmem_size = c->orig;
+	KUNIT_EXPECT_EQ(test, vf_get_lmem_info(gt), c->expected_ret);
+}
+
+static int guc_action_query_single_klv_stub_ggtt_size(struct xe_guc *guc, u32 key,
+						      u32 *value, u32 value_len)
+{
+	struct xe_device *xe = guc_to_xe(guc);
+	const struct config *c = kunit_get_current_test()->param_value;
+
+	if (key == GUC_KLV_VF_CFG_GGTT_START_KEY) {
+		*value = xe->tiles[0].sriov.vf.self_config.ggtt_base;
+		return 0;
+	}
+
+	*value = c->query;
+	if (*value >= TEST_GGTT_SIZE)
+		return -EINVAL;
+
+	return 0;
+}
+
+static void ggtt_size_1vf(struct kunit *test)
+{
+	const struct config *c = test->param_value;
+	struct xe_gt *gt = test->priv;
+	struct xe_device *xe = gt_to_xe(gt);
+
+	kunit_activate_static_stub(test, guc_action_query_single_klv,
+				   guc_action_query_single_klv_stub_ggtt_size);
+
+	xe->tiles[0].sriov.vf.self_config.ggtt_size = c->orig;
+	xe->tiles[0].sriov.vf.self_config.ggtt_base = 0xdeadbeef;
+	KUNIT_EXPECT_EQ(test, vf_get_ggtt_info(gt), c->expected_ret);
+}
+
+static int guc_action_query_single_klv_stub_ggtt_start(struct xe_guc *guc, u32 key,
+						       u32 *value, u32 value_len)
+{
+	struct xe_device *xe = guc_to_xe(guc);
+	const struct config *c = kunit_get_current_test()->param_value;
+
+	if (key == GUC_KLV_VF_CFG_GGTT_SIZE_KEY) {
+		*value = xe->tiles[0].sriov.vf.self_config.ggtt_size;
+		return 0;
+	}
+
+	*value = c->query;
+	if (!(*value))
+		return -ENODATA;
+
+	return 0;
+}
+
+static void ggtt_start_1vf(struct kunit *test)
+{
+	const struct config *c = test->param_value;
+	struct xe_gt *gt = test->priv;
+	struct xe_device *xe = gt_to_xe(gt);
+
+	kunit_activate_static_stub(test, guc_action_query_single_klv,
+				   guc_action_query_single_klv_stub_ggtt_start);
+
+	xe->tiles[0].sriov.vf.self_config.ggtt_base = c->orig;
+	xe->tiles[0].sriov.vf.self_config.ggtt_size = TEST_GGTT_SIZE;
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
+	struct xe_vram_region *vram;
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
+	/* pretend it has some VRAM */
+	KUNIT_ASSERT_TRUE(test, IS_DGFX(xe));
+	vram = kunit_kzalloc(test, sizeof(*vram), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vram);
+
+	return 0;
+}
+
+static struct kunit_case vf_gt_config_test_cases[] = {
+	KUNIT_CASE_PARAM(ctx_1vf, vf_ctx_testcase_gen_params),
+	KUNIT_CASE_PARAM(db_1vf, vf_db_testcase_gen_params),
+	KUNIT_CASE_PARAM(vram_1vf, vf_vram_testcase_gen_params),
+	KUNIT_CASE_PARAM(ggtt_size_1vf, vf_ggtt_size_testcase_gen_params),
+	KUNIT_CASE_PARAM(ggtt_start_1vf, vf_ggtt_start_testcase_gen_params),
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
index 027c5a5f0748..8834483286a6 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1657,3 +1657,7 @@ int xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
 
 	return atomic_read(&gt->sriov.vf.migration.fixups_complete_count);
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_gt_sriov_vf_kunit.c"
+#endif
-- 
2.43.0

