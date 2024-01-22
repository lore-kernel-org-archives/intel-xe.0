Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9FCC47DAF
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 11:37:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B61F10ED48;
	Mon, 22 Jan 2024 11:37:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B75310E104;
 Mon, 22 Jan 2024 11:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705923428; x=1737459428;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HkdE4Sh9+E/CexOqjsSwzb/DEeq4TK2MGW/8i1+yPno=;
 b=YbLsq7lUCFeNLL8JgklJIBMQkPaofGagPGAFp81RaWjZEg0CadGQ48P8
 I+1PvoE+IYbyasapgdQeiQ5iV+oGv+PW/WupBgH80NcHg5k+sFcklMijC
 XFyxZLxrVO7rsiE7alm1LKTYnWt82zN4ih5vrCGFcOWD3eIauDSQKrnSn
 9PwHEcn+SQ3wMbvrcYFJL1T/ajvaXgNvf9xXRwXNdw13xwfjIHpnGcWSm
 eD7bkDHVFDXB3LZDITJ5+HlxGFdNuC9j1Qt0ZcQCSijqQSZaDDjlcoNNL
 6NMH6QKxWZWc6KUmYy01/o1XOhWFd2NAx0qtv4h30pmh1/UKv5GyQAe7c A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="22662616"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="22662616"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 03:37:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="1116834850"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="1116834850"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.20.214])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 03:37:06 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] xe_live_ktest: Use xe_live_test kernel
 module
Date: Mon, 22 Jan 2024 12:35:28 +0100
Message-ID: <7633435.EvYhyI6sBW@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <dzacvbdditbneiu3e3fmstjmttcbne44yspumpkd6sjn56jqpk@vxu7sksbqrp6>
References: <20231205224926.2188996-1-lucas.demarchi@intel.com>
 <njwvai6cu7jwmy7lmg3vkg4jd52uq2f6es4obvdplkz43i6hpe@jqrzk4bveqqc>
 <dzacvbdditbneiu3e3fmstjmttcbne44yspumpkd6sjn56jqpk@vxu7sksbqrp6>
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
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Friday, 12 January 2024 00:45:37 CET Lucas De Marchi wrote:
> On Thu, Dec 21, 2023 at 04:15:23PM -0600, Lucas De Marchi wrote:
> >On Fri, Dec 08, 2023 at 12:13:36PM -0600, Lucas De Marchi wrote:
> >>On Thu, Dec 07, 2023 at 04:41:52PM +0100, Mauro Carvalho Chehab wrote:
> >>>On Tue,  5 Dec 2023 14:49:26 -0800
> >>>Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> >>>
> >>>>https://patchwork.freedesktop.org/series/126786/ groups all the live
> >>>>tests into a single kernel module. Use that module to run any of the
> >>>>tests triggered by igt.
> >>>>
> >>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >>>>---
> >>>>tests/intel/xe_live_ktest.c | 15 +++++----------
> >>>>1 file changed, 5 insertions(+), 10 deletions(-)
> >>>>
> >>>>diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
> >>>>index fe7b2e69f..c8bd68928 100644
> >>>>--- a/tests/intel/xe_live_ktest.c
> >>>>+++ b/tests/intel/xe_live_ktest.c
> >>>>@@ -19,15 +19,10 @@
> >>>> * Functionality: migrate
> >>>> */
> >>>>
> >>>>-struct kunit_tests {
> >>>>-	const char *kunit;
> >>>>-	const char *name;
> >>>>-};
> >>>>-
> >>>>-static const struct kunit_tests live_tests[] = {
> >>>>-	{ "xe_bo_test",		"bo" },
> >>>>-	{ "xe_dma_buf_test",	"dmabuf" },
> >>>>-	{ "xe_migrate_test",	"migrate" },
> >>>>+static const char *live_tests[] = {
> >>>>+	"bo",
> >>>>+	"dmabuf",
> >>>>+	"migrate",
> >>>>};
> >>>>
> >>>>igt_main
> >>>>@@ -35,5 +30,5 @@ igt_main
> >>>>	int i;
> >>>>
> >>>>	for (i = 0; i < ARRAY_SIZE(live_tests); i++)
> >>>>-		igt_kunit(live_tests[i].kunit, live_tests[i].name, NULL);
> >>>>+		igt_kunit("xe_live_test", live_tests[i], NULL);
> >>>
> >>>This loop will modprobe xe_live_test the times. Just do something
> >>>like:
> >>>
> >>>	igt_kunit("xe_live_test", "live_tests", NULL);
> >>
> >>but there's no such "live_tests" suite and we want to run each of
> >>them individually, not together.  How would you select the subtest
> >>otherwise?
> >
> >gentle ping as I want to merge the kernel patch that is blocked on this
> >one.
> 
> I did some tests today and... current situation is not very good. The
> kunit module has the param filter_glob to filter the testsuite, but it's
> not used at all by igt.  

Please see https://patchwork.freedesktop.org/series/126017/.  It has been 
blocked by the below mentioned xe -> kunit module dependency problem, but now 
as I'm back from my 2-months leave, I'll update it and resubmit as soon as we 
have that resolved with writable filter* module parameters.

> live_tests[i].name is more informational than
> to really do any filtering.
> 
> Another issue I see is that since we have the dep xe.ko -> kunit.ko, as
> soon as we load xe, kunit comes as a dependency. Since kunit's param are
> read-only, we can't really change the testsuite that will run without
> first remove xe. Having to reload xe multiple times doesn't seem a good
> option.
> 
> Some manual tests I did here. First a kernel patch:
> 
> 	diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
> 	index 1236b3cd2fbb..30ed9d321c19 100644
> 	--- a/lib/kunit/executor.c
> 	+++ b/lib/kunit/executor.c
> 	@@ -31,7 +31,7 @@ static char *filter_glob_param;
> 	 static char *filter_param;
> 	 static char *filter_action_param;
> 
> 	-module_param_named(filter_glob, filter_glob_param, charp, 0400);
> 	+module_param_named(filter_glob, filter_glob_param, charp, 0600);
> 	 MODULE_PARM_DESC(filter_glob,
> 			"Filter which KUnit test suites/tests run at 
boot-time, e.g. list* or list*.*del_test");
> 	 module_param_named(filter, filter_param, charp, 0400);
> 
> Now we can filter the testsuite at will:
> 
> 	# modprobe xe
> 	
> Run only xe_bo tests:
> 
> 	# echo -n xe_bo > /sys/modules/kunit/parameters/filter_glob
> 	# dmesg -C
> 	# modprobe xe_live_test
> 	# dmesg
> 	[ 4064.402190] KTAP version 1
> 	[ 4064.402195] 1..1
> 	[ 4064.403336]     KTAP version 1
> 	[ 4064.403339]     # Subtest: xe_bo
> 	[ 4064.403342]     # module: xe_live_test
> 	[ 4064.403410]     1..2
> 	...
> 	[ 4065.712622]     ok 2 xe_bo_evict_kunit
> 	[ 4065.712646] # xe_bo: pass:2 fail:0 skip:0 total:2
> 	[ 4065.712668] # Totals: pass:2 fail:0 skip:0 total:2
> 	[ 4065.712700] ok 1 xe_bo
> 
> Execute all live tests:
> 
> 	# modprobe -r xe_live_test
> 	# dmesg -C
> 	# echo -n \* > /sys/modules/kunit/parameters/filter_glob
> 	# modprobe xe_live_test
> 	# dmesg
> 	[ 5010.536719] KTAP version 1
> 	[ 5010.536725] 1..4
> 	[ 5010.537618]     KTAP version 1
> 	[ 5010.537620]     # Subtest: xe_bo
> 	[ 5010.537623]     # module: xe_live_test
> 	...
> 	[ 5011.831597]     KTAP version 1
> 	[ 5011.831599]     # Subtest: xe_dma_buf
> 	[ 5011.831601]     # module: xe_live_test
> 	...
> 	[ 5011.867751]     KTAP version 1
> 	[ 5011.867753]     # Subtest: xe_migrate
> 	[ 5011.867755]     # module: xe_live_test
> 	...
> 	[ 5011.882481]     KTAP version 1
> 	[ 5011.882483]     # Subtest: xe_mocs
> 	[ 5011.882485]     # module: xe_live_test
> 
> To simplify our kunit lib, we could also rely on kunit_debugfs to list
> tests.

That option also sits in my IGT queue, though it requires an updated Xe CI 
kconfig (or at least it did two months ago).

Thanks,
Janusz

> 
> I will prepare a patch for the kunit part in the kernel.
> 
> Lucas De Marchi
> 
> >
> >Lucas De Marchi
> >
> >>
> >>Lucas De Marchi
> >>
> >>>
> >>>>}
> >>>
> >>>Regards,
> >>>Mauro
> 




