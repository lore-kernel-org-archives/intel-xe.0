Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB46C48BF6
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 05:50:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1F010E61F;
	Wed, 21 Feb 2024 05:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VcyL4Tc1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF0510E61F
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 05:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708494623; x=1740030623;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GB6afcIgNaf+ytUNjWMJMk8PmFnbfDBSrwO6rwy5y3E=;
 b=VcyL4Tc1lf849POiD0OM2/Fxi9Ray02UGgeQcIdgVcCxLKAG5RGc34s9
 iHNPJQHYLeTSVB3sFTrj29cIyFYWZb9Wj3wL8Fr/FqehDTZN0y8gpUPqV
 gG2sv/fgI9KdDv7+j1Jy5CqRtEzq7gMD++3ye7ddy3RuKe5ogpVZUgdlp
 QS7+0Go9zdXzJD15qaAclBldKq6RhDQbbsCyDPncquBUh92AU7OKatjBf
 J2xUsC0dDZZkfzBjbuneLIuMXw7sdwr2lZdoCJijOnCWcefeUEJFOrISM
 DpIgubjQwGCmTDnX8aZ/qvJjuvuLNS37JYP0yyCOqoBFk6GFlg+F73rIr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="6416849"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="6416849"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 21:50:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="4918104"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 21:50:22 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe: Group live kunit tests
Date: Tue, 20 Feb 2024 21:48:21 -0800
Message-ID: <20240221055038.2071063-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

As was done for the normal kunit tests, group the live tests into a
single module, xe_live_test.ko.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

Rebase again. Now the igt changes are merged, with the exception of the
oneliner (extracted from
https://lore.kernel.org/igt-dev/20240202004529.552806-3-lucas.demarchi@intel.com/)
to actually do the rename.

 drivers/gpu/drm/xe/tests/Makefile           |  3 ++-
 drivers/gpu/drm/xe/tests/xe_bo_test.c       |  5 -----
 drivers/gpu/drm/xe/tests/xe_dma_buf_test.c  |  5 -----
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c | 10 ++++++++++
 drivers/gpu/drm/xe/tests/xe_migrate_test.c  |  5 -----
 drivers/gpu/drm/xe/tests/xe_mocs_test.c     |  5 -----
 6 files changed, 12 insertions(+), 21 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_live_test_mod.c

diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
index 9d1d88af8b2f..8cf2367449d8 100644
--- a/drivers/gpu/drm/xe/tests/Makefile
+++ b/drivers/gpu/drm/xe/tests/Makefile
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 
 # "live" kunit tests
-obj-$(CONFIG_DRM_XE_KUNIT_TEST) += \
+obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_live_test.o
+xe_live_test-y = xe_live_test_mod.o \
 	xe_bo_test.o \
 	xe_dma_buf_test.o \
 	xe_migrate_test.o \
diff --git a/drivers/gpu/drm/xe/tests/xe_bo_test.c b/drivers/gpu/drm/xe/tests/xe_bo_test.c
index f408f17f2164..a324cde77db8 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo_test.c
@@ -19,8 +19,3 @@ static struct kunit_suite xe_bo_test_suite = {
 };
 
 kunit_test_suite(xe_bo_test_suite);
-
-MODULE_AUTHOR("Intel Corporation");
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("xe_bo kunit test");
-MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c b/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
index 9f5a9cda8c0f..99cdb718b6c6 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
@@ -18,8 +18,3 @@ static struct kunit_suite xe_dma_buf_test_suite = {
 };
 
 kunit_test_suite(xe_dma_buf_test_suite);
-
-MODULE_AUTHOR("Intel Corporation");
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("xe_dma_buf kunit test");
-MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
diff --git a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
new file mode 100644
index 000000000000..eb1ea99a5a8b
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+#include <linux/module.h>
+
+MODULE_AUTHOR("Intel Corporation");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("xe live kunit tests");
+MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate_test.c b/drivers/gpu/drm/xe/tests/xe_migrate_test.c
index cf0c173b945f..eb0d8963419c 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate_test.c
@@ -18,8 +18,3 @@ static struct kunit_suite xe_migrate_test_suite = {
 };
 
 kunit_test_suite(xe_migrate_test_suite);
-
-MODULE_AUTHOR("Intel Corporation");
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("xe_migrate kunit test");
-MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
diff --git a/drivers/gpu/drm/xe/tests/xe_mocs_test.c b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
index ee40f31e1e12..6315886b659e 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
@@ -19,8 +19,3 @@ static struct kunit_suite xe_mocs_test_suite = {
 };
 
 kunit_test_suite(xe_mocs_test_suite);
-
-MODULE_AUTHOR("Intel Corporation");
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("xe_mocs kunit test");
-MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
-- 
2.43.0

