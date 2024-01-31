Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13DCC4828D
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 18:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6E910FBFA;
	Wed, 31 Jan 2024 18:12:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8BB610FBF1;
 Wed, 31 Jan 2024 18:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706724752; x=1738260752;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LTrzjIOuCKrc/NML+2Qjq1MyO2djMKX0qydZT08aitg=;
 b=ls0okNX8QdrSWYjFsWXTeTzJGrkcsCzDfW+ba5qL8c+P3//sg2tCm6cq
 eNOWe7wbatvbSjG2smngPTHs62FipqViKhm4fUBM7j2LTWCQ08i2DFxrn
 IBqWaRexcrnv944j4SkE//AkI0jYhprA06LlAf/KFu7XHVOjLkquk5n72
 d1IWzzSfvU0AVvQYZYJf6pkRESRXedfpByvZqDkn/MFtW2GE0/P4k0uPe
 CLSnErpCirED8wUfpP3svcWHBK27ZYsB23BcNwdBTHn3WY91COxolQtTq
 rAS85CrsOvm/pqZ6uS7p1EmlWuPRVWiW5u5c1zGLKe2qqrrjcHLvzdAia g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="17067224"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="17067224"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 10:12:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="931930555"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="931930555"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.2.5])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 10:12:29 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 5/6] lib/kunit: Report early kernel taints explicitly
Date: Wed, 31 Jan 2024 19:03:52 +0100
Message-ID: <20240131181156.80571-13-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240131181156.80571-8-janusz.krzysztofik@linux.intel.com>
References: <20240131181156.80571-8-janusz.krzysztofik@linux.intel.com>
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

When we find the kernel tainted after loading a KUnit test module in
list only mode, report that taint immediately as the reason for skip
instead of executing and blaming our KTAP parser.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_kmod.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 1d57ea708d..53c54b1a0d 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -1165,6 +1165,7 @@ static void kunit_get_tests(struct igt_list_head *tests,
 	char *suite_name = NULL, *case_name = NULL;
 	struct igt_ktap_result *r, *rn;
 	struct igt_ktap_results *ktap;
+	unsigned long taints;
 	int flags, err;
 
 	igt_skip_on_f(tst->kmsg < 0, "Could not open /dev/kmsg\n");
@@ -1192,6 +1193,7 @@ static void kunit_get_tests(struct igt_list_head *tests,
 	}
 
 	igt_skip_on(modprobe(tst->kmod, opts));
+	igt_skip_on(igt_kernel_tainted(&taints));
 
 	ktap = igt_ktap_alloc(tests);
 	igt_require(ktap);
-- 
2.43.0

