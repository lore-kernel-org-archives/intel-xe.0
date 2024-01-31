Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64A4C47DB3
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 18:12:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E6F610FBF1;
	Wed, 31 Jan 2024 18:12:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C0610FBE9;
 Wed, 31 Jan 2024 18:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706724748; x=1738260748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r6790tI8DotVHhF7HB88J7DHoz4FOznIXDKbnu95v1s=;
 b=NU/+jSPMg3B/xD0gl6rUVMGi6grMHBigQUWRa59Fdi4RFyvj4CO55eCl
 u+rQF/RllOXmW1dLSymOpzlC/68q3Pg2r7UE8DxvA3sHxqpZskMl6EPsC
 YADM55EmO3b07E5cvSDO9rhwt+NlJT4uNhh/G+bWkZI4ZnfOI2TU//tjs
 c8ATekhlD+NZ8bwB47FRX819DhsuOO+it+NfU01a4GIy62pywuH9R+4Ug
 fsHuxnA9pwBDFYQDHwPA3QFhGyRdfJSgmc0Fe30iGeOzTali6NCN9v2zu
 GM12HRyqi+dqcSBv6CtpmzLmbXJRaiRoETiuNI1uwOQ7LLiv54B/8cXxi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="17067212"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="17067212"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 10:12:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="931930531"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="931930531"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.2.5])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 10:12:25 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 3/6] lib/kunit: Unload base KUnit module only before
 reloading it
Date: Wed, 31 Jan 2024 19:03:50 +0100
Message-ID: <20240131181156.80571-11-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240131181156.80571-8-janusz.krzysztofik@linux.intel.com>
References: <20240131181156.80571-8-janusz.krzysztofik@linux.intel.com>
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
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In preparation for replacement of the current method of reloading base
KUnit module when a new set of module parameters is needed with updating
those parameters via sysfs, unload the module right before it is now
reloaded with new parameters, and stop unloading it in other places.
Follow-up patches will remove some of the code added here, but even then
they will be shorter and more clean with that adjustment already in place.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_kmod.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index d1091bdc79..d2c28d0a64 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -1130,6 +1130,7 @@ static void kunit_get_tests(struct igt_list_head *tests,
 	 * iterating over KTAP results collected from blind execution of all
 	 * Kunit test cases provided by a Kunit test module.
 	 */
+	igt_ignore_warn(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
 	if (igt_debug_on(igt_kmod_load("kunit",
 				       "filter=module=none filter_action=skip")))
 		return;
@@ -1167,7 +1168,6 @@ static void kunit_get_tests(struct igt_list_head *tests,
 	}
 
 	igt_skip_on(kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE));
-	igt_skip_on(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
 
 	igt_skip_on_f(err,
 		      "KTAP parser failed while getting a list of test cases\n");
@@ -1200,6 +1200,17 @@ static void __igt_kunit(struct igt_ktest *tst,
 			      t->case_name) {
 
 			if (!modprobe.thread) {
+				/*
+				 * Since we have successfully loaded the kunit
+				 * base module with non-default parameters in
+				 * order to get a list of test cases, now we
+				 * have to unload it so it is then automatically
+				 * reloaded with default parameter values when
+				 * we load the test module again for execution.
+				 */
+				igt_skip_on(igt_kmod_unload("kunit",
+							    KMOD_REMOVE_FORCE));
+
 				igt_assert_eq(pthread_mutexattr_init(&attr), 0);
 				igt_assert_eq(pthread_mutexattr_setrobust(&attr,
 							  PTHREAD_MUTEX_ROBUST),
@@ -1364,15 +1375,6 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
 		igt_skip_on(igt_ktest_init(&tst, module_name));
 		igt_skip_on(igt_ktest_begin(&tst));
 
-		/*
-		 * Since we need to load kunit base module with specific
-		 * options in order to get a list of test cases, make
-		 * sure that the module is not loaded.  However, since
-		 * unload may fail if kunit base module is not loaded,
-		 * ignore any failures, we'll fail later if still loaded.
-		 */
-		igt_ignore_warn(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
-
 		igt_assert(igt_list_empty(&tests));
 	}
 
@@ -1404,7 +1406,6 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
 		kunit_results_free(&tests, &suite_name, &case_name);
 
 		igt_ktest_end(&tst);
-		igt_debug_on(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
 	}
 
 	igt_ktest_fini(&tst);
-- 
2.43.0

