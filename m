Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592E9C7618E
	for <intel-xe@archiver.kernel.org>; Thu, 16 Mar 2023 21:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380D210E375;
	Thu, 16 Mar 2023 21:03:55 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A779A10E31F
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Mar 2023 21:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679000633; x=1710536633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kQe6qXMuAljYngm2QBofHwSZp1y6uisMILMKIT8Hg/8=;
 b=N8iRvJfTAkN+nuS4qWH1hsYwHD4Ttl6Kk8QbVWegLPIJPavoj7fyKNJW
 ecSx7kPcygIa/eLpzibZB/pbH8S/aZeBF62MX3EHGcdhjZhvCuWiQWXJt
 6W7zjFrBJtK/Sqe4qy7qNgx3kpaQWcLh9+Lw2Xmy7fQYD325EPbwwinnM
 BtOoSMfnKjoodiNQA4/ERHW48CP7SSEIKSfcbUS6e79kILBCMaQDGqwvm
 w+NtMn4sH8jCZ0OwPF3CXor1JM6a1dyqyt4jjGRM0oC3eLFOQiNzA4aRA
 9Wr7OMHzNRHYzqW3lWIekfbKWwgFnMl5jq65N+XPtwUTGuc8UKFdnUXAU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="338127581"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="338127581"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 14:03:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="657320519"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="657320519"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 14:03:52 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Mar 2023 14:03:41 -0700
Message-Id: <20230316210341.3547058-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230316210341.3547058-1-lucas.demarchi@intel.com>
References: <20230316210341.3547058-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/3] drm/xe: Add basic unit tests for rtp
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
Cc: mauro.chehab@intel.com, thomas.hellstrom@intel.com,
 Matt Roper <matthew.d.roper@intel.com>, maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add some basic unit tests for rtp. This is intended to prove the
functionality of the rtp itself, like coalescing entries, rejecting
non-disjoint values, etc.

Contrary to the other tests in xe, this is a unit test to test the
sw-side only, so it can be executed on any machine - it doesn't interact
with the real hardware. For that a mock was provided with the minimum
initialization needed. Running it produces the following output:

	$ ./tools/testing/kunit/kunit.py run --raw_output  \
		--kunitconfig drivers/gpu/drm/xe/.kunitconfig xe_rtp
	...
	[13:46:14] Starting KUnit Kernel (1/1)...
	KTAP version 1
	1..1
	    KTAP version 1
	    # Subtest: xe_rtp
	    1..3
	    ok 1 xe_rtp_process_basic
	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000001, set: 00000001, masked: no): ret=-22
	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000003, set: 00000003, masked: no): ret=-22
	    ok 2 xe_rtp_process_dup
	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000001, set: 00000001, masked: no): ret=-22
	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000003, set: 00000003, masked: no): ret=-22
	    ok 3 xe_rtp_process_incompat_types
	# xe_rtp: pass:3 fail:0 skip:0 total:3
	# Totals: pass:3 fail:0 skip:0 total:3
	ok 1 xe_rtp
	[13:46:14] Elapsed time: 6.800s total, 0.002s configuring, 6.682s building, 0.073s running

Note that the ERRORs in the kernel log are expected since it's testing
non-disjoint or incompatible entries.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.debug       |   1 +
 drivers/gpu/drm/xe/tests/Makefile      |   7 +-
 drivers/gpu/drm/xe/tests/xe_rtp.c      | 201 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_rtp_test.c |  71 +++++++++
 drivers/gpu/drm/xe/tests/xe_rtp_test.h |  15 ++
 drivers/gpu/drm/xe/xe_rtp.c            |   4 +
 6 files changed, 297 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_test.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_test.h

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
diff --git a/drivers/gpu/drm/xe/tests/xe_rtp.c b/drivers/gpu/drm/xe/tests/xe_rtp.c
new file mode 100644
index 000000000000..196a7223c807
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_rtp.c
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "tests/xe_rtp_test.h"
+
+#include <linux/string.h>
+#include <linux/xarray.h>
+
+#include <kunit/test.h>
+
+#include "regs/xe_gt_regs.h"
+#include "regs/xe_reg_defs.h"
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
+/* Basic entries: same register, only one action, disjoint values */
+static const struct xe_rtp_entry basic_entries[] = {
+	{ XE_RTP_NAME("basic-yes-1"),
+	  XE_RTP_RULES(FUNC(match_yes)),
+	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
+	},
+	{ XE_RTP_NAME("basic-yes-2"),
+	  XE_RTP_RULES(FUNC(match_yes)),
+	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(1)))
+	},
+	{ XE_RTP_NAME("basic-no-3"),
+	  XE_RTP_RULES(FUNC(match_no)),
+	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(2)))
+	},
+	{ XE_RTP_NAME("basic-no-4"),
+	  XE_RTP_RULES(FUNC(match_yes), FUNC(match_no)),
+	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(3)))
+	},
+	{ XE_RTP_NAME("basic-yes-clr-1"),
+	  XE_RTP_RULES(FUNC(match_yes)),
+	  XE_RTP_ACTIONS(CLR(REGULAR_REG1, REG_BIT(4)))
+	},
+	{ XE_RTP_NAME("basic-yes-clr-2"),
+	  XE_RTP_RULES(FUNC(match_yes)),
+	  XE_RTP_ACTIONS(CLR(REGULAR_REG1, REG_BIT(5)))
+	},
+	{}
+};
+
+void xe_rtp_process_basic(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_reg_sr *reg_sr = &xe->gt[0].reg_sr;
+	const struct xe_rtp_entry *rtp_entry;
+	const struct xe_reg_sr_entry *sre, *sr_entry = NULL;
+	unsigned long idx, count = 0, set_bits = 0, clr_bits = 0;
+
+	xe_reg_sr_init(reg_sr, "basic", xe);
+	xe_rtp_process(basic_entries, reg_sr, &xe->gt[0], NULL);
+
+	xa_for_each(&reg_sr->xa, idx, sre) {
+		count++;
+		sr_entry = sre;
+	}
+
+	/*
+	 * Same REGULAR_REG1 register being used: all the entries should
+	 * coalesce into a single entry
+	 */
+	KUNIT_ASSERT_EQ(test, count, 1);
+
+	/* Only bits in the entries named *-yes* are set */
+	for (rtp_entry = basic_entries; rtp_entry && rtp_entry->name; rtp_entry++) {
+		if (!strstr(rtp_entry->name, "-yes"))
+			continue;
+
+		clr_bits |= rtp_entry->actions[0].clr_bits;
+		set_bits |= rtp_entry->actions[0].set_bits;
+	}
+
+	/* implementation detail of RTP - SET() also clears */
+	clr_bits |= set_bits;
+
+	KUNIT_EXPECT_EQ(test, clr_bits, sr_entry->clr_bits);
+	KUNIT_EXPECT_EQ(test, set_bits, sr_entry->set_bits);
+}
+EXPORT_SYMBOL(xe_rtp_process_basic);
+
+/*
+ * Duplicate entries - same register register, only one action,
+ * with actions trying to set/clear bits already changed in previous entries
+ */
+static const struct xe_rtp_entry dup_entries[] = {
+	{ XE_RTP_NAME("dup-entries-yes-1"),
+	  XE_RTP_RULES(FUNC(match_yes)),
+	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
+	},
+	{ XE_RTP_NAME("dup-entries-no-2"),
+	  XE_RTP_RULES(FUNC(match_yes)),
+	  /* should be dropped as it's the same as a previous */
+	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
+	},
+	{ XE_RTP_NAME("dup-entries-no-3"),
+	  XE_RTP_RULES(FUNC(match_yes)),
+	  /* should be dropped as not disjoint */
+	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_GENMASK(1, 0)))
+	},
+	{}
+};
+
+void xe_rtp_process_dup(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_reg_sr *reg_sr = &xe->gt[0].reg_sr;
+	const struct xe_reg_sr_entry *sre, *sr_entry = NULL;
+	unsigned long idx, count = 0;
+
+	xe_reg_sr_init(reg_sr, "duplicate values", xe);
+	xe_rtp_process(dup_entries, reg_sr, &xe->gt[0], NULL);
+
+	xa_for_each(&reg_sr->xa, idx, sre) {
+		count++;
+		sr_entry = sre;
+	}
+
+	/*
+	 * Same REGULAR_REG1 register being used: all the entries should
+	 * coalesce into a single entry
+	 */
+	KUNIT_EXPECT_EQ(test, count, 1);
+	KUNIT_EXPECT_EQ(test, sr_entry->set_bits, REG_BIT(0));
+}
+EXPORT_SYMBOL(xe_rtp_process_dup);
+
+/*
+ * Incompatible types: same register register, but entries trying to set the
+ * same register passing incompatible types (masked / mcr)
+ */
+static const struct xe_rtp_entry incompat_types_entries[] = {
+	{ XE_RTP_NAME("incompat-types-yes-1"),
+	  XE_RTP_RULES(FUNC(match_yes)),
+	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
+	},
+	{ XE_RTP_NAME("incompat-types-no-2"),
+	  XE_RTP_RULES(FUNC(match_yes)),
+	  /* dropped since has incompatible type with previous entry */
+	  XE_RTP_ACTIONS(SET(MCR_REG1, REG_BIT(1)))
+	},
+	{ XE_RTP_NAME("incompat-types-no-3"),
+	  XE_RTP_RULES(FUNC(match_yes)),
+	  /* dropped since has incompatible type with previous entry */
+	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(2),
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+	{ XE_RTP_NAME("incompat-types-no-3"),
+	  XE_RTP_RULES(FUNC(match_yes)),
+	  /* dropped since has incompatible type with previous entry */
+	  XE_RTP_ACTIONS(SET(MCR_REG1, REG_BIT(3),
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+	{}
+};
+
+void xe_rtp_process_incompat_types(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_reg_sr *reg_sr = &xe->gt[0].reg_sr;
+	const struct xe_reg_sr_entry *sre, *sr_entry = NULL;
+	unsigned long idx, count = 0;
+
+	xe_reg_sr_init(reg_sr, "incompatible types", xe);
+	xe_rtp_process(dup_entries, reg_sr, &xe->gt[0], NULL);
+
+	xa_for_each(&reg_sr->xa, idx, sre) {
+		count++;
+		sr_entry = sre;
+	}
+
+	/* Just the first entry is added, the rest are incompatible */
+	KUNIT_EXPECT_EQ(test, count, 1);
+	KUNIT_EXPECT_EQ(test, sr_entry->set_bits, REG_BIT(0));
+}
+EXPORT_SYMBOL(xe_rtp_process_incompat_types);
diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
new file mode 100644
index 000000000000..9340ce44c7be
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "xe_rtp_test.h"
+
+#include <drm/drm_drv.h>
+#include <drm/drm_kunit_helpers.h>
+
+#include <kunit/test.h>
+
+#include "xe_device_types.h"
+
+static void mock_xe_device_init(struct xe_device *xe)
+{
+	xe->gt[0].xe = xe;
+}
+
+struct xe_rtp_test_priv {
+	struct xe_device xe;
+	struct device *dev;
+};
+
+static int xe_rtp_test_init(struct kunit *test)
+{
+	struct xe_rtp_test_priv *priv;
+	struct device *dev;
+
+	dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	priv = drm_kunit_helper_alloc_drm_device(test, dev,
+						 struct xe_rtp_test_priv,
+						 xe.drm,
+						 DRIVER_GEM | DRIVER_RENDER |
+						 DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+
+	mock_xe_device_init(&priv->xe);
+	priv->dev = dev;
+	test->priv = priv;
+
+	return 0;
+}
+
+static void xe_rtp_test_exit(struct kunit *test)
+{
+	struct xe_rtp_test_priv *priv = test->priv;
+
+	drm_kunit_helper_free_device(test, priv->dev);
+}
+
+static struct kunit_case xe_rtp_tests[] = {
+	KUNIT_CASE(xe_rtp_process_basic),
+	KUNIT_CASE(xe_rtp_process_dup),
+	KUNIT_CASE(xe_rtp_process_incompat_types),
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
diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.h b/drivers/gpu/drm/xe/tests/xe_rtp_test.h
new file mode 100644
index 000000000000..a2f1437d6299
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 AND MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_RTP_TEST_H_
+#define _XE_RTP_TEST_H_
+
+struct kunit;
+
+void xe_rtp_process_basic(struct kunit *test);
+void xe_rtp_process_dup(struct kunit *test);
+void xe_rtp_process_incompat_types(struct kunit *test);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index cb9dd894547d..f634558b6e50 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -186,3 +186,7 @@ bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
 
 	return dss >= dss_per_gslice;
 }
+
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_rtp.c"
+#endif
-- 
2.39.0

