Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05F7C47DDF
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 11:03:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8DAD10E16A;
	Thu,  1 Feb 2024 11:03:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7191A10E16A;
 Thu,  1 Feb 2024 11:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706785420; x=1738321420;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vl6OQr+5qjs5/Yqr5cH9ZCIh9ftqRPZ5Mol5dWeiOr8=;
 b=RtowWuA3Ijaw4T+iRs9lg3UfHrEz+W/d3naJqVRtfPQiQLZUgq+CZE+g
 NQV5AO2LqDuqaE1g7nTkDu39OfrXFfGiLkkxrSj3+/txdVHm81suFSDu2
 pHq8sYWglAK0/CyElKY+je9d6yDmhd/wv/K9wHwIXT8uEWmcCG7vt+hp2
 +URPeE8sTu9uC1lZJOfyq7hC1bfi+Cey0+0AkcwGt1FfsTf/HUKYHedhJ
 ODHDlNMdT4RI8iowjJiZh5NSejzD6PIKQMvP7WzXRfBuZ8BNFV9y4RMIF
 leUS4sF8fgxGYFDaJ9v4FRo49AhfkBX/W33C6+2DfkTG04DEFQPWtHsXg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="435030584"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="435030584"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 03:03:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="30565389"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.1.219])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 03:03:30 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v2 4/6] lib/kunit: Support writable filter*
 parameters of kunit module
Date: Thu, 01 Feb 2024 12:03:27 +0100
Message-ID: <3169229.fEcJ0Lxnt5@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <wefjuksjpqxyofstfnjdsdr7jdxr3u72kfytuft5rdtxwnkylp@suywjlthr3u7>
References: <20240131181156.80571-8-janusz.krzysztofik@linux.intel.com>
 <20240131181156.80571-12-janusz.krzysztofik@linux.intel.com>
 <wefjuksjpqxyofstfnjdsdr7jdxr3u72kfytuft5rdtxwnkylp@suywjlthr3u7>
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
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Lucas,

On Thursday, 1 February 2024 02:01:17 CET Lucas De Marchi wrote:
> On Wed, Jan 31, 2024 at 07:03:51PM +0100, Janusz Krzysztofik wrote:
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
> > lib/igt_kmod.c | 114 ++++++++++++++++++++++++++++++++++++-------------
> > 1 file changed, 84 insertions(+), 30 deletions(-)
> >
> >diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> >index d2c28d0a64..1d57ea708d 100644
> >--- a/lib/igt_kmod.c
> >+++ b/lib/igt_kmod.c
> >@@ -811,6 +811,56 @@ static int open_parameters(const char *module_name)
> > 	return open(path, O_RDONLY);
> > }
> >
> >+static const char *kunit_params[3] = {
> >+	"filter_glob", "filter", "filter_action",
> >+};
> >+
> >+static bool kunit_set_params(const char **values)
> >+{
> >+	/*
> >+	 * Reapplying default NULLs to module parameters via sysfs seems not
> >+	 * possible, and applying empty strings doesn't work as expected,
> >+	 * leaving current values untouched.  As a workaround, use
> >+	 * human-readable non-empty strings that exhibit the same behaviour
> >+	 * as if default NULLs were in place.  In case of filter_action
> >+	 * parameter there is no such obvious non-empty string, however,
> >+	 * that's not a problem for us since even if it was previously set
> >+	 * to "skip" and we leave it as is, our "module!=none" default filter
> >+	 * guarantees that no test cases are filtered out to be skipped.
> >+	 */
> >+	const char *defaults[ARRAY_SIZE(kunit_params)] = {
> >+	     /* filter_glob, filter,	     filter_action */
> >+		"*",	     "module!=none", "",
> >+	};
> >+	int i, params;
> >+	bool ret;
> >+
> >+	params = open_parameters("kunit");
> >+	ret = !igt_debug_on(params < 0);
> >+
> >+	for (i = 0; ret && i < ARRAY_SIZE(kunit_params); i++) {
> >+		char *param = igt_sysfs_get(params, kunit_params[i]);
> 
> why do we read-modify-write? I'd rather just write the values. An
> optimization by checking previous value belongs in the kernel, when it
> makes an actual difference. Something like this (but with error
> handling):
> 
> 	int dirfd = open("/sys/modules/kunit/parameters", O_RDONLY);
> 	igt_sysfs_set(dirfd, "filter_glob", ...);
> 	igt_sysfs_set(dirfd, "filter", ...);
> 	igt_sysfs_set(dirfd, "filter_action", ...);
> 	close(dirfd);

OK.

> 
> an abstraction could better be something like:
> 
> 	igt_sysfs_set_all("/sys/modules/kunit/parameters",
> 			  attr1, val1,
> 			  attr2, val2,
> 			  attr3, val2,
> 			  NULL);
> >+
> >+		if (igt_debug_on_f(!param, "param: %s\n", kunit_params[i])) {
> >+			ret = false;
> >+			break;
> >+		}
> >+
> >+		ret = !strcmp(param, values[i] ?: defaults[i]);
> >+		free(param);
> >+		if (!ret)
> >+			ret = !igt_debug_on(!igt_sysfs_set(params,
> >+							   kunit_params[i],
> >+							   values[i] ?:
> >+							   defaults[i]));
> 
> 
> filter_action is "". How does this fix the issue of writing a 0-length
> string? If we try to go back and forth between "skip" and "", this will
> fail.  

I think I've explained that in a comment to "defaults" variable (see above, 
here quoted again for your convenience):
> >+	/*
> >+	 * Reapplying default NULLs to module parameters via sysfs seems not
> >+	 * possible, and applying empty strings doesn't work as expected,
> >+	 * leaving current values untouched.  As a workaround, use
> >+	 * human-readable non-empty strings that exhibit the same behaviour
> >+	 * as if default NULLs were in place.  In case of filter_action
> >+	 * parameter there is no such obvious non-empty string, however,
> >+	 * that's not a problem for us since even if it was previously set
> >+	 * to "skip" and we leave it as is, our "module!=none" default filter
> >+	 * guarantees that no test cases are filtered out to be skipped.
> >+	 */

If still not convinced then please have a look at results from other KUnit 
based IGT tests executed within the pre-merge CI run for this series:
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10613/index.html?testfilter=drm_mm%7Cdrm_buddy%7Ckms_selftest
to see how it works (please note that IGT output is still not in sync with 
KTAP output, then results are still not easily human-readable, which is a 
known issue that will be fixed by a series planned as next, i.e.,
https://patchwork.freedesktop.org/series/126017/ refreshed on top of this 
one).

> A workaround would be to make defaults above to be something else
> like "run", 

But won't that require a respective modification on the kernel side?  Do we 
know if KUnit will accept "run" as filter_action value, now and in the future?  
And if it is accepted then do we know how KUnit filtering algorithm will 
respond to that value, now and in the future?

> but we should really fix this in igt.  I'm submitting a
> patch for that.

Do we know if KUnit will accept an empty string as filter_action value, now 
and in the future?  And if it is accepted then do we know if, when filtering 
test cases, KUnit will respond to it, now and in the future, the same way as 
if it was NULL (the default)?

That would be nice if default values of those module parameters were not NULL 
(presented by sysfs as "(null)"), then perfectly possible to be restored via 
sysfs (with your IGT fix if empty strings), without guessing or inventing 
default equivalents.

Thanks,
Janusz

> 
> Lucas de Marchi
> 
> >+	}
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
> >@@ -1100,6 +1150,18 @@ static void kunit_get_tests(struct igt_list_head *tests,
> > 			    const char *filter,
> > 			    const char *opts)
> > {
> >+	/*
> >+	 * To get a list of test cases provided by a kunit test module, ask the
> >+	 * generic kunit module to respond with SKIP result for each test found.
> >+	 * We could also try to use action=list kunit parameter to get the
> >+	 * listing, however, parsing a KTAP report -- something that we already
> >+	 * can do perfectly -- seems to be more safe than extracting a test case
> >+	 * list of unknown length from /dev/kmsg.
> >+	 */
> >+	const char *values[ARRAY_SIZE(kunit_params)] = {
> >+	     /* filter_glob, filter,	    filter_action */
> >+		NULL,	     "module=none", "skip",
> >+	};
> > 	char *suite_name = NULL, *case_name = NULL;
> > 	struct igt_ktap_result *r, *rn;
> > 	struct igt_ktap_results *ktap;
> >@@ -1113,27 +1175,21 @@ static void kunit_get_tests(struct igt_list_head *tests,
> >
> > 	igt_skip_on(lseek(tst->kmsg, 0, SEEK_END) < 0);
> >
> >-	/*
> >-	 * To get a list of test cases provided by a kunit test module, ask the
> >-	 * generic kunit module to respond with SKIP result for each test found.
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
> >-	 */
> >-	igt_ignore_warn(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
> >-	if (igt_debug_on(igt_kmod_load("kunit",
> >-				       "filter=module=none filter_action=skip")))
> >+	if (igt_debug_on(!kunit_set_params(values))) {
> >+		/*
> >+		 * TODO: drop the following workaround, required by LTS kernel
> >+		 *       v6.1 not capable of listing test cases when built as as
> >+		 *       module, when no longer needed.
> >+		 * If updating writable filter parameters of the kunit base
> >+		 * module with required values then assume that we are running
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
> >@@ -1200,16 +1256,11 @@ static void __igt_kunit(struct igt_ktest *tst,
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
> >+				const char *values[ARRAY_SIZE(kunit_params)] = {
> >+					NULL, NULL, NULL,
> >+				};
> >+
> >+				igt_require(kunit_set_params(values));
> >
> > 				igt_assert_eq(pthread_mutexattr_init(&attr), 0);
> > 				igt_assert_eq(pthread_mutexattr_setrobust(&attr,
> >@@ -1378,6 +1429,9 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
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




