Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E078BC001E0
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 15:14:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1293D10E40B;
	Tue,  1 Aug 2023 15:14:02 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C71010E40B;
 Tue,  1 Aug 2023 15:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690902839; x=1722438839;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D3Gr4CQz5RXEpExSMqhczLYsHj+yuAQsgSmsBQ4YJ6c=;
 b=LPxQ7VmHaJb8f+fVx0VqnbLYO05DofQe2llwol+sUHrREHWgQy2ZQIGh
 7l8X6hteIaxPQoFGUrc3j+4u3dycf0YFr7PO04vNevfC+eEZwW3J5MlEg
 QANIRl6/h9yUIshgoxBccP3dbGcbLlZczsIwU4k7QmXs/tvMI8wYBT3Yv
 kTZuNEkm7aYaZd0Edj7z5YT4zZS81+9ezq0u99XSHdvDmtTr0CgJJ+WNq
 1I1dalQv8IW4G7n59rN0OF1b/QfCYX+g3dKccAcZHC/wol9TKDKkaJ5aX
 EvcIYEqpTrOPtHjUnM8UqYkquE4aFuSNtJOpUzcNKiANZKvQrlXDScqyX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="349619785"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; d="scan'208";a="349619785"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 08:13:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="975350300"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; d="scan'208";a="975350300"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.27.8])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 08:13:56 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Tue, 01 Aug 2023 17:13:53 +0200
Message-ID: <5405097.29KlJPOoH8@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230801151711.2765e2eb@coco.lan>
References: <20230731141021.2854827-5-janusz.krzysztofik@linux.intel.com>
 <20230731141021.2854827-6-janusz.krzysztofik@linux.intel.com>
 <20230801151711.2765e2eb@coco.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [Intel-xe] [PATCH v3 1/3] kunit: Report the count of test
 suites in a module
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
Cc: David Gow <davidgow@google.com>, linux-kernel@vger.kernel.org,
 igt-dev@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>,
 linux-kselftest@vger.kernel.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-xe@lists.freedesktop.org, kunit-dev@googlegroups.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Mauro,

Thanks for review.

On Tuesday, 1 August 2023 15:17:11 CEST Mauro Carvalho Chehab wrote:
> Em Mon, 31 Jul 2023 16:10:23 +0200
> Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> escreveu:
> 
> > According to KTAP specification[1], results should always start from a
> > header that provides a TAP protocol version, followed by a test plan with
> > a count of items to be executed.  That pattern should be followed at each
> > nesting level.  In the current implementation of the top-most, i.e., test
> > suite level, those rules apply only for test suites built into the kernel,
> > executed and reported on boot.  Results submitted to dmesg from kunit test
> > modules loaded later are missing those top-level headers.
> > 
> > As a consequence, if a kunit test module provides more than one test suite
> > then, without the top level test plan, external tools that are parsing
> > dmesg for kunit test output are not able to tell how many test suites
> > should be expected and whether to continue parsing after complete output
> > from the first test suite is collected.
> > 
> > Submit the top-level headers also from the kunit test module notifier
> > initialization callback.
> > 
> > [1] https://docs.kernel.org/dev-tools/ktap.html#
> > 
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > ---
> >  lib/kunit/test.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> > index 84e4666555c94..a29ca1acc4d81 100644
> > --- a/lib/kunit/test.c
> > +++ b/lib/kunit/test.c
> > @@ -729,6 +729,11 @@ EXPORT_SYMBOL_GPL(__kunit_test_suites_exit);
> >  #ifdef CONFIG_MODULES
> >  static void kunit_module_init(struct module *mod)
> >  {
> > +	if (mod->num_kunit_suites > 0) {
> > +		pr_info("KTAP version 1\n");
> > +		pr_info("1..%d\n", mod->num_kunit_suites);
> > +	}
> > +
> >  	__kunit_test_suites_init(mod->kunit_suites, mod->num_kunit_suites);
> >  }
> 
> IMO, the best would be instead to export kunit_exec_run_tests() and
> use it here too.

I was considering a similar approach, i.e., moving those two pr_info() lines 
from built-in only kunit_exec_run_tests() to __kunit_test_suites_init() which 
is common to both built-in and modular paths, but please note that with kunit 
built in, an empty test plan "1..0" is now reported on boot, while we don't 
want similar reports to appear on loading modules that don't provide any kunit 
tests.  Then, inside either your exported kunit_exec_run_tests() or my 
__kunit_test_suites_init(), we would have to check somehow if it has been 
called from a module notifier initialization callback, and that seemed to me 
too much complicated and less clean than what I've proposed: keep using 
unmodified kunit_exec_run_tests() in built-in and updated kunit_module_init() 
in modular processing path.
Dropping the empty "1..0" test plan from boot messages would mean an ABI 
change, I believe, which I'd rather avoid adding to the scope of this patch as 
not required.

Thanks,
Janusz
 
> 
> Except for the nit, LGTM.
> 
> 
> Thanks,
> Mauro
> 




