Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F299C27C40
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 20:32:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F091010E319;
	Wed, 22 Nov 2023 20:32:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F4110E318
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 20:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700685139; x=1732221139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KR4zrMY2OpVne1WtyPlZoDuAXuJEHmsMQ63NjZrNP7Y=;
 b=UHt/cjt1cjCfeIjAiEzY/N+tPsGQ2JzCUY2zWkF1dHckG79llVuQdbWM
 sl7GRKYzKM+lAALA7IYygprVt1HvfKhIG0BLNvkDIQrUHmwXLx0GXbPTr
 CEBmLzeWYZSlSf9pt0FGBvd8rj4P4loN8/pvXfNJFs7r718nha16g2Att
 snqa8iGYypxmEaRsoaL971ISc1ephE2mjqls/HNXLVEMAMwPhd9hrVFfz
 WA7o0xwsBHN3ZK1f89av8llWyj5LFa3t3gVuTGwqxo/C10jT6eBZha5C5
 P+xTrtw7k0tWDET5xs0eMWZ3YDnbDA60HRgQ70ErobQ0hlwo6ZRufSNXY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="13702690"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="13702690"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 12:32:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="910964495"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="910964495"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 12:32:18 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 22 Nov 2023 12:31:47 -0800
Message-Id: <20231122203147.988021-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231122203147.988021-1-lucas.demarchi@intel.com>
References: <20231122203147.988021-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Group live kunit tests
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

As was done for the normal kunit tests, group the live tests into a
single module, xe_live_tests.ko.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
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
index ef56bd517b28..fb0a446d1087 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
@@ -18,7 +18,3 @@ static struct kunit_suite xe_mocs_test_suite = {
 };
 
 kunit_test_suite(xe_mocs_test_suite);
-
-MODULE_AUTHOR("Intel Corporation");
-MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
-- 
2.40.1

