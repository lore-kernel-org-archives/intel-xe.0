Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A639CC4828D
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 00:30:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4ADD10ED8F;
	Fri,  2 Feb 2024 00:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KOsHxDAM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555E510ED8F
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 00:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706833843; x=1738369843;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NcOVEY5VxMY1wheVzO6yZRlNZel7qV0tDfKs+oT1a/o=;
 b=KOsHxDAMpiwZH0RqrsZNZFwx4Hn1m0c6SXz3fncSvZ9kJ2eYmRfHUssv
 hGw6MGpglIMl7QEC4S5GPuk0EJoKeVY6WO8AQSXjw+AlQXTXjy/hUQBma
 fFyUxDXZJeldlfG031EPYW9iGAOaQhhoo0J1Q65Q2HTWsl2NayS3q9lB9
 z+65LX9QTz5nQW6zQb0J2Bj5HWQYu0xBhzgvhczSzTGvOHsF9KcXqs8S4
 /px0BeYyf49tvf0jjkmygVKqTj3XsDPp5v1ux+GwWIngmNB7nmw85I3Y/
 v0wfNA0lBiTeWyMmsfFYP2PAJ566LdLPEnPd+4Jt6XBAuatEOfgHD27LG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="10702379"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="10702379"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 16:30:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="131521"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 16:30:39 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe: Group live kunit tests
Date: Thu,  1 Feb 2024 16:30:06 -0800
Message-ID: <20240202003047.552529-1-lucas.demarchi@intel.com>
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
single module, xe_live_tests.ko.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

Sending this again as previous version doesn't apply anymore.
The IGT side is still being worked on.



 drivers/gpu/drm/xe/tests/Makefile           |  3 ++-
 drivers/gpu/drm/xe/tests/xe_bo_test.c       |  5 -----
 drivers/gpu/drm/xe/tests/xe_dma_buf_test.c  |  5 -----
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c | 10 ++++++++++
 drivers/gpu/drm/xe/tests/xe_migrate_test.c  |  5 -----
 drivers/gpu/drm/xe/tests/xe_mocs_test.c     |  4 ----
 6 files changed, 12 insertions(+), 20 deletions(-)
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
index 4f62e7a4270b..6315886b659e 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
@@ -19,7 +19,3 @@ static struct kunit_suite xe_mocs_test_suite = {
 };
 
 kunit_test_suite(xe_mocs_test_suite);
-
-MODULE_AUTHOR("Intel Corporation");
-MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
-- 
2.43.0

