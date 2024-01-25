Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09659C47258
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 16:59:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09EC10F935;
	Thu, 25 Jan 2024 16:59:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1708210F96E;
 Thu, 25 Jan 2024 16:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706201953; x=1737737953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dhnWjJ8+WAHmrCM4nMU3ypLwZWt9uDxhM1F6d/O+Fbg=;
 b=dy95Is+sbZYlFi3s/O5BfdLJ63otRPGlLCua5t/YhD1ONtO5rkNrRtmM
 HKELhtlXTfx9kgGwTiaGpOPMiQCXehnuyiI3fl2ajoAE09FBCp9/37S+G
 dgA0lB+XCVf5k9PZVIqZVHGoq5BQywPoLUsZQJlyL8ZWYAE2RSytzG6UN
 oOdiF7ToOBavVeEy5ceCaeSJAse87mIHbhKzQchn2JDDb8VC18wseMnDH
 ZD2xsuC/bx+IPAwWRSM3RPaXvWS9E8OHDTjvNgnJKvJ39yuLV0jDCKj1B
 2XFB3Eiz4xOYceJar6kPL3GIqFphj9pmH9+QCp6t6L5M0fk4/VHRZJ4dN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="23682496"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="23682496"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 08:58:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="786819895"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="786819895"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.20.225])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 08:58:24 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/3] lib/kunit: Support writable filter* parameters of
 kunit module
Date: Thu, 25 Jan 2024 17:52:10 +0100
Message-ID: <20240125165749.15599-6-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125165749.15599-5-janusz.krzysztofik@linux.intel.com>
References: <20240125165749.15599-5-janusz.krzysztofik@linux.intel.com>
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
reloading the module.

This change also provides a workaround for the issue of impossibility to
unload the base Kunit module on Xe platforms, available as soon as the
module supports writable filter parameters.

Since the base Kunit module is now unloaded from kunit_set_params() when
needed, drop other attempts to unload it.

To reuse an existing open_parameters() helper, moved it up in the source
file to avoid a forward declaration.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_kmod.c | 147 +++++++++++++++++++++++++++++++++++--------------
 1 file changed, 107 insertions(+), 40 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 250ab2107b..4f96dafe01 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -803,6 +803,78 @@ void igt_kselftest_get_tests(struct kmod_module *kmod,
 	kmod_module_info_free_list(pre);
 }
 
+static int open_parameters(const char *module_name)
+{
+	char path[256];
+
+	snprintf(path, sizeof(path), "/sys/module/%s/parameters", module_name);
+	return open(path, O_RDONLY);
+}
+
+static bool kunit_set_params(const char **name, const char **value, int count)
+{
+	static bool writable = true;
+	int i, ret, params;
+	char *opts = NULL;
+
+	if (!writable) {
+		if (count)
+			if (igt_debug_on(asprintf(&opts, "%s=%s",
+						  name[0], value[0]) < 0)) {
+				free(opts);
+				return false;
+			}
+
+		for (i = 1; i < count; i++) {
+			char *head = opts;
+
+			opts = NULL;
+			ret = asprintf(&opts, "%s %s=%s", head, name[i], value[i]);
+			free(head);
+			if (igt_debug_on(ret < 0)) {
+				free(opts);
+				return false;
+			}
+		}
+
+		igt_ignore_warn(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
+	}
+
+	ret = igt_debug_on(igt_kmod_load("kunit", opts));
+	free(opts);
+
+	if (ret && !writable)
+		return false;
+
+	params = open_parameters("kunit");
+	ret = igt_debug_on(params < 0);
+
+	for (i = 0; !ret && i < count; i++) {
+		char *param = igt_sysfs_get(params, name[i]);
+
+		if (igt_debug_on_f(!param, "param: %s\n", name[i])) {
+			ret = -1;
+			continue;
+		}
+
+		ret = strcmp(param, value[i]);
+		free(param);
+		if (ret)
+			ret = !igt_sysfs_set(params, name[i], value[i]);
+	}
+
+	if (params >= 0)
+		close(params);
+
+	if (!ret)
+		return true;
+	if (!writable)
+		return false;
+
+	writable = false;
+	return kunit_set_params(name, value, count);
+}
+
 struct modprobe_data {
 	struct kmod_module *kmod;
 	const char *opts;
@@ -814,11 +886,17 @@ struct modprobe_data {
 
 static void *modprobe_task(void *arg)
 {
+	const char *param[3] = { "filter_glob", "filter", "filter_action", };
+	const char *value[3] = { "*", "", "", };
 	struct modprobe_data *data = arg;
+	bool ret;
+
+	ret = kunit_set_params(param, value, ARRAY_SIZE(param));
 
-	data->err = modprobe(data->kmod, data->opts);
+	if (ret)
+		data->err = modprobe(data->kmod, data->opts);
 
-	if (igt_debug_on(data->err)) {
+	if (igt_debug_on(!ret || data->err)) {
 		bool once = false;
 		int err;
 
@@ -1092,9 +1170,20 @@ static void kunit_get_tests(struct igt_list_head *tests,
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
+	const char *param[3] = { "filter_glob", "filter", "filter_action", };
+	const char *value[3] = { "*", "module=none", "skip", };
 	char *suite_name = NULL, *case_name = NULL;
 	struct igt_ktap_result *r, *rn;
 	struct igt_ktap_results *ktap;
+	unsigned long taints;
 	int flags, err;
 
 	igt_skip_on_f(tst->kmsg < 0, "Could not open /dev/kmsg\n");
@@ -1105,26 +1194,23 @@ static void kunit_get_tests(struct igt_list_head *tests,
 
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
-	if (igt_debug_on(igt_kmod_load("kunit",
-				       "filter=module=none filter_action=skip")))
+	if (igt_debug_on(!kunit_set_params(param, value, ARRAY_SIZE(param)))) {
+		/*
+		 * TODO: drop the following workaround, required by LTS kernel
+		 *       v6.1 not capable of listing test cases when built as as
+		 *       module, when no longer needed.
+		 * If updating writable filter parameters of the kunit base
+		 * module with required values or reloading that module with
+		 * those parameters specified fails then assume that we are
+		 * running on a kernel with missing test case listing
+		 * capabilities.  Dont skip but just return with empty list of
+		 * test cases, which should tell the caller to use a legacy
+		 * method of iterating over KTAP results collected from blind
+		 * execution of all Kunit test cases provided by a Kunit test
+		 * module.
+		 */
 		return;
+	}
 
 	igt_skip_on(modprobe(tst->kmod, opts));
 
@@ -1159,7 +1245,6 @@ static void kunit_get_tests(struct igt_list_head *tests,
 	}
 
 	igt_skip_on(kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE));
-	igt_skip_on(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
 
 	igt_skip_on_f(err,
 		      "KTAP parser failed while getting a list of test cases\n");
@@ -1355,15 +1440,6 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
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
 
@@ -1395,20 +1471,11 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
 		kunit_results_free(&tests, &suite_name, &case_name);
 
 		igt_ktest_end(&tst);
-		igt_debug_on(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
 	}
 
 	igt_ktest_fini(&tst);
 }
 
-static int open_parameters(const char *module_name)
-{
-	char path[256];
-
-	snprintf(path, sizeof(path), "/sys/module/%s/parameters", module_name);
-	return open(path, O_RDONLY);
-}
-
 int igt_ktest_init(struct igt_ktest *tst,
 		   const char *module_name)
 {
-- 
2.43.0

