Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA17C4829C
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 10:16:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A691127B3;
	Tue,  6 Feb 2024 10:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N8eL/dXa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A1910FB98;
 Tue,  6 Feb 2024 10:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707214570; x=1738750570;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M7VH2WrjKlrDOJ2VfQuXVxcP9Ki2b+b/xax4vldhL5M=;
 b=N8eL/dXaD8XnaZJcanTjvQeb2QwLfRgcPiCY+8GxuZyUb1jaVRpll8gS
 IsE+jyjGgRsPrd/QdKK1OFYVQaXZ01oaDb3ARb1p8tk/CedX9wLAuby6/
 qKCjn6d8GbJRNMzD8FB2z2APOuBOX+owzozaIf0bU3hWCwqlNw9Idw0af
 wCiXtxAUgWTDxOkSh7VKzrBdBKeCrahRbz63zTDgp/dkwbiQYvBTegsyw
 gWkQnjKxUnSozWcyqTjUpwISSvmjq/Eg1F/eFTYHYWy/j7RV/hZUpEtjR
 yAdUPIyyc/EaxgRmGfm3KkVKvujbHurrDsh4SCwAEpe0NT0qStMH7xdeu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="4525613"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="4525613"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 02:16:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; d="scan'208";a="38405750"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.2.162])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 02:16:06 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v4 8/8] lib/kunit: Perform test suite filtering on the
 kernel side
Date: Tue,  6 Feb 2024 11:00:32 +0100
Message-ID: <20240206101514.6897-18-janusz.krzysztofik@linux.intel.com>
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

When getting a list of test cases provided by a KUnit test module, we now
set KUnit filters in a way that results in all test cases from all test
suites of that module being reported as skipped, then we delete test cases
that don't belong to a requested test suite from the list.  Moreover,
before executing test cases from that list, we modify KUnit filters in a
way that all test cases from all test suites of the test module are
executed, but we report only those from the requested test suite.  Since
KUnit base module has a capability of filtering test cases by test suite
name, which we don't use, our approach to filtering is not optimal.

Limit kernel side processing to test cases that belong to the requested
test suite by setting KUnit filter_glob parameter to that test suite name,
and drop user side test suite filtering.  With user side post-processing
of test case lists limited to SKIP verification, defer cleanup of memory
occupied by the list entries to a first igt_fixture section that follows.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_kmod.c | 34 +++++++++-------------------------
 1 file changed, 9 insertions(+), 25 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 506093c954..9b92696f1f 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -1157,7 +1157,6 @@ static bool kunit_get_tests(struct igt_list_head *tests,
 			    const char *suite,
 			    const char *opts)
 {
-	char *suite_name = NULL, *case_name = NULL;
 	struct igt_ktap_result *r, *rn;
 	struct igt_ktap_results *ktap;
 	unsigned long taints;
@@ -1179,7 +1178,7 @@ static bool kunit_get_tests(struct igt_list_head *tests,
 	 * perfectly -- seems to be more safe than extracting a test case list
 	 * of unknown length from /dev/kmsg.
 	 */
-	if (igt_debug_on(!kunit_set_filtering(NULL, "module=none", "skip")))
+	if (igt_debug_on(!kunit_set_filtering(suite, "module=none", "skip")))
 		return false;
 
 	igt_skip_on(modprobe(tst->kmod, opts));
@@ -1194,30 +1193,13 @@ static bool kunit_get_tests(struct igt_list_head *tests,
 
 	igt_ktap_free(ktap);
 
-	if (!err)
-		igt_list_for_each_entry_safe(r, rn, tests, link) {
-			if (igt_debug_on(r->code != IGT_EXIT_SKIP)) {
-				err = r->code ?: -EPROTO;
-				break;
-			}
-
-			if (!suite)
-				continue;
-
-			if (strcmp(r->suite_name, suite))
-				kunit_result_free(&r, &case_name, &suite_name);
-		}
-
-	if (err) {
-		kunit_results_free(tests, &case_name, &suite_name);
-	} else {
-		free(suite_name);
-		free(case_name);
-	}
-
 	igt_skip_on_f(err,
 		      "KTAP parser failed while getting a list of test cases\n");
 
+	igt_list_for_each_entry_safe(r, rn, tests, link)
+		igt_require_f(r->code == IGT_EXIT_SKIP,
+			      "Unexpected non-SKIP result while listing test cases\n");
+
 	igt_skip_on(kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE));
 
 	return true;
@@ -1225,6 +1207,7 @@ static bool kunit_get_tests(struct igt_list_head *tests,
 
 static void __igt_kunit(struct igt_ktest *tst,
 			const char *subtest,
+			const char *suite,
 			const char *opts,
 			struct igt_list_head *tests)
 {
@@ -1249,7 +1232,8 @@ static void __igt_kunit(struct igt_ktest *tst,
 			      t->case_name) {
 
 			if (!modprobe.thread) {
-				igt_require(kunit_set_filtering(NULL, NULL, NULL));
+				igt_require(kunit_set_filtering(suite,
+								NULL, NULL));
 
 				igt_assert_eq(pthread_mutexattr_init(&attr), 0);
 				igt_assert_eq(pthread_mutexattr_setrobust(&attr,
@@ -1443,7 +1427,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
 		if (!kunit_get_tests(&tests, &tst, suite, opts))
 			__igt_kunit_legacy(&tst, subtest, opts);
 		else
-			__igt_kunit(&tst, subtest, opts, &tests);
+			__igt_kunit(&tst, subtest, suite, opts, &tests);
 	}
 
 	igt_fixture {
-- 
2.43.0

