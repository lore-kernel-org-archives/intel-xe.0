Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97ADEC48286
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 19:03:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57FAC10F2DA;
	Thu,  1 Feb 2024 19:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UDELuCxG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A9810F2E4;
 Thu,  1 Feb 2024 19:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706814199; x=1738350199;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/vccEffWOBI/KxqMJyEyLdGYNzbd2DOOt4Bds7HPmPc=;
 b=UDELuCxGch7eq/YlhkYzEnqXzXHltY/rRz1zLLGQkyxrU/1WvBTyEzL8
 NG1tc3Ci1a5Rr+CzEmAgIHopaIbhc5N9nGhMzM5C/JvuRjkRHj0xsMHd5
 RK8o2luRsfZu/Yy9BDt7Alt8afB8aZrf3OtIuejEevACZsXRAgpjji4ab
 TDWuwm/SlRHyzP8rNqdJ0yhL2ZFERppfgroNS/hvuYLqWeFhvGsyjbh72
 DHR13TLG04CkFMg/RRi7/DTz3n+tHvokrJewLa/PAhlbITADnHTKOL+/w
 iALq3Ud9JdAhydm1s6yrPC5UXyrce+9yuT/nBa8eMSU4giZ6zpfF7F+NP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="407694515"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="407694515"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:03:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="912219434"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="912219434"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.1.219])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:03:16 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v3 6/6] lib/kunit: Process module remove error after
 list errors
Date: Thu,  1 Feb 2024 19:59:22 +0100
Message-ID: <20240201190237.150754-14-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201190237.150754-8-janusz.krzysztofik@linux.intel.com>
References: <20240201190237.150754-8-janusz.krzysztofik@linux.intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Skip on any error from test case list gathering first, then, in
preparation for executing those test cases, on an error from unloading the
test module loaded in list only mode, so it is more clear if listing the
test cases was successful or not.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_kmod.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 0ac4ac7a02..3163434aa6 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -1214,11 +1214,11 @@ static void kunit_get_tests(struct igt_list_head *tests,
 		free(case_name);
 	}
 
-	igt_skip_on(kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE));
-
 	igt_skip_on_f(err,
 		      "KTAP parser failed while getting a list of test cases\n");
 	igt_skip_on(igt_list_empty(tests));
+
+	igt_skip_on(kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE));
 }
 
 static void __igt_kunit(struct igt_ktest *tst,
-- 
2.43.0

