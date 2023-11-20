Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB75FC2BB3F
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 22:19:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B74D10E20A;
	Mon, 20 Nov 2023 22:19:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C743910E20A
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 22:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700518756; x=1732054756;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5pzyO/ojpjmLAYM9fWo1SYU0JZgDd40P3u7mENPvkQI=;
 b=OLjLXZfljNtJM6eb4uwO1AUHvKQgdmENAlOjsfWpcLJQXQEG1sojfl/5
 NQjECmmLhNXzkTOg1+Y5nhd60ApVZywqlv2kZE+mCJkFsxWXSowKUpokh
 ciUEFjPIRJSD6pbTHG63XzF+dApFc7KcHeosWaA0l9mmtTarGfkTn3hY0
 Y6FvXv7iY2etWq+SeagK8cPzHcYh9jjlR4ABtkNmf/lLEi5IoHMLjfDYw
 OG86vexk2cJqy3sH4EVPo8kCqLm8jKhpVIbw+633lmmopDMfuqWpfyQYL
 BsqDdvncMBsPwDXTSo/fNH/u9FSR6u3zb6m2F2nAgb6Q5AmubteCOzXgn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="456054783"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="456054783"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 14:19:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="766444554"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="766444554"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 14:19:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 20 Nov 2023 14:19:04 -0800
Message-Id: <20231120221904.695630-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix modpost warning on kunit modules
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

When built with W=1, the following warnings show up on modpost:

	  MODPOST drivers/gpu/drm/xe/Module.symvers
	WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/xe/tests/xe_bo_test.o
	WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/xe/tests/xe_dma_buf_test.o
	WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/xe/tests/xe_migrate_test.o
	WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/xe/tests/xe_pci_test.o
	WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/xe/tests/xe_rtp_test.o
	WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/xe/tests/xe_wa_test.o

Add the module description for each of these to fix the warning.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo_test.c      | 1 +
 drivers/gpu/drm/xe/tests/xe_dma_buf_test.c | 1 +
 drivers/gpu/drm/xe/tests/xe_migrate_test.c | 1 +
 drivers/gpu/drm/xe/tests/xe_pci_test.c     | 2 +-
 drivers/gpu/drm/xe/tests/xe_rtp_test.c     | 1 +
 drivers/gpu/drm/xe/tests/xe_wa_test.c      | 1 +
 6 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo_test.c b/drivers/gpu/drm/xe/tests/xe_bo_test.c
index 1c868e3635bc..f408f17f2164 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo_test.c
@@ -22,4 +22,5 @@ kunit_test_suite(xe_bo_test_suite);
 
 MODULE_AUTHOR("Intel Corporation");
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("xe_bo kunit test");
 MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c b/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
index 35312bfd5fb7..9f5a9cda8c0f 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
@@ -21,4 +21,5 @@ kunit_test_suite(xe_dma_buf_test_suite);
 
 MODULE_AUTHOR("Intel Corporation");
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("xe_dma_buf kunit test");
 MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate_test.c b/drivers/gpu/drm/xe/tests/xe_migrate_test.c
index 39179eae890b..cf0c173b945f 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate_test.c
@@ -21,4 +21,5 @@ kunit_test_suite(xe_migrate_test_suite);
 
 MODULE_AUTHOR("Intel Corporation");
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("xe_migrate kunit test");
 MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.c b/drivers/gpu/drm/xe/tests/xe_pci_test.c
index 9c6f6c2c6c6e..daf652517608 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.c
@@ -70,5 +70,5 @@ kunit_test_suite(xe_pci_test_suite);
 
 MODULE_AUTHOR("Intel Corporation");
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("xe_pci kunit test");
 MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
-
diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index b2beba0019cd..a1d204133cc1 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -313,4 +313,5 @@ kunit_test_suite(xe_rtp_test_suite);
 
 MODULE_AUTHOR("Intel Corporation");
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("xe_rtp kunit test");
 MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
index 6e1127b276ea..01ea974591ea 100644
--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -138,4 +138,5 @@ kunit_test_suite(xe_rtp_test_suite);
 
 MODULE_AUTHOR("Intel Corporation");
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("xe_wa kunit test");
 MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
-- 
2.40.1

