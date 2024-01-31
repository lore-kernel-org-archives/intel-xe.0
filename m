Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9246FC4828F
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 18:12:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A2910FBDF;
	Wed, 31 Jan 2024 18:12:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EEFD10FBD9;
 Wed, 31 Jan 2024 18:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706724746; x=1738260746;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DiqUE8xI4znDRXjYhB5LTEGynr5ye7YiVqeGGvfUW1Q=;
 b=fkIkYqDVgwGQvMTR4H1pmMkVmzKQnO4UecZmef0CZDiW5SBy8g8p8hu4
 Jzcki2KEpnc2NkZGM5sMqscKZeZJdJCjDHxsvjCi2l7l6MVgFS8rvIN5J
 Xs39ePnZDCqpXrYlxAYKqJZ1uwVmnNhfjkAU2/xavyaD+VydP4cgQBpv4
 aGa3G6c0QjBcF8MD5IYxBdeBJ5bCLfCz42iVIbI6A/phuju8oDBQnQ/+e
 O4w6BmLpt3Uq/+WJLiLZaEQn9sBulegwMmR97sE6wxTCPZkCAzNw9okK2
 Mh1yPVSXHmnwuva/5Mae6cWuKD4my9mFdXDXXdDO/r/em/okV4CUTpyVo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="17067200"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="17067200"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 10:12:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="931930516"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="931930516"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.2.5])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 10:12:22 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 2/6] lib/kmode: Prepare open_parameters() helper for
 reuse by kunit
Date: Wed, 31 Jan 2024 19:03:49 +0100
Message-ID: <20240131181156.80571-10-janusz.krzysztofik@linux.intel.com>
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

Move the open_parameters() helper code up in the source file, above the
kunit related functions, so it is available to follow-up changes of the
kunit code.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
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

