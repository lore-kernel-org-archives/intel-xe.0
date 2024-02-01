Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73FEC4828D
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 19:03:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B38E10F2E6;
	Thu,  1 Feb 2024 19:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="COi1JhjT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1A910F2E4;
 Thu,  1 Feb 2024 19:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706814193; x=1738350193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l5vhnEtW2/JEKURA+nfmlnowXCq89XngL7oIgANo9A4=;
 b=COi1JhjTeGe/Dqh2jSjmLuEalONgHYEusZNgZXcdd2GPlesfdecsKz9b
 WNjTyYMZVDjKfZiXQIZ7U/Oaf2jJIli9QpeT5K3+pEz7ZviRFL+PuIgcH
 wv/7AbdQx710K5N9ivBbg3T2yhlRpslikfI3nZJPlnt6yhAscvUDfERAs
 zQlBzzCah9Nu9DG9UZPbi3/GlgZbDpCBnavkLA36XbvjKsHC/xnq4S9tX
 T3JuZIkQ8ZTYy6km77qV16Nr8/a6v8bmWKMPxgt5yykBA+JUGJZXiVrFj
 9fNDb2DnT7KGBxqaqy4zYIlVfkrFBsGk25ptXXSrUrW+tUuCx5R8bf1KQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="407694492"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="407694492"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:03:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="912219421"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="912219421"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.1.219])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:03:10 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v3 4/6] lib/kunit: Support writable filter* parameters
 of kunit module
Date: Thu,  1 Feb 2024 19:59:20 +0100
Message-ID: <20240201190237.150754-12-janusz.krzysztofik@linux.intel.com>
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

Instead of wasting resources on reloading the base Kunit module each time
a different set of filter parameters is needed, try to write the required
values to sysfs representation of those parameters.  If that fails (e.g.
on older LTS kernels with read-only filter parameters), fall back to
legacy "no list of test cases available" mode as we do on kernels with
those module parameters not supported at all.

This modification will also serve as a workaround for the issue of
impossibility to unload the base Kunit module on Xe platforms, available
to IGT as soon as the module supports writable filter parameters.

v3: Don't read-compare-write, just write the values (Lucas),
  - skip calling igt_sysfs_set() when the string to be written to
    filter_action is empty (Lucas),
  - warn if we leave the filter_action set to "skip" while setting a non-
    default value of the filter parameter,
  - transform generic kunit_set_params() to kunit_set_filtering().
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
 lib/igt_kmod.c | 91 +++++++++++++++++++++++++++++++++++---------------
 1 file changed, 65 insertions(+), 26 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index d2c28d0a64..83416d2aa4 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -811,6 +811,49 @@ static int open_parameters(const char *module_name)
 	return open(path, O_RDONLY);
 }
 
+static bool kunit_set_filtering(const char *filter_glob, const char *filter,
+				const char *filter_action)
+{
+	int params;
+	bool ret;
+
+	params = open_parameters("kunit");
+	ret = !igt_debug_on(params < 0);
+
+	/*
+	 * Default values of the KUnit base module filtering parameters
+	 * are all NULLs.  Reapplying those NULLs over sysfs once
+	 * overwritten with non-NULL strings seems not possible.
+	 * As a workaround, we use human-readable strings that exhibit
+	 * the same behaviour as if default NULLs were in place.
+	 */
+	if (ret)
+		ret = !igt_debug_on(!igt_sysfs_set(params, "filter_glob",
+						   filter_glob ?: "*"));
+	if (ret)
+		ret = !igt_debug_on(!igt_sysfs_set(params, "filter",
+						   filter ?: "module!=none"));
+	/*
+	 * In case of filter_action parameter there is no obvious human-
+	 * readable string that behaves like default NULL.  However, if NULL
+	 * is requested for both filter and filter_action then that's not a
+	 * problem for us since even if filter_action was previously set to
+	 * "skip" we can leave it as is because our "module!=none" default
+	 * filter guarantees that no test cases are filtered out to be skipped.
+	 */
+	if (ret)
+		ret = !igt_warn_on_f(!filter_action && filter,
+				     "test error: filter_action=NULL requires filter=NULL\n");
+	if (ret && filter_action)
+		ret = !igt_debug_on(!igt_sysfs_set(params, "filter_action",
+						   filter_action));
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
@@ -1116,24 +1159,26 @@ static void kunit_get_tests(struct igt_list_head *tests,
 	/*
 	 * To get a list of test cases provided by a kunit test module, ask the
 	 * generic kunit module to respond with SKIP result for each test found.
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
+	 * We could also try to use action=list kunit parameter to get the
+	 * listing, however, parsing a structured KTAP report -- something that
+	 * we already can do perfectly -- seems to be more safe than extracting
+	 * a free text list of unknown length from /dev/kmsg.
 	 */
-	igt_ignore_warn(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
-	if (igt_debug_on(igt_kmod_load("kunit",
-				       "filter=module=none filter_action=skip")))
+	if (igt_debug_on(!kunit_set_filtering(NULL, "module=none", "skip"))) {
+		/*
+		 * TODO: drop the following workaround, required by LTS kernel
+		 *       v6.1 not capable of listing test cases when built as as
+		 *       module, when no longer needed.
+		 * If updating writable filter parameters of the kunit base
+		 * module with required values fails then assume we are running
+		 * on a kernel with missing test case listing capabilities.
+		 * Don't skip but just return with empty list of test cases,
+		 * which should tell the caller to use a legacy method of
+		 * iterating over KTAP results collected from blind execution
+		 * of all Kunit test cases provided by a Kunit test module.
+		 */
 		return;
+	}
 
 	igt_skip_on(modprobe(tst->kmod, opts));
 
@@ -1200,16 +1245,7 @@ static void __igt_kunit(struct igt_ktest *tst,
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
+				igt_require(kunit_set_filtering(NULL, NULL, NULL));
 
 				igt_assert_eq(pthread_mutexattr_init(&attr), 0);
 				igt_assert_eq(pthread_mutexattr_setrobust(&attr,
@@ -1378,6 +1414,9 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
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

