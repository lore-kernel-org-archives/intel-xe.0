Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057CEC48286
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 19:03:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40ED10F2E0;
	Thu,  1 Feb 2024 19:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fHg7EyFN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F5110F2E0;
 Thu,  1 Feb 2024 19:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706814190; x=1738350190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s6A2sVgBZNr0PF8g9jmCVnFUUJcgbbJinWC+x5Q8gA4=;
 b=fHg7EyFNSgvCaddZKeCX+bp7vUXEcqEKMuyDGMqBrxjxaNJxx8VYP3H5
 8gmz1jAi8zxoXtCdsBF51kqZJtAe7TlSxWh40biKpKeRgfoKqGxlQ/4gA
 CaKygrR0oAdroEhfEYEagZgKCMGpoMqKPlzbl1cZHBaYZHjzTw+gjwLvf
 Tk4Xh8rCsPsfYgssMbV43dwDj1erUXV58oStL4AFolp4FK4vrTyEikaJl
 HVZgCwqsBZqu5VBfiA7J5YPdvlsgKGgfu8xzp56lNcLjxl/77i3I/64xN
 2lvpRCj5qmzeSQ4tjNFR9vp6Fb7exvGeISR1q7elS8w/W1TstVljd4fU7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="407694488"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="407694488"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:03:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="912219416"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="912219416"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.1.219])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:03:08 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v3 3/6] lib/kunit: Unload base KUnit module only before
 reloading it
Date: Thu,  1 Feb 2024 19:59:19 +0100
Message-ID: <20240201190237.150754-11-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201190237.150754-8-janusz.krzysztofik@linux.intel.com>
References: <20240201190237.150754-8-janusz.krzysztofik@linux.intel.com>
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

