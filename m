Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523E8CD6E7A
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 14:32:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F01F10E8DD;
	Wed, 11 Oct 2023 14:32:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34BC10E8DB;
 Wed, 11 Oct 2023 14:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697034718; x=1728570718;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F2r4gA67wREUpFTFt6demyQUbKEHwHhQXaRMzkkq3HY=;
 b=GMQOH5ZAkPu221XaCoiwQjzWxKwjBn18um6HbNimgGI7qkAlqsERt3Cv
 MRO4KI/2dJEffMdh2pKRNV5TF8ATG13zG26GHSBhFORGghRePLME6IXDD
 a8jyiyb9spjtRAy62uiQErc150vGsr9qml2JlX66MGRjH61Ml5fQmFHOd
 hj8loFQU3QsdPN/xB8NFjNcb7Au09GnpUld4tpTESXlzL6x6f6GWMeN9z
 dJkMN3QvZp8ILPvjHBZ7I9OKXnfbbwYvdKEiy5XxySEUXvdq9Rz82pRgO
 ILXwD6arJc94NP5V3LjnIRoe8nL2ZQxi/rpGUfWh1xDe16X+bbqfXIkQD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="364042076"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="364042076"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 07:31:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="897641593"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="897641593"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.15.228])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 07:30:11 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 Oct 2023 16:17:43 +0200
Message-ID: <20231011141734.590321-21-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231011141734.590321-13-janusz.krzysztofik@linux.intel.com>
References: <20231011141734.590321-13-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t v3 08/11] lib/kunit: Provide all results
 cleanup helper
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

Planned changes require a couple of loops around kunit_result_free().
Since we already have such loop, move it into a helper in preparation for
future uses.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_kmod.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index d014644fb4..21c547bf42 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -888,13 +888,25 @@ static void kunit_result_free(struct igt_ktap_result **r,
 	*r = NULL;
 }
 
+static void kunit_results_free(struct igt_list_head *results,
+			       char **suite_name, char **case_name)
+{
+	struct igt_ktap_result *r, *rn;
+
+	igt_list_for_each_entry_safe(r, rn, results, link)
+		kunit_result_free(&r, suite_name, case_name);
+
+	free(*case_name);
+	free(*suite_name);
+}
+
 static void
 __igt_kunit(struct igt_ktest *tst, const char *name, const char *opts)
 {
 	struct modprobe_data modprobe = { tst->kmod, opts, 0, pthread_self(), };
 	char *suite_name = NULL, *case_name = NULL;
-	struct igt_ktap_result *r, *rn;
 	struct igt_ktap_results *ktap;
+	struct igt_ktap_result *r;
 	pthread_mutexattr_t attr;
 	IGT_LIST_HEAD(results);
 	unsigned long taints;
@@ -1000,11 +1012,7 @@ __igt_kunit(struct igt_ktest *tst, const char *name, const char *opts)
 
 	} while (ret == -EINPROGRESS);
 
-	igt_list_for_each_entry_safe(r, rn, &results, link)
-		kunit_result_free(&r, &suite_name, &case_name);
-
-	free(case_name);
-	free(suite_name);
+	kunit_results_free(&results, &suite_name, &case_name);
 
 	switch (pthread_mutex_lock(&modprobe.lock)) {
 	case 0:
-- 
2.42.0

