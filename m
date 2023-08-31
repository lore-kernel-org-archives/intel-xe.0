Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46005C83F10
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 08:58:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C4010E5CD;
	Thu, 31 Aug 2023 08:58:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB7810E1AC
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 08:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693472290; x=1725008290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a3uc1Auw/Mt25W6kYijmeC/vzqP/c0tgVitYgbFG3L8=;
 b=Vt3IWpZkejY7vjiTaPiGNB3uZLifeaNDudnrx2zl+wvQroa5d0gJO1Yv
 /HpzaA0VTv7fevBna5RKkbDmqKxruLDpZxtisbeLDErxneZjXy/byLGkE
 6xglQcwKLkvGNZkbTPLwpojW6hq+8LZDSjFWsqs9zuo2sRA9taY9MAAII
 5PRDZGC4IXYk/Da3izYHMxfgkHvqDGeIfv+CRl/1Hvw23X05f4pCTDyZ0
 gQwghkVXfwc5ekLJTMLPUZjJdRxPPTotlMqMTWbgglqoxO5iepZyupOXq
 Y+NlIL2Ow26DTgxdLy511U+3jV+uenoWMU/EXLkEKmKR+yLbvDXSz4OSX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="375814154"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="375814154"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 01:58:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="716257346"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="716257346"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga006.jf.intel.com with ESMTP; 31 Aug 2023 01:58:08 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 31 Aug 2023 14:35:30 +0530
Message-Id: <20230831090536.2949934-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
References: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/7] drm/xe: Add drm-client infrastructure
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
index 9d2311f8141f..f9c25cb2f890 100644
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
index 109aeb25d19c..cf59c7b74eaf 100644
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
index 750e1f0d3339..d210a535c703 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -462,6 +462,9 @@ struct xe_device {
  * struct xe_file - file handle for XE driver
  */
 struct xe_file {
+	/** @xe: xe DEVICE **/
+	struct xe_device *xe;
+
 	/** @drm: base DRM file */
 	struct drm_file *drm;
 
@@ -480,6 +483,9 @@ struct xe_file {
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
index 000000000000..ea7993338076
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
+ * Return: pointer to client struct or NULL if cant allocate
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

