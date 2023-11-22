Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A93FC61D97
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 20:32:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1CC110E69F;
	Wed, 22 Nov 2023 20:32:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A7710E319
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 20:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700685139; x=1732221139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Oa/JD2FntTGA9M3I1lwxZOEiKecpPN/qj5KDbVZTqXs=;
 b=LTiK0mt0fh6ADJ8F1PxUrWYMbKG2rwjaEiKTbK1krHlLnW9Gtaw77SQ5
 a313f4Z3isB39qM28LnXM4O/xU4YzNnhtdrWAviqHMf/re5Yr8l0cFKZc
 JhEkhv/FS5s703WxX/t3ByCSPxLX95jKWzTCYifRE4FqO8kq591JiBydf
 fycl5mBCYoGhi+Ph/Z6nl/lcQ3iQOSuHhuLVnmlATZq00Nf/BM+KiPud8
 1gEb0rq4umh0ZodmYNjM14H31DW76nS+fgql7SpxdC+dbVCed2dyy0RRd
 RxDL9IHuCw84RscnhCqy8F8hkxyWzi6Z8+n6bRG5H3UxBA0opjokV9ybg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="13702688"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="13702688"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 12:32:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="910964491"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="910964491"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 12:32:17 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 22 Nov 2023 12:31:46 -0800
Message-Id: <20231122203147.988021-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231122203147.988021-1-lucas.demarchi@intel.com>
References: <20231122203147.988021-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Group normal kunit tests in a single
 module
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

Creating one module for each compilation unit to be tested seems
excessive as the number of tests increase. Group them all in a single
kunit test module called xe_test.ko.

The tests requiring the physical device, aka "live" tests, are still
kept in separate modules since they are normally triggered via igt,
and not via kunit.py. After igt is converted, those can be merged in
a single module as well.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/Makefile      |  7 ++++++-
 drivers/gpu/drm/xe/tests/xe_pci_test.c |  5 -----
 drivers/gpu/drm/xe/tests/xe_rtp_test.c |  5 -----
 drivers/gpu/drm/xe/tests/xe_test_mod.c | 10 ++++++++++
 drivers/gpu/drm/xe/tests/xe_wa_test.c  |  5 -----
 5 files changed, 16 insertions(+), 16 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_test_mod.c

diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
index 39d8a0892274..9d1d88af8b2f 100644
--- a/drivers/gpu/drm/xe/tests/Makefile
+++ b/drivers/gpu/drm/xe/tests/Makefile
@@ -1,10 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0
 
+# "live" kunit tests
 obj-$(CONFIG_DRM_XE_KUNIT_TEST) += \
 	xe_bo_test.o \
 	xe_dma_buf_test.o \
 	xe_migrate_test.o \
-	xe_mocs_test.o \
+	xe_mocs_test.o
+
+# Normal kunit tests
+obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_test.o
+xe_test-y = xe_test_mod.o \
 	xe_pci_test.o \
 	xe_rtp_test.o \
 	xe_wa_test.o
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.c b/drivers/gpu/drm/xe/tests/xe_pci_test.c
index daf652517608..59e29a148478 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.c
@@ -67,8 +67,3 @@ static struct kunit_suite xe_pci_test_suite = {
 };
 
 kunit_test_suite(xe_pci_test_suite);
-
-MODULE_AUTHOR("Intel Corporation");
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("xe_pci kunit test");
-MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index a1d204133cc1..83b0ba097a3e 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -310,8 +310,3 @@ static struct kunit_suite xe_rtp_test_suite = {
 };
 
 kunit_test_suite(xe_rtp_test_suite);
-
-MODULE_AUTHOR("Intel Corporation");
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("xe_rtp kunit test");
-MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
diff --git a/drivers/gpu/drm/xe/tests/xe_test_mod.c b/drivers/gpu/drm/xe/tests/xe_test_mod.c
new file mode 100644
index 000000000000..875f3e6f965e
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_test_mod.c
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+#include <linux/module.h>
+
+MODULE_AUTHOR("Intel Corporation");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("xe kunit tests");
+MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
index 01ea974591ea..4eb8e1e8a76c 100644
--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -135,8 +135,3 @@ static struct kunit_suite xe_rtp_test_suite = {
 };
 
 kunit_test_suite(xe_rtp_test_suite);
-
-MODULE_AUTHOR("Intel Corporation");
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("xe_wa kunit test");
-MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
-- 
2.40.1

