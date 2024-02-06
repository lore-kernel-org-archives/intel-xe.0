Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0C6C4829D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 10:16:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F6610FE43;
	Tue,  6 Feb 2024 10:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LZuyEGIO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFDD10FE43;
 Tue,  6 Feb 2024 10:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707214567; x=1738750567;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j96+DqaDeTLjxXPpgMwRWk8/9dKUaBgGe/i9mcoAa3g=;
 b=LZuyEGIOKiKSrlhiogbmHVCcZTTxF1PZM2K3n7nIVHruwVy+EkrahgaG
 5hSwdSEE8NPW+kOpxGzWdL6aZZqQl0mpkxTQGfX24C40LRmTwJgqEz+IT
 /jPIrt9o4iM2cFiNPvWJtNJMc8YYKq2PX2bYSrO74iOy5IeSh1LZxA2sB
 g4oPcCPb75Bde2AU+eyx2hEJ+KuExGyrGVCtI2qukjnc9A4NXN6BJ9oZ1
 Y8JiiLuiFLEpdK4gN95DsVQvyFwXfJ0NF+Zivi28VcQLcv37eeSXfIZp+
 SD0UV5L4uOpl9UNm4of4F91JrbYCsfUB0qIiYMBEn+HNKvWul3Vuwi0kR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="4525607"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="4525607"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 02:16:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; d="scan'208";a="38405740"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.2.162])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 02:16:04 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v4 7/8] lib/kunit: Fix API documentation
Date: Tue,  6 Feb 2024 11:00:31 +0100
Message-ID: <20240206101514.6897-17-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206101514.6897-10-janusz.krzysztofik@linux.intel.com>
References: <20240206101514.6897-10-janusz.krzysztofik@linux.intel.com>
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

The only IGT KUnit global function igt_kunit() accepts a "name" argument
documented as "the name of subtest, if different from that derived from
module name".  But in practice, we use that argument, if not NULL, as a
name of test suite to be executed.  We pass that value to kunit_get_tests()
as a filter that selects only test cases from that test suite.  We also
use that string, if not NULL, as subtest name, which we otherwise just
derive from module name.

Fix the documentation, and also use better names for the argument and a
local variable initialized as its copy.  For clarity, propagate those
new names as argument names down to lower level functions.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_kmod.c | 52 +++++++++++++++++++++++++++-----------------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index b5acc5a2a6..506093c954 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -1019,7 +1019,7 @@ static void kunit_results_free(struct igt_list_head *results,
 }
 
 static void __igt_kunit_legacy(struct igt_ktest *tst,
-			       const char *name,
+			       const char *subtest,
 			       const char *opts)
 {
 	struct modprobe_data modprobe = { tst->kmod, opts, 0, pthread_self(), };
@@ -1058,8 +1058,8 @@ static void __igt_kunit_legacy(struct igt_ktest *tst,
 		r = igt_list_first_entry(&results, r, link);
 
 		igt_dynamic_f("%s%s%s",
-			      strcmp(r->suite_name, name) ?  r->suite_name : "",
-			      strcmp(r->suite_name, name) ? "-" : "",
+			      strcmp(r->suite_name, subtest) ?  r->suite_name : "",
+			      strcmp(r->suite_name, subtest) ? "-" : "",
 			      r->case_name) {
 
 			if (r->code == IGT_EXIT_INVALID) {
@@ -1154,7 +1154,7 @@ static void __igt_kunit_legacy(struct igt_ktest *tst,
 
 static bool kunit_get_tests(struct igt_list_head *tests,
 			    struct igt_ktest *tst,
-			    const char *filter,
+			    const char *suite,
 			    const char *opts)
 {
 	char *suite_name = NULL, *case_name = NULL;
@@ -1201,10 +1201,10 @@ static bool kunit_get_tests(struct igt_list_head *tests,
 				break;
 			}
 
-			if (!filter)
+			if (!suite)
 				continue;
 
-			if (strcmp(r->suite_name, filter))
+			if (strcmp(r->suite_name, suite))
 				kunit_result_free(&r, &case_name, &suite_name);
 		}
 
@@ -1224,7 +1224,7 @@ static bool kunit_get_tests(struct igt_list_head *tests,
 }
 
 static void __igt_kunit(struct igt_ktest *tst,
-			const char *name,
+			const char *subtest,
 			const char *opts,
 			struct igt_list_head *tests)
 {
@@ -1244,8 +1244,8 @@ static void __igt_kunit(struct igt_ktest *tst,
 
 	igt_list_for_each_entry(t, tests, link) {
 		igt_dynamic_f("%s%s%s",
-			      strcmp(t->suite_name, name) ?  t->suite_name : "",
-			      strcmp(t->suite_name, name) ? "-" : "",
+			      strcmp(t->suite_name, subtest) ?  t->suite_name : "",
+			      strcmp(t->suite_name, subtest) ? "-" : "",
 			      t->case_name) {
 
 			if (!modprobe.thread) {
@@ -1380,29 +1380,33 @@ static void __igt_kunit(struct igt_ktest *tst,
 /**
  * igt_kunit:
  * @module_name: the name of the module
- * @name: the name of subtest, if different from that derived from module name
+ * @suite: the name of test suite to be executed, also used as subtest name;
+ *	   if NULL then test cases from all test suites provided by the module
+ *	   are executed as dynamic sub-subtests of one IGT subtest, which name
+ *	   is derived from the module name by cutting off its optional trailing
+ *	   _test or _kunit suffix
  * @opts: options to load the module
  *
  * Loads the test module, parses its (k)tap dmesg output, then unloads it
  */
-void igt_kunit(const char *module_name, const char *name, const char *opts)
+void igt_kunit(const char *module_name, const char *suite, const char *opts)
 {
 	struct igt_ktest tst = { .kmsg = -1, };
-	const char *filter = name;
+	const char *subtest = suite;
 	IGT_LIST_HEAD(tests);
 
 	/*
-	 * If the caller (an IGT test) provides no subtest name then we
-	 * take the module name, drop the trailing "_test" or "_kunit"
+	 * If the caller (an IGT test) provides no test suite name then
+	 * we take the module name, drop the trailing "_test" or "_kunit"
 	 * suffix, if any, and use the result as our IGT subtest name.
 	 */
-	if (!name) {
-		name = strdup(module_name);
-		if (!igt_debug_on(!name)) {
-			char *suffix = strstr(name, "_test");
+	if (!subtest) {
+		subtest = strdup(module_name);
+		if (!igt_debug_on(!subtest)) {
+			char *suffix = strstr(subtest, "_test");
 
 			if (!suffix)
-				suffix = strstr(name, "_kunit");
+				suffix = strstr(subtest, "_kunit");
 
 			if (suffix)
 				*suffix = '\0';
@@ -1410,7 +1414,7 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
 	}
 
 	igt_fixture {
-		igt_require(name);
+		igt_require(subtest);
 
 		igt_skip_on(igt_ktest_init(&tst, module_name));
 		igt_skip_on(igt_ktest_begin(&tst));
@@ -1428,7 +1432,7 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
 	 * proper namespace for dynamic subtests, with is required for CI
 	 * and for documentation.
 	 */
-	igt_subtest_with_dynamic(name) {
+	igt_subtest_with_dynamic(subtest) {
 		/*
 		 * TODO: As soon as no longer needed by major Linux
 		 *	 distributions, replace the fallback to
@@ -1436,10 +1440,10 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
 		 *	 LTS kernels not capable of using KUnit filters for
 		 *	 listing test cases in KTAP format, with igt_require.
 		 */
-		if (!kunit_get_tests(&tests, &tst, filter, opts))
-			__igt_kunit_legacy(&tst, name, opts);
+		if (!kunit_get_tests(&tests, &tst, suite, opts))
+			__igt_kunit_legacy(&tst, subtest, opts);
 		else
-			__igt_kunit(&tst, name, opts, &tests);
+			__igt_kunit(&tst, subtest, opts, &tests);
 	}
 
 	igt_fixture {
-- 
2.43.0

