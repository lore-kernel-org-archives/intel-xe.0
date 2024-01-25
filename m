Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23262C47258
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 16:59:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01D410F15B;
	Thu, 25 Jan 2024 16:59:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D68110F92F;
 Thu, 25 Jan 2024 16:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706201956; x=1737737956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xsp2FKGr8in5rRG3ICMLfQ8UnXCYvcRlahNYTXFx+VU=;
 b=CfP2q5pnfby9VezZo5Xcf+m+tv07tdU9eHKsOg6A6RfJvDwF0TXsQCrY
 Hz2FvYKLd9QvvRTL8jivVHt1IhdgSATVxbNtlWLVDkXEi0R0qqTjNW8mE
 4+HyjLE50joMeEzSIOPzoXaCIKUVwYPHK5dzISUSsgY3PLLlFH6i/m/Ys
 uSm5H0AhvO7tAvhWiZjfxqFjMwBp/QNxZFBpKLLaK2/UxRrzfhp4CoVjH
 STrnRy8N7D0j2gvCIxD+IZDCQ7dxcM9nuheXeySea6JT898+jY/Yn7Kv3
 vSXHW/DoYYWf6T6bEDwAVqvHtW+RfYd966HMR+dpxBeoVsLbk505hqLks Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="23682510"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="23682510"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 08:58:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="786819910"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="786819910"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.20.225])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 08:58:29 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/3] lib/kunit: Report early kernel taints explicitly
Date: Thu, 25 Jan 2024 17:52:11 +0100
Message-ID: <20240125165749.15599-7-janusz.krzysztofik@linux.intel.com>
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

When we find the kernel tainted after loading our kunit test module in
list only mode, report that taint immediately as the reason for skip
instead of executing and blaming our ktap parser.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_kmod.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 4f96dafe01..01198e75dc 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -1213,6 +1213,7 @@ static void kunit_get_tests(struct igt_list_head *tests,
 	}
 
 	igt_skip_on(modprobe(tst->kmod, opts));
+	igt_skip_on(igt_kernel_tainted(&taints));
 
 	ktap = igt_ktap_alloc(tests);
 	igt_require(ktap);
-- 
2.43.0

