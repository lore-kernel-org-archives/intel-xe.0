Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905C3C19F4F
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 17:13:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B2610E411;
	Wed,  8 May 2024 17:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lcBjHB6s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C81C11290E
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 17:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715188384; x=1746724384;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1NiiQhh5WJEsQbmvQ+pZ3dZ8R1mnAUxeoz+5CCxvbpE=;
 b=lcBjHB6s5eixXvmNOdlXzBJwQ0ZqZQ3rBRIZf/NRAV2XlPm4Bfbmf2wS
 AVz9A5roXSCRG2SWBNa3h1AN4WYYE2lJp/Rg3LJwgVXl8TRqkGsvszt+D
 ZcLcy3a2zZSsEqn5n8ijaQXrioUxC/HODBiX7MLeTQk1kZds5QT1IyCs1
 gYeJ/pZoio5YLNEi2o91W5raCN8uxKCszifRBqZEEl2O0JDfVLTvdNjUT
 hPwFif/b6/zC1mHLdQcYDoqZkLQOdhXDFjUBlZsI6ibiVkXdjWHCNSEid
 hsHqdS063DzWruXbfbC3NgOpddV+JJiZMq/mYT+1RYSZdFKxQs9RuC6Ml w==;
X-CSE-ConnectionGUID: HLbp8y+pTeGzmC1ei+BY/w==
X-CSE-MsgGUID: xSCedw0LTH+TYLoXWGEiuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="21738551"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="21738551"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 10:10:18 -0700
X-CSE-ConnectionGUID: EFAPZxeaQaexhkq+lLotnw==
X-CSE-MsgGUID: HlSyR6y0SgiQBJTZg1+ijA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="28836817"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.252.59])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 10:10:17 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3] drm/xe: Rename few xe_args.h macros
Date: Wed,  8 May 2024 19:10:00 +0200
Message-Id: <20240508171000.1864-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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

To minimize the risk of future name collisions, rename macros to
always include the ARG or ARGS tag:

  DROP_FIRST to DROP_FIRST_ARG
  PICK_FIRST to FIRST_ARG
  PICK_LAST to LAST_ARG

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com> #v2
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: s/ARGS_TAIL/DROP_FIRST_ARG (Lucas)
v3: s/__PICK_ARG/__LAST_ARG (Lucas)
    promote and document PICK_ARG
---
 drivers/gpu/drm/xe/tests/xe_args_test.c | 101 ++++++++++++++++--------
 drivers/gpu/drm/xe/xe_args.h            |  72 +++++++++++------
 drivers/gpu/drm/xe/xe_rtp_helpers.h     |  12 +--
 3 files changed, 119 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_args_test.c b/drivers/gpu/drm/xe/tests/xe_args_test.c
index 9b44c1ab6364..f3fb23aa5d2e 100644
--- a/drivers/gpu/drm/xe/tests/xe_args_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_args_test.c
@@ -21,10 +21,10 @@ static void call_args_example(struct kunit *test)
 #undef buz
 }
 
-static void drop_first_example(struct kunit *test)
+static void drop_first_arg_example(struct kunit *test)
 {
 #define foo	X, Y, Z, Q
-#define bar	CALL_ARGS(COUNT_ARGS, DROP_FIRST(foo))
+#define bar	CALL_ARGS(COUNT_ARGS, DROP_FIRST_ARG(foo))
 
 	KUNIT_EXPECT_EQ(test, bar, 3);
 
@@ -32,12 +32,12 @@ static void drop_first_example(struct kunit *test)
 #undef bar
 }
 
-static void pick_first_example(struct kunit *test)
+static void first_arg_example(struct kunit *test)
 {
 	int X = 1;
 
 #define foo	X, Y, Z, Q
-#define bar	PICK_FIRST(foo)
+#define bar	FIRST_ARG(foo)
 
 	KUNIT_EXPECT_EQ(test, bar, X);
 	KUNIT_EXPECT_STREQ(test, __stringify(bar), "X");
@@ -46,12 +46,12 @@ static void pick_first_example(struct kunit *test)
 #undef bar
 }
 
-static void pick_last_example(struct kunit *test)
+static void last_arg_example(struct kunit *test)
 {
 	int Q = 1;
 
 #define foo	X, Y, Z, Q
-#define bar	PICK_LAST(foo)
+#define bar	LAST_ARG(foo)
 
 	KUNIT_EXPECT_EQ(test, bar, Q);
 	KUNIT_EXPECT_STREQ(test, __stringify(bar), "Q");
@@ -60,11 +60,29 @@ static void pick_last_example(struct kunit *test)
 #undef bar
 }
 
+static void pick_arg_example(struct kunit *test)
+{
+	int Y = 1, Z = 2;
+
+#define foo	X, Y, Z, Q
+#define bar	PICK_ARG(2, foo)
+#define buz	PICK_ARG3(foo)
+
+	KUNIT_EXPECT_EQ(test, bar, Y);
+	KUNIT_EXPECT_STREQ(test, __stringify(bar), "Y");
+	KUNIT_EXPECT_EQ(test, buz, Z);
+	KUNIT_EXPECT_STREQ(test, __stringify(buz), "Z");
+
+#undef foo
+#undef bar
+#undef buz
+}
+
 static void sep_comma_example(struct kunit *test)
 {
 #define foo(f)	f(X) f(Y) f(Z) f(Q)
-#define bar	DROP_FIRST(foo(ARGS_SEP_COMMA __stringify))
-#define buz	CALL_ARGS(COUNT_ARGS, DROP_FIRST(foo(ARGS_SEP_COMMA)))
+#define bar	DROP_FIRST_ARG(foo(ARGS_SEP_COMMA __stringify))
+#define buz	CALL_ARGS(COUNT_ARGS, DROP_FIRST_ARG(foo(ARGS_SEP_COMMA)))
 
 	static const char * const a[] = { bar };
 
@@ -123,61 +141,74 @@ static void call_args_test(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, MAX_ARGS), 12);
 }
 
-static void drop_first_test(struct kunit *test)
+static void drop_first_arg_test(struct kunit *test)
 {
 	int Y = -2, Z = -3, Q = -4;
-	int a[] = { DROP_FIRST(FOO_ARGS) };
+	int a[] = { DROP_FIRST_ARG(FOO_ARGS) };
 
-	KUNIT_EXPECT_EQ(test, DROP_FIRST(0, -1), -1);
-	KUNIT_EXPECT_EQ(test, DROP_FIRST(DROP_FIRST(0, -1, -2)), -2);
+	KUNIT_EXPECT_EQ(test, DROP_FIRST_ARG(0, -1), -1);
+	KUNIT_EXPECT_EQ(test, DROP_FIRST_ARG(DROP_FIRST_ARG(0, -1, -2)), -2);
 
-	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, DROP_FIRST(FOO_ARGS)), 3);
-	KUNIT_EXPECT_EQ(test, DROP_FIRST(DROP_FIRST(DROP_FIRST(FOO_ARGS))), -4);
+	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, DROP_FIRST_ARG(FOO_ARGS)), 3);
+	KUNIT_EXPECT_EQ(test, DROP_FIRST_ARG(DROP_FIRST_ARG(DROP_FIRST_ARG(FOO_ARGS))), -4);
 	KUNIT_EXPECT_EQ(test, a[0], -2);
 	KUNIT_EXPECT_EQ(test, a[1], -3);
 	KUNIT_EXPECT_EQ(test, a[2], -4);
-	KUNIT_EXPECT_STREQ(test, __stringify(DROP_FIRST(DROP_FIRST(DROP_FIRST(FOO_ARGS)))), "Q");
+
+#define foo	DROP_FIRST_ARG(FOO_ARGS)
+#define bar	DROP_FIRST_ARG(DROP_FIRST_ARG(FOO_ARGS))
+#define buz	DROP_FIRST_ARG(DROP_FIRST_ARG(DROP_FIRST_ARG(FOO_ARGS)))
+
+	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, foo), 3);
+	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, bar), 2);
+	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, buz), 1);
+	KUNIT_EXPECT_STREQ(test, __stringify(buz), "Q");
+
+#undef foo
+#undef bar
+#undef buz
 }
 
-static void pick_first_test(struct kunit *test)
+static void first_arg_test(struct kunit *test)
 {
 	int X = -1;
-	int a[] = { PICK_FIRST(FOO_ARGS) };
+	int a[] = { FIRST_ARG(FOO_ARGS) };
 
-	KUNIT_EXPECT_EQ(test, PICK_FIRST(-1, -2), -1);
+	KUNIT_EXPECT_EQ(test, FIRST_ARG(-1, -2), -1);
 
-	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, PICK_FIRST(FOO_ARGS)), 1);
-	KUNIT_EXPECT_EQ(test, PICK_FIRST(FOO_ARGS), -1);
+	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, FIRST_ARG(FOO_ARGS)), 1);
+	KUNIT_EXPECT_EQ(test, FIRST_ARG(FOO_ARGS), -1);
 	KUNIT_EXPECT_EQ(test, a[0], -1);
-	KUNIT_EXPECT_STREQ(test, __stringify(PICK_FIRST(FOO_ARGS)), "X");
+	KUNIT_EXPECT_STREQ(test, __stringify(FIRST_ARG(FOO_ARGS)), "X");
 }
 
-static void pick_last_test(struct kunit *test)
+static void last_arg_test(struct kunit *test)
 {
 	int Q = -4;
-	int a[] = { PICK_LAST(FOO_ARGS) };
+	int a[] = { LAST_ARG(FOO_ARGS) };
 
-	KUNIT_EXPECT_EQ(test, PICK_LAST(-1, -2), -2);
+	KUNIT_EXPECT_EQ(test, LAST_ARG(-1, -2), -2);
 
-	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, PICK_LAST(FOO_ARGS)), 1);
-	KUNIT_EXPECT_EQ(test, PICK_LAST(FOO_ARGS), -4);
+	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, LAST_ARG(FOO_ARGS)), 1);
+	KUNIT_EXPECT_EQ(test, LAST_ARG(FOO_ARGS), -4);
 	KUNIT_EXPECT_EQ(test, a[0], -4);
-	KUNIT_EXPECT_STREQ(test, __stringify(PICK_LAST(FOO_ARGS)), "Q");
+	KUNIT_EXPECT_STREQ(test, __stringify(LAST_ARG(FOO_ARGS)), "Q");
 
-	KUNIT_EXPECT_EQ(test, PICK_LAST(MAX_ARGS), -12);
-	KUNIT_EXPECT_STREQ(test, __stringify(PICK_LAST(MAX_ARGS)), "-12");
+	KUNIT_EXPECT_EQ(test, LAST_ARG(MAX_ARGS), -12);
+	KUNIT_EXPECT_STREQ(test, __stringify(LAST_ARG(MAX_ARGS)), "-12");
 }
 
 static struct kunit_case args_tests[] = {
 	KUNIT_CASE(count_args_test),
 	KUNIT_CASE(call_args_example),
 	KUNIT_CASE(call_args_test),
-	KUNIT_CASE(drop_first_example),
-	KUNIT_CASE(drop_first_test),
-	KUNIT_CASE(pick_first_example),
-	KUNIT_CASE(pick_first_test),
-	KUNIT_CASE(pick_last_example),
-	KUNIT_CASE(pick_last_test),
+	KUNIT_CASE(drop_first_arg_example),
+	KUNIT_CASE(drop_first_arg_test),
+	KUNIT_CASE(first_arg_example),
+	KUNIT_CASE(first_arg_test),
+	KUNIT_CASE(last_arg_example),
+	KUNIT_CASE(last_arg_test),
+	KUNIT_CASE(pick_arg_example),
 	KUNIT_CASE(sep_comma_example),
 	{}
 };
diff --git a/drivers/gpu/drm/xe/xe_args.h b/drivers/gpu/drm/xe/xe_args.h
index 40b9eb4151d8..4dbc7e53c624 100644
--- a/drivers/gpu/drm/xe/xe_args.h
+++ b/drivers/gpu/drm/xe/xe_args.h
@@ -35,7 +35,7 @@
 #define __CALL_ARGS(f, args...)		f(args)
 
 /**
- * DROP_FIRST - Returns all arguments except the first one.
+ * DROP_FIRST_ARG - Returns all arguments except the first one.
  * @args: arguments
  *
  * This helper macro allows manipulation the argument list before passing it
@@ -44,15 +44,15 @@
  * Example:
  *
  *	#define foo	X,Y,Z,Q
- *	#define bar	CALL_ARGS(COUNT_ARGS, DROP_FIRST(foo))
+ *	#define bar	CALL_ARGS(COUNT_ARGS, DROP_FIRST_ARG(foo))
  *
  *	With above definitions bar expands to 3.
  */
-#define DROP_FIRST(args...)		__DROP_FIRST(args)
-#define __DROP_FIRST(a, b...)		b
+#define DROP_FIRST_ARG(args...)		__DROP_FIRST_ARG(args)
+#define __DROP_FIRST_ARG(a, b...)	b
 
 /**
- * PICK_FIRST - Returns the first argument.
+ * FIRST_ARG - Returns the first argument.
  * @args: arguments
  *
  * This helper macro allows manipulation the argument list before passing it
@@ -61,15 +61,15 @@
  * Example:
  *
  *	#define foo	X,Y,Z,Q
- *	#define bar	PICK_FIRST(foo)
+ *	#define bar	FIRST_ARG(foo)
  *
  *	With above definitions bar expands to X.
  */
-#define PICK_FIRST(args...)		__PICK_FIRST(args)
-#define __PICK_FIRST(a, b...)		a
+#define FIRST_ARG(args...)		__FIRST_ARG(args)
+#define __FIRST_ARG(a, b...)		a
 
 /**
- * PICK_LAST - Returns the last argument.
+ * LAST_ARG - Returns the last argument.
  * @args: arguments
  *
  * This helper macro allows manipulation the argument list before passing it
@@ -80,24 +80,46 @@
  * Example:
  *
  *	#define foo	X,Y,Z,Q
- *	#define bar	PICK_LAST(foo)
+ *	#define bar	LAST_ARG(foo)
  *
  *	With above definitions bar expands to Q.
  */
-#define PICK_LAST(args...)		__PICK_ARG(COUNT_ARGS(args), args)
+#define LAST_ARG(args...)		__LAST_ARG(args)
+#define __LAST_ARG(args...)		PICK_ARG(COUNT_ARGS(args), args)
+
+/**
+ * PICK_ARG - Returns the n-th argument.
+ * @n: argument number to be returned
+ * @args: arguments
+ *
+ * This helper macro allows manipulation the argument list before passing it
+ * to the next level macro.
+ *
+ * Like COUNT_ARGS() this macro supports n up to 12.
+ * Specialized macros PICK_ARG1() to PICK_ARG12() are also available.
+ *
+ * Example:
+ *
+ *	#define foo	X,Y,Z,Q
+ *	#define bar	PICK_ARG(2, foo)
+ *	#define buz	PICK_ARG3(foo)
+ *
+ *	With above definitions bar expands to Y and buz expands to Z.
+ */
+#define PICK_ARG(n, args...)		__PICK_ARG(n, args)
 #define __PICK_ARG(n, args...)		CALL_ARGS(CONCATENATE(PICK_ARG, n), args)
-#define PICK_ARG1(args...)		PICK_FIRST(args)
-#define PICK_ARG2(args...)		PICK_ARG1(DROP_FIRST(args))
-#define PICK_ARG3(args...)		PICK_ARG2(DROP_FIRST(args))
-#define PICK_ARG4(args...)		PICK_ARG3(DROP_FIRST(args))
-#define PICK_ARG5(args...)		PICK_ARG4(DROP_FIRST(args))
-#define PICK_ARG6(args...)		PICK_ARG5(DROP_FIRST(args))
-#define PICK_ARG7(args...)		PICK_ARG6(DROP_FIRST(args))
-#define PICK_ARG8(args...)		PICK_ARG7(DROP_FIRST(args))
-#define PICK_ARG9(args...)		PICK_ARG8(DROP_FIRST(args))
-#define PICK_ARG10(args...)		PICK_ARG9(DROP_FIRST(args))
-#define PICK_ARG11(args...)		PICK_ARG10(DROP_FIRST(args))
-#define PICK_ARG12(args...)		PICK_ARG11(DROP_FIRST(args))
+#define PICK_ARG1(args...)		FIRST_ARG(args)
+#define PICK_ARG2(args...)		PICK_ARG1(DROP_FIRST_ARG(args))
+#define PICK_ARG3(args...)		PICK_ARG2(DROP_FIRST_ARG(args))
+#define PICK_ARG4(args...)		PICK_ARG3(DROP_FIRST_ARG(args))
+#define PICK_ARG5(args...)		PICK_ARG4(DROP_FIRST_ARG(args))
+#define PICK_ARG6(args...)		PICK_ARG5(DROP_FIRST_ARG(args))
+#define PICK_ARG7(args...)		PICK_ARG6(DROP_FIRST_ARG(args))
+#define PICK_ARG8(args...)		PICK_ARG7(DROP_FIRST_ARG(args))
+#define PICK_ARG9(args...)		PICK_ARG8(DROP_FIRST_ARG(args))
+#define PICK_ARG10(args...)		PICK_ARG9(DROP_FIRST_ARG(args))
+#define PICK_ARG11(args...)		PICK_ARG10(DROP_FIRST_ARG(args))
+#define PICK_ARG12(args...)		PICK_ARG11(DROP_FIRST_ARG(args))
 
 /**
  * ARGS_SEP_COMMA - Definition of a comma character.
@@ -109,8 +131,8 @@
  * Example:
  *
  *	#define foo(f)	f(X) f(Y) f(Z) f(Q)
- *	#define bar	DROP_FIRST(foo(ARGS_SEP_COMMA __stringify))
- *	#define buz	CALL_ARGS(COUNT_ARGS, DROP_FIRST(foo(ARGS_SEP_COMMA)))
+ *	#define bar	DROP_FIRST_ARG(foo(ARGS_SEP_COMMA __stringify))
+ *	#define buz	CALL_ARGS(COUNT_ARGS, DROP_FIRST_ARG(foo(ARGS_SEP_COMMA)))
  *
  *	With above definitions bar expands to
  *		"X", "Y", "Z", "Q"
diff --git a/drivers/gpu/drm/xe/xe_rtp_helpers.h b/drivers/gpu/drm/xe/xe_rtp_helpers.h
index 8129d6d9ef37..7735f217ba71 100644
--- a/drivers/gpu/drm/xe/xe_rtp_helpers.h
+++ b/drivers/gpu/drm/xe/xe_rtp_helpers.h
@@ -17,7 +17,7 @@
  */
 #define _XE_ESC(...) __VA_ARGS__
 
-#define _XE_TUPLE_TAIL(...) (DROP_FIRST(__VA_ARGS__))
+#define _XE_TUPLE_TAIL(...) (DROP_FIRST_ARG(__VA_ARGS__))
 
 #define _XE_RTP_CONCAT(a, b) CONCATENATE(XE_RTP_, CONCATENATE(a, b))
 
@@ -54,10 +54,10 @@
  *	XE_RTP_TEST_FOO BANANA XE_RTP_TEST_BAR
  */
 #define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_RTP_CONCAT(PASTE_, COUNT_ARGS args_)(prefix_, sep_, args_)
-#define XE_RTP_PASTE_1(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_)
-#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)
-#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
-#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define XE_RTP_PASTE_1(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_)
+#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
 
 /*
  * XE_RTP_DROP_CAST - Drop cast to convert a compound statement to a initializer
@@ -70,6 +70,6 @@
  *
  *	{ .a = 10 }
  */
-#define XE_RTP_DROP_CAST(...) _XE_ESC(DROP_FIRST _XE_ESC __VA_ARGS__)
+#define XE_RTP_DROP_CAST(...) _XE_ESC(DROP_FIRST_ARG _XE_ESC __VA_ARGS__)
 
 #endif
-- 
2.43.0

