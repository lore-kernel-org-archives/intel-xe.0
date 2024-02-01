Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86073C48292
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 19:03:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C77710F2DF;
	Thu,  1 Feb 2024 19:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jz9C1MDZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0945D10F2DE;
 Thu,  1 Feb 2024 19:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706814188; x=1738350188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9PyNuyZqj6O54GR9+5F5aLK/8K+2ABr6D4/6kAbbwRw=;
 b=jz9C1MDZplpfQs95Ywv6SB/l2gkMDxtz4wtmVm+jBcQi7hG6puKVzdUz
 T/ZYum2hew9tJjkiDF2KJV9BlRE++UdfNdSt2FGtQa6G76JuXxF9hxjE2
 QTv9hBKc3DMr7MiGcng1DRpcN0wgXOIxkOiYmGoXgggGECzc35X5r7Ma1
 a9zuvrX4gENKopVW7XSQ++j49BL/1Op2LBAu3F6+4ZPFl1OS52HzyL1gy
 KDqR+7xPP82DxmHLdu7pOG0baO75ssZ6CAQvVggCCnMEKe44VpYjgfaCd
 KXbpJSPbmxKx+NbTTZgGF4rpcsgkqxfEmnt+wLSUomnVsGS4UohdaLCq+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="407694484"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="407694484"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:03:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="912219412"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="912219412"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.1.219])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:03:05 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v3 2/6] lib/kmode: Prepare open_parameters() helper for
 reuse by kunit
Date: Thu,  1 Feb 2024 19:59:18 +0100
Message-ID: <20240201190237.150754-10-janusz.krzysztofik@linux.intel.com>
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

Move the open_parameters() helper code up in the source file, above the
kunit related functions, so it is available to follow-up changes of the
kunit code.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_kmod.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index ad69173151..d1091bdc79 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -803,6 +803,14 @@ void igt_kselftest_get_tests(struct kmod_module *kmod,
 	kmod_module_info_free_list(pre);
 }
 
+static int open_parameters(const char *module_name)
+{
+	char path[256];
+
+	snprintf(path, sizeof(path), "/sys/module/%s/parameters", module_name);
+	return open(path, O_RDONLY);
+}
+
 struct modprobe_data {
 	struct kmod_module *kmod;
 	const char *opts;
@@ -1402,14 +1410,6 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
 	igt_ktest_fini(&tst);
 }
 
-static int open_parameters(const char *module_name)
-{
-	char path[256];
-
-	snprintf(path, sizeof(path), "/sys/module/%s/parameters", module_name);
-	return open(path, O_RDONLY);
-}
-
 int igt_ktest_init(struct igt_ktest *tst,
 		   const char *module_name)
 {
-- 
2.43.0

