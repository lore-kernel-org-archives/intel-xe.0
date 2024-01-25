Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD691C47258
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 16:59:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9930210F940;
	Thu, 25 Jan 2024 16:59:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91CA10F940;
 Thu, 25 Jan 2024 16:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706201962; x=1737737962;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ANmdMBP00MAcTmWhY7URzQIaY3KniRuNIxsmVQcslGM=;
 b=kVZpm9WgRo7yP8yHGBt/Lm9bs5L1J2R+uP3Lz7lhxIwsQY9ozoI7S3QQ
 2bigA+LmigQQAikfcJHgbKWR+sMI6vpye5GR9iUun3GxIGLNjdgLZDq8f
 oWVPWciHKWvyOydGi5jxWgSfo1vCtCwj6trxRj5GZFW4Ar3JFjfi5nJ9X
 D8ZpFBVbjkyHsvQTTgWq9Afu71JyLH8t62m8FJZsUl8UKx6yD7BYHznQL
 zc97rAbpeNKgLECCqVXA8LTibkV4pu3kRZTD3ZJvQeagEUR6Md0kDByOM
 GvCOWDV6faqnht7BZsI2ka9DUtmCY2ycH4lNo5XTjzeWR3MJW6ne00ZKX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="23682532"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="23682532"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 08:58:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="786819923"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="786819923"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.20.225])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 08:58:32 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/3] lib/kunit: Process module remove error after list
 errors
Date: Thu, 25 Jan 2024 17:52:12 +0100
Message-ID: <20240125165749.15599-8-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125165749.15599-5-janusz.krzysztofik@linux.intel.com>
References: <20240125165749.15599-5-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Skip on any error from test case list gathering phase first, then, in
preparation for executing those test cases, from unloading the test module
loaded in list only mode, so it is more clear if listing the test cases
was successful or not.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_kmod.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 01198e75dc..436aad58b3 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -1245,10 +1245,10 @@ static void kunit_get_tests(struct igt_list_head *tests,
 		free(case_name);
 	}
 
-	igt_skip_on(kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE));
-
 	igt_skip_on_f(err,
 		      "KTAP parser failed while getting a list of test cases\n");
+
+	igt_skip_on(kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE));
 }
 
 static void __igt_kunit(struct igt_ktest *tst,
-- 
2.43.0

