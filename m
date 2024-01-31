Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86669C47258
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 18:12:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6503010FBD9;
	Wed, 31 Jan 2024 18:12:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FD910FBD8;
 Wed, 31 Jan 2024 18:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706724743; x=1738260743;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zPtf2Bzzpvw0AO/Kq3umMZB53HrdTvZ9DM7OLh0cB44=;
 b=KQI7WVboqv0maKzA8wn2pGDeK+PPgeanAP3K2mz7LU6vLXNJGImcgXgQ
 rspf1ad9Y1qwwZ8TqXsRpsBrho3xQa/k6TVDISrNGHg0Rm1IvOxqK6P6r
 iS09srZ6BG95uH4Z9DreYFTi67aINXU2Nx7IS7DQObY87oKP5XYsmJGNV
 b3Om58mhxvoiDTBPBfcRlK+1GesV6YwfrKFSPdJm3WvMNFN8HZV/+ohB8
 gBl8VgDoN0lVefg499LvrzjRubMHVgOPQ3723zQewej7h50/5neksZS6d
 DEr4yyL50isNiyS/HOzMkyz3VykqXj/0btEBzoKadc0qWvZsy1CSUwsJy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="17067191"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="17067191"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 10:12:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="931930493"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="931930493"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.2.5])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 10:12:20 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 1/6] lib/kunit: Skip on empty list of test cases
Date: Wed, 31 Jan 2024 19:03:48 +0100
Message-ID: <20240131181156.80571-9-janusz.krzysztofik@linux.intel.com>
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

If loading the base KUnit module in list mode succeeds but our KTAP
parser or test suite filter returns an empty list of test cases then,
instead of calling igt_skip, we now unintentionally fall back to legacy
mode as if the module didn't support filter parameters.  Fix it.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
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

