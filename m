Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9D1C6FD20
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 22:06:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D9210E265;
	Tue, 21 Mar 2023 22:06:25 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6302210E100
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 22:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679436380; x=1710972380;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1yZ9MRVLKvNPJbS9DkqcY+jmsX7bs7Xg3S3Z3h3YPO8=;
 b=c84EotDbDdQ/o77VP8eQPNmTMp+Z0kXCYj/q8n3SXoS7P0r753xlNjfR
 TXeenQypPNpHD97pKgBkli1uJOK/2jXmIm4CPvXU0XYmUG4jiCfNmsZjH
 LG7vdcNdXqIs3EnKB3GUwcCa1KK3OVR6oikG0RuOJorEL2YeDl+GlE3CI
 D+2MVcMbvVnIlDN/Cms3ZpIBwdM7IKRtvK5DtfDy682tIXNEKaNh4tK+W
 fU0FSjB+fQC1/ixuNAImnN8j8B1wHuexoWgwMb32lp3exuGa+V+LRh0XQ
 1Ut+HUYBS5eI/AHqRn4+aESZfODiaPa2yn7GCtqR32KvSpSRSfci4djHd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="339109503"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="339109503"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 15:06:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="684065716"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="684065716"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 15:06:20 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Mar 2023 15:05:27 -0700
Message-Id: <20230321220527.595462-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230321220527.595462-1-lucas.demarchi@intel.com>
References: <20230321220527.595462-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 7/7] drm/xe: Add test for GT workarounds and
 tunings
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In order to avoid mistakes when populating the workarounds, it's good to
be able to test if the entries added are all compatible for a certain
platform. The platform itself is not needed as long as we create fake
devices with enough configuration for the RTP helpers to process the
tables.  Common mistakes that can be avoided:

	- Entries clashing the bitfields being updated
	- Register type being mixed (MCR vs regular / masked vs regular)
	- Unexpected errors while adding the reg_sr entry

To test, inject a duplicate entry in gt_was, but with platform == tigerlake
rather than the currenct graphics version check:

       { XE_RTP_NAME("14011059788"),
	 XE_RTP_RULES(PLATFORM(TIGERLAKE)),
	 XE_RTP_ACTIONS(SET(GEN10_DFR_RATIO_EN_AND_CHICKEN, DFR_DISABLE))
       },

This produces the following result:

	$  ./tools/testing/kunit/kunit.py run \
		--kunitconfig drivers/gpu/drm/xe/.kunitconfig  xe_wa

	[14:18:02] Starting KUnit Kernel (1/1)...
	[14:18:02] ============================================================
	[14:18:02] ==================== xe_wa (1 subtest) =====================
	[14:18:02] ======================== xe_wa_gt  =========================
	[14:18:02] [drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 9550 (clear: 00000200, set: 00000200, masked: no): ret=-22
	[14:18:02]     # xe_wa_gt: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_wa_test.c:116
	[14:18:02]     Expected gt->reg_sr.errors == 0, but
	[14:18:02]         gt->reg_sr.errors == 1 (0x1)
	[14:18:02] [FAILED] TIGERLAKE (B0)
	[14:18:02] [PASSED] DG1 (A0)
	[14:18:02] [PASSED] DG1 (B0)
	...

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/Makefile     |   3 +-
 drivers/gpu/drm/xe/tests/xe_wa_test.c | 136 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_reg_sr.c        |   1 +
 drivers/gpu/drm/xe/xe_tuning.c        |   1 +
 drivers/gpu/drm/xe/xe_wa.c            |   1 +
 5 files changed, 141 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_wa_test.c

diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
index c5c2f108d017..56919abb3f2a 100644
--- a/drivers/gpu/drm/xe/tests/Makefile
+++ b/drivers/gpu/drm/xe/tests/Makefile
@@ -4,4 +4,5 @@ obj-$(CONFIG_DRM_XE_KUNIT_TEST) += \
 	xe_bo_test.o \
 	xe_dma_buf_test.o \
 	xe_migrate_test.o \
-	xe_rtp_test.o
+	xe_rtp_test.o \
+	xe_wa_test.o
diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
new file mode 100644
index 000000000000..7f0dc821535b
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <drm/drm_drv.h>
+#include <drm/drm_kunit_helpers.h>
+
+#include <kunit/test.h>
+
+#include "xe_device.h"
+#include "xe_pci_test.h"
+#include "xe_reg_sr.h"
+#include "xe_tuning.h"
+#include "xe_wa.h"
+
+struct platform_test_case {
+	const char *name;
+	enum xe_platform platform;
+	enum xe_subplatform subplatform;
+	struct xe_step_info step;
+};
+
+#define PLATFORM_CASE(platform__, graphics_step__)				\
+	{									\
+		.name = #platform__ " (" #graphics_step__ ")",			\
+		.platform = XE_ ## platform__,					\
+		.subplatform = XE_SUBPLATFORM_NONE,				\
+		.step = { .graphics = STEP_ ## graphics_step__ }		\
+	}
+
+
+#define SUBPLATFORM_CASE(platform__, subplatform__, graphics_step__)			\
+	{										\
+		.name = #platform__ "_" #subplatform__ " (" #graphics_step__ ")",	\
+		.platform = XE_ ## platform__,						\
+		.subplatform = XE_SUBPLATFORM_ ## platform__ ## _ ## subplatform__,	\
+		.step = { .graphics = STEP_ ## graphics_step__ }			\
+	}
+
+static const struct platform_test_case cases[] = {
+	PLATFORM_CASE(TIGERLAKE, B0),
+	PLATFORM_CASE(DG1, A0),
+	PLATFORM_CASE(DG1, B0),
+	PLATFORM_CASE(ALDERLAKE_S, A0),
+	PLATFORM_CASE(ALDERLAKE_S, B0),
+	PLATFORM_CASE(ALDERLAKE_S, C0),
+	PLATFORM_CASE(ALDERLAKE_S, D0),
+	SUBPLATFORM_CASE(DG2, G10, A0),
+	SUBPLATFORM_CASE(DG2, G10, A1),
+	SUBPLATFORM_CASE(DG2, G10, B0),
+	SUBPLATFORM_CASE(DG2, G10, C0),
+	SUBPLATFORM_CASE(DG2, G11, A0),
+	SUBPLATFORM_CASE(DG2, G11, B0),
+	SUBPLATFORM_CASE(DG2, G11, B1),
+	SUBPLATFORM_CASE(DG2, G12, A0),
+	SUBPLATFORM_CASE(DG2, G12, A1),
+	PLATFORM_CASE(PVC, B0),
+	PLATFORM_CASE(PVC, B1),
+	PLATFORM_CASE(PVC, C0),
+};
+
+static void platform_desc(const struct platform_test_case *t, char *desc)
+{
+	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(platform, cases, platform_desc);
+
+static int xe_wa_test_init(struct kunit *test)
+{
+	const struct platform_test_case *param = test->param_value;
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
+	ret = xe_pci_fake_device_init(xe, param->platform, param->subplatform);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	xe->info.step = param->step;
+
+	/* TODO: init hw engines for engine/LRC WAs */
+	xe->drm.dev = dev;
+	test->priv = xe;
+
+	return 0;
+}
+
+static void xe_wa_test_exit(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+
+	drm_kunit_helper_free_device(test, xe->drm.dev);
+}
+
+static void xe_wa_gt(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_gt *gt;
+	int id;
+
+	for_each_gt(gt, xe, id) {
+		xe_reg_sr_init(&gt->reg_sr, "GT", xe);
+
+		xe_wa_process_gt(gt);
+		xe_tuning_process_gt(gt);
+
+		KUNIT_ASSERT_EQ(test, gt->reg_sr.errors, 0);
+	}
+}
+
+static struct kunit_case xe_wa_tests[] = {
+	KUNIT_CASE_PARAM(xe_wa_gt, platform_gen_params),
+	{}
+};
+
+static struct kunit_suite xe_rtp_test_suite = {
+	.name = "xe_wa",
+	.init = xe_wa_test_init,
+	.exit = xe_wa_test_exit,
+	.test_cases = xe_wa_tests,
+};
+
+kunit_test_suite(xe_rtp_test_suite);
+
+MODULE_AUTHOR("Intel Corporation");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(XE_KUNIT);
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 83f29aeb9250..b8939951bde7 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -44,6 +44,7 @@ int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_device *xe)
 
 	return drmm_add_action_or_reset(&xe->drm, reg_sr_fini, sr);
 }
+EXPORT_SYMBOL_NS_GPL(xe_reg_sr_init, XE_KUNIT);
 
 static struct xe_reg_sr_entry *alloc_entry(struct xe_reg_sr *sr)
 {
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 7ff5eb762da5..31b163b971fb 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -62,6 +62,7 @@ void xe_tuning_process_gt(struct xe_gt *gt)
 {
 	xe_rtp_process(gt_tunings, &gt->reg_sr, gt, NULL);
 }
+EXPORT_SYMBOL_NS_GPL(xe_tuning_process_gt, XE_KUNIT);
 
 /**
  * xe_tuning_process_lrc - process lrc tunings
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 59d2daab5929..282a25302e65 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -628,6 +628,7 @@ void xe_wa_process_gt(struct xe_gt *gt)
 {
 	xe_rtp_process(gt_was, &gt->reg_sr, gt, NULL);
 }
+EXPORT_SYMBOL_NS_GPL(xe_wa_process_gt, XE_KUNIT);
 
 /**
  * xe_wa_process_engine - process engine workaround table
-- 
2.39.0

