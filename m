Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3771FCD37B0
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 13:52:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E899810E2C5;
	Mon, 18 Sep 2023 13:52:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA0E10E2C3;
 Mon, 18 Sep 2023 13:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695045169; x=1726581169;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xk5x1k/33qi2QectDJlPg2OZ13MAVe/dMUo+KUPEb18=;
 b=X6X99oRoOLEIRacWa9LVeXqDO1zmi3ih52+lZJCtfSsHENRJDWng46hs
 tFkGJlNh822/JhvVn7/a49/7B6Kx/ZO9coT9rIFbbBq6DCwNnC56MUwYU
 Pm8hqwRjx78qEsjn62CmMMt1K4qQTpVNM+H5e5+sp8CaNY6sRscw07Jtt
 hIwkgzBg/ya3MrzQBHBQj+yHAnBXoxit3mCFpoHNN/Pqbs/Uj26N9FQeZ
 jbralXndER+yKZNGbc+neBs9rtGKgZ9bCVnbb6eKOEDNE2NiCLhoE+vUb
 K+hVFPE5FG/TyKgg2iZ9awAOwKK738K4fln5PKOoGzUDFrqWIHLB8SEMQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="376969669"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="376969669"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 06:52:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="749030554"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="749030554"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.18.199])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 06:52:47 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 18 Sep 2023 15:43:01 +0200
Message-ID: <20230918134249.31645-30-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918134249.31645-19-janusz.krzysztofik@linux.intel.com>
References: <20230918134249.31645-19-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t v3 11/17] lib/kunit: Fail / skip on kernel
 taint
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
Cc: intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Isabella Basso <isabbasso@riseup.net>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Similar to how igt_kselftest() handles kernel taints, fail current dynamic
sub-subtest and skip remaining ones when a kernel taint is detected during
execution of kunit test cases.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/igt_kmod.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 96240543a7..77fc971f8f 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -761,6 +761,7 @@ static void __igt_kunit(struct igt_ktest *tst, const char *opts)
 	bool is_builtin;
 	struct ktap_test_results *results;
 	struct ktap_test_results_element *temp;
+	unsigned long taints;
 	int flags, ret;
 
 	igt_skip_on_f(tst->kmsg < 0, "Could not open /dev/kmsg\n");
@@ -785,12 +786,20 @@ static void __igt_kunit(struct igt_ktest *tst, const char *opts)
 
 	while (READ_ONCE(results->still_running) || READ_ONCE(results->head) != NULL)
 	{
+		if (igt_kernel_tainted(&taints)) {
+			ktap_parser_cancel();
+			break;
+		}
+
 		if (READ_ONCE(results->head) != NULL) {
 			pthread_mutex_lock(&results->mutex);
 
-			igt_dynamic(results->head->test_name)
+			igt_dynamic(results->head->test_name) {
 				igt_assert(READ_ONCE(results->head->passed));
 
+				igt_fail_on(igt_kernel_tainted(&taints));
+			}
+
 			temp = results->head;
 			results->head = results->head->next;
 			free(temp);
@@ -801,6 +810,7 @@ static void __igt_kunit(struct igt_ktest *tst, const char *opts)
 
 	ret = ktap_parser_stop();
 
+	igt_skip_on(igt_kernel_tainted(&taints));
 	igt_skip_on_f(ret, "KTAP parser failed\n");
 }
 
-- 
2.41.0

