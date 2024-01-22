Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1F6C47DAF
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 17:14:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF97310EF6F;
	Mon, 22 Jan 2024 17:14:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6502610EF6F
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 17:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705943662; x=1737479662;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QzD4pwvbiYZ9itdJVQhid9o2mLBqbUNnCZYBsNS9LKg=;
 b=apARB/doijzgxI0RoU2XU/SZEgQ9eYMC1MbrSW/HMAEgTdz5ol6AxjON
 K4jk0QayiuxZAhJ2/6yOfWaAyQW7IwSoJ5ExmAvx0tiKvQN0Tf4iNBHCR
 TIUqBrKy6FokrP95Y8IMQ73Le/I0VGohpzTvFE/JversO6Ahk0qUYZKz7
 1sdBXgarFmqokMrJrhMJgPAir9aJg4aAiUmVi7Xp0jW8MezCSbhUYUggJ
 iVeexQMOah9TwD7zpUaBlIr+3ujlFLjWwDwWlDHnFY8oc0MMsdubSJmbf
 uPI06ZkumT2pRto21Bp8XtdoQTfS2npj9LHrwhLmRFWj1O1GAhQl7dC8y w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="8023200"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="8023200"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 09:14:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="735233041"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="735233041"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 09:14:21 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kselftest@vger.kernel.org
Subject: [PATCH v2] kunit: Mark filter* params as rw
Date: Mon, 22 Jan 2024 09:14:08 -0800
Message-Id: <20240122171408.3328510-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Rae Moar <rmoar@google.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
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

For completeness and to cover other use cases, also change filter and
filter_action to rw.

Link: https://lore.kernel.org/intel-xe/dzacvbdditbneiu3e3fmstjmttcbne44yspumpkd6sjn56jqpk@vxu7sksbqrp6/
Reviewed-by: Rae Moar <rmoar@google.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

Rae, I kept your r-b from v1 since the additions are just what we talked
about.

v2: also change filter_action and filter to rw, testing with the xe
    module to see if filter=module=none filter_action=skip produces
    the result expected by igt

 lib/kunit/executor.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
index 1236b3cd2fbb..371ddcee7fb5 100644
--- a/lib/kunit/executor.c
+++ b/lib/kunit/executor.c
@@ -31,13 +31,13 @@ static char *filter_glob_param;
 static char *filter_param;
 static char *filter_action_param;
 
-module_param_named(filter_glob, filter_glob_param, charp, 0400);
+module_param_named(filter_glob, filter_glob_param, charp, 0600);
 MODULE_PARM_DESC(filter_glob,
 		"Filter which KUnit test suites/tests run at boot-time, e.g. list* or list*.*del_test");
-module_param_named(filter, filter_param, charp, 0400);
+module_param_named(filter, filter_param, charp, 0600);
 MODULE_PARM_DESC(filter,
 		"Filter which KUnit test suites/tests run at boot-time using attributes, e.g. speed>slow");
-module_param_named(filter_action, filter_action_param, charp, 0400);
+module_param_named(filter_action, filter_action_param, charp, 0600);
 MODULE_PARM_DESC(filter_action,
 		"Changes behavior of filtered tests using attributes, valid values are:\n"
 		"<none>: do not run filtered tests as normal\n"
-- 
2.40.1

