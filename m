Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0140BC48292
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 19:03:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A7F10F2E8;
	Thu,  1 Feb 2024 19:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eMZvNVAd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE9B10F2E8;
 Thu,  1 Feb 2024 19:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706814196; x=1738350196;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mmT0JldzRK6DisBofumf6kz19AAHgECgSWMhUynDEYI=;
 b=eMZvNVAdK4MiL5nkNhFN9Dd8inC7tQ48iBFVZB/lPujRdTm1F3Jl1dcL
 uz9p2cbjYPJhPYMJZiy0jEDUwHbXVymbSx++bqNXhFqHDfKo3HLjm5GK4
 WS/YBE9/FvOuSMm0qIOoh5m9Y6a7waNBsZ+KU9flRUN5u+bKbuylmCDf1
 HAtIolzvUAluMj0uIYhYKx0B1GHxrrd/xFrDNXevowugLa2TGriQvpOoo
 UGC/gPKShCj+2IAzlCmfmy02A0oJolUskZqcB283LEufJYWtrY7wrwjRL
 9v9N06dHTF+xMJ5J4Ucm2vMB78CBc8D5Cl0gSnqOi2IU6VGO3rGrbmzhp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="407694498"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="407694498"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:03:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="912219426"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="912219426"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.1.219])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:03:13 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v3 5/6] lib/kunit: Report early kernel taints explicitly
Date: Thu,  1 Feb 2024 19:59:21 +0100
Message-ID: <20240201190237.150754-13-janusz.krzysztofik@linux.intel.com>
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

When we find the kernel tainted after loading a KUnit test module in
list only mode, report that taint immediately as the reason for skip
instead of executing and blaming our KTAP parser.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_kmod.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 83416d2aa4..0ac4ac7a02 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -1146,6 +1146,7 @@ static void kunit_get_tests(struct igt_list_head *tests,
 	char *suite_name = NULL, *case_name = NULL;
 	struct igt_ktap_result *r, *rn;
 	struct igt_ktap_results *ktap;
+	unsigned long taints;
 	int flags, err;
 
 	igt_skip_on_f(tst->kmsg < 0, "Could not open /dev/kmsg\n");
@@ -1181,6 +1182,7 @@ static void kunit_get_tests(struct igt_list_head *tests,
 	}
 
 	igt_skip_on(modprobe(tst->kmod, opts));
+	igt_skip_on(igt_kernel_tainted(&taints));
 
 	ktap = igt_ktap_alloc(tests);
 	igt_require(ktap);
-- 
2.43.0

