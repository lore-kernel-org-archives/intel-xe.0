Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A37DC4828D
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 19:03:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0565E10F2DA;
	Thu,  1 Feb 2024 19:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WQmoNoa0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC08810F2C6;
 Thu,  1 Feb 2024 19:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706814184; x=1738350184;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MV1R11Qp3Ek/xL43Qxi58gesxOHHLleg/+sStM/dLdo=;
 b=WQmoNoa0n01FSExllScZ7io6Iz/ZVXlziueSVc5MnDFtrCJrktWubefJ
 lBkeFDVrJH4yb/01IFjqh3XlEOfQVnhAIS7nctTGyx8u5do33ZOmHEqoL
 HvWkMxLCUmHpi6q+2KuPYGwcZCquYR5QTuAz1+WiuOc8rxw4Li978vxME
 K8XxgHjfYM029xNySe+t3v7eS73EUSrKWUUINe6YI06fYux84vkPZ+GaW
 RalhJMDCh4NzlmgHNmZ2aZz7edHvMD/dI8tGbZAKk1xv5SJK0gk9ae0Z1
 vVllCLxYKXbu68CiIQEPFUAA7rSEyNocn+ubSmd9wrtmriRe6nvciZs2L g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="407694475"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="407694475"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:03:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="912219407"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="912219407"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.1.219])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:03:02 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v3 1/6] lib/kunit: Skip on empty list of test cases
Date: Thu,  1 Feb 2024 19:59:17 +0100
Message-ID: <20240201190237.150754-9-janusz.krzysztofik@linux.intel.com>
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

If loading the base KUnit module in list mode succeeds but our KTAP
parser or test suite filter returns an empty list of test cases then,
instead of calling igt_skip, we now unintentionally fall back to legacy
mode as if the module didn't support filter parameters.  Fix it.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_kmod.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 250ab2107b..ad69173151 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -1163,6 +1163,7 @@ static void kunit_get_tests(struct igt_list_head *tests,
 
 	igt_skip_on_f(err,
 		      "KTAP parser failed while getting a list of test cases\n");
+	igt_skip_on(igt_list_empty(tests));
 }
 
 static void __igt_kunit(struct igt_ktest *tst,
-- 
2.43.0

