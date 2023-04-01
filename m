Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFFFC76196
	for <intel-xe@archiver.kernel.org>; Sat,  1 Apr 2023 08:52:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A1410E0A2;
	Sat,  1 Apr 2023 08:52:47 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEBA10E096
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Apr 2023 08:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680339162; x=1711875162;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EUrYQQZZeIXdOufRmRW01FUD9IH5drYfXASZEWpvTUo=;
 b=Ltq3DQuBGHSUefxbPOKXAsi/8CJsr1IgX4TOwq+A8fkQW2mIjIPDJMFe
 d6XU2BvTMC5gJVYil0Mh8QZcaTCGSPaumYooRonkW0PHaEmcPgzJ6B2C8
 lS+mzxlVv86LDaQAfL7WJbt9lIq8JX4Jd4YxqanxStiInn/vnXDc6oaSS
 Qm4Q4YgRr+1d8qsB50jPit47Idi+LZrrBGQIzoa+x/wCXSLi7DcF2BDkN
 SPRx+wrXpwoOLbDgtk/r+JhQGtH01/FWy9Fi+WWkvytthBtUZevXr971h
 foW9eW6xzY5pde7JEVnHRDkX3uFafmpZJTR1qzDJPVKJ9l1XUFxeDUO+3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="341651177"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="341651177"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 01:52:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="685369580"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="685369580"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 01:52:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sat,  1 Apr 2023 01:51:50 -0700
Message-Id: <20230401085151.1786204-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230401085151.1786204-1-lucas.demarchi@intel.com>
References: <20230401085151.1786204-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 6/7] drm/xe: Add basic unit tests for rtp
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal@hardline.pl>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add some basic unit tests for rtp. This is intended to prove the
functionality of the rtp itself, like coalescing entries, rejecting
non-disjoint values, etc.

Contrary to the other tests in xe, this is a unit test to test the
sw-side only, so it can be executed on any machine - it doesn't interact
with the real hardware. Running it produces the following output:

	$ ./tools/testing/kunit/kunit.py run --raw_output-kunit  \
		--kunitconfig drivers/gpu/drm/xe/.kunitconfig xe_rtp
	...
	[01:26:27] Starting KUnit Kernel (1/1)...
	KTAP version 1
	1..1
	    KTAP version 1
	    # Subtest: xe_rtp
	    1..1
		KTAP version 1
		# Subtest: xe_rtp_process_tests
		ok 1 coalesce-same-reg
		ok 2 no-match-no-add
		ok 3 no-match-no-add-multiple-rules
		ok 4 two-regs-two-entries
		ok 5 clr-one-set-other
		ok 6 set-field
	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000001, set: 00000001, masked: no): ret=-22
		ok 7 conflict-duplicate
	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000003, set: 00000000, masked: no): ret=-22
		ok 8 conflict-not-disjoint
	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000002, set: 00000002, masked: no): ret=-22
	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000001, set: 00000001, masked: yes): ret=-22
		ok 9 conflict-reg-type
	    # xe_rtp_process_tests: pass:9 fail:0 skip:0 total:9
	    ok 1 xe_rtp_process_tests
	# Totals: pass:9 fail:0 skip:0 total:9
	ok 1 xe_rtp
	...

Note that the ERRORs in the kernel log are expected since it's testing
incompatible entries.

v2:
  - Use parameterized table for tests  (Michał Winiarski)
  - Move everything to the xe_rtp_test.ko and only add a few exports to the
    right namespace
  - Add more tests to cover FIELD_SET, CLR, partially true rules, etc

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Maarten Lankhorst<maarten.lankhorst@linux.intel.com> # v1
---
 drivers/gpu/drm/xe/Kconfig.debug       |   1 +
 drivers/gpu/drm/xe/tests/Makefile      |   7 +-
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 318 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_reg_sr.c         |   2 +
 drivers/gpu/drm/xe/xe_rtp.c            |   3 +
 5 files changed, 329 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_test.c

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index 93b284cdd0a2..11bb13c73e7b 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -66,6 +66,7 @@ config DRM_XE_KUNIT_TEST
 	depends on DRM_XE && KUNIT && DEBUG_FS
 	default KUNIT_ALL_TESTS
 	select DRM_EXPORT_FOR_TESTS if m
+	select DRM_KUNIT_TEST_HELPERS
 	help
 	  Choose this option to allow the driver to perform selftests under
 	  the kunit framework
diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
index 47056b6459e3..c5c2f108d017 100644
--- a/drivers/gpu/drm/xe/tests/Makefile
+++ b/drivers/gpu/drm/xe/tests/Makefile
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_bo_test.o xe_dma_buf_test.o \
-	xe_migrate_test.o
+obj-$(CONFIG_DRM_XE_KUNIT_TEST) += \
+	xe_bo_test.o \
+	xe_dma_buf_test.o \
+	xe_migrate_test.o \
+	xe_rtp_test.o
diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
new file mode 100644
index 000000000000..29e112c108c6
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -0,0 +1,318 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/string.h>
+#include <linux/xarray.h>
+
+#include <drm/drm_drv.h>
+#include <drm/drm_kunit_helpers.h>
+
+#include <kunit/test.h>
+
+#include "regs/xe_gt_regs.h"
+#include "regs/xe_reg_defs.h"
+#include "xe_device_types.h"
+#include "xe_pci_test.h"
+#include "xe_reg_sr.h"
+#include "xe_rtp.h"
+
+#undef _MMIO
+#undef MCR_REG
+#define _MMIO(x)	_XE_RTP_REG(x)
+#define MCR_REG(x)	_XE_RTP_MCR_REG(x)
+
+#define REGULAR_REG1	_MMIO(1)
+#define REGULAR_REG2	_MMIO(2)
+#define REGULAR_REG3	_MMIO(3)
+#define MCR_REG1	MCR_REG(1)
+#define MCR_REG2	MCR_REG(2)
+#define MCR_REG3	MCR_REG(3)
+
+struct rtp_test_case {
+	const char *name;
+	struct {
+		u32 offset;
+		u32 type;
+	} expected_reg;
+        u32 expected_set_bits;
+	u32 expected_clr_bits;
+	unsigned long expected_count;
+	unsigned int expected_sr_errors;
+	const struct xe_rtp_entry *entries;
+};
+
+static bool match_yes(const struct xe_gt *gt, const struct xe_hw_engine *hwe)
+{
+	return true;
+}
+
+static bool match_no(const struct xe_gt *gt, const struct xe_hw_engine *hwe)
+{
+	return false;
+}
+
+static const struct rtp_test_case cases[] = {
+	{
+		.name = "coalesce-same-reg",
+		.expected_reg = { REGULAR_REG1 },
+		.expected_set_bits = REG_BIT(0) | REG_BIT(1),
+		.expected_clr_bits = REG_BIT(0) | REG_BIT(1),
+		.expected_count = 1,
+		/* Different bits on the same register: create a single entry */
+		.entries = (const struct xe_rtp_entry[]) {
+			{ XE_RTP_NAME("basic-1"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
+			},
+			{ XE_RTP_NAME("basic-2"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(1)))
+			},
+			{}
+		},
+	},
+	{
+		.name = "no-match-no-add",
+		.expected_reg = { REGULAR_REG1 },
+		.expected_set_bits = REG_BIT(0),
+		.expected_clr_bits = REG_BIT(0),
+		.expected_count = 1,
+		/* Don't coalesce second entry since rules don't match */
+		.entries = (const struct xe_rtp_entry[]) {
+			{ XE_RTP_NAME("basic-1"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
+			},
+			{ XE_RTP_NAME("basic-2"),
+			  XE_RTP_RULES(FUNC(match_no)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(1)))
+			},
+			{}
+		},
+	},
+	{
+		.name = "no-match-no-add-multiple-rules",
+		.expected_reg = { REGULAR_REG1 },
+		.expected_set_bits = REG_BIT(0),
+		.expected_clr_bits = REG_BIT(0),
+		.expected_count = 1,
+		/* Don't coalesce second entry due to one of the rules */
+		.entries = (const struct xe_rtp_entry[]) {
+			{ XE_RTP_NAME("basic-1"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
+			},
+			{ XE_RTP_NAME("basic-2"),
+			  XE_RTP_RULES(FUNC(match_yes), FUNC(match_no)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(1)))
+			},
+			{}
+		},
+	},
+	{
+		.name = "two-regs-two-entries",
+		.expected_reg = { REGULAR_REG1 },
+		.expected_set_bits = REG_BIT(0),
+		.expected_clr_bits = REG_BIT(0),
+		.expected_count = 2,
+		/* Same bits on different registers are not coalesced */
+		.entries = (const struct xe_rtp_entry[]) {
+			{ XE_RTP_NAME("basic-1"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
+			},
+			{ XE_RTP_NAME("basic-2"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG2, REG_BIT(0)))
+			},
+			{}
+		},
+	},
+	{
+		.name = "clr-one-set-other",
+		.expected_reg = { REGULAR_REG1 },
+		.expected_set_bits = REG_BIT(0),
+		.expected_clr_bits = REG_BIT(1) | REG_BIT(0),
+		.expected_count = 1,
+		/* Check clr vs set actions on different bits */
+		.entries = (const struct xe_rtp_entry[]) {
+			{ XE_RTP_NAME("basic-1"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
+			},
+			{ XE_RTP_NAME("basic-2"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(CLR(REGULAR_REG1, REG_BIT(1)))
+			},
+			{}
+		},
+	},
+	{
+#define TEMP_MASK	REG_GENMASK(10, 8)
+#define TEMP_FIELD	REG_FIELD_PREP(TEMP_MASK, 2)
+		.name = "set-field",
+		.expected_reg = { REGULAR_REG1 },
+		.expected_set_bits = TEMP_FIELD,
+		.expected_clr_bits = TEMP_MASK,
+		.expected_count = 1,
+		/* Check FIELD_SET works */
+		.entries = (const struct xe_rtp_entry[]) {
+			{ XE_RTP_NAME("basic-1"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(FIELD_SET(REGULAR_REG1,
+						   TEMP_MASK, TEMP_FIELD))
+			},
+			{}
+		},
+#undef TEMP_MASK
+#undef TEMP_FIELD
+	},
+	{
+		.name = "conflict-duplicate",
+		.expected_reg = { REGULAR_REG1 },
+		.expected_set_bits = REG_BIT(0),
+		.expected_clr_bits = REG_BIT(0),
+		.expected_count = 1,
+		.expected_sr_errors = 1,
+		.entries = (const struct xe_rtp_entry[]) {
+			{ XE_RTP_NAME("basic-1"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
+			},
+			/* drop: setting same values twice */
+			{ XE_RTP_NAME("basic-2"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
+			},
+			{}
+		},
+	},
+	{
+		.name = "conflict-not-disjoint",
+		.expected_reg = { REGULAR_REG1 },
+		.expected_set_bits = REG_BIT(0),
+		.expected_clr_bits = REG_BIT(0),
+		.expected_count = 1,
+		.expected_sr_errors = 1,
+		.entries = (const struct xe_rtp_entry[]) {
+			{ XE_RTP_NAME("basic-1"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
+			},
+			/* drop: bits are not disjoint with previous entries */
+			{ XE_RTP_NAME("basic-2"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(CLR(REGULAR_REG1, REG_GENMASK(1, 0)))
+			},
+			{}
+		},
+	},
+	{
+		.name = "conflict-reg-type",
+		.expected_reg = { REGULAR_REG1 },
+		.expected_set_bits = REG_BIT(0),
+		.expected_clr_bits = REG_BIT(0),
+		.expected_count = 1,
+		.expected_sr_errors = 2,
+		.entries = (const struct xe_rtp_entry[]) {
+			{ XE_RTP_NAME("basic-1"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
+			},
+			/* drop: regular vs MCR */
+			{ XE_RTP_NAME("basic-2"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(MCR_REG1, REG_BIT(1)))
+			},
+			/* drop: regular vs masked */
+			{ XE_RTP_NAME("basic-3"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0),
+					     XE_RTP_ACTION_FLAG(MASKED_REG)))
+			},
+			{}
+		},
+	},
+};
+
+static void xe_rtp_process_tests(struct kunit *test)
+{
+	const struct rtp_test_case *param = test->param_value;
+	struct xe_device *xe = test->priv;
+	struct xe_reg_sr *reg_sr = &xe->gt[0].reg_sr;
+	const struct xe_reg_sr_entry *sre, *sr_entry = NULL;
+	unsigned long idx, count = 0;
+
+	xe_reg_sr_init(reg_sr, "xe_rtp_tests", xe);
+	xe_rtp_process(param->entries, reg_sr, &xe->gt[0], NULL);
+
+	xa_for_each(&reg_sr->xa, idx, sre) {
+		if (idx == param->expected_reg.offset)
+			sr_entry = sre;
+
+		count++;
+	}
+
+	KUNIT_EXPECT_EQ(test, count, param->expected_count);
+	KUNIT_EXPECT_EQ(test, sr_entry->clr_bits, param->expected_clr_bits);
+	KUNIT_EXPECT_EQ(test, sr_entry->set_bits, param->expected_set_bits);
+	KUNIT_EXPECT_EQ(test, sr_entry->reg_type, param->expected_reg.type);
+	KUNIT_EXPECT_EQ(test, reg_sr->errors, param->expected_sr_errors);
+}
+
+static void rtp_desc(const struct rtp_test_case *t, char *desc)
+{
+	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(rtp, cases, rtp_desc);
+
+static int xe_rtp_test_init(struct kunit *test)
+{
+	struct xe_device *xe;
+	struct device *dev;
+	int ret;
+
+	dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	xe = drm_kunit_helper_alloc_drm_device(test, dev,
+					       struct xe_device,
+					       drm, DRIVER_GEM);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
+
+	ret = xe_pci_fake_device_init_any(xe);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	xe->drm.dev = dev;
+	test->priv = xe;
+
+	return 0;
+}
+
+static void xe_rtp_test_exit(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+
+	drm_kunit_helper_free_device(test, xe->drm.dev);
+}
+
+static struct kunit_case xe_rtp_tests[] = {
+	KUNIT_CASE_PARAM(xe_rtp_process_tests, rtp_gen_params),
+	{}
+};
+
+static struct kunit_suite xe_rtp_test_suite = {
+	.name = "xe_rtp",
+	.init = xe_rtp_test_init,
+	.exit = xe_rtp_test_exit,
+	.test_cases = xe_rtp_tests,
+};
+
+kunit_test_suite(xe_rtp_test_suite);
+
+MODULE_AUTHOR("Intel Corporation");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 83f29aeb9250..feed87109e93 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -5,6 +5,7 @@
 
 #include "xe_reg_sr.h"
 
+#include <kunit/visibility.h>
 #include <linux/align.h>
 #include <linux/string_helpers.h>
 #include <linux/xarray.h>
@@ -44,6 +45,7 @@ int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_device *xe)
 
 	return drmm_add_action_or_reset(&xe->drm, reg_sr_fini, sr);
 }
+EXPORT_SYMBOL_IF_KUNIT(xe_reg_sr_init);
 
 static struct xe_reg_sr_entry *alloc_entry(struct xe_reg_sr *sr)
 {
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index cb9dd894547d..20acd43cb60b 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -5,6 +5,8 @@
 
 #include "xe_rtp.h"
 
+#include <kunit/visibility.h>
+
 #include <drm/xe_drm.h>
 
 #include "xe_gt.h"
@@ -155,6 +157,7 @@ void xe_rtp_process(const struct xe_rtp_entry *entries, struct xe_reg_sr *sr,
 		}
 	}
 }
+EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process);
 
 bool xe_rtp_match_even_instance(const struct xe_gt *gt,
 				const struct xe_hw_engine *hwe)
-- 
2.39.0

