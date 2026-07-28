Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45964C53219
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 09:50:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0776E10E556;
	Tue, 28 Jul 2026 09:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hkt6PD4d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F4210E858
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 09:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785232239; x=1816768239;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S3VP32XZ3eQ3RcHT8YuKUFMozpN/DV+T6wqtzxCmV8Y=;
 b=hkt6PD4dOyebjTOZxMRzu+fcrGxasT6AHOnCJedq9fEW+n3gdXj9fg3F
 ac838WwqCuTYI57ciRxYcsiuU4010hkJF6BUoJcLnesk9uAuJp++P+kKS
 w1TBPgFHNXaOBAoppV+h4/4HQSyAoDpKfZU4cAVeCQXA2oeVYtdXWL59J
 MrvOuFWx6SrdSi3/vC1+rUbTr4kNbuck27iF4SYBwwaX5xEOq2U9XkNuv
 YpjzR6xlUmmFb9vYUEOH7JvVcFxShyyGwcfwn+rmc0ImRfg3LrvPH0VaC
 MYqaJHQFQmhXifuNXqDh+wU4wojhCv5Thbd7WhbyRmMrOB1lbiNhO+1/0 Q==;
X-CSE-ConnectionGUID: d5QRKE4VSSKWuOrIImOEhw==
X-CSE-MsgGUID: HYdkg2EjSaymUfLho0b7xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="111357409"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="111357409"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 02:50:38 -0700
X-CSE-ConnectionGUID: JlwNHbWxQYai2Aj//JgWcQ==
X-CSE-MsgGUID: R7626j/5QnKRkCgtG+xBnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="258387266"
Received: from gsd-build.iind.intel.com ([10.190.229.141])
 by orviesa010.jf.intel.com with ESMTP; 28 Jul 2026 02:50:37 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4 4/4] drm/xe/tests: Add KUnit tests for VF provisioning
 error handling
Date: Tue, 28 Jul 2026 09:50:30 +0000
Message-ID: <20260728095026.2197333-10-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728095026.2197333-6-satyanarayana.k.v.p@intel.com>
References: <20260728095026.2197333-6-satyanarayana.k.v.p@intel.com>
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

Add KUnit test cases that use the xe_guc_mmio_send_recv() stub to inject
bad KLV responses and verify that VF can survive without crashing for
the invalid configuration data received.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
V3 -> V4:
- Changed stub function from guc_action_query_single_klv32() and
guc_action_query_single_klv64() to xe_guc_mmio_send_recv() (Michal W).
- Fixed review comments (Michal W).

V2 -> V3:
- Renamed the test names. (Michal W).
- Fixed review comments (Michal W).

V1 -> V2:
- Renamed the test file (Michal W).
- Fixed review comments (Michal W).
---
 .../gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c   | 212 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |   4 +
 2 files changed, 216 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
new file mode 100644
index 000000000000..5444cad1eead
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <kunit/static_stub.h>
+#include <kunit/test.h>
+
+#include "regs/xe_guc_regs.h"
+#include "xe_device.h"
+#include "xe_kunit_helpers.h"
+#include "xe_pci_test.h"
+#include "xe_guc.h"
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
+	{TEST_CTXS,	TEST_CTXS,		0,		"same",		},
+	{0,		0,			-ENODATA,	"none",		},
+	{0,		GUC_ID_MAX + 1,		-EPROTO,	"overflow",	},
+	{TEST_CTXS,	0,			-EREMCHG,	"lost",		},
+	{TEST_CTXS,	TEST_CTXS / 2,		-EREMCHG,	"reduced",	},
+	{TEST_CTXS,	TEST_CTXS * 2,		-EREMCHG,	"increased",	},
+}, vf_db_testcase[] = {
+	{TEST_DBS,	TEST_DBS,		0,		"same",		},
+	{0,		0,			-ENODATA,	"none",		},
+	{0,		GUC_NUM_DOORBELLS + 1,	-EPROTO,	"overflow",	},
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
+	{TEST_VRAM,	TEST_VRAM,		0,		"same",		},
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
+	{TEST_GGTT_START,	TEST_GGTT_START,	TEST_GGTT_SIZE,
+		TEST_GGTT_SIZE,		0,		"same",		},
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
+KUNIT_ARRAY_PARAM_DESC(ctx_testcase, vf_ctx_testcase, name);
+KUNIT_ARRAY_PARAM_DESC(db_testcase, vf_db_testcase, name);
+KUNIT_ARRAY_PARAM_DESC(vram_testcase, vf_vram_testcase, name);
+KUNIT_ARRAY_PARAM_DESC(ggtt_testcase, vf_ggtt_testcase, name);
+
+static int xe_guc_mmio_send_recv_stub(struct xe_guc *guc, const u32 *request,
+				      u32 len, u32  *response_buf)
+{
+	struct kunit *test = kunit_get_current_test();
+	const struct config_vram *c_vram;
+	const struct config_ggtt *c_ggtt;
+	const struct config *c;
+
+	if ((request[0] & 0xffff) != GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV)
+		return -EINVAL;
+
+	switch (request[1]) {
+	case GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY:
+		c = test->param_value;
+		response_buf[0] = sizeof(u32) / sizeof(u32);
+		response_buf[1] = c->query;
+		break;
+
+	case GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY:
+		c = test->param_value;
+		response_buf[0] = sizeof(u32) / sizeof(u32);
+		response_buf[1] = c->query;
+		break;
+
+	case GUC_KLV_VF_CFG_LMEM_SIZE_KEY:
+		c_vram = test->param_value;
+		response_buf[0] = sizeof(u64) / sizeof(u32);
+		response_buf[1] = c_vram->query & 0xffffffff;
+		response_buf[2] = (c_vram->query >> 32) & 0xffffffff;
+		break;
+
+	case GUC_KLV_VF_CFG_GGTT_START_KEY:
+		c_ggtt = test->param_value;
+		response_buf[0] = sizeof(u64) / sizeof(u32);
+		response_buf[1] = c_ggtt->start_query & 0xffffffff;
+		response_buf[2] = (c_ggtt->start_query >> 32) & 0xffffffff;
+		break;
+
+	case GUC_KLV_VF_CFG_GGTT_SIZE_KEY:
+		c_ggtt = test->param_value;
+		response_buf[0] = sizeof(u64) / sizeof(u32);
+		response_buf[1] = c_ggtt->size_query & 0xffffffff;
+		response_buf[2] = (c_ggtt->size_query >> 32) & 0xffffffff;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void test_ctxs(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	const struct config *c = test->param_value;
+
+	gt->sriov.vf.self_config.num_ctxs = c->orig;
+	KUNIT_EXPECT_EQ(test, vf_get_ctxs_cfg(gt), c->expected_ret);
+}
+
+static void test_dbs(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	const struct config *c = test->param_value;
+
+	gt->sriov.vf.self_config.num_dbs = c->orig;
+	KUNIT_EXPECT_EQ(test, vf_get_dbs_cfg(gt), c->expected_ret);
+}
+
+static void test_vram(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	const struct config_vram *c = test->param_value;
+
+	gt->tile->sriov.vf.self_config.lmem_size = c->orig;
+	KUNIT_EXPECT_EQ(test, vf_get_lmem_info(gt), c->expected_ret);
+}
+
+static void test_ggtt_size(struct kunit *test)
+{
+	const struct config_ggtt *c = test->param_value;
+	struct xe_gt *gt = test->priv;
+
+	gt->tile->sriov.vf.self_config.ggtt_base = c->start_orig;
+	gt->tile->sriov.vf.self_config.ggtt_size = c->size_orig;
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
+	KUNIT_ASSERT_TRUE(test, IS_DGFX(xe));
+
+	gt = xe_root_mmio_gt(xe);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
+	test->priv = gt;
+
+	kunit_activate_static_stub(test, xe_guc_mmio_send_recv, xe_guc_mmio_send_recv_stub);
+	return 0;
+}
+
+static struct kunit_case vf_gt_config_test_cases[] = {
+	KUNIT_CASE_PARAM(test_ctxs, ctx_testcase_gen_params),
+	KUNIT_CASE_PARAM(test_dbs, db_testcase_gen_params),
+	KUNIT_CASE_PARAM(test_vram, vram_testcase_gen_params),
+	KUNIT_CASE_PARAM(test_ggtt_size, ggtt_testcase_gen_params),
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
index 69e531be15ed..dd06b23d7a9d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1661,3 +1661,7 @@ int xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
 
 	return atomic_read(&gt->sriov.vf.migration.fixups_complete_count);
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_gt_sriov_vf_kunit.c"
+#endif
-- 
2.43.0

