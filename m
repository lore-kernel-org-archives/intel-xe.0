Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71670EED61E
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 18:17:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4394710E669;
	Fri, 15 Sep 2023 18:17:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F9010E669
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 18:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694801831; x=1726337831;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=53l4oUHi64VM59g9XmZ/xJUvkQDdG9PO8wwTJVwzb8o=;
 b=K+m9volyjl/LPLfYt8Lgwry+zolNfgHw0oGjeoFOzS2RM3xdRYM5bwmL
 NPKAXyweG2NPMaqx+wj5KLpBri2lL0CKoVZZ5zcdt+r5apGT25ztbB9iq
 JyLm+nR7xrCfrXI6rNC5FF0h4um29hDh+b1WCcBDVfkYzGyMIy5SobjMj
 uRwoFvuVKLf05DPDcy+1KEGbteQgM/LD0aipNyjF2znrmACtzvs7w6nox
 euHKykLEqX4y4acSFoTg6oXXbAqBanvTw5ooixNajvwcKJ5C0JbJkrvTV
 a7xTbW+z6iIHGQjYKBMbvgQF0Z6k71HvmcA2Cx29NP9fFc3zfWnsEECQ4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="445786735"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="445786735"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 11:17:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="918733516"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="918733516"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga005.jf.intel.com with ESMTP; 15 Sep 2023 11:17:09 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 15 Sep 2023 23:54:51 +0530
Message-Id: <20230915182457.3951938-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915182457.3951938-1-tejas.upadhyay@intel.com>
References: <20230915182457.3951938-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V4 1/7] drm/xe: Add drm-client infrastructure
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

Add drm-client infrastructure to record stats of consumption
done by individual drm client.

V2:
  - Typo - CI

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device.c       | 15 +++++++-
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++++
 drivers/gpu/drm/xe/xe_drm_client.c   | 52 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_drm_client.h   | 43 +++++++++++++++++++++++
 5 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_drm_client.c
 create mode 100644 drivers/gpu/drm/xe/xe_drm_client.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index cc95a46b5e4d..f3a376988f8b 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -51,6 +51,7 @@ xe-y += xe_bb.o \
 	xe_device.o \
 	xe_device_sysfs.o \
 	xe_dma_buf.o \
+	xe_drm_client.o \
 	xe_exec.o \
 	xe_execlist.o \
 	xe_exec_queue.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b6bcb6c3482e..60509fe9a1c6 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -18,6 +18,7 @@
 #include "xe_debugfs.h"
 #include "xe_display.h"
 #include "xe_dma_buf.h"
+#include "xe_drm_client.h"
 #include "xe_drv.h"
 #include "xe_exec_queue.h"
 #include "xe_exec.h"
@@ -43,13 +44,24 @@ struct lockdep_map xe_device_mem_access_lockdep_map = {
 
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 {
+	struct xe_device *xe = to_xe_device(dev);
+	struct xe_drm_client *client;
 	struct xe_file *xef;
+	int ret = -ENOMEM;
 
 	xef = kzalloc(sizeof(*xef), GFP_KERNEL);
 	if (!xef)
-		return -ENOMEM;
+		return ret;
+
+	client = xe_drm_client_alloc();
+	if (!client) {
+		kfree(xef);
+		return ret;
+	}
 
 	xef->drm = file;
+	xef->client = client;
+	xef->xe = xe;
 
 	mutex_init(&xef->vm.lock);
 	xa_init_flags(&xef->vm.xa, XA_FLAGS_ALLOC1);
@@ -89,6 +101,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 	xa_destroy(&xef->vm.xa);
 	mutex_destroy(&xef->vm.lock);
 
+	xe_drm_client_put(xef->client);
 	kfree(xef);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a82f28c6a3a0..32ab0fea04ee 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -466,6 +466,9 @@ struct xe_device {
  * struct xe_file - file handle for XE driver
  */
 struct xe_file {
+	/** @xe: xe DEVICE **/
+	struct xe_device *xe;
+
 	/** @drm: base DRM file */
 	struct drm_file *drm;
 
@@ -484,6 +487,9 @@ struct xe_file {
 		/** @lock: protects file engine state */
 		struct mutex lock;
 	} exec_queue;
+
+	/** @client: drm client */
+	struct xe_drm_client *client;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
new file mode 100644
index 000000000000..1558ca4e0eb7
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <drm/drm_print.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#include "xe_device_types.h"
+#include "xe_drm_client.h"
+
+/**
+ * xe_drm_client_alloc() - Allocate drm client
+ * @void: No arg
+ *
+ * Allocate drm client struct to track client memory against
+ * same till client life. Call this API whenever new client
+ * has opened xe device.
+ *
+ * Return: pointer to client struct or NULL if can't allocate
+ */
+struct xe_drm_client *xe_drm_client_alloc(void)
+{
+	struct xe_drm_client *client;
+
+	client = kzalloc(sizeof(*client), GFP_KERNEL);
+	if (!client)
+		return NULL;
+
+	kref_init(&client->kref);
+
+	return client;
+}
+
+/**
+ * __xe_drm_client_free() - Free client struct
+ * @kref: The reference
+ *
+ * This frees client struct. Call this API when xe device is closed
+ * by drm client.
+ *
+ * Return: void
+ */
+void __xe_drm_client_free(struct kref *kref)
+{
+	struct xe_drm_client *client =
+		container_of(kref, typeof(*client), kref);
+
+	kfree(client);
+}
diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_drm_client.h
new file mode 100644
index 000000000000..be097cdf5d12
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_drm_client.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_DRM_CLIENT_H_
+#define _XE_DRM_CLIENT_H_
+
+#include <linux/kref.h>
+#include <linux/list.h>
+#include <linux/pid.h>
+#include <linux/rcupdate.h>
+#include <linux/sched.h>
+#include <linux/spinlock.h>
+
+struct drm_file;
+struct drm_printer;
+
+struct xe_drm_client {
+	struct kref kref;
+	unsigned int id;
+};
+
+	static inline struct xe_drm_client *
+xe_drm_client_get(struct xe_drm_client *client)
+{
+	kref_get(&client->kref);
+	return client;
+}
+
+void __xe_drm_client_free(struct kref *kref);
+
+static inline void xe_drm_client_put(struct xe_drm_client *client)
+{
+	kref_put(&client->kref, __xe_drm_client_free);
+}
+
+struct xe_drm_client *xe_drm_client_alloc(void);
+static inline struct xe_drm_client *
+xe_drm_client_get(struct xe_drm_client *client);
+static inline void xe_drm_client_put(struct xe_drm_client *client);
+
+#endif
-- 
2.25.1

