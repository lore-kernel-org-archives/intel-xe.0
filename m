Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6764DC04A6A
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 14:00:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BAEE10E07F;
	Wed,  9 Aug 2023 14:00:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E99189D8E
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 14:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691589647; x=1723125647;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EJxi9cxSCjmaLDPwBK6u2QgAmrnrj2Epj6EaUn7uIKg=;
 b=MW1+U/nQsJaHcTjzsbux3bw8MLY7Us0xqEznCvSUniE+cpRnANDiV1gz
 3ZjzEpQItB6+7tAVsTPGW4uXpmKmNRXbv1zzl7mBypVfrI2ppdcSorhYM
 8mynJe7JeTpHc9yRl0ovUuSq0fBoSW901b0WvdTrKAc20Ffdlzw2sTBvi
 dNKwdRd7uQqYvktm1UuN0N0t5cIsUKSym/AzGTS8DylJsvZl1zcH0GgRC
 QiHb+P/7vZUqW23HqLZEHRTA87h2MEy0nB3reOgy++3DK79N9T+ReSuE/
 VRPSv5bPuUg2j0xvPsRsbPOhPznAPXzdV19qQ+36TxlXVDDWxi7P01k2C A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="361257003"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="361257003"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 07:00:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="1062479929"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="1062479929"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga005.fm.intel.com with ESMTP; 09 Aug 2023 07:00:45 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  9 Aug 2023 19:37:44 +0530
Message-Id: <20230809140746.1614908-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230809140746.1614908-1-tejas.upadhyay@intel.com>
References: <20230809140746.1614908-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 1/3] drm/xe: Add drm-client infrastructure
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
 drivers/gpu/drm/xe/xe_device.c       | 13 ++++++++-
 drivers/gpu/drm/xe/xe_device_types.h |  3 ++
 drivers/gpu/drm/xe/xe_drm_client.c   | 34 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_drm_client.h   | 43 ++++++++++++++++++++++++++++
 5 files changed, 93 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_drm_client.c
 create mode 100644 drivers/gpu/drm/xe/xe_drm_client.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index c91bb7ddcf1d..ec810c34926a 100644
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
index 766df07de979..b79aaf7a66ab 100644
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
@@ -43,13 +44,22 @@ struct lockdep_map xe_device_mem_access_lockdep_map = {
 
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 {
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
 
 	mutex_init(&xef->vm.lock);
 	xa_init_flags(&xef->vm.xa, XA_FLAGS_ALLOC1);
@@ -89,6 +99,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 	xa_destroy(&xef->vm.xa);
 	mutex_destroy(&xef->vm.lock);
 
+	xe_drm_client_put(xef->client);
 	kfree(xef);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index bfedcc7571b0..25786ed9ac4d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -494,6 +494,9 @@ struct xe_file {
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
index 000000000000..6349e50d0b5b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -0,0 +1,34 @@
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
+#include "xe_drm_client.h"
+#include "xe_device_types.h"
+
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
+void __xe_drm_client_free(struct kref *kref)
+{
+	struct xe_drm_client *client =
+		container_of(kref, typeof(*client), kref);
+
+	kfree(client);
+}
+
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

