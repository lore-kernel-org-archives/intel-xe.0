Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A97C25B10
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 22:33:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B18A1126EB;
	Thu,  2 May 2024 22:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BeCSWoio";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0093410F6AA
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 22:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714689209; x=1746225209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IN6wGEuqrDAlcJu+v5mzMrFaN17dionP18WVbWDfIr8=;
 b=BeCSWoiout5jbstismoyznsdWaNNiyGOX2mWV30btxiVgdJJlV+3NiyI
 QMTJIDcqm2pdAqx6jvDgMmJLjdq+HDY0cWaUoBq+BK7XervkVdV5ijm4z
 J6hfPWZfcyye1RgS2wVhU2Ujv7WFH/RUSQaEXBx5PO+yUSZTbT1A25hPW
 SZcfKCiuo4c/6RrCIx+bANW5N118WZNjw0IEvX5d91eweKef8l560t0Lo
 +3q62brWhjIqrZA9Lxbt7sa0n+dis7VMhHEZUuTiz2giBeUIauDthK9L2
 nwVNJWkteA/Db+3WcImrRc8gJvCDpkJBYY5REMeWc2nKbzAsj4gUMsIeW Q==;
X-CSE-ConnectionGUID: UoWcuYIMRUyDr83qlCh58w==
X-CSE-MsgGUID: OOpmBnjvTaqJc8n+8aS6lQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10312976"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="10312976"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 15:33:29 -0700
X-CSE-ConnectionGUID: StxkVpsCSRix6BiwZPwJmQ==
X-CSE-MsgGUID: WaN1ZJ55Ql2zxMlhKmpd6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="32061555"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.17.255])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 15:33:28 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 2/3] drm/xe/kunit: Add simple tests for new xe_args macros
Date: Fri,  3 May 2024 00:33:12 +0200
Message-Id: <20240502223313.2527-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240502223313.2527-1-michal.wajdeczko@intel.com>
References: <20240502223313.2527-1-michal.wajdeczko@intel.com>
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

We want to make sure that helper macros are working as expected.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/Makefile       |   1 +
 drivers/gpu/drm/xe/tests/xe_args_test.c | 190 ++++++++++++++++++++++++
 2 files changed, 191 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_args_test.c

diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
index 8cf2367449d8..6e58931fddd4 100644
--- a/drivers/gpu/drm/xe/tests/Makefile
+++ b/drivers/gpu/drm/xe/tests/Makefile
@@ -11,6 +11,7 @@ xe_live_test-y = xe_live_test_mod.o \
 # Normal kunit tests
 obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_test.o
 xe_test-y = xe_test_mod.o \
+	xe_args_test.o \
 	xe_pci_test.o \
 	xe_rtp_test.o \
 	xe_wa_test.o
diff --git a/drivers/gpu/drm/xe/tests/xe_args_test.c b/drivers/gpu/drm/xe/tests/xe_args_test.c
new file mode 100644
index 000000000000..9b44c1ab6364
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_args_test.c
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include "xe_args.h"
+
+static void call_args_example(struct kunit *test)
+{
+#define foo	X, Y, Z, Q
+#define bar	COUNT_ARGS(foo)
+#define buz	CALL_ARGS(COUNT_ARGS, foo)
+
+	KUNIT_EXPECT_EQ(test, bar, 1);
+	KUNIT_EXPECT_EQ(test, buz, 4);
+
+#undef foo
+#undef bar
+#undef buz
+}
+
+static void drop_first_example(struct kunit *test)
+{
+#define foo	X, Y, Z, Q
+#define bar	CALL_ARGS(COUNT_ARGS, DROP_FIRST(foo))
+
+	KUNIT_EXPECT_EQ(test, bar, 3);
+
+#undef foo
+#undef bar
+}
+
+static void pick_first_example(struct kunit *test)
+{
+	int X = 1;
+
+#define foo	X, Y, Z, Q
+#define bar	PICK_FIRST(foo)
+
+	KUNIT_EXPECT_EQ(test, bar, X);
+	KUNIT_EXPECT_STREQ(test, __stringify(bar), "X");
+
+#undef foo
+#undef bar
+}
+
+static void pick_last_example(struct kunit *test)
+{
+	int Q = 1;
+
+#define foo	X, Y, Z, Q
+#define bar	PICK_LAST(foo)
+
+	KUNIT_EXPECT_EQ(test, bar, Q);
+	KUNIT_EXPECT_STREQ(test, __stringify(bar), "Q");
+
+#undef foo
+#undef bar
+}
+
+static void sep_comma_example(struct kunit *test)
+{
+#define foo(f)	f(X) f(Y) f(Z) f(Q)
+#define bar	DROP_FIRST(foo(ARGS_SEP_COMMA __stringify))
+#define buz	CALL_ARGS(COUNT_ARGS, DROP_FIRST(foo(ARGS_SEP_COMMA)))
+
+	static const char * const a[] = { bar };
+
+	KUNIT_EXPECT_STREQ(test, a[0], "X");
+	KUNIT_EXPECT_STREQ(test, a[1], "Y");
+	KUNIT_EXPECT_STREQ(test, a[2], "Z");
+	KUNIT_EXPECT_STREQ(test, a[3], "Q");
+
+	KUNIT_EXPECT_EQ(test, buz, 4);
+
+#undef foo
+#undef bar
+#undef buz
+}
+
+#define NO_ARGS
+#define FOO_ARGS	X, Y, Z, Q
+#define MAX_ARGS	-1, -2, -3, -4, -5, -6, -7, -8, -9, -10, -11, -12
+
+static void count_args_test(struct kunit *test)
+{
+	int count;
+
+	/* COUNT_ARGS() counts to 12 */
+
+	count = COUNT_ARGS();
+	KUNIT_EXPECT_EQ(test, count, 0);
+
+	count = COUNT_ARGS(1);
+	KUNIT_EXPECT_EQ(test, count, 1);
+
+	count = COUNT_ARGS(a, b, c, d, e);
+	KUNIT_EXPECT_EQ(test, count, 5);
+
+	count = COUNT_ARGS(a, b, c, d, e, f, g, h, i, j, k, l);
+	KUNIT_EXPECT_EQ(test, count, 12);
+
+	/* COUNT_ARGS() does not expand params */
+
+	count = COUNT_ARGS(NO_ARGS);
+	KUNIT_EXPECT_EQ(test, count, 1);
+
+	count = COUNT_ARGS(FOO_ARGS);
+	KUNIT_EXPECT_EQ(test, count, 1);
+}
+
+static void call_args_test(struct kunit *test)
+{
+	int count;
+
+	count = CALL_ARGS(COUNT_ARGS, NO_ARGS);
+	KUNIT_EXPECT_EQ(test, count, 0);
+	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, NO_ARGS), 0);
+	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, FOO_ARGS), 4);
+	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, FOO_ARGS, FOO_ARGS), 8);
+	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, MAX_ARGS), 12);
+}
+
+static void drop_first_test(struct kunit *test)
+{
+	int Y = -2, Z = -3, Q = -4;
+	int a[] = { DROP_FIRST(FOO_ARGS) };
+
+	KUNIT_EXPECT_EQ(test, DROP_FIRST(0, -1), -1);
+	KUNIT_EXPECT_EQ(test, DROP_FIRST(DROP_FIRST(0, -1, -2)), -2);
+
+	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, DROP_FIRST(FOO_ARGS)), 3);
+	KUNIT_EXPECT_EQ(test, DROP_FIRST(DROP_FIRST(DROP_FIRST(FOO_ARGS))), -4);
+	KUNIT_EXPECT_EQ(test, a[0], -2);
+	KUNIT_EXPECT_EQ(test, a[1], -3);
+	KUNIT_EXPECT_EQ(test, a[2], -4);
+	KUNIT_EXPECT_STREQ(test, __stringify(DROP_FIRST(DROP_FIRST(DROP_FIRST(FOO_ARGS)))), "Q");
+}
+
+static void pick_first_test(struct kunit *test)
+{
+	int X = -1;
+	int a[] = { PICK_FIRST(FOO_ARGS) };
+
+	KUNIT_EXPECT_EQ(test, PICK_FIRST(-1, -2), -1);
+
+	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, PICK_FIRST(FOO_ARGS)), 1);
+	KUNIT_EXPECT_EQ(test, PICK_FIRST(FOO_ARGS), -1);
+	KUNIT_EXPECT_EQ(test, a[0], -1);
+	KUNIT_EXPECT_STREQ(test, __stringify(PICK_FIRST(FOO_ARGS)), "X");
+}
+
+static void pick_last_test(struct kunit *test)
+{
+	int Q = -4;
+	int a[] = { PICK_LAST(FOO_ARGS) };
+
+	KUNIT_EXPECT_EQ(test, PICK_LAST(-1, -2), -2);
+
+	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, PICK_LAST(FOO_ARGS)), 1);
+	KUNIT_EXPECT_EQ(test, PICK_LAST(FOO_ARGS), -4);
+	KUNIT_EXPECT_EQ(test, a[0], -4);
+	KUNIT_EXPECT_STREQ(test, __stringify(PICK_LAST(FOO_ARGS)), "Q");
+
+	KUNIT_EXPECT_EQ(test, PICK_LAST(MAX_ARGS), -12);
+	KUNIT_EXPECT_STREQ(test, __stringify(PICK_LAST(MAX_ARGS)), "-12");
+}
+
+static struct kunit_case args_tests[] = {
+	KUNIT_CASE(count_args_test),
+	KUNIT_CASE(call_args_example),
+	KUNIT_CASE(call_args_test),
+	KUNIT_CASE(drop_first_example),
+	KUNIT_CASE(drop_first_test),
+	KUNIT_CASE(pick_first_example),
+	KUNIT_CASE(pick_first_test),
+	KUNIT_CASE(pick_last_example),
+	KUNIT_CASE(pick_last_test),
+	KUNIT_CASE(sep_comma_example),
+	{}
+};
+
+static struct kunit_suite args_test_suite = {
+	.name = "args",
+	.test_cases = args_tests,
+};
+
+kunit_test_suite(args_test_suite);
-- 
2.43.0

