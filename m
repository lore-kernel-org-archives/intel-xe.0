Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF2FC001DE
	for <intel-xe@archiver.kernel.org>; Mon, 31 Jul 2023 14:12:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD0410E2AA;
	Mon, 31 Jul 2023 14:12:46 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C8010E1AF;
 Mon, 31 Jul 2023 14:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690812764; x=1722348764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xfWKTT2Wn3/IWe//m/LpBpFN0F6nm+3nkhbl/ibfElU=;
 b=D7RoLEGSSRXBJYSsWpoOe1BhF5oPVLCNW1iv8RkHovivM1L2XEWwT7J1
 d67jcxsUMgYYZjJarVfsgD0cgFeA5VpPnNMSIfn16IGQd/SaCORIiWkAP
 ketO89XEp/tZy+ACCLfvti754Nt1YTVgS7C/rGcqNjhxXjMRjerTPPtlL
 dAJA6VK9Oi21pV671DsNsPAXJhAF7yAZge8pp+kJlp17Dc1OhlFA+3AsI
 JEqdGvdRBsc7JBJgvIG3AJ43A8gP8lFnHMcEH6Gpe+EKZxTggnf3QVyZp
 Kfla1iFrZfVbxNhtFEKTMWptSKG1fz7MyoNFrXrYK8wmzf9NB6QDkcGom A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="455403629"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="455403629"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 07:12:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="728324347"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="728324347"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.1.128])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 07:12:41 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>
Date: Mon, 31 Jul 2023 16:10:23 +0200
Message-ID: <20230731141021.2854827-6-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731141021.2854827-5-janusz.krzysztofik@linux.intel.com>
References: <20230731141021.2854827-5-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/3] kunit: Report the count of test suites in
 a module
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
Cc: linux-kernel@vger.kernel.org, igt-dev@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-xe@lists.freedesktop.org, kunit-dev@googlegroups.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

According to KTAP specification[1], results should always start from a
header that provides a TAP protocol version, followed by a test plan with
a count of items to be executed.  That pattern should be followed at each
nesting level.  In the current implementation of the top-most, i.e., test
suite level, those rules apply only for test suites built into the kernel,
executed and reported on boot.  Results submitted to dmesg from kunit test
modules loaded later are missing those top-level headers.

As a consequence, if a kunit test module provides more than one test suite
then, without the top level test plan, external tools that are parsing
dmesg for kunit test output are not able to tell how many test suites
should be expected and whether to continue parsing after complete output
from the first test suite is collected.

Submit the top-level headers also from the kunit test module notifier
initialization callback.

[1] https://docs.kernel.org/dev-tools/ktap.html#

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/kunit/test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 84e4666555c94..a29ca1acc4d81 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -729,6 +729,11 @@ EXPORT_SYMBOL_GPL(__kunit_test_suites_exit);
 #ifdef CONFIG_MODULES
 static void kunit_module_init(struct module *mod)
 {
+	if (mod->num_kunit_suites > 0) {
+		pr_info("KTAP version 1\n");
+		pr_info("1..%d\n", mod->num_kunit_suites);
+	}
+
 	__kunit_test_suites_init(mod->kunit_suites, mod->num_kunit_suites);
 }
 
-- 
2.41.0

