Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADC1C4829F
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 10:16:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77E110F6D0;
	Tue,  6 Feb 2024 10:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SchWIZ8J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8519110FB98;
 Tue,  6 Feb 2024 10:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707214561; x=1738750561;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zlab+ZGTE7p3G+I7393YhcEUUL4PJxSZwnjujfSpI4M=;
 b=SchWIZ8JZEVswK5f4Z0Zytq0nU2lNautw8iWidw+yYOpwi9+KGAgWjbL
 iFGMO5iDQnA+3v+aroLZ4DQT3pzZMn6H/05GvEKx1+IN3dmFrYa7tc0iM
 iXcg2ppGxj0lt2FNj/ksejOZJuC7cLXig98x463sX4s3Ma5LYYwl/Ql3M
 jo6RZ3tPKvj+whTDkWE/Ug/ZnNI4SafSMlY1ybPSNE//usziVSCEoD70Y
 wZaoVkwcKOK7HqExvU6CUHgnxtIqCBw+YTw8PEQ8FXAQ8SSoRim6voqye
 JANNiVqvtMHDctb3mITfgruKP/aNlgZyrGZPwzhMrRCGTllDUvgLnx/qV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="4525591"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="4525591"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 02:16:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; d="scan'208";a="38405720"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.2.162])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 02:15:58 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v4 5/8] lib/kunit: Report early kernel taints explicitly
Date: Tue,  6 Feb 2024 11:00:29 +0100
Message-ID: <20240206101514.6897-15-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206101514.6897-10-janusz.krzysztofik@linux.intel.com>
References: <20240206101514.6897-10-janusz.krzysztofik@linux.intel.com>
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

When we find the kernel tainted after loading a KUnit test module in
list only mode, report that taint immediately as the reason for skip
instead of executing and blaming our KTAP parser.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_kmod.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 5931121944..578c8a0909 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -1160,6 +1160,7 @@ static bool kunit_get_tests(struct igt_list_head *tests,
 	char *suite_name = NULL, *case_name = NULL;
 	struct igt_ktap_result *r, *rn;
 	struct igt_ktap_results *ktap;
+	unsigned long taints;
 	int flags, err;
 
 	igt_skip_on_f(tst->kmsg < 0, "Could not open /dev/kmsg\n");
@@ -1182,6 +1183,7 @@ static bool kunit_get_tests(struct igt_list_head *tests,
 		return false;
 
 	igt_skip_on(modprobe(tst->kmod, opts));
+	igt_skip_on(igt_kernel_tainted(&taints));
 
 	ktap = igt_ktap_alloc(tests);
 	igt_require(ktap);
-- 
2.43.0

