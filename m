Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D08CD4F5B
	for <intel-xe@archiver.kernel.org>; Tue, 19 May 2026 19:33:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DA710ECE7;
	Tue, 19 May 2026 19:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bx/TjYgi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B7010E3DA
 for <intel-xe@lists.freedesktop.org>; Tue, 19 May 2026 19:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779219220; x=1810755220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LI3LIGw/HiwAOdJl2GOpLqQNOM2pm5guJ5XsyDDBw7I=;
 b=Bx/TjYgiG+FnE/ZvkyCURpufBKF9I0jTTZe66+9qj6kIDj6/IYTRI4qM
 cr47HJHYQm7ygh/U5/LanxDkrorga3pykVB0LbV657zUBzsgG0S9OUUYs
 6FOA4edeZIVRxi8cXO7UrpRgBhQvWllBdfPnze3uCxGyT4zIT6vCgYJcs
 sZqSWXYhSKptfs9ZQJSV7r4mxMTeCDHz6cxfTQyjzTfYhtDhKWO3B3S5N
 +k8FpJxdx1VsVf058iR1MPTpoQG6hB2qK4Q7wjpvDsg+pWyBFoWDpn7wV
 +DXIK/Anfqw79Ed49wnO6rNMfoJxCFIq4ZfoT9bUNQ2Qp6cJXFdNXxcdU g==;
X-CSE-ConnectionGUID: /zqaWNOISRe8TzbcZlTepw==
X-CSE-MsgGUID: W3rN55YBRlqCz3Mc1KgBng==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91214948"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="91214948"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 12:33:39 -0700
X-CSE-ConnectionGUID: K6FlVXSiRAOYpab7LALo0g==
X-CSE-MsgGUID: kswCN/88ReOBo0EQY7r9QA==
X-ExtLoop1: 1
Received: from vmonti-desk.jf.intel.com ([10.88.27.136])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 12:33:03 -0700
From: Violet Monti <violet.monti@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Violet Monti <violet.monti@intel.com>
Subject: [PATCH v2 2/4] drm/xe/rtp: Ensure gt_was doesn't evaluate rules with
 engine types
Date: Tue, 19 May 2026 12:32:14 -0700
Message-ID: <20260519193216.546048-8-violet.monti@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519193216.546048-6-violet.monti@intel.com>
References: <20260519193216.546048-6-violet.monti@intel.com>
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
with XEP_RTP_ENGINE_CLASS() rules. If a workaround does have one of
these rules, the workaround is then checked for the "FOREACH_ENGINE" flag,
which ensures the workaround is implemented properly.

The result of this test is an expectation failure if a workaround has an
improper XE_RTP_ENGINE_CLASS() rule setup, and aims to prevent future
issues of gt_was workarounds being applied without proper contexts.

v2:
    - Moved contents of xe_rtp_tables_test.h to .c and removed file
    - Renamed macro RTP_KUNIT_ARRAY_PARAM to RTP_TABLE_PARAM
    - Removed unnecessary functions and iterative components from
      generated _gen_params functions and implemented usage of table
      name and WA number as entry name
    - Condensed xe_rtp_table_gt_test() to use KUNIT_EXPECT_TRUE with no
      message statement
    - Removed xe_rtp_table_test_init() and xe_rtp_table_test_exit() as
      fake device initialization is not necessary

Signed-off-by: Violet Monti <violet.monti@intel.com>
---
 drivers/gpu/drm/xe/tests/Makefile             |  1 +
 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c | 55 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa.c                    |  3 +-
 drivers/gpu/drm/xe/xe_wa.h                    |  5 ++
 4 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c

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
index 000000000000..01d2bc6e8aad
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
@@ -0,0 +1,55 @@
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
+#include "xe_wa.h"
+
+/**
+ * RTP_TABLE_PARAM() - Define test parameter generator from a RTP table.
+ * @table: array of test parameters which includes a n_entries value
+ *
+ * Define function @table_gen_params which uses @table to generate parameters.
+ */
+#define RTP_TABLE_PARAM(table)						\
+	static const void *table##_gen_params(struct kunit *test,				\
+					     const void *prev, char *desc)			\
+	{											\
+		typeof((table.entries)[0]) *__next = prev ?					\
+			((typeof(__next))prev) + 1 : (table.entries);				\
+		if (__next - table.entries < table.n_entries) {					\
+			scnprintf(desc, KUNIT_PARAM_DESC_SIZE, #table "/%s", __next->name);	\
+			return __next;								\
+		}										\
+		return NULL;									\
+	}
+
+static void xe_rtp_table_gt_test(struct kunit *test)
+{
+	const struct xe_rtp_entry_sr *entry = test->param_value;
+
+	for (int i = 0; i < entry->n_rules; i++)
+		KUNIT_EXPECT_TRUE(test,
+				  (entry->rules[i].match_type != XE_RTP_MATCH_ENGINE_CLASS &&
+				   entry->rules[i].match_type != XE_RTP_MATCH_NOT_ENGINE_CLASS) ||
+				  entry->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE);
+}
+
+RTP_TABLE_PARAM(gt_was);
+
+static struct kunit_case xe_rtp_table_tests[] = {
+	KUNIT_CASE_PARAM(xe_rtp_table_gt_test, gt_was_gen_params),
+	{}
+};
+
+static struct kunit_suite xe_rtp_tables_test_suite = {
+	.name = "xe_rtp_tables_test",
+	.test_cases = xe_rtp_table_tests,
+};
+
+kunit_test_suite(xe_rtp_tables_test_suite);
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index b9d9fe0801aa..1a1e04215f21 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -130,7 +130,7 @@
 __diag_push();
 __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 
-static const struct xe_rtp_table_sr gt_was = XE_RTP_TABLE_SR(
+VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was = XE_RTP_TABLE_SR(
 	/* Workarounds applying over a range of IPs */
 
 	{ XE_RTP_NAME("14011060649"),
@@ -307,6 +307,7 @@ static const struct xe_rtp_table_sr gt_was = XE_RTP_TABLE_SR(
 	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
 	},
 );
+EXPORT_SYMBOL_IF_KUNIT(gt_was);
 
 static const struct xe_rtp_table_sr engine_was = XE_RTP_TABLE_SR(
 	/* Workarounds applying over a range of IPs */
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

