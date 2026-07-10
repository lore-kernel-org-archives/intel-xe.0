Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F15C43458
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 12:18:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDDD10F8A6;
	Fri, 10 Jul 2026 12:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YEPofEGx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4058A10F8A6
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jul 2026 12:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783685912; x=1815221912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V61yE0Dr6429jw6QP9hiIsRyOtYioHJj3elPP4hM6X4=;
 b=YEPofEGxuaTspxiomgcGmY1cyXa2d+b1IMr+v7bppz40C/DMnXS/UJGJ
 kmWF7kZMTJiAa+0MPEpqGnvPrBBZlCombck2gudvIW4djoef2IWtjUV4G
 UEwxzyDn61tmDuzZtr+PnaOc9C7MnUCrJO4Zv+Q60vuuEATZPzCFHbOKB
 6RtS0HjELIZWPI90QcLZn2FgwI3qpVJYJiNEjn5AOFK4JqmHjgLDy9JAm
 WPQmfLbUB4rZVMv4+vLJ9IM/rz4Hugcz7bbf3LdSY+ANmVK5sDqBRj1sH
 yfHbDz8c+purHmvZoHZGeVZ34tQG0ILJmucpigiQE7av0d+Y3hTnMDYUp w==;
X-CSE-ConnectionGUID: QND+JtviRJqmfibwd+AzLg==
X-CSE-MsgGUID: ad5acuiUQPudUgKL8hwZZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83360316"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="83360316"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 05:18:32 -0700
X-CSE-ConnectionGUID: te/+myZMQs+nA4w7+mkMrw==
X-CSE-MsgGUID: me2yy0YZRjWCPuNA92Sdlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="255522165"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by orviesa009.jf.intel.com with ESMTP; 10 Jul 2026 05:18:30 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/2] drm/xe/tests: Add KUnit tests for VF provisioning error
 handling
Date: Fri, 10 Jul 2026 17:49:56 +0530
Message-ID: <20260710122007.3329932-3-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260710122007.3329932-1-satyanarayana.k.v.p@intel.com>
References: <20260710122007.3329932-1-satyanarayana.k.v.p@intel.com>
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
 drivers/gpu/drm/xe/tests/xe_gt_sriov_vf.c | 387 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       |   4 +
 2 files changed, 391 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_vf.c

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf.c
new file mode 100644
index 000000000000..529513255dc3
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf.c
@@ -0,0 +1,387 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026-2027 Intel Corporation
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
+#define TEST_MAX_VFS    63
+#define TEST_VRAM       0x7a800000ull   /* random size that works on 32-bit */
+#define TEST_GGTT_SIZE  SZ_2G
+
+static int guc_action_query_single_klv_stub(struct xe_guc *guc, u32 key, u32 *value, u32 value_len);
+static int vf_gt_config_test_init(struct kunit *test);
+
+enum vf_config_types {
+	CTX_CONFIG,
+	DB_CONFIG,
+	VRAM_CONFIG,
+	GGTT_CONFIG,
+};
+
+struct vf_config_type {
+	enum vf_config_types type;
+};
+
+enum ctx_config_types {
+	CTX_CONFIG_DEFAULT,
+	CTX_CONFIG_ZERO_CTXS,
+	CTX_CONFIG_LESS_BY_4K_CTXS,
+	CTX_CONFIG_INVALID_CTXS,
+	CTX_CONFIG_ONE_CTX,
+	CTX_CONFIG_MORE_BY_4K,
+	CTX_CONFIG_MAX_CTXS,
+
+};
+
+struct vf_ctx_config_case {
+	struct vf_config_type config_type;
+	enum ctx_config_types ctx_type;
+	const char *test_name;
+};
+
+static const struct vf_ctx_config_case vf_ctx_config_cases[] = {
+	{.config_type = { .type = CTX_CONFIG },
+		.ctx_type = CTX_CONFIG_ZERO_CTXS,
+		.test_name = "contexts_zero_1vf"
+	},
+	{.config_type = { .type = CTX_CONFIG },
+		.ctx_type = CTX_CONFIG_LESS_BY_4K_CTXS,
+		.test_name = "contexts_less_by_4K_1vf"
+	},
+	{.config_type = { .type = CTX_CONFIG },
+		.ctx_type = CTX_CONFIG_INVALID_CTXS,
+		.test_name = "contexts_invalid_1vf"
+	},
+	{.config_type = { .type = CTX_CONFIG },
+		.ctx_type = CTX_CONFIG_ONE_CTX,
+		.test_name = "context_one_1vf"
+	},
+	{.config_type = { .type = CTX_CONFIG },
+		.ctx_type = CTX_CONFIG_MORE_BY_4K,
+		.test_name = "contexts_more_by_4K_1vf"
+	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(vf_ctx_config, vf_ctx_config_cases, test_name);
+
+enum db_config_types {
+	DB_CONFIG_DEFAULT = CTX_CONFIG_MAX_CTXS,
+	DB_CONFIG_ZERO_DOORBELLS,
+	DB_CONFIG_LESS_BY_32_DOORBELLS,
+	DB_CONFIG_INVALID_DOORBELLS,
+	DB_CONFIG_ONE_DOORBELL,
+	DB_CONFIG_MORE_BY_32_DOORBELLS,
+};
+
+struct vf_db_config_case {
+	struct vf_config_type config_type;
+	enum db_config_types db_type;
+	const char *test_name;
+};
+
+static const struct vf_db_config_case vf_db_config_cases[] = {
+	{.config_type = { .type = DB_CONFIG },
+		.db_type = DB_CONFIG_ZERO_DOORBELLS,
+		.test_name = "doorbells_zero_1vf"
+	},
+	{.config_type = { .type = DB_CONFIG },
+		.db_type = DB_CONFIG_LESS_BY_32_DOORBELLS,
+		.test_name = "doorbells_less_by_32_1vf"
+	},
+	{.config_type = { .type = DB_CONFIG },
+		.db_type = DB_CONFIG_INVALID_DOORBELLS,
+		.test_name = "doorbells_invalid_1vf"
+	},
+	{.config_type = { .type = DB_CONFIG },
+		.db_type = DB_CONFIG_ONE_DOORBELL,
+		.test_name = "doorbells_one_1vf"
+	},
+	{.config_type = { .type = DB_CONFIG },
+		.db_type = DB_CONFIG_MORE_BY_32_DOORBELLS,
+		.test_name = "doorbells_more_by_32_1vf"
+	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(vf_db_config, vf_db_config_cases, test_name);
+
+enum vram_config_types {
+	VRAM_CONFIG_DEFAULT,
+	VRAM_CONFIG_ZERO_VRAM,
+	VRAM_CONFIG_LESS_BY_32M_VRAM,
+	VRAM_CONFIG_INVALID_VRAM,
+	VRAM_CONFIG_ONE_GB_VRAM,
+	VRAM_CONFIG_MORE_BY_1G_VRAM,
+};
+
+struct vf_vram_config_case {
+	struct vf_config_type config_type;
+	enum vram_config_types vram_type;
+	const char *test_name;
+};
+
+static const struct vf_vram_config_case vf_vram_config_cases[] = {
+	{.config_type = { .type = VRAM_CONFIG },
+		.vram_type = VRAM_CONFIG_ZERO_VRAM,
+		.test_name = "vram_zero_1vf"
+	},
+	{.config_type = { .type = VRAM_CONFIG },
+		.vram_type = VRAM_CONFIG_LESS_BY_32M_VRAM,
+		.test_name = "vram_less_by_32M_1vf"
+	},
+	{.config_type = { .type = VRAM_CONFIG },
+		.vram_type = VRAM_CONFIG_INVALID_VRAM,
+		.test_name = "vram_invalid_1vf"
+	},
+	{.config_type = { .type = VRAM_CONFIG },
+		.vram_type = VRAM_CONFIG_ONE_GB_VRAM,
+		.test_name = "vram_one_gb_1vf"
+	},
+	{.config_type = { .type = VRAM_CONFIG },
+		.vram_type = VRAM_CONFIG_MORE_BY_1G_VRAM,
+		.test_name = "vram_more_by_1G_1vf"
+	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(vf_vram_config, vf_vram_config_cases, test_name);
+
+enum ggtt_config_types {
+	GGTT_CONFIG_DEFAULT,
+	GGTT_CONFIG_SIZE_INVALID,
+	GGTT_CONFIG_SIZE_ZERO,
+	GGTT_CONFIG_SIZE_LESS_BY_4K,
+};
+
+struct vf_ggtt_config_case {
+	struct vf_config_type config_type;
+	enum ggtt_config_types ggtt_type;
+	const char *test_name;
+};
+
+static const struct vf_ggtt_config_case ggtt_config_cases[] = {
+	{.config_type = { .type = GGTT_CONFIG },
+		.ggtt_type = GGTT_CONFIG_SIZE_ZERO,
+		.test_name = "ggtt_size_zero_1vf"
+	},
+	{.config_type = { .type = GGTT_CONFIG },
+		.ggtt_type = GGTT_CONFIG_SIZE_LESS_BY_4K,
+		.test_name = "ggtt_size_less_by_4K_1vf"
+	},
+	{.config_type = { .type = GGTT_CONFIG },
+		.ggtt_type = GGTT_CONFIG_SIZE_INVALID,
+		.test_name = "ggtt_size_invalid_1vf"
+	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(vf_ggtt_config, ggtt_config_cases, test_name);
+
+static void vf_gt_config_1vf(struct kunit *test)
+{
+	int config_type = ((struct vf_config_type *)test->param_value)->type;
+	struct xe_gt *gt = test->priv;
+
+	kunit_activate_static_stub(test, guc_action_query_single_klv,
+				   guc_action_query_single_klv_stub);
+
+	if (config_type == CTX_CONFIG) {
+		const struct vf_ctx_config_case *c = test->param_value;
+		enum ctx_config_types ctx_type = c->ctx_type;
+
+		test->priv = &ctx_type;
+
+		KUNIT_EXPECT_LT(test, vf_get_submission_cfg(gt), 0);
+	} else if (config_type == DB_CONFIG) {
+		const struct vf_db_config_case *c = test->param_value;
+		enum db_config_types db_type = c->db_type;
+
+		test->priv = &db_type;
+
+		KUNIT_EXPECT_LT(test, vf_get_submission_cfg(gt), 0);
+	} else if (config_type == VRAM_CONFIG) {
+		const struct vf_vram_config_case *c = test->param_value;
+		enum vram_config_types vram_type = c->vram_type;
+
+		test->priv = &vram_type;
+
+		KUNIT_EXPECT_LT(test, vf_get_lmem_info(gt), 0);
+	} else if (config_type == GGTT_CONFIG) {
+		const struct vf_ggtt_config_case *c = test->param_value;
+		enum ggtt_config_types ggtt_type = c->ggtt_type;
+
+		test->priv = &ggtt_type;
+
+		KUNIT_EXPECT_LT(test, vf_get_ggtt_info(gt), 0);
+	}
+
+	kunit_deactivate_static_stub(test, guc_action_query_single_klv);
+}
+
+static int guc_action_query_single_klv_stub(struct xe_guc *guc, u32 key, u32 *value, u32 value_len)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_device *xe = gt_to_xe(gt);
+	int *type = kunit_get_current_test()->priv;
+
+	switch (key) {
+	case GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY:
+		switch (*type) {
+		case CTX_CONFIG_ZERO_CTXS:
+			*value = 0;
+			break;
+		case CTX_CONFIG_LESS_BY_4K_CTXS:
+			*value = gt->sriov.vf.self_config.num_ctxs - SZ_4K;
+			break;
+		case CTX_CONFIG_INVALID_CTXS:
+			*value = GUC_ID_MAX + SZ_1K; /* greater than max context value */
+			break;
+		case CTX_CONFIG_ONE_CTX:
+			*value = 1;
+			break;
+		case CTX_CONFIG_MORE_BY_4K:
+			*value = gt->sriov.vf.self_config.num_ctxs + SZ_4K;
+			break;
+		default:
+			*value = gt->sriov.vf.self_config.num_ctxs;
+			break;
+		}
+		break;
+	case GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY:
+		switch (*type) {
+		case DB_CONFIG_ZERO_DOORBELLS:
+			*value = 0;
+			break;
+		case DB_CONFIG_LESS_BY_32_DOORBELLS:
+			*value = gt->sriov.vf.self_config.num_dbs - SZ_32;
+			break;
+		case DB_CONFIG_INVALID_DOORBELLS:
+			*value = GUC_NUM_DOORBELLS + 10; /* greater than max doorbells */
+			break;
+		case DB_CONFIG_ONE_DOORBELL:
+			*value = 1;
+			break;
+		case DB_CONFIG_MORE_BY_32_DOORBELLS:
+			*value = gt->sriov.vf.self_config.num_dbs + SZ_32;
+			break;
+		default:
+			*value = gt->sriov.vf.self_config.num_dbs;
+			break;
+		}
+		break;
+	case GUC_KLV_VF_CFG_LMEM_SIZE_KEY:
+		switch (*type) {
+		case VRAM_CONFIG_ZERO_VRAM:
+			*value = 0;
+			break;
+		case VRAM_CONFIG_LESS_BY_32M_VRAM:
+			*value = xe->tiles[0].sriov.vf.self_config.lmem_size - SZ_32M;
+			break;
+		case VRAM_CONFIG_INVALID_VRAM:
+			*value = xe->tiles[0].sriov.vf.self_config.lmem_size * 2;
+			break;
+		case VRAM_CONFIG_MORE_BY_1G_VRAM:
+			*value = xe->tiles[0].sriov.vf.self_config.lmem_size + SZ_1G;
+			break;
+		case VRAM_CONFIG_ONE_GB_VRAM:
+			*value = SZ_1G;
+			break;
+		default:
+			*value = xe->tiles[0].sriov.vf.self_config.lmem_size;
+			break;
+		}
+		break;
+	case GUC_KLV_VF_CFG_GGTT_SIZE_KEY:
+		switch (*type) {
+		case GGTT_CONFIG_SIZE_INVALID:
+			*value = SZ_4K;
+			break;
+		case GGTT_CONFIG_SIZE_ZERO:
+			*value = 0;
+			break;
+		case GGTT_CONFIG_SIZE_LESS_BY_4K:
+			*value = xe->tiles[0].sriov.vf.self_config.ggtt_size - SZ_4K;
+			break;
+		default:
+			*value = xe->tiles[0].sriov.vf.self_config.ggtt_size;
+			break;
+		}
+		break;
+	}
+	return 0;
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
+	vram->usable_size = TEST_VRAM;
+	xe->mem.vram = vram;
+	xe->tiles[0].mem.vram = vram;
+
+	/* pretend we have a valid LMTT */
+	KUNIT_ASSERT_TRUE(test, xe_device_has_lmtt(xe));
+	KUNIT_ASSERT_GE(test, GRAPHICS_VERx100(xe), 1260);
+	xe->tiles[0].sriov.pf.lmtt.ops = &lmtt_ml_ops;
+
+	/* pretend it can support up to 63 VFs */
+	xe->sriov.pf.device_total_vfs = TEST_MAX_VFS;
+	xe->sriov.pf.driver_max_vfs = TEST_MAX_VFS;
+	KUNIT_ASSERT_EQ(test, xe_sriov_pf_get_totalvfs(xe), 63);
+
+	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
+
+	/* more sanity checks */
+	KUNIT_EXPECT_EQ(test, GUC_ID_MAX + 1, SZ_64K);
+	KUNIT_EXPECT_EQ(test, GUC_NUM_DOORBELLS, SZ_256);
+
+	gt->sriov.vf.self_config.num_ctxs = SZ_32K;
+	gt->sriov.vf.self_config.num_dbs = 128;
+	xe->tiles[0].sriov.vf.self_config.lmem_size = TEST_VRAM;
+	xe->tiles[0].sriov.vf.self_config.ggtt_size = TEST_GGTT_SIZE;
+
+	return 0;
+}
+
+static struct kunit_case vf_gt_config_test_cases[] = {
+	KUNIT_CASE_PARAM(vf_gt_config_1vf, vf_ctx_config_gen_params),
+	KUNIT_CASE_PARAM(vf_gt_config_1vf, vf_db_config_gen_params),
+	KUNIT_CASE_PARAM(vf_gt_config_1vf, vf_vram_config_gen_params),
+	KUNIT_CASE_PARAM(vf_gt_config_1vf, vf_ggtt_config_gen_params),
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
index 802c982ea39b..7b4b88cb81d7 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1579,3 +1579,7 @@ int xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
 
 	return atomic_read(&gt->sriov.vf.migration.fixups_complete_count);
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_gt_sriov_vf.c"
+#endif
-- 
2.53.0

