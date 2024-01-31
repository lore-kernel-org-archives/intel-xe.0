Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25022C48285
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 18:12:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC3910FBFB;
	Wed, 31 Jan 2024 18:12:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD1310FBF6;
 Wed, 31 Jan 2024 18:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706724754; x=1738260754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZEBZIpuX+dz3R2Cs35/9INAoNm5ASsxofrmiuTqlhck=;
 b=VQ8BGHxZkzUn0BjG6ThkDFjZoKBvJX+5qZPps2/MiHakIbcpmKc98Re3
 Jx94qGXaJNWgTUjPJh09KRqS4sjknIz2Y3sxh1xwfYdr+JPz58ddmAekd
 kSdMIs62MBw3Szcvx//d1usylJoPg5rJo2NYBmMv5WRTFyHL73cMMSGyf
 ExT9CzhA/m1Yl65OIllzeVO/1qCgG4Cz5HcRjZoOZZ1UY9JFSpamfSV7J
 OB3jzFyZeLsSSL2MPnI25c8EjDuFH9QltGjTqiyqgHqwwusRPpLCeAgPb
 G0BGVhDIZYFJYw2OEbsG9n3z+x6JrXSAdo5C2W5TjM3SvkwG/Vkwy0huY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="17067229"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="17067229"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 10:12:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="931930570"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="931930570"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.2.5])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 10:12:31 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 6/6] lib/kunit: Process module remove error after
 list errors
Date: Wed, 31 Jan 2024 19:03:53 +0100
Message-ID: <20240131181156.80571-14-janusz.krzysztofik@linux.intel.com>
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

Skip on any error from test case list gathering first, then, in
preparation for executing those test cases, on an error from unloading the
test module loaded in list only mode, so it is more clear if listing the
test cases was successful or not.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_kmod.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 53c54b1a0d..741c7fd055 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -1225,11 +1225,11 @@ static void kunit_get_tests(struct igt_list_head *tests,
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

