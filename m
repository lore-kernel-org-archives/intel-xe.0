Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EFAC47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 13:04:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57FDB10FA43;
	Fri, 26 Jan 2024 13:04:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8ED10FA42;
 Fri, 26 Jan 2024 13:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706274293; x=1737810293;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=PgPGe53FbJetErziYDP6cS+EjKdmXrz7fu8+yEoCgME=;
 b=AAIMFr8i1KTybYtC5MJUukr7Cj+yfgUo4BEl8p46ubChuzn+FaV0mJAB
 HNutQuGzYrpFwWzWN2pxXjbGeUziyKeVSysWyhiYT5SfVlWE6keOKjGc8
 7/0Lj7zEgzVkknzVSet1eqwsL40f7UY1TA68nvApvrT9QEWuzMh9QvkV8
 PkJZsf8efeRJ5/j5++VzkcUBTtbgaNH5u+S8Q8dCiKJOaMIKgS7vfFYL7
 pkLyb+JU2bCKbRAyCOovhX3AK1H+4QL0uSGepvc04f+njh3zVcT9FuF9J
 bhwbrq0d4++twMkW10bbED+4c87p9ham444JHLEHQBzodIxOhpdyIR/c3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9832624"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9832624"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 05:04:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="910330579"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="910330579"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.21.59])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 05:04:46 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-xe@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t 1/3] lib/kunit: Support writable filter* parameters
 of kunit module
Date: Fri, 26 Jan 2024 14:04:43 +0100
Message-ID: <1800863.TLkxdtWsSY@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240126093728.d6pylg47ea6tifgm@kamilkon-desk.igk.intel.com>
References: <20240125165749.15599-5-janusz.krzysztofik@linux.intel.com>
 <20240125165749.15599-6-janusz.krzysztofik@linux.intel.com>
 <20240126093728.d6pylg47ea6tifgm@kamilkon-desk.igk.intel.com>
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

Thanks for review.

On Friday, 26 January 2024 10:37:28 CET Kamil Konieczny wrote:
> Hi Janusz,
> On 2024-01-25 at 17:52:10 +0100, Janusz Krzysztofik wrote:
> > Instead of wasting resources on reloading the base Kunit module each time
> > a different set of filter parameters is needed, try to write the required
> > values to sysfs representation of those parameters.  If that fails (e.g.
> > on older LTS kernels with read-only filter parameters), fall back to
> > reloading the module.
> > 
> > This change also provides a workaround for the issue of impossibility to
> > unload the base Kunit module on Xe platforms, available as soon as the
> > module supports writable filter parameters.
> > 
> > Since the base Kunit module is now unloaded from kunit_set_params() when
> > needed, drop other attempts to unload it.
> > 
> > To reuse an existing open_parameters() helper, moved it up in the source
> > file to avoid a forward declaration.
> 
> Could you split your patch into smaller parts? You described four
> actions you did, maybe four patches?

Regarding the first two paragraphs, they don't describe two separate changes 
to the code, one each, only two benefits provided by one atomic change:
- optimization of resource usage by avoiding expensive module reloading,
- workaround for the unusual dependency of the Xe driver on the base kunit 
  module.
Then I can't see how I could split that into two patches.

Regarding the third paragraph, I don't agree because I think that trying to 
keep the base KUnit module loaded is an integral part of the solution.  We 
can't stop unloading the module via a separate patch before we teach the code 
how to modify module parameters via sysfs.  OTOH, if we kept unloading the 
module then trying to update module parameters via sysfs with the module not 
loaded would obviously fail, and the code would have to be modified to take 
such conflicting while easily avoidable condition into account.  That would 
make the code sub-optimal, and a follow-up patch that drops those unneeded 
module unloads would have to optimize that code.  IOW, that paragraph 
shouldn't be read as describing a separate action, only providing a 
justification for an integral part of the change which purpose could be 
potentially non-obvious at a first glance.

Regarding the last paragraph, OK, I can put that part in a separate patch in 
front of the main one if that's important to you, though I don't believe in a 
scenario where that main patch is reverted while the helper is still needed in 
the new place by some other code added later.  Besides, that's only 7 lines of 
simple code being moved, pretty easy to verify if correct, not affecting 
readability of other code changes in any way, I believe.

If you think that my commit description can be misleading, suggesting that 4 
unrelated changes have been mixed here then could please give me some ideas on 
how I could improve that description?  Please note that if I just omitted the 
last two paragraphs then the description would be missing explanations of some 
not necessarily obvious parts of the change, and that's why I added them 
before sending to my initial version with only the first two paragraphs.

> 
> Regards,
> Kamil
> 
> > 
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > ---
> >  lib/igt_kmod.c | 147 +++++++++++++++++++++++++++++++++++--------------
> >  1 file changed, 107 insertions(+), 40 deletions(-)
> > 
> > diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> > index 250ab2107b..4f96dafe01 100644
> > --- a/lib/igt_kmod.c
> > +++ b/lib/igt_kmod.c
> > @@ -803,6 +803,78 @@ void igt_kselftest_get_tests(struct kmod_module *kmod,
> >  	kmod_module_info_free_list(pre);
> >  }
> >  
> > +static int open_parameters(const char *module_name)
> > +{
> > +	char path[256];
> > +
> > +	snprintf(path, sizeof(path), "/sys/module/%s/parameters", module_name);
> > +	return open(path, O_RDONLY);
> > +}
> > +
> > +static bool kunit_set_params(const char **name, const char **value, int count)
> > +{
> > +	static bool writable = true;
> > +	int i, ret, params;
> > +	char *opts = NULL;
> > +
> > +	if (!writable) {
> > +		if (count)
> > +			if (igt_debug_on(asprintf(&opts, "%s=%s",
> > +						  name[0], value[0]) < 0)) {
> > +				free(opts);
> > +				return false;
> > +			}
> > +
> > +		for (i = 1; i < count; i++) {
> > +			char *head = opts;
> > +
> > +			opts = NULL;
> > +			ret = asprintf(&opts, "%s %s=%s", head, name[i], value[i]);
> > +			free(head);
> > +			if (igt_debug_on(ret < 0)) {
> > +				free(opts);
> > +				return false;
> > +			}
> > +		}
> > +
> > +		igt_ignore_warn(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
> > +	}
> > +
> > +	ret = igt_debug_on(igt_kmod_load("kunit", opts));
> > +	free(opts);
> > +
> > +	if (ret && !writable)
> > +		return false;
> > +
> > +	params = open_parameters("kunit");
> > +	ret = igt_debug_on(params < 0);
> > +
> > +	for (i = 0; !ret && i < count; i++) {
> > +		char *param = igt_sysfs_get(params, name[i]);
> > +
> > +		if (igt_debug_on_f(!param, "param: %s\n", name[i])) {
> > +			ret = -1;
> > +			continue;
> > +		}
> > +
> > +		ret = strcmp(param, value[i]);
> > +		free(param);
> > +		if (ret)
> > +			ret = !igt_sysfs_set(params, name[i], value[i]);
> > +	}
> > +
> > +	if (params >= 0)
> > +		close(params);
> > +
> > +	if (!ret)
> > +		return true;
> > +	if (!writable)
> > +		return false;
> > +
> > +	writable = false;
> > +	return kunit_set_params(name, value, count);
> > +}
> > +
> >  struct modprobe_data {
> >  	struct kmod_module *kmod;
> >  	const char *opts;
> > @@ -814,11 +886,17 @@ struct modprobe_data {
> >  
> >  static void *modprobe_task(void *arg)
> >  {
> > +	const char *param[3] = { "filter_glob", "filter", "filter_action", };
> > +	const char *value[3] = { "*", "", "", };
> >  	struct modprobe_data *data = arg;
> > +	bool ret;
> > +
> > +	ret = kunit_set_params(param, value, ARRAY_SIZE(param));
> >  
> > -	data->err = modprobe(data->kmod, data->opts);
> > +	if (ret)
> > +		data->err = modprobe(data->kmod, data->opts);
> >  
> > -	if (igt_debug_on(data->err)) {
> > +	if (igt_debug_on(!ret || data->err)) {
> >  		bool once = false;
> >  		int err;
> >  
> > @@ -1092,9 +1170,20 @@ static void kunit_get_tests(struct igt_list_head *tests,
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
> > +	const char *param[3] = { "filter_glob", "filter", "filter_action", };
> > +	const char *value[3] = { "*", "module=none", "skip", };
> >  	char *suite_name = NULL, *case_name = NULL;
> >  	struct igt_ktap_result *r, *rn;
> >  	struct igt_ktap_results *ktap;
> > +	unsigned long taints;

Auto-correction: that line belongs to patch 2/3 "lib/kunit: Report early 
kernel taints explicitly", and I'll move it there.

Thanks,
Janusz

> >  	int flags, err;
> >  
> >  	igt_skip_on_f(tst->kmsg < 0, "Could not open /dev/kmsg\n");
> > @@ -1105,26 +1194,23 @@ static void kunit_get_tests(struct igt_list_head *tests,
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
> > -	if (igt_debug_on(igt_kmod_load("kunit",
> > -				       "filter=module=none filter_action=skip")))
> > +	if (igt_debug_on(!kunit_set_params(param, value, ARRAY_SIZE(param)))) {
> > +		/*
> > +		 * TODO: drop the following workaround, required by LTS kernel
> > +		 *       v6.1 not capable of listing test cases when built as as
> > +		 *       module, when no longer needed.
> > +		 * If updating writable filter parameters of the kunit base
> > +		 * module with required values or reloading that module with
> > +		 * those parameters specified fails then assume that we are
> > +		 * running on a kernel with missing test case listing
> > +		 * capabilities.  Dont skip but just return with empty list of
> > +		 * test cases, which should tell the caller to use a legacy
> > +		 * method of iterating over KTAP results collected from blind
> > +		 * execution of all Kunit test cases provided by a Kunit test
> > +		 * module.
> > +		 */
> >  		return;
> > +	}
> >  
> >  	igt_skip_on(modprobe(tst->kmod, opts));
> >  
> > @@ -1159,7 +1245,6 @@ static void kunit_get_tests(struct igt_list_head *tests,
> >  	}
> >  
> >  	igt_skip_on(kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE));
> > -	igt_skip_on(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
> >  
> >  	igt_skip_on_f(err,
> >  		      "KTAP parser failed while getting a list of test cases\n");
> > @@ -1355,15 +1440,6 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
> >  		igt_skip_on(igt_ktest_init(&tst, module_name));
> >  		igt_skip_on(igt_ktest_begin(&tst));
> >  
> > -		/*
> > -		 * Since we need to load kunit base module with specific
> > -		 * options in order to get a list of test cases, make
> > -		 * sure that the module is not loaded.  However, since
> > -		 * unload may fail if kunit base module is not loaded,
> > -		 * ignore any failures, we'll fail later if still loaded.
> > -		 */
> > -		igt_ignore_warn(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
> > -
> >  		igt_assert(igt_list_empty(&tests));
> >  	}
> >  
> > @@ -1395,20 +1471,11 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
> >  		kunit_results_free(&tests, &suite_name, &case_name);
> >  
> >  		igt_ktest_end(&tst);
> > -		igt_debug_on(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
> >  	}
> >  
> >  	igt_ktest_fini(&tst);
> >  }
> >  
> > -static int open_parameters(const char *module_name)
> > -{
> > -	char path[256];
> > -
> > -	snprintf(path, sizeof(path), "/sys/module/%s/parameters", module_name);
> > -	return open(path, O_RDONLY);
> > -}
> > -
> >  int igt_ktest_init(struct igt_ktest *tst,
> >  		   const char *module_name)
> >  {
> 




