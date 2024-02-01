Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583CFC4828D
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 16:13:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E370010EEC6;
	Thu,  1 Feb 2024 16:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VDfbwkNQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C972110EEC6;
 Thu,  1 Feb 2024 16:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706804035; x=1738340035;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=S3tQopLs2QoXr+TqZz2m90O1vfnbwsr7dSM0EjkSnGY=;
 b=VDfbwkNQmRDiXhAtTI5qczvMvc4ocH+urPNcoZLCnkeinhZcMu9ep7Wl
 zCFSB+q+ZsxAjtoWA/OOh/739fH3HdGRdH9X+ovY4IrQD1bw9excPhD0M
 VCB0gR0bCn70Qjorw6HdkV7OEevFUrbPa+VQdE15aak9M9lqIL1vUHNrv
 kmi4CZM68p3VqPvdNrAlxrVFHxNp1huIBhIobEbP4y1BkQISQaeIQXNA5
 xntNryn9x1RR6iEnsjbfPWeTAxyMa3bCo2NJA0hyXgttoWp3b74QSNv7b
 f5awgNYNkXjg32eM+9HLCQ0uodfEdD03CruoXP1otKoG4XRPHgsRdd2m8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="108409"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="108409"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 08:13:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="140563"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.1.219])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 08:13:16 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-xe@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v2 4/6] lib/kunit: Support writable filter*
 parameters of kunit module
Date: Thu, 01 Feb 2024 17:13:14 +0100
Message-ID: <12739995.iMDcRRXYNz@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240201150741.r6hq3dnam33qzwxe@kamilkon-desk.igk.intel.com>
References: <20240131181156.80571-8-janusz.krzysztofik@linux.intel.com>
 <20240131181156.80571-12-janusz.krzysztofik@linux.intel.com>
 <20240201150741.r6hq3dnam33qzwxe@kamilkon-desk.igk.intel.com>
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

Hi Kamil,

On Thursday, 1 February 2024 16:07:41 CET Kamil Konieczny wrote:
> Hi Janusz,
> On 2024-01-31 at 19:03:51 +0100, Janusz Krzysztofik wrote:
> > Instead of wasting resources on reloading the base Kunit module each time
> > a different set of filter parameters is needed, try to write the required
> > values to sysfs representation of those parameters.  If that fails (e.g.
> > on older LTS kernels with read-only filter parameters), fall back to
> > legacy "no list of test cases available" mode as we do on kernels with
> > those module parameters not supported at all.
> > 
> > This modification will also serve as a workaround for the issue of
> > impossibility to unload the base Kunit module on Xe platforms, available
> > to IGT as soon as the module supports writable filter parameters.
> > 
> > v2: Work around ineffective writes of empty strings to sysfs module
> >     parameter files (Lucas) by using human readable non-empty strings that
> >     give the same results as default NULLs,
> >   - drop fallback to reload of base Kunit module method if assigning new
> >     values to module parameters via sysfs fails (Lucas), instead use the
> >     existing fallback to blind execution like if getting a list of test
> >     cases was not supported at all,
> >   - split move of open_parameters() helper up in the source file as well
> >     as cleanup of base KUnit module unloading to separate patches (Kamil),
> >   - address the issue of the second paragraph of commit description
> >     suggesting two separate changes combined in one patch (Kamil) by
> >     rewording the description.
> > 
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  lib/igt_kmod.c | 114 ++++++++++++++++++++++++++++++++++++-------------
> >  1 file changed, 84 insertions(+), 30 deletions(-)
> > 
> > diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> > index d2c28d0a64..1d57ea708d 100644
> > --- a/lib/igt_kmod.c
> > +++ b/lib/igt_kmod.c
> > @@ -811,6 +811,56 @@ static int open_parameters(const char *module_name)
> >  	return open(path, O_RDONLY);
> >  }
> >  
> > +static const char *kunit_params[3] = {
> > +	"filter_glob", "filter", "filter_action",
> > +};
> > +
> > +static bool kunit_set_params(const char **values)
> > +{
> > +	/*
> > +	 * Reapplying default NULLs to module parameters via sysfs seems not
> > +	 * possible, and applying empty strings doesn't work as expected,
> > +	 * leaving current values untouched.  As a workaround, use
> > +	 * human-readable non-empty strings that exhibit the same behaviour
> > +	 * as if default NULLs were in place.  In case of filter_action
> > +	 * parameter there is no such obvious non-empty string, however,
> > +	 * that's not a problem for us since even if it was previously set
> > +	 * to "skip" and we leave it as is, our "module!=none" default filter
> > +	 * guarantees that no test cases are filtered out to be skipped.
> > +	 */
> > +	const char *defaults[ARRAY_SIZE(kunit_params)] = {
> > +	     /* filter_glob, filter,	     filter_action */
> > +		"*",	     "module!=none", "",
> 
> If writing empty string poses a problem, what about writing
> one space? Could it work?

The approach suggested by Lucas seems the best to me: don't write to 
filter_action at all if we are not able to get the result we want (i.e., its 
default NULL value restored) AND we can get what we want with its current 
value "skip" in place when combined with the proposed value of filter 
parameter "module!=none".

> 
> One more nit below.
> 
> > +	};
> > +	int i, params;
> > +	bool ret;
> > +
> > +	params = open_parameters("kunit");
> > +	ret = !igt_debug_on(params < 0);
> > +
> > +	for (i = 0; ret && i < ARRAY_SIZE(kunit_params); i++) {
> > +		char *param = igt_sysfs_get(params, kunit_params[i]);
> > +
> > +		if (igt_debug_on_f(!param, "param: %s\n", kunit_params[i])) {
> > +			ret = false;
> > +			break;
> > +		}
> > +
> > +		ret = !strcmp(param, values[i] ?: defaults[i]);
> > +		free(param);
> > +		if (!ret)
> > +			ret = !igt_debug_on(!igt_sysfs_set(params,
> > +							   kunit_params[i],
> > +							   values[i] ?:
> > +							   defaults[i]));
> > +	}
> > +
> > +	if (params >= 0)
> > +		close(params);
> > +
> > +	return ret;
> > +}
> > +
> >  struct modprobe_data {
> >  	struct kmod_module *kmod;
> >  	const char *opts;
> > @@ -1100,6 +1150,18 @@ static void kunit_get_tests(struct igt_list_head *tests,
> >  			    const char *filter,
> >  			    const char *opts)
> >  {
> > +	/*
> > +	 * To get a list of test cases provided by a kunit test module, ask the
> > +	 * generic kunit module to respond with SKIP result for each test found.
> > +	 * We could also try to use action=list kunit parameter to get the
> > +	 * listing, however, parsing a KTAP report -- something that we already
> > +	 * can do perfectly -- seems to be more safe than extracting a test case
> > +	 * list of unknown length from /dev/kmsg.
> > +	 */
> > +	const char *values[ARRAY_SIZE(kunit_params)] = {
> > +	     /* filter_glob, filter,	    filter_action */
> > +		NULL,	     "module=none", "skip",
> > +	};
> >  	char *suite_name = NULL, *case_name = NULL;
> >  	struct igt_ktap_result *r, *rn;
> >  	struct igt_ktap_results *ktap;
> > @@ -1113,27 +1175,21 @@ static void kunit_get_tests(struct igt_list_head *tests,
> >  
> >  	igt_skip_on(lseek(tst->kmsg, 0, SEEK_END) < 0);
> >  
> > -	/*
> > -	 * To get a list of test cases provided by a kunit test module, ask the
> > -	 * generic kunit module to respond with SKIP result for each test found.
> > -	 * We could also use action=list kunit parameter to get the listing,
> > -	 * however, parsing a KTAP report -- something that we already can do
> > -	 * perfectly -- seems to be more safe than extracting a test case list
> > -	 * of unknown length from /dev/kmsg.
> > -	 *
> > -	 * TODO: drop the following workaround, which is required by LTS kernel
> > -	 *       v6.1 not capable of listing test cases when built as a module.
> > -	 * If loading the kunit module with required parameters fails then
> > -	 * assume that we are running on a kernel with missing test case listing
> > -	 * capabilities.  Dont's skip but just return with empty list of test
> > -	 * cases, that should tell the caller to use a legacy method of
> > -	 * iterating over KTAP results collected from blind execution of all
> > -	 * Kunit test cases provided by a Kunit test module.
> > -	 */
> > -	igt_ignore_warn(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
> > -	if (igt_debug_on(igt_kmod_load("kunit",
> > -				       "filter=module=none filter_action=skip")))
> > +	if (igt_debug_on(!kunit_set_params(values))) {
> > +		/*
> > +		 * TODO: drop the following workaround, required by LTS kernel
> > +		 *       v6.1 not capable of listing test cases when built as as
> 
> s/as as/as/

OK, thanks.

Janusz

> 
> Regards,
> Kamil
> 
> > +		 *       module, when no longer needed.
> > +		 * If updating writable filter parameters of the kunit base
> > +		 * module with required values then assume that we are running
> > +		 * on a kernel with missing test case listing capabilities.
> > +		 * Don't skip but just return with empty list of test cases,
> > +		 * which should tell the caller to use a legacy method of
> > +		 * iterating over KTAP results collected from blind execution
> > +		 * of all Kunit test cases provided by a Kunit test module.
> > +		 */
> >  		return;
> > +	}
> >  
> >  	igt_skip_on(modprobe(tst->kmod, opts));
> >  
> > @@ -1200,16 +1256,11 @@ static void __igt_kunit(struct igt_ktest *tst,
> >  			      t->case_name) {
> >  
> >  			if (!modprobe.thread) {
> > -				/*
> > -				 * Since we have successfully loaded the kunit
> > -				 * base module with non-default parameters in
> > -				 * order to get a list of test cases, now we
> > -				 * have to unload it so it is then automatically
> > -				 * reloaded with default parameter values when
> > -				 * we load the test module again for execution.
> > -				 */
> > -				igt_skip_on(igt_kmod_unload("kunit",
> > -							    KMOD_REMOVE_FORCE));
> > +				const char *values[ARRAY_SIZE(kunit_params)] = {
> > +					NULL, NULL, NULL,
> > +				};
> > +
> > +				igt_require(kunit_set_params(values));
> >  
> >  				igt_assert_eq(pthread_mutexattr_init(&attr), 0);
> >  				igt_assert_eq(pthread_mutexattr_setrobust(&attr,
> > @@ -1378,6 +1429,9 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
> >  		igt_assert(igt_list_empty(&tests));
> >  	}
> >  
> > +	/* We need the base KUnit module loaded if not built-in */
> > +	igt_ignore_warn(igt_kmod_load("kunit", NULL));
> > +
> >  	/*
> >  	 * We need to use igt_subtest here, as otherwise it may crash with:
> >  	 *  skipping is allowed only in fixtures, subtests or igt_simple_main
> 




