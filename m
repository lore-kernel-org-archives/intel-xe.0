Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62DBC47258
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 18:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94CA710FBF6;
	Wed, 31 Jan 2024 18:12:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4ACC10FBF0;
 Wed, 31 Jan 2024 18:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706724750; x=1738260750;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LSxkW1upU1gCHUtla/p3TeEF0/rkL7OEyMICaXy/XbQ=;
 b=XVnDf21cukOGN4GPe0U6kFmtdiooBAg4NxSxfI7u8JHG2RkBS/3X/L48
 y+RmrzGOxvXlI4lyqF1vaS9/rfv2gMyNtpG0stW9+Vu2vpLHGvA3sO2br
 12vKOd+BMzKECHGbchVTpTI2MSCPTY/JRYLNDYsHz17JmBODlK7UG+LEP
 YSqSq2gYzIicCpy+yIIbpbeTewGFzMRrjRPi6qraBVRdOTjF54akIX6EB
 jEhjpgvudVYLCmX87yWJykbVvbK6kr5CqUynvoFRlF2xGt1aDI0XbislM
 vxZc8z2Yi+qDGEWSCKq4zVExmA1iXzfc/kNafUIEntTJHND5AFVA8I3Cj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="17067216"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="17067216"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 10:12:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="931930544"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="931930544"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.2.5])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 10:12:27 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 4/6] lib/kunit: Support writable filter* parameters
 of kunit module
Date: Wed, 31 Jan 2024 19:03:51 +0100
Message-ID: <20240131181156.80571-12-janusz.krzysztofik@linux.intel.com>
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

Instead of wasting resources on reloading the base Kunit module each time
a different set of filter parameters is needed, try to write the required
values to sysfs representation of those parameters.  If that fails (e.g.
on older LTS kernels with read-only filter parameters), fall back to
legacy "no list of test cases available" mode as we do on kernels with
those module parameters not supported at all.

This modification will also serve as a workaround for the issue of
impossibility to unload the base Kunit module on Xe platforms, available
to IGT as soon as the module supports writable filter parameters.

v2: Work around ineffective writes of empty strings to sysfs module
    parameter files (Lucas) by using human readable non-empty strings that
    give the same results as default NULLs,
  - drop fallback to reload of base Kunit module method if assigning new
    values to module parameters via sysfs fails (Lucas), instead use the
    existing fallback to blind execution like if getting a list of test
    cases was not supported at all,
  - split move of open_parameters() helper up in the source file as well
    as cleanup of base KUnit module unloading to separate patches (Kamil),
  - address the issue of the second paragraph of commit description
    suggesting two separate changes combined in one patch (Kamil) by
    rewording the description.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_kmod.c | 114 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 84 insertions(+), 30 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index d2c28d0a64..1d57ea708d 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -811,6 +811,56 @@ static int open_parameters(const char *module_name)
 	return open(path, O_RDONLY);
 }
 
+static const char *kunit_params[3] = {
+	"filter_glob", "filter", "filter_action",
+};
+
+static bool kunit_set_params(const char **values)
+{
+	/*
+	 * Reapplying default NULLs to module parameters via sysfs seems not
+	 * possible, and applying empty strings doesn't work as expected,
+	 * leaving current values untouched.  As a workaround, use
+	 * human-readable non-empty strings that exhibit the same behaviour
+	 * as if default NULLs were in place.  In case of filter_action
+	 * parameter there is no such obvious non-empty string, however,
+	 * that's not a problem for us since even if it was previously set
+	 * to "skip" and we leave it as is, our "module!=none" default filter
+	 * guarantees that no test cases are filtered out to be skipped.
+	 */
+	const char *defaults[ARRAY_SIZE(kunit_params)] = {
+	     /* filter_glob, filter,	     filter_action */
+		"*",	     "module!=none", "",
+	};
+	int i, params;
+	bool ret;
+
+	params = open_parameters("kunit");
+	ret = !igt_debug_on(params < 0);
+
+	for (i = 0; ret && i < ARRAY_SIZE(kunit_params); i++) {
+		char *param = igt_sysfs_get(params, kunit_params[i]);
+
+		if (igt_debug_on_f(!param, "param: %s\n", kunit_params[i])) {
+			ret = false;
+			break;
+		}
+
+		ret = !strcmp(param, values[i] ?: defaults[i]);
+		free(param);
+		if (!ret)
+			ret = !igt_debug_on(!igt_sysfs_set(params,
+							   kunit_params[i],
+							   values[i] ?:
+							   defaults[i]));
+	}
+
+	if (params >= 0)
+		close(params);
+
+	return ret;
+}
+
 struct modprobe_data {
 	struct kmod_module *kmod;
 	const char *opts;
@@ -1100,6 +1150,18 @@ static void kunit_get_tests(struct igt_list_head *tests,
 			    const char *filter,
 			    const char *opts)
 {
+	/*
+	 * To get a list of test cases provided by a kunit test module, ask the
+	 * generic kunit module to respond with SKIP result for each test found.
+	 * We could also try to use action=list kunit parameter to get the
+	 * listing, however, parsing a KTAP report -- something that we already
+	 * can do perfectly -- seems to be more safe than extracting a test case
+	 * list of unknown length from /dev/kmsg.
+	 */
+	const char *values[ARRAY_SIZE(kunit_params)] = {
+	     /* filter_glob, filter,	    filter_action */
+		NULL,	     "module=none", "skip",
+	};
 	char *suite_name = NULL, *case_name = NULL;
 	struct igt_ktap_result *r, *rn;
 	struct igt_ktap_results *ktap;
@@ -1113,27 +1175,21 @@ static void kunit_get_tests(struct igt_list_head *tests,
 
 	igt_skip_on(lseek(tst->kmsg, 0, SEEK_END) < 0);
 
-	/*
-	 * To get a list of test cases provided by a kunit test module, ask the
-	 * generic kunit module to respond with SKIP result for each test found.
-	 * We could also use action=list kunit parameter to get the listing,
-	 * however, parsing a KTAP report -- something that we already can do
-	 * perfectly -- seems to be more safe than extracting a test case list
-	 * of unknown length from /dev/kmsg.
-	 *
-	 * TODO: drop the following workaround, which is required by LTS kernel
-	 *       v6.1 not capable of listing test cases when built as a module.
-	 * If loading the kunit module with required parameters fails then
-	 * assume that we are running on a kernel with missing test case listing
-	 * capabilities.  Dont's skip but just return with empty list of test
-	 * cases, that should tell the caller to use a legacy method of
-	 * iterating over KTAP results collected from blind execution of all
-	 * Kunit test cases provided by a Kunit test module.
-	 */
-	igt_ignore_warn(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
-	if (igt_debug_on(igt_kmod_load("kunit",
-				       "filter=module=none filter_action=skip")))
+	if (igt_debug_on(!kunit_set_params(values))) {
+		/*
+		 * TODO: drop the following workaround, required by LTS kernel
+		 *       v6.1 not capable of listing test cases when built as as
+		 *       module, when no longer needed.
+		 * If updating writable filter parameters of the kunit base
+		 * module with required values then assume that we are running
+		 * on a kernel with missing test case listing capabilities.
+		 * Don't skip but just return with empty list of test cases,
+		 * which should tell the caller to use a legacy method of
+		 * iterating over KTAP results collected from blind execution
+		 * of all Kunit test cases provided by a Kunit test module.
+		 */
 		return;
+	}
 
 	igt_skip_on(modprobe(tst->kmod, opts));
 
@@ -1200,16 +1256,11 @@ static void __igt_kunit(struct igt_ktest *tst,
 			      t->case_name) {
 
 			if (!modprobe.thread) {
-				/*
-				 * Since we have successfully loaded the kunit
-				 * base module with non-default parameters in
-				 * order to get a list of test cases, now we
-				 * have to unload it so it is then automatically
-				 * reloaded with default parameter values when
-				 * we load the test module again for execution.
-				 */
-				igt_skip_on(igt_kmod_unload("kunit",
-							    KMOD_REMOVE_FORCE));
+				const char *values[ARRAY_SIZE(kunit_params)] = {
+					NULL, NULL, NULL,
+				};
+
+				igt_require(kunit_set_params(values));
 
 				igt_assert_eq(pthread_mutexattr_init(&attr), 0);
 				igt_assert_eq(pthread_mutexattr_setrobust(&attr,
@@ -1378,6 +1429,9 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
 		igt_assert(igt_list_empty(&tests));
 	}
 
+	/* We need the base KUnit module loaded if not built-in */
+	igt_ignore_warn(igt_kmod_load("kunit", NULL));
+
 	/*
 	 * We need to use igt_subtest here, as otherwise it may crash with:
 	 *  skipping is allowed only in fixtures, subtests or igt_simple_main
-- 
2.43.0

