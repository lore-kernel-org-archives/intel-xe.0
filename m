Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB204C4828D
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 16:02:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8403510ED80;
	Thu,  1 Feb 2024 16:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQXmKjRW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A2A10EF47;
 Thu,  1 Feb 2024 16:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706803333; x=1738339333;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=aA59Muj752d8idO5uDhyyIccmBKQZgA6qwoKM/FXbYM=;
 b=EQXmKjRWvw8I8l0TTwHQr8kImYpoWEhwQA+HlzWz1pPoz4ffI8zPJFpY
 /dMJIv4LC8rOSQTsCsVWVHDuUh9XPPgt7tK20Voo4Axltch+p4VRH0hd6
 m6ZlNqnEyqZ3QOcZPF5nY+FAiu4ZYUy8Ovk5HvDQEjbK0h8Q/J7lDWG+6
 hSF1SNLNF5+DqmJULlmwxRmvsDmndhBMH/ZwKb0izO4i+4bYJaSY4aMky
 YfhTU2BfPz9E/RgD3s1NKMFuhCvQK7+IDKoIewSGLFUBr5+zSZzxxa9ZO
 SY910LI0UDQiIy0GxrZH7kCHP1zGkBPf9KX8ijvKo6MtmVEiSZhZ0l6qi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="402771044"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="402771044"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 08:02:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4424695"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.1.219])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 08:02:08 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-xe@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v2 6/6] lib/kunit: Process module remove error after
 list errors
Date: Thu, 01 Feb 2024 17:02:05 +0100
Message-ID: <2550119.vzjCzTo3RI@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240201145501.5ga7vvpkc6urpwy2@kamilkon-desk.igk.intel.com>
References: <20240131181156.80571-8-janusz.krzysztofik@linux.intel.com>
 <20240131181156.80571-14-janusz.krzysztofik@linux.intel.com>
 <20240201145501.5ga7vvpkc6urpwy2@kamilkon-desk.igk.intel.com>
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

On Thursday, 1 February 2024 15:55:01 CET Kamil Konieczny wrote:
> Hi Janusz,
> On 2024-01-31 at 19:03:53 +0100, Janusz Krzysztofik wrote:
> > Skip on any error from test case list gathering first, then, in
> > preparation for executing those test cases, on an error from unloading the
> > test module loaded in list only mode, so it is more clear if listing the
> > test cases was successful or not.
> > 
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > ---
> >  lib/igt_kmod.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> > index 53c54b1a0d..741c7fd055 100644
> > --- a/lib/igt_kmod.c
> > +++ b/lib/igt_kmod.c
> > @@ -1225,11 +1225,11 @@ static void kunit_get_tests(struct igt_list_head 
*tests,
> >  		free(case_name);
> >  	}
> >  
> > -	igt_skip_on(kmod_module_remove_module(tst->kmod, 
KMOD_REMOVE_FORCE));
> > -
> >  	igt_skip_on_f(err,
> >  		      "KTAP parser failed while getting a list of test 
cases\n");
> >  	igt_skip_on(igt_list_empty(tests));
> 
> This skip_on will prevent module unload below... What about
> remembering both and skipping on list_empty() only after module unload?
> For example:
>     testslist_is_empty = igt_list_empty(tests);
>     unload_failed = kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE);
> 
>     igt_skip_on(testslist_is_empty);
>     igt_skip_on_f(unload_failed, "kmod %s unload failed\n", tst->kmod);

As I tried to express in my commit description, test module is unloaded here, 
after the list of test cases is collected, "in preparation for executing those 
test cases", and not as a final cleanup.

kunit_get_tests() is called from inside igt_subtest_with_dynamic() before any 
calls to igt_dynamic() from where test cases are executed.  If 
kunit_get_tests() skips for any reason then no test cases provided by that 
module will be executed, then unloading the module is not required.  An 
attempt to unload it if still loaded will be take from the trailing 
igt_fixture section of igt_kunit() via a call to igt_ktest_end().

Is the above clarification sufficient for you?  

Thanks,
Janusz

> 
> 
> Regards,
> Kamil
> 
> > +
> > +	igt_skip_on(kmod_module_remove_module(tst->kmod, 
KMOD_REMOVE_FORCE));
> >  }
> >  
> >  static void __igt_kunit(struct igt_ktest *tst,
> 




