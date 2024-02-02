Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE13C4828E
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 10:22:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0852E10EF05;
	Fri,  2 Feb 2024 10:22:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CHx8j3Ki";
	dkim-atps=neutral
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Fri, 02 Feb 2024 10:22:04 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77DDD10EEE5;
 Fri,  2 Feb 2024 10:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706869324; x=1738405324;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iyJwkflSKcN99/L6B8ptfohtYXioyUrxYuOAXQisO7U=;
 b=CHx8j3Kih/91kU4rPsdkiCUtKr+sK2mugWtYmTEuEOX1DUE9s+Rk5sZB
 X/a3lFrAQSVGRRj0Lguvx/Td5HKysWrv73fkDSDosSDNmz18y/io9cIzv
 I5vIxePi9j+3zpMZJyqveXBkLx7b4tEYsSXwqfWWQRCP6jeoq5h/rfXns
 CFai487Zpp7kisminfELW/32XbEQ3FLSW7G2wF/R67p6OkWz0WM/eOgfn
 p0bsg5KlJgeDBXYgrGxLTlg8oQ2E7OOkZ+makjYd5IraXGDx16lmNXIKc
 N0FvHAPb8bqlJ/jGeZbPN1sVa3cWxziRYLBoLptWeNGep8u3DUFtZmG3J A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="34469"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; 
   d="scan'208";a="34469"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 02:14:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; 
   d="scan'208";a="44913"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.2.73])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 02:14:53 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t v3 4/6] lib/kunit: Support writable filter*
 parameters of kunit module
Date: Fri, 02 Feb 2024 11:14:49 +0100
Message-ID: <3705187.TKLx3GfHUD@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <3ehhnx6ijqdzahhkemcf5x4avps4e6inrrgd6p4dqgvu7ydo32@zs7hpimyjhy4>
References: <20240201190237.150754-8-janusz.krzysztofik@linux.intel.com>
 <20240201190237.150754-12-janusz.krzysztofik@linux.intel.com>
 <3ehhnx6ijqdzahhkemcf5x4avps4e6inrrgd6p4dqgvu7ydo32@zs7hpimyjhy4>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

On Thursday, 1 February 2024 21:26:35 CET Lucas De Marchi wrote:
> On Thu, Feb 01, 2024 at 07:59:20PM +0100, Janusz Krzysztofik wrote:
> >Instead of wasting resources on reloading the base Kunit module each time
> >a different set of filter parameters is needed, try to write the required
> >values to sysfs representation of those parameters.  If that fails (e.g.
> >on older LTS kernels with read-only filter parameters), fall back to
> >legacy "no list of test cases available" mode as we do on kernels with
> >those module parameters not supported at all.
> >
> >This modification will also serve as a workaround for the issue of
> >impossibility to unload the base Kunit module on Xe platforms, available
> >to IGT as soon as the module supports writable filter parameters.
> >
> >v3: Don't read-compare-write, just write the values (Lucas),
> >  - skip calling igt_sysfs_set() when the string to be written to
> >    filter_action is empty (Lucas),
> >  - warn if we leave the filter_action set to "skip" while setting a non-
> >    default value of the filter parameter,
> >  - transform generic kunit_set_params() to kunit_set_filtering().
> >v2: Work around ineffective writes of empty strings to sysfs module
> >    parameter files (Lucas) by using human readable non-empty strings that
> >    give the same results as default NULLs,
> >  - drop fallback to reload of base Kunit module method if assigning new
> >    values to module parameters via sysfs fails (Lucas), instead use the
> >    existing fallback to blind execution like if getting a list of test
> >    cases was not supported at all,
> >  - split move of open_parameters() helper up in the source file as well
> >    as cleanup of base KUnit module unloading to separate patches (Kamil),
> >  - address the issue of the second paragraph of commit description
> >    suggesting two separate changes combined in one patch (Kamil) by
> >    rewording the description.
> >
> >Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> >Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> >---
> > lib/igt_kmod.c | 91 +++++++++++++++++++++++++++++++++++---------------
> > 1 file changed, 65 insertions(+), 26 deletions(-)
> >
> >diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> >index d2c28d0a64..83416d2aa4 100644
> >--- a/lib/igt_kmod.c
> >+++ b/lib/igt_kmod.c
> >@@ -811,6 +811,49 @@ static int open_parameters(const char *module_name)
> > 	return open(path, O_RDONLY);
> > }
> >
> >+static bool kunit_set_filtering(const char *filter_glob, const char *filter,
> >+				const char *filter_action)
> >+{
> >+	int params;
> >+	bool ret;
> >+
> >+	params = open_parameters("kunit");
> >+	ret = !igt_debug_on(params < 0);
> 
> why proceed? just return early when it fails pre-conditions

Right.

> >+
> >+	/*
> >+	 * Default values of the KUnit base module filtering parameters
> >+	 * are all NULLs.  Reapplying those NULLs over sysfs once
> >+	 * overwritten with non-NULL strings seems not possible.
> >+	 * As a workaround, we use human-readable strings that exhibit
> >+	 * the same behaviour as if default NULLs were in place.
> >+	 */
> >+	if (ret)
> >+		ret = !igt_debug_on(!igt_sysfs_set(params, "filter_glob",
> >+						   filter_glob ?: "*"));
> >+	if (ret)
> >+		ret = !igt_debug_on(!igt_sysfs_set(params, "filter",
> >+						   filter ?: "module!=none"));
> >+	/*
> >+	 * In case of filter_action parameter there is no obvious human-
> >+	 * readable string that behaves like default NULL.  However, if NULL
> 
> that is not true.. it's just igt_sysfs not doing the right thing to

That depends on how we feel about empty strings, whether they are human-
readable or not.  For me they're not quite, e.g. when simply reading them back 
from sysfs it's not possible to distinguished them from potential white space, 
unless some graphical representation of non-printing characters is used.  
Maybe it would be more clear if kernel was using a convention to display empty 
strings as e.g. "(empty)", like it displays NULL as "(null)".

> write an empty string, that does behave like NULL on the kernel side.

Then maybe let's better send the empty string to igt_sysfs_set() instead of 
skipping that, and replace my "human-readable" with "non-NULL" in the 
comments.  Thanks to "module!=none" we are still on the safe side, even before 
igt_sysfs_set() is fixed.

> I'd drop these lines and just justify with the lines below why we are
> not setting it here.
> 
> with a small change below we can also move these to use igt_require()
> 
> >+	 * is requested for both filter and filter_action then that's not a
> >+	 * problem for us since even if filter_action was previously set to
> >+	 * "skip" we can leave it as is because our "module!=none" default
> >+	 * filter guarantees that no test cases are filtered out to be skipped.
> >+	 */
> >+	if (ret)
> >+		ret = !igt_warn_on_f(!filter_action && filter,
> >+				     "test error: filter_action=NULL requires filter=NULL\n");
> >+	if (ret && filter_action)
> >+		ret = !igt_debug_on(!igt_sysfs_set(params, "filter_action",
> >+						   filter_action));
> >+
> >+	if (params >= 0)
> >+		close(params);
> >+
> >+	return ret;
> >+}
> >+
> > struct modprobe_data {
> > 	struct kmod_module *kmod;
> > 	const char *opts;
> >@@ -1116,24 +1159,26 @@ static void kunit_get_tests(struct igt_list_head *tests,
> > 	/*
> > 	 * To get a list of test cases provided by a kunit test module, ask the
> > 	 * generic kunit module to respond with SKIP result for each test found.
> >-	 * We could also use action=list kunit parameter to get the listing,
> >-	 * however, parsing a KTAP report -- something that we already can do
> >-	 * perfectly -- seems to be more safe than extracting a test case list
> >-	 * of unknown length from /dev/kmsg.
> >-	 *
> >-	 * TODO: drop the following workaround, which is required by LTS kernel
> >-	 *       v6.1 not capable of listing test cases when built as a module.
> >-	 * If loading the kunit module with required parameters fails then
> >-	 * assume that we are running on a kernel with missing test case listing
> >-	 * capabilities.  Dont's skip but just return with empty list of test
> >-	 * cases, that should tell the caller to use a legacy method of
> >-	 * iterating over KTAP results collected from blind execution of all
> >-	 * Kunit test cases provided by a Kunit test module.
> >+	 * We could also try to use action=list kunit parameter to get the
> >+	 * listing, however, parsing a structured KTAP report -- something that
> >+	 * we already can do perfectly -- seems to be more safe than extracting
> >+	 * a free text list of unknown length from /dev/kmsg.
> > 	 */
> >-	igt_ignore_warn(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
> >-	if (igt_debug_on(igt_kmod_load("kunit",
> >-				       "filter=module=none filter_action=skip")))
> >+	if (igt_debug_on(!kunit_set_filtering(NULL, "module=none", "skip"))) {
> 
> probably in the caller or very early:
> 
> 	if (!igt_syfs_has_rw_attr())
> 		return fallback_kunit_execution();
> 
> I think it's too different this approach from the previous one, that
> results in the long comments trying to explain each different
> step.

OK.

> 
> Humn... I guess we can do that on top, so if this works, seems ok for
> now.

OK.

Thanks,
Janusz

> 
> Lucas De Marchi
> 
> >+		/*
> >+		 * TODO: drop the following workaround, required by LTS kernel
> >+		 *       v6.1 not capable of listing test cases when built as as
> >+		 *       module, when no longer needed.
> >+		 * If updating writable filter parameters of the kunit base
> >+		 * module with required values fails then assume we are running
> >+		 * on a kernel with missing test case listing capabilities.
> >+		 * Don't skip but just return with empty list of test cases,
> >+		 * which should tell the caller to use a legacy method of
> >+		 * iterating over KTAP results collected from blind execution
> >+		 * of all Kunit test cases provided by a Kunit test module.
> >+		 */
> > 		return;
> >+	}
> >
> > 	igt_skip_on(modprobe(tst->kmod, opts));
> >
> >@@ -1200,16 +1245,7 @@ static void __igt_kunit(struct igt_ktest *tst,
> > 			      t->case_name) {
> >
> > 			if (!modprobe.thread) {
> >-				/*
> >-				 * Since we have successfully loaded the kunit
> >-				 * base module with non-default parameters in
> >-				 * order to get a list of test cases, now we
> >-				 * have to unload it so it is then automatically
> >-				 * reloaded with default parameter values when
> >-				 * we load the test module again for execution.
> >-				 */
> >-				igt_skip_on(igt_kmod_unload("kunit",
> >-							    KMOD_REMOVE_FORCE));
> >+				igt_require(kunit_set_filtering(NULL, NULL, NULL));
> >
> > 				igt_assert_eq(pthread_mutexattr_init(&attr), 0);
> > 				igt_assert_eq(pthread_mutexattr_setrobust(&attr,
> >@@ -1378,6 +1414,9 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
> > 		igt_assert(igt_list_empty(&tests));
> > 	}
> >
> >+	/* We need the base KUnit module loaded if not built-in */
> >+	igt_ignore_warn(igt_kmod_load("kunit", NULL));
> >+
> > 	/*
> > 	 * We need to use igt_subtest here, as otherwise it may crash with:
> > 	 *  skipping is allowed only in fixtures, subtests or igt_simple_main
> 




