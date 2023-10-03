Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F65E7543A
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 09:13:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6F110E2C2;
	Tue,  3 Oct 2023 09:13:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BFD910E2C2;
 Tue,  3 Oct 2023 09:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696324414; x=1727860414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+Y6jUBlWNLU/D+cQG9AZGIVJHwiZ7fbGEI3+NqblW9A=;
 b=Qf9cnvfkTV7dpZr4P32y/TRDZrz8N42kMzUa7Pa8r1o85gaW1tU8UlFt
 /3WOzWR8JuXBc8yCFegsaxzQwb7f2GHJKI5ggvaX0vEjUes+lRkvYWu/S
 9XK22WRxalq3SC/GMEaf94hfTFUrhJBdx2zX6z8VygUHfU2DGyGUpizUR
 FMA1q5l2JIoZvXI8gkgQdaajuToCsZ/pGl9XFscEVoVNp+10z82igLXOe
 PpM3gEFiUNVRtK41jnhzWMnMWayqx6zvSQ6h0Z4Brh4Cza2CFcslCZPdr
 TWc02wEEtw6PlEe4YUq6KQrV2Z8yoVeOYQ2fSZ25F2X3oI3CGzrxhKGBK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="1419738"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="1419738"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 02:13:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="997935793"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; d="scan'208";a="997935793"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.14.111])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 02:13:30 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  3 Oct 2023 11:10:50 +0200
Message-ID: <20231003091044.407965-16-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231003091044.407965-11-janusz.krzysztofik@linux.intel.com>
References: <20231003091044.407965-11-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t 5/9] lib/kunit: Omit suite name prefix if
 the same as subtest name
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
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Kunit test modules usually contain one test suite, named after the module
name with the trailing "_test" or "_kunit" suffix omitted.  Since we
follow the same convention when we derive subtest names from module names,
there is a great chance that those two names match.  Take this into
account when composing names for IGT dynamic sub-subtest names and drop
the leading test suite name component when it is the same as subtest name.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/igt_kmod.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 7bca4cdaab..387efbb59f 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -885,7 +885,8 @@ static void kunit_result_free(struct igt_ktap_result **r,
 	*r = NULL;
 }
 
-static void __igt_kunit(struct igt_ktest *tst, const char *opts)
+static void
+__igt_kunit(struct igt_ktest *tst, const char *name, const char *opts)
 {
 	struct modprobe_data modprobe = { pthread_self(), tst->kmod, opts, 0, };
 	char *suite_name = NULL, *case_name = NULL;
@@ -928,7 +929,11 @@ static void __igt_kunit(struct igt_ktest *tst, const char *opts)
 
 		r = igt_list_first_entry(&results, r, link);
 
-		igt_dynamic_f("%s-%s", r->suite_name, r->case_name) {
+		igt_dynamic_f("%s%s%s",
+			      strcmp(r->suite_name, name) ?  r->suite_name : "",
+			      strcmp(r->suite_name, name) ? "-" : "",
+			      r->case_name) {
+
 			if (r->code == IGT_EXIT_INVALID) {
 				/* parametrized test case, get actual result */
 				kunit_result_free(&r, &suite_name, &case_name);
@@ -1069,7 +1074,7 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
 	 * and for documentation.
 	 */
 	igt_subtest_with_dynamic(name)
-		__igt_kunit(&tst, opts);
+		__igt_kunit(&tst, name, opts);
 
 	igt_fixture
 		igt_ktest_end(&tst);
-- 
2.42.0

