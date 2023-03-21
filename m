Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CC4C761AF
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 22:06:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFA710E090;
	Tue, 21 Mar 2023 22:06:26 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76BB10E100
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 22:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679436379; x=1710972379;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LEG6X3YF/F23feYlTiTPYieG2e9GdULLkWzi5hsB7nM=;
 b=OlCaOH068gqW4Wbje89Bh6fJK/MEdXtDFPC8lYwbD23kX2gs3vPHa5JQ
 Hds8NHpJf7Ag943nDzZXFAcn0YYx3DPdqo0mrCD6M1jHlOTE/MpMoQnhf
 IGCLrsq5PKDvzH/ZEBEEarX1Z5T097DZ8+FbhhFS7UDhjOyF+yuoROAIC
 pqPwT9ejHbDvD1774GwVtBewqk5ws0tWTAvaQt8ulnsTdrcZGjo41rYzl
 jCkwg68VEdGSwC1DaX9Lalejgexj0j/xeeVY7CvsUy98eQekHpV81PJXW
 7WdDM7JOh9Hq3+0MdKF239jKtaesqxQFojFZOujfQv0A5BXh57GVJk07p w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="339109499"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="339109499"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 15:06:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="684065703"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="684065703"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 15:06:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Mar 2023 15:05:23 -0700
Message-Id: <20230321220527.595462-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230321220527.595462-1-lucas.demarchi@intel.com>
References: <20230321220527.595462-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/7] drm/xe: Move test infra out of xe_pci.[ch]
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Move code out of xe_pci.[ch] into tests/*.[ch], like is done in other
similar compilation units. Even if this is not part of "tests for
xe_pci.c", they are functions exported and required by other tests. It's
better not to clutter the module headers and sources with them.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c       |  2 +
 drivers/gpu/drm/xe/tests/xe_dma_buf.c  |  1 +
 drivers/gpu/drm/xe/tests/xe_migrate.c  |  1 +
 drivers/gpu/drm/xe/tests/xe_pci.c      | 62 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h | 15 +++++++
 drivers/gpu/drm/xe/xe_pci.c            | 52 +--------------------
 drivers/gpu/drm/xe/xe_pci.h            |  9 ----
 7 files changed, 82 insertions(+), 60 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_pci.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_pci_test.h

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 3c60cbdf516c..aa433a7b59b7 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -6,6 +6,8 @@
 #include <kunit/test.h>
 
 #include "tests/xe_bo_test.h"
+#include "tests/xe_pci_test.h"
+#include "tests/xe_test.h"
 
 #include "xe_bo_evict.h"
 #include "xe_pci.h"
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index e66a8361ae1f..cf9dddf1a8d7 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -6,6 +6,7 @@
 #include <kunit/test.h>
 
 #include "tests/xe_dma_buf_test.h"
+#include "tests/xe_pci_test.h"
 
 #include "xe_pci.h"
 
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 17829f878757..d410305c9b59 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -6,6 +6,7 @@
 #include <kunit/test.h>
 
 #include "tests/xe_migrate_test.h"
+#include "tests/xe_pci_test.h"
 
 #include "xe_pci.h"
 
diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
new file mode 100644
index 000000000000..643bddb35214
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "tests/xe_pci_test.h"
+
+#include "tests/xe_test.h"
+
+#include <kunit/test.h>
+
+struct kunit_test_data {
+	int ndevs;
+	xe_device_fn xe_fn;
+};
+
+static int dev_to_xe_device_fn(struct device *dev, void *__data)
+
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+	struct kunit_test_data *data = __data;
+	int ret = 0;
+	int idx;
+
+	data->ndevs++;
+
+	if (drm_dev_enter(drm, &idx))
+		ret = data->xe_fn(to_xe_device(dev_get_drvdata(dev)));
+	drm_dev_exit(idx);
+
+	return ret;
+}
+
+/**
+ * xe_call_for_each_device - Iterate over all devices this driver binds to
+ * @xe_fn: Function to call for each device.
+ *
+ * This function iterated over all devices this driver binds to, and calls
+ * @xe_fn: for each one of them. If the called function returns anything else
+ * than 0, iteration is stopped and the return value is returned by this
+ * function. Across each function call, drm_dev_enter() / drm_dev_exit() is
+ * called for the corresponding drm device.
+ *
+ * Return: Zero or the error code of a call to @xe_fn returning an error
+ * code.
+ */
+int xe_call_for_each_device(xe_device_fn xe_fn)
+{
+	int ret;
+	struct kunit_test_data data = {
+	    .xe_fn = xe_fn,
+	    .ndevs = 0,
+	};
+
+	ret = driver_for_each_device(&xe_pci_driver.driver, NULL,
+				     &data, dev_to_xe_device_fn);
+
+	if (!data.ndevs)
+		kunit_skip(current->kunit_test, "test runs only on hardware\n");
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
new file mode 100644
index 000000000000..de65d8c9ccb5
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 AND MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_PCI_TEST_H_
+#define _XE_PCI_TEST_H_
+
+struct xe_device;
+
+typedef int (*xe_device_fn)(struct xe_device *);
+
+int xe_call_for_each_device(xe_device_fn xe_fn);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b990985b5771..302f7f588da1 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -635,55 +635,5 @@ void xe_unregister_pci_driver(void)
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
-struct kunit_test_data {
-	int ndevs;
-	xe_device_fn xe_fn;
-};
-
-static int dev_to_xe_device_fn(struct device *dev, void *__data)
-
-{
-	struct drm_device *drm = dev_get_drvdata(dev);
-	struct kunit_test_data *data = __data;
-	int ret = 0;
-	int idx;
-
-	data->ndevs++;
-
-	if (drm_dev_enter(drm, &idx))
-		ret = data->xe_fn(to_xe_device(dev_get_drvdata(dev)));
-	drm_dev_exit(idx);
-
-	return ret;
-}
-
-/**
- * xe_call_for_each_device - Iterate over all devices this driver binds to
- * @xe_fn: Function to call for each device.
- *
- * This function iterated over all devices this driver binds to, and calls
- * @xe_fn: for each one of them. If the called function returns anything else
- * than 0, iteration is stopped and the return value is returned by this
- * function. Across each function call, drm_dev_enter() / drm_dev_exit() is
- * called for the corresponding drm device.
- *
- * Return: Zero or the error code of a call to @xe_fn returning an error
- * code.
- */
-int xe_call_for_each_device(xe_device_fn xe_fn)
-{
-	int ret;
-	struct kunit_test_data data = {
-	    .xe_fn = xe_fn,
-	    .ndevs = 0,
-	};
-
-	ret = driver_for_each_device(&xe_pci_driver.driver, NULL,
-				     &data, dev_to_xe_device_fn);
-
-	if (!data.ndevs)
-		kunit_skip(current->kunit_test, "test runs only on hardware\n");
-
-	return ret;
-}
+#include "tests/xe_pci.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
index 9e3089549d5f..611c1209b14c 100644
--- a/drivers/gpu/drm/xe/xe_pci.h
+++ b/drivers/gpu/drm/xe/xe_pci.h
@@ -6,16 +6,7 @@
 #ifndef _XE_PCI_H_
 #define _XE_PCI_H_
 
-#include "tests/xe_test.h"
-
 int xe_register_pci_driver(void);
 void xe_unregister_pci_driver(void);
 
-#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
-struct xe_device;
-
-typedef int (*xe_device_fn)(struct xe_device *);
-
-int xe_call_for_each_device(xe_device_fn xe_fn);
-#endif
 #endif
-- 
2.39.0

