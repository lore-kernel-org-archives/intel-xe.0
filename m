Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60A2C4828D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 10:15:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9444C10F14B;
	Tue,  6 Feb 2024 10:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CN6DVHH8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78AFB10F6D0;
 Tue,  6 Feb 2024 10:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707214555; x=1738750555;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5oMp0mWJO1J4DPiX1dZ+yHmdIwHyJXFq+NPP3d4L+EQ=;
 b=CN6DVHH8K7H185zKrgto6JhenZxBhNwLPx3lsEeiEcQcqY0nRwLzJG2q
 JC6IWERqtBslVD4/sS8sbgeMwQiuxDsSem3KowiwtghWP1IW+sg0rR2Dg
 HVFtJAf8vJNOH3vCEysOivZBMFMva9dEmwRjjBcOt23QcXruLLVtUWP4f
 6cc5ptuxO9ni++HPXSZuVBAwJJeyWDH5ws5viY2wmZTwO4NP9AHaQ3dSB
 rdZ6UY4PLhhfrbLScnEwu48Wujx62wjQBwWYm1O/iTZ2hevjylK0HXIni
 Sv8RkVXZ+bi7UJSr78JsOd0DBm+R8WekPLYUa7pG8W2hvm6fsYaDKxfH8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="4525578"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="4525578"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 02:15:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; d="scan'208";a="38405707"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.2.162])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 02:15:52 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v4 3/8] lib/kunit: Unload base KUnit module only before
 reloading it
Date: Tue,  6 Feb 2024 11:00:27 +0100
Message-ID: <20240206101514.6897-13-janusz.krzysztofik@linux.intel.com>
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

In preparation for replacement of the current method of reloading base
KUnit module with updating the module parameters via sysfs when a new set
of those parameters is needed, unload the module right before it is now
reloaded with new parameters, and stop unloading it in other places.
A follow-up patch will remove all those unloads still left, but even then
it will be shorter and more clean when based on top of this one.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_kmod.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 5a3bd9cf3a..2a1b09c0bd 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -1121,6 +1121,7 @@ static bool kunit_get_tests(struct igt_list_head *tests,
 	 * perfectly -- seems to be more safe than extracting a test case list
 	 * of unknown length from /dev/kmsg.
 	 */
+	igt_ignore_warn(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
 	if (igt_debug_on(igt_kmod_load("kunit",
 				       "filter=module=none filter_action=skip")))
 		return false;
@@ -1158,7 +1159,6 @@ static bool kunit_get_tests(struct igt_list_head *tests,
 	}
 
 	igt_skip_on(kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE));
-	igt_skip_on(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
 
 	igt_skip_on_f(err,
 		      "KTAP parser failed while getting a list of test cases\n");
@@ -1192,6 +1192,17 @@ static void __igt_kunit(struct igt_ktest *tst,
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
@@ -1356,15 +1367,6 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
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
 
@@ -1395,7 +1397,6 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
 		kunit_results_free(&tests, &suite_name, &case_name);
 
 		igt_ktest_end(&tst);
-		igt_debug_on(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
 	}
 
 	igt_ktest_fini(&tst);
-- 
2.43.0

