Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6589DCD4F21
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 21:22:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2804010E09B;
	Wed, 13 May 2026 21:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ImSEJob5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5F710F08F
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 21:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778707323; x=1810243323;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I8F/td3TUUIGN7Blp2R3dfAMSDr+mAVdYLgUE6rtT9g=;
 b=ImSEJob5FIiSJNdw6yA7jH9vOVCsSj5It4ydKAV5Y2X8BXFHP6tdJBaQ
 +xwSqD3xdgXrkcgKv/4uQ8sDmHMpzl7xSjoU8HEuwqzzNo1Gmv41tqRCu
 DgNCIp71COhkrqiHM0bRCXI0hA2O7/0u/II/z7fyBJimxLYLD+hm5Vk5+
 ffSTD1mrLHNe1WPVepQyW1d081djXN5u0inwOZWiMtwxFvGddBLFMMjzF
 kDyovkHX2JUAuw+2imUqrhuPfgWTaNdUtmppIK6oVlDEzfqSSDm39Ihuf
 iq4FjYLlD+EpZGzuAWdm9Zpri+Z5o2mdz9KLCGg46cDyEf9iv99g8ugf+ w==;
X-CSE-ConnectionGUID: YdxyNZO9Q0qYZ4VEQhPlEg==
X-CSE-MsgGUID: VqdSy2g6TmK+jKo9uTRTIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79679041"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="79679041"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 14:22:03 -0700
X-CSE-ConnectionGUID: q1DGMZywS56QRRszRn5NDg==
X-CSE-MsgGUID: kHM9aB0SST2KCQM+MT1WkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="276295791"
Received: from vmonti-desk.jf.intel.com ([10.88.27.136])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 14:22:03 -0700
From: Violet Monti <violet.monti@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Violet Monti <violet.monti@intel.com>
Subject: [PATCH 2/4] drm/xe/rtp: Add GT WAs rule checking
Date: Wed, 13 May 2026 14:21:26 -0700
Message-ID: <20260513212129.691628-8-violet.monti@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513212129.691628-6-violet.monti@intel.com>
References: <20260513212129.691628-6-violet.monti@intel.com>
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

It is currently possible for a RTP rule, and subsequently a workaround,
to expect contexts that may not be present when the workaround is
applied. For example, the workarounds in the engine_was[] in drm/xe/xe_wa.c
expect an engine entity to be active. Conversely, the gt_was[] is not
depending on an engine entity to implement its workarounds. This kunit
test addition checks the gt_was[] workaround list for any workarounds
with specifically an engine_class rule. If a workaround does have an
engine_class rule, the workaround is then checked for the
"FOREACH_ENGINE" flag, which ensures the workaround is not implemented
in an improper context.

The result of this test is an expectation failure if a workaround has an
improper engine_class rule, and aims to prevent future issues of
gt_was being applied without proper contexts.

Signed-off-by: Violet Monti <violet.monti@intel.com>
---
 drivers/gpu/drm/xe/tests/Makefile             |  1 +
 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c | 76 +++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.h | 24 ++++++
 drivers/gpu/drm/xe/xe_wa.c                    |  2 +-
 drivers/gpu/drm/xe/xe_wa.h                    |  5 ++
 5 files changed, 107 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.h

diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
index 0e3408f4952c..f7aa47f11a36 100644
--- a/drivers/gpu/drm/xe/tests/Makefile
+++ b/drivers/gpu/drm/xe/tests/Makefile
@@ -9,5 +9,6 @@ obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_test.o
 xe_test-y = xe_test_mod.o \
 	xe_args_test.o \
 	xe_pci_test.o \
+	xe_rtp_tables_test.o \
 	xe_rtp_test.o \
 	xe_wa_test.o
diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
new file mode 100644
index 000000000000..100cac379b08
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <drm/drm_kunit_helpers.h>
+
+#include "xe_kunit_helpers.h"
+#include "xe_pci_test.h"
+#include "xe_rtp.h"
+#include "xe_rtp_tables_test.h"
+#include "xe_wa.h"
+
+static void xe_rtp_table_gt_test(struct kunit *test)
+{
+	const struct xe_rtp_entry_sr *param = test->param_value;
+
+	for (int i = 0; i < param->n_rules; i++) {
+		if (param->rules[i].match_type == XE_RTP_MATCH_ENGINE_CLASS)
+			KUNIT_EXPECT_EQ_MSG(test, param->flags,
+					    XE_RTP_ENTRY_FLAG_FOREACH_ENGINE,
+					    "GT WA %s has an invalid engine class rule setup",
+					    param->name);
+	}
+}
+
+static int xe_rtp_table_test_init(struct kunit *test)
+{
+	struct xe_device *xe;
+	struct device *dev;
+	int ret;
+
+	dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	xe = xe_kunit_helper_alloc_xe_device(test, dev);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
+
+	/* Initialize an empty device */
+	test->priv = NULL;
+
+	ret = xe_pci_fake_device_init(xe);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	xe->drm.dev = dev;
+	test->priv = xe;
+
+	return 0;
+}
+
+static void xe_rtp_table_test_exit(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+
+	drm_kunit_helper_free_device(test, xe->drm.dev);
+}
+
+static void rtp_table_gt_test_desc(const struct xe_rtp_entry_sr *t, char *desc)
+{
+	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+RTP_KUNIT_ARRAY_PARAM(rtp_table_gt, gt_was, rtp_table_gt_test_desc);
+
+static struct kunit_case xe_rtp_table_tests[] = {
+	KUNIT_CASE_PARAM(xe_rtp_table_gt_test, rtp_table_gt_gen_params),
+	{}
+};
+
+static struct kunit_suite xe_rtp_tables_test_suite = {
+	.name = "xe_rtp_tables_test",
+	.init = xe_rtp_table_test_init,
+	.exit = xe_rtp_table_test_exit,
+	.test_cases = xe_rtp_table_tests,
+};
+
+kunit_test_suite(xe_rtp_tables_test_suite);
diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.h b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.h
new file mode 100644
index 000000000000..3e91dd08f854
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 AND MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+// The "gen_params" function functionality does not work to dynamically collect the size
+// of the WA array, even with the new n_entries pointer. This addition builds on that framework
+// to allow dynamic sizing
+#define RTP_KUNIT_ARRAY_PARAM(name, array, get_desc)						\
+	static const void *name##_gen_params(struct kunit *test,				\
+					     const void *prev, char *desc)			\
+	{											\
+		typeof((array.entries)[0]) *__next = prev ?					\
+			((typeof(__next))prev) + 1 : (array.entries);				\
+		if (!prev)									\
+			kunit_register_params_array(test, array.entries, array.n_entries, NULL);\
+		if (__next - array.entries < array.n_entries) {					\
+			void (*__get_desc)(typeof(__next), char *) = get_desc;			\
+			if (__get_desc)								\
+				__get_desc(__next, desc);					\
+			return __next;								\
+		}										\
+		return NULL;									\
+	}
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 39c507edb8ce..285072fe0a47 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -130,7 +130,7 @@
 __diag_push();
 __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 
-static const struct xe_rtp_table_sr gt_was = XE_RTP_TABLE_SR(
+VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was = XE_RTP_TABLE_SR(
 	/* Workarounds applying over a range of IPs */
 
 	{ XE_RTP_NAME("14011060649"),
diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
index a5f7d33c1b32..17dff615e507 100644
--- a/drivers/gpu/drm/xe/xe_wa.h
+++ b/drivers/gpu/drm/xe/xe_wa.h
@@ -6,6 +6,7 @@
 #ifndef _XE_WA_H_
 #define _XE_WA_H_
 
+#include <kunit/visibility.h>
 #include "xe_assert.h"
 
 struct drm_printer;
@@ -24,6 +25,10 @@ void xe_wa_apply_tile_workarounds(struct xe_tile *tile);
 void xe_wa_device_dump(struct xe_device *xe, struct drm_printer *p);
 int xe_wa_gt_dump(struct xe_gt *gt, struct drm_printer *p);
 
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+extern VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was;
+#endif
+
 /**
  * XE_GT_WA - Out-of-band GT workarounds, to be queried and called as needed.
  * @gt__: gt instance
-- 
2.43.0

