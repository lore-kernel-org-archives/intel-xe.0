Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC00C0015E
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 13:17:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC06910E346;
	Tue,  1 Aug 2023 13:17:20 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE98D10E340;
 Tue,  1 Aug 2023 13:17:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 45ECE6158A;
 Tue,  1 Aug 2023 13:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB9EC433CD;
 Tue,  1 Aug 2023 13:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690895837;
 bh=qXIRgH4mK+xtTO6grCOfqyhbajUmr7Zt70n3ttnq9n4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NscodObExuJ6qYr/qZV8BXmcaeXG9huOl7lIweoAgV95TST0F8UJVcvCvkUnyndym
 CikfBfqRw0A8ScDV7cPNhBLFnD5RSzdT9lebllSUoEYPJhOydWLPs7RWl008p2wU7S
 s139H2m1rIfRFDWgD47q4RuDCTYMShBiTiRCxFHC4LwCLYkIi7DLBCLyYzPRyJNFCl
 EcsFWAQQ5n3MxpX/+UX5RDp9QNglJIccXFESxZx10MzJ9nnHpXtIop9Jm2XBgzzdHM
 WZSGRGgIdgkvkhxxxdIZKDzx43pJC8/NczcR3FY9gIBib0oUJ8SI85XfDbw0GQR6+a
 toFQxKE1/YxYA==
Date: Tue, 1 Aug 2023 15:17:11 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <20230801151711.2765e2eb@coco.lan>
In-Reply-To: <20230731141021.2854827-6-janusz.krzysztofik@linux.intel.com>
References: <20230731141021.2854827-5-janusz.krzysztofik@linux.intel.com>
 <20230731141021.2854827-6-janusz.krzysztofik@linux.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
 linux-kselftest@vger.kernel.org, intel-xe@lists.freedesktop.org,
 kunit-dev@googlegroups.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Em Mon, 31 Jul 2023 16:10:23 +0200
Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> escreveu:

> According to KTAP specification[1], results should always start from a
> header that provides a TAP protocol version, followed by a test plan with
> a count of items to be executed.  That pattern should be followed at each
> nesting level.  In the current implementation of the top-most, i.e., test
> suite level, those rules apply only for test suites built into the kernel,
> executed and reported on boot.  Results submitted to dmesg from kunit test
> modules loaded later are missing those top-level headers.
> 
> As a consequence, if a kunit test module provides more than one test suite
> then, without the top level test plan, external tools that are parsing
> dmesg for kunit test output are not able to tell how many test suites
> should be expected and whether to continue parsing after complete output
> from the first test suite is collected.
> 
> Submit the top-level headers also from the kunit test module notifier
> initialization callback.
> 
> [1] https://docs.kernel.org/dev-tools/ktap.html#
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---
>  lib/kunit/test.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index 84e4666555c94..a29ca1acc4d81 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -729,6 +729,11 @@ EXPORT_SYMBOL_GPL(__kunit_test_suites_exit);
>  #ifdef CONFIG_MODULES
>  static void kunit_module_init(struct module *mod)
>  {
> +	if (mod->num_kunit_suites > 0) {
> +		pr_info("KTAP version 1\n");
> +		pr_info("1..%d\n", mod->num_kunit_suites);
> +	}
> +
>  	__kunit_test_suites_init(mod->kunit_suites, mod->num_kunit_suites);
>  }

IMO, the best would be instead to export kunit_exec_run_tests() and
use it here too.

Except for the nit, LGTM.


Thanks,
Mauro
