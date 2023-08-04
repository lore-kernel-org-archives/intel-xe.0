Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7A5C001DB
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 22:55:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FB910E173;
	Fri,  4 Aug 2023 22:55:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D1510E764;
 Fri,  4 Aug 2023 22:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691189749; x=1722725749;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8bIrsQqCpBVlAK/eu+yWgC6uJDWnEP5qJbMInord1B4=;
 b=JrT1m1LRtt/4qFYkb8HJOLu0Odlb8Sei5BGeFExmZBRtihw6efEAMoAG
 JlnpZukuRefVFAAVd9D0poV+5/Ul1/Y5r+yOex+ogtlFXL6auiV4EvhKy
 S/5/hcYuCrc6HONsrOrSFY5ST7glkizGgN40FSFNhYnsEoit8Xubnw+o8
 Ns7FhNJCo/2RW5ul8RAduLr+yozJOcujLCMB4qJqRmaMKpzBJ6bMnC9Fl
 btJsb7Y0mh3pbalKZDlCr7gp6tPTZCQaZ96xaoQW4kYVBEdZCjNNBpbBu
 wjS6pqp6VkuZ3Q8wVuEQnKXqiCN2nOVv1b2CZ/x4+w++mHu9az4XBhhEU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="360325211"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="360325211"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 15:55:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="733445189"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="733445189"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.4.149])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 15:55:23 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>
Date: Sat,  5 Aug 2023 00:52:23 +0200
Message-ID: <20230804225220.8005-7-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804225220.8005-5-janusz.krzysztofik@linux.intel.com>
References: <20230804225220.8005-5-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 2/3] kunit: Make 'list' action available to
 kunit test modules
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
Cc: linux-kernel@vger.kernel.org, Rae Moar <rmoar@google.com>,
 igt-dev@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-xe@lists.freedesktop.org, kunit-dev@googlegroups.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Results from kunit tests reported via dmesg may be interleaved with other
kernel messages.  When parsing dmesg for modular kunit results in real
time, external tools, e.g., Intel GPU tools (IGT), may want to insert
their own test name markers into dmesg at the start of each test, before
any kernel message related to that test appears there, so existing upper
level test result parsers have no doubt which test to blame for a specific
kernel message.  Unfortunately, kunit reports names of tests only at their
completion (with the exeption of a not standarized "# Subtest: <name>"
header above a test plan of each test suite or parametrized test).

External tools could be able to insert their own "start of the test"
markers with test names included if they new those names in advance.
Test names could be learned from a list if provided by a kunit test
module.

There exists a feature of listing kunit tests without actually executing
them, but it is now limited to configurations with the kunit module built
in and covers only built-in tests, already available at boot time.
Moreover, switching from list to normal mode requires reboot.  If that
feature was also available when kunit is built as a module, userspace
could load the module with action=list parameter, load some kunit test
modules they are interested in and learn about the list of tests provided
by those modules, then unload them, reload the kunit module in normal mode
and execute the tests with their lists already known.

Extend kunit module notifier initialization callback with a processing
path for only listing the tests provided by a module if the kunit action
parameter is set to "list" or "list_attr".  For user convenience, make the
kunit.action parameter visible in sysfs.

v2: Don't use a different format, use kunit_exec_list_tests() (Rae),
  - refresh on top of new attributes patches, handle newly introduced
    kunit.action=list_attr case (Rae).

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Rae Moar <rmoar@google.com>
---
 include/kunit/test.h |  2 ++
 lib/kunit/executor.c | 28 +++++++++++++++++-----------
 lib/kunit/test.c     | 18 +++++++++++++++---
 3 files changed, 34 insertions(+), 14 deletions(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index 3d002e6b252f2..6a338a3267ed5 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -309,6 +309,7 @@ static inline void kunit_set_failure(struct kunit *test)
 }
 
 bool kunit_enabled(void);
+const char *kunit_action(void);
 
 void kunit_init_test(struct kunit *test, const char *name, char *log);
 
@@ -324,6 +325,7 @@ int __kunit_test_suites_init(struct kunit_suite * const * const suites, int num_
 void __kunit_test_suites_exit(struct kunit_suite **suites, int num_suites);
 
 void kunit_exec_run_tests(struct kunit_suite_set *suite_set, bool builtin);
+void kunit_exec_list_tests(struct kunit_suite_set *suite_set, bool include_attr);
 
 #if IS_BUILTIN(CONFIG_KUNIT)
 int kunit_run_all_tests(void);
diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
index bd6f3b5dc47f7..b3878a34c35a5 100644
--- a/lib/kunit/executor.c
+++ b/lib/kunit/executor.c
@@ -13,22 +13,29 @@
 extern struct kunit_suite * const __kunit_suites_start[];
 extern struct kunit_suite * const __kunit_suites_end[];
 
+static char *action_param;
+
+module_param_named(action, action_param, charp, 0400);
+MODULE_PARM_DESC(action,
+		 "Changes KUnit executor behavior, valid values are:\n"
+		 "<none>: run the tests like normal\n"
+		 "'list' to list test names instead of running them.\n"
+		 "'list_attr' to list test names and attributes instead of running them.\n");
+
+const char *kunit_action(void)
+{
+	return action_param;
+}
+
 #if IS_BUILTIN(CONFIG_KUNIT)
 
 static char *filter_glob_param;
-static char *action_param;
 static char *filter_param;
 static char *filter_action_param;
 
 module_param_named(filter_glob, filter_glob_param, charp, 0);
 MODULE_PARM_DESC(filter_glob,
 		"Filter which KUnit test suites/tests run at boot-time, e.g. list* or list*.*del_test");
-module_param_named(action, action_param, charp, 0);
-MODULE_PARM_DESC(action,
-		 "Changes KUnit executor behavior, valid values are:\n"
-		 "<none>: run the tests like normal\n"
-		 "'list' to list test names instead of running them.\n"
-		 "'list_attr' to list test names and attributes instead of running them.\n");
 module_param_named(filter, filter_param, charp, 0);
 MODULE_PARM_DESC(filter,
 		"Filter which KUnit test suites/tests run at boot-time using attributes, e.g. speed>slow");
@@ -228,10 +235,7 @@ void kunit_exec_run_tests(struct kunit_suite_set *suite_set, bool builtin)
 	__kunit_test_suites_init(suite_set->start, num_suites);
 }
 
-#if IS_BUILTIN(CONFIG_KUNIT)
-
-static void kunit_exec_list_tests(struct kunit_suite_set *suite_set,
-				  bool include_attr)
+void kunit_exec_list_tests(struct kunit_suite_set *suite_set, bool include_attr)
 {
 	struct kunit_suite * const *suites;
 	struct kunit_case *test_case;
@@ -254,6 +258,8 @@ static void kunit_exec_list_tests(struct kunit_suite_set *suite_set,
 	}
 }
 
+#if IS_BUILTIN(CONFIG_KUNIT)
+
 int kunit_run_all_tests(void)
 {
 	struct kunit_suite_set suite_set = {
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 8b2808068497f..5232a43737826 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -739,13 +739,25 @@ static void kunit_module_init(struct module *mod)
 	struct kunit_suite_set suite_set = {
 		mod->kunit_suites, mod->kunit_suites + mod->num_kunit_suites,
 	};
-
-	kunit_exec_run_tests(&suite_set, false);
+	const char *action = kunit_action();
+
+	if (!action)
+		kunit_exec_run_tests(&suite_set, false);
+	else if (!strcmp(action, "list"))
+		kunit_exec_list_tests(&suite_set, false);
+	else if (!strcmp(action, "list_attr"))
+		kunit_exec_list_tests(&suite_set, true);
+	else
+		pr_err("kunit: unknown action '%s'\n", action);
 }
 
 static void kunit_module_exit(struct module *mod)
 {
-	__kunit_test_suites_exit(mod->kunit_suites, mod->num_kunit_suites);
+	const char *action = kunit_action();
+
+	if (!action)
+		__kunit_test_suites_exit(mod->kunit_suites,
+					 mod->num_kunit_suites);
 }
 
 static int kunit_module_notify(struct notifier_block *nb, unsigned long val,
-- 
2.41.0

