Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B19DC4707B
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 00:13:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E2E10E9C5;
	Fri, 12 Jan 2024 00:13:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588C910E9C5
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 00:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705018397; x=1736554397;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AAr1jyF5ycUc3fnsLZxVVxgsc9+kH7u4LIsdUC1Iv88=;
 b=aTdBBOKf0EZS4XRB/qIuXAmOsfw0iFCtPhsGWXymJfP3XgQy+Etx4dpp
 PbCYbp1FGyBgP5t4lrP0w+1Ntsa2DI1xiRu6Uki7BvJ16f1PSZvoaRiX9
 mr1NKR+vGlYe+OwW9TpqTsV9X+oSidY2FXYd7ZtS6ZBrLHplittkZkGGP
 Whe8R+Do6DNM7ty0mxFbMIgQHrY7zJYA4LkMICbU3VECqtyXkgJQ1O1rc
 0jCbfrH0ho3YgrGBOIH/T0UCpsEOeUf6kaEzynbwLgczETYaLuvqRlJE6
 e0riPjO4lT/PYckJP1sVZjHFXi04PX6OXzNRHKiysZe066yLRhs38BZX6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="397915560"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="397915560"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 16:13:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="853120102"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="853120102"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 16:13:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kselftest@vger.kernel.org
Subject: [PATCH] kunit: Mark filter_glob param as rw
Date: Thu, 11 Jan 2024 16:12:40 -0800
Message-Id: <20240112001240.1710962-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 David Gow <davidgow@google.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

By allowing the filter_glob parameter to be written to, it's possible to
tweak the testsuites that will be executed on new module loads. This
makes it easier to run specific tests without having to reload kunit and
provides a way to filter tests on real HW even if kunit is builtin.
Example for xe driver:

1) Run just 1 test
	# echo -n xe_bo > /sys/module/kunit/parameters/filter_glob
	# modprobe -r xe_live_test
	# modprobe xe_live_test
	# ls /sys/kernel/debug/kunit/
	xe_bo

2) Run all tests
	# echo \* > /sys/module/kunit/parameters/filter_glob
	# modprobe -r xe_live_test
	# modprobe xe_live_test
	# ls /sys/kernel/debug/kunit/
	xe_bo  xe_dma_buf  xe_migrate  xe_mocs

References: https://lore.kernel.org/intel-xe/dzacvbdditbneiu3e3fmstjmttcbne44yspumpkd6sjn56jqpk@vxu7sksbqrp6/
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/kunit/executor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
index 1236b3cd2fbb..30ed9d321c19 100644
--- a/lib/kunit/executor.c
+++ b/lib/kunit/executor.c
@@ -31,7 +31,7 @@ static char *filter_glob_param;
 static char *filter_param;
 static char *filter_action_param;
 
-module_param_named(filter_glob, filter_glob_param, charp, 0400);
+module_param_named(filter_glob, filter_glob_param, charp, 0600);
 MODULE_PARM_DESC(filter_glob,
 		"Filter which KUnit test suites/tests run at boot-time, e.g. list* or list*.*del_test");
 module_param_named(filter, filter_param, charp, 0400);
-- 
2.40.1

