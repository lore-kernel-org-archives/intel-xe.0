Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1917C4828D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 10:15:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E71210EAE9;
	Tue,  6 Feb 2024 10:15:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mq4em10e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3E110ECF5;
 Tue,  6 Feb 2024 10:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707214558; x=1738750558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fuDt+Qfm3Rm1dCdy9Uf3ODEf5QJWY9M9MlYap7Esh6o=;
 b=Mq4em10ecN2qULicl39Sn8xsgIXPU/h6EJEKwy8fZRAjtQZN8EDY95S1
 MwIcxgX92zEbpZ/wHs527yYpB4dvjgOo5TD1e8p/Klw2zwlNgQeESXxhY
 93D9VqMbk1vTmzTmCuVf/VQtd1W7BMfOZINm0Uy80Wd7XuGUO6S/RYBIu
 KuQ9jBwPWpLwMn0EAS2fOxlLh5qhJpX46N6bU9AsUQ3o97/x797GUpd5p
 ++swmLe9ERJtSQ9Uf9Jrtja2eKKoX+PoXxsczDb0NNKXp6Bp8gXYPNJj2
 9OVXAQOzSJNhRh1/zSHFuPRiNPXUY+GZPLgpbI1i0lFg2WrnH/VBhbCQN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="4525584"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="4525584"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 02:15:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; d="scan'208";a="38405712"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.2.162])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 02:15:55 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v4 4/8] lib/kunit: Support writable filter* parameters
 of kunit module
Date: Tue,  6 Feb 2024 11:00:28 +0100
Message-ID: <20240206101514.6897-14-janusz.krzysztofik@linux.intel.com>
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

Instead of wasting resources on reloading the base Kunit module each time
a different set of filter parameters is needed, try to write the required
values to sysfs representation of those parameters.

This modification will also serve as a workaround for the issue of
impossibility to unload the base Kunit module on Xe platforms, available
to IGT as soon as the module supports writable filter parameters.

v4: Return early when opening module parameters directory fails (Lucas),
  - use error unwind pattern on errors from sysfs writes,
  - replace "human-readable" with "non-NULL" in comments about strings
    used as equivalents of default NULLs,
  - use empty string as filter_action NULL equivalent, but verify if
    successfully applied when critical,
  - refresh commit description by removing a statement that addressed an
    update to a comment on legacy path, no longer in scope of this patch.
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
 lib/igt_kmod.c | 75 +++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 62 insertions(+), 13 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 2a1b09c0bd..5931121944 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -811,6 +811,63 @@ static int open_parameters(const char *module_name)
 	return open(path, O_RDONLY);
 }
 
+static bool kunit_set_filtering(const char *filter_glob, const char *filter,
+				const char *filter_action)
+{
+	int params;
+	bool ret;
+
+	params = open_parameters("kunit");
+	if (igt_debug_on(params < 0))
+		return false;
+
+	/*
+	 * Default values of the KUnit base module filtering parameters
+	 * are all NULLs.  Reapplying those NULLs over sysfs once
+	 * overwritten with non-NULL strings seems not possible.
+	 * As a workaround, we use non-NULL strings that exhibit
+	 * the same behaviour as if default NULLs were in place.
+	 */
+	ret = !igt_debug_on(!igt_sysfs_set(params, "filter_glob",
+					   filter_glob ?: "*"));
+	if (!ret)
+		goto close;
+
+	ret = !igt_debug_on(!igt_sysfs_set(params, "filter",
+					   filter ?: "module!=none"));
+	if (!ret)
+		goto close;
+
+	ret = !igt_debug_on(!igt_sysfs_set(params, "filter_action",
+					   filter_action ?: ""));
+
+	/*
+	 * TODO: Drop the extra check below as soon as igt_sysfs_set()
+	 *	 can correctly process empty strings which we are using
+	 *	 as filter_action NULL equivalent.
+	 *
+	 * We need this check only when NULL is requested for "filter_action"
+	 * and not for "filter" parameter, otherwise, even if "filter_action"
+	 * was previously set to "skip", we don't care since our
+	 * "module!=none" default filter guarantees that no test cases are
+	 * filtered out to be processed as "filter_action" says.
+	 */
+	if (ret && !filter_action && filter) {
+		filter_action = igt_sysfs_get(params, "filter_action");
+
+		ret = !(igt_debug_on_f(!filter_action,
+				       "open() failed\n") ||
+			igt_debug_on_f(strlen(filter_action),
+				       "empty string not applied\n"));
+		free((char *)filter_action);
+	}
+
+close:
+	close(params);
+
+	return ret;
+}
+
 struct modprobe_data {
 	struct kmod_module *kmod;
 	const char *opts;
@@ -1121,9 +1178,7 @@ static bool kunit_get_tests(struct igt_list_head *tests,
 	 * perfectly -- seems to be more safe than extracting a test case list
 	 * of unknown length from /dev/kmsg.
 	 */
-	igt_ignore_warn(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
-	if (igt_debug_on(igt_kmod_load("kunit",
-				       "filter=module=none filter_action=skip")))
+	if (igt_debug_on(!kunit_set_filtering(NULL, "module=none", "skip")))
 		return false;
 
 	igt_skip_on(modprobe(tst->kmod, opts));
@@ -1192,16 +1247,7 @@ static void __igt_kunit(struct igt_ktest *tst,
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
@@ -1370,6 +1416,9 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
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

