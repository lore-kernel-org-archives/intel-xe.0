Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62995E75437
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 09:13:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082B110E2A5;
	Tue,  3 Oct 2023 09:13:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E8F10E039;
 Tue,  3 Oct 2023 09:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696324407; x=1727860407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lzvV8s+EpQm2AeZ7Nktrs/HZQJ2NeXSeewgj0+Mm3og=;
 b=CIRadP94+OQ79gsV7xQtZTCi7ynYQLLN4XgnqTmmXXDNu3T9dEscOgpT
 eHaY3QrMqhuxI9Q32VSfyz+4LN5vco/kPU6UysT2E9niMbwUqDFX17OPn
 NGGYYlQhgiaRAmvgqux667vvl/DzNiwoa3XL1F57UBY2WIAeN05WwTHVT
 CDAs5+JJl+QcY8MMwNEuXIoi5ogWXxRQll9jHS+XMhq4ObFg58hueAF8u
 RlBXtZY1Io6eLm2lyn5cawkGfSiIfH+glKQMz61mVKGLrMSb2k2gldxdi
 WSswckIBZ1Ut+M+V5P6J7lFccS0EUjZ4Sa86U75TxjDcPnHZiX5oeYfEg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="1419698"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="1419698"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 02:13:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="997935751"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; d="scan'208";a="997935751"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.14.111])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 02:13:21 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  3 Oct 2023 11:10:47 +0200
Message-ID: <20231003091044.407965-13-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231003091044.407965-11-janusz.krzysztofik@linux.intel.com>
References: <20231003091044.407965-11-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t 2/9] lib/kunit: Be more verbose on errors
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

Use a more verbose variant of igt_fail() when failing a dynamic sub-
subtest on kernel taint.  Also, print a debug message on string
duplication failure.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_kmod.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 05ff178b27..df0e650d49 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -834,7 +834,7 @@ static void __igt_kunit(struct igt_ktest *tst, const char *opts)
 			if (!pthread_tryjoin_np(modprobe_thread, NULL))
 				igt_assert_eq(modprobe.err, 0);
 
-			igt_fail_on(igt_kernel_tainted(&taints));
+			igt_assert_eq(igt_kernel_tainted(&taints), 0);
 		}
 
 		free(result);
@@ -861,7 +861,7 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
 	 */
 	if (!name) {
 		name = strdup(module_name);
-		if (name) {
+		if (!igt_debug_on(!name)) {
 			char *suffix = strstr(name, "_test");
 
 			if (!suffix)
-- 
2.42.0

