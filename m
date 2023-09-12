Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EAECA0EC3
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 11:45:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E1510E40A;
	Tue, 12 Sep 2023 11:45:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99AAE10E40A
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 11:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694519102; x=1726055102;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zI6MspD7FuqrnS0VcdcsM9umIjz6fxQCwnRob9SwrmA=;
 b=ZBCnyKVFnK3fCT/OXJv3GTQwe4Jy42ZjsIAmeHxToC9ys/8xLJ+vJFy0
 Zp6JKy9FiF/D+jVKSZCDB26aOGv7VLGOylGXblIrKno85S3qmd2/XpvGC
 7PJ2zZav0k3OQRqdJd5WoM0aaQyfNIL+uBuwTVB2BEVHtpJ3t6yULpd8Z
 +dwgv/v7Fyoo8Tvw9HcUm8o4WWfBjwZhmNHdgCYH0d39oP2LfuHPX7BtQ
 MqLbHWbRcHunGn7M+dU4eRlBnvbRuxMgye3WDoasnCpBFBh69tlZwzT5F
 7VRyPyLUFQ8Y3RTudRDStkDED9W50LsxZL0WlOTwVdIuUcdGoqdyhOzsF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="381050197"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="381050197"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:45:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="743700052"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="743700052"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga002.jf.intel.com with ESMTP; 12 Sep 2023 04:45:00 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 12 Sep 2023 17:22:35 +0530
Message-Id: <20230912115239.3554341-4-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230912115239.3554341-1-tejas.upadhyay@intel.com>
References: <20230912115239.3554341-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V2 3/7] drm/xe: Add tracking support for bos per
 client
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

In order to show per client memory consumption, we
need tracking support APIs to add at every bo consumption
and removal. Adding APIs here to add tracking calls at
places wherever it is applicable.

V2:
  - make xe_drm_client_remove_bo return void - Himal

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c         |  7 ++++
 drivers/gpu/drm/xe/xe_bo_types.h   | 10 ++++++
 drivers/gpu/drm/xe/xe_drm_client.c | 52 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_drm_client.h | 26 +++++++++++++++
 4 files changed, 95 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 25fdc04627ca..c90a9615ab98 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -16,6 +16,7 @@
 
 #include "xe_device.h"
 #include "xe_dma_buf.h"
+#include "xe_drm_client.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_map.h"
@@ -1051,6 +1052,9 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 	if (bo->vm && xe_bo_is_user(bo))
 		xe_vm_put(bo->vm);
 
+	if (bo->client)
+		xe_drm_client_remove_bo(bo);
+
 	kfree(bo);
 }
 
@@ -1228,6 +1232,9 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	bo->ttm.priority = DRM_XE_VMA_PRIORITY_NORMAL;
 	INIT_LIST_HEAD(&bo->vmas);
 	INIT_LIST_HEAD(&bo->pinned_link);
+#ifdef CONFIG_PROC_FS
+	INIT_LIST_HEAD(&bo->client_link);
+#endif
 
 	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
 
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index f6ee920303af..1aef413b6f8a 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -45,6 +45,16 @@ struct xe_bo {
 	struct ttm_bo_kmap_obj kmap;
 	/** @pinned_link: link to present / evicted list of pinned BO */
 	struct list_head pinned_link;
+#ifdef CONFIG_PROC_FS
+	/**
+	 * @client: @xe_drm_client which created the bo
+	 */
+	struct xe_drm_client *client;
+	/**
+	 * @client_link: Link into @xe_drm_client.objects_list
+	 */
+	struct list_head client_link;
+#endif
 	/** @props: BO user controlled properties */
 	struct {
 		/** @preferred_mem: preferred memory class for this BO */
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index b5dc024b5dd0..f10b13079074 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -8,8 +8,11 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
+#include "xe_bo_types.h"
 #include "xe_device_types.h"
 #include "xe_drm_client.h"
+#include "xe_device_types.h"
+#include "xe_trace.h"
 
 /**
  * xe_drm_client_alloc() - Allocate drm client
@@ -31,6 +34,10 @@ struct xe_drm_client *xe_drm_client_alloc(void)
 
 	kref_init(&client->kref);
 
+#ifdef CONFIG_PROC_FS
+	spin_lock_init(&client->bos_lock);
+	INIT_LIST_HEAD(&client->bos_list);
+#endif
 	return client;
 }
 
@@ -52,6 +59,51 @@ void __xe_drm_client_free(struct kref *kref)
 }
 
 #ifdef CONFIG_PROC_FS
+/**
+ * xe_drm_client_add_bo() - Add BO for tracking client mem usage
+ * @client: The drm client ptr
+ * @bo: The xe BO ptr
+ *
+ * Add all BO created by individual drm client by calling this function.
+ * This helps in tracking client memory usage.
+ *
+ * Return: void
+ */
+void xe_drm_client_add_bo(struct xe_drm_client *client,
+			  struct xe_bo *bo)
+{
+	unsigned long flags;
+
+	XE_WARN_ON(bo->client);
+	XE_WARN_ON(!list_empty(&bo->client_link));
+
+	spin_lock_irqsave(&client->bos_lock, flags);
+	bo->client = xe_drm_client_get(client);
+	list_add_tail_rcu(&bo->client_link, &client->bos_list);
+	spin_unlock_irqrestore(&client->bos_lock, flags);
+}
+
+/**
+ * xe_drm_client_remove_bo() - Remove BO for tracking client mem usage
+ * @bo: The xe BO ptr
+ *
+ * Remove all BO removed by individual drm client by calling this function.
+ * This helps in tracking client memory usage.
+ *
+ * Return: void
+ */
+void xe_drm_client_remove_bo(struct xe_bo *bo)
+{
+	struct xe_drm_client *client = bo->client;
+	unsigned long flags;
+
+	spin_lock_irqsave(&client->bos_lock, flags);
+	list_del_rcu(&bo->client_link);
+	spin_unlock_irqrestore(&client->bos_lock, flags);
+
+	xe_drm_client_put(client);
+}
+
 /**
  * xe_drm_client_fdinfo() - Callback for fdinfo interface
  * @p: The drm_printer ptr
diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_drm_client.h
index dbe3a083c9df..744efb008861 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.h
+++ b/drivers/gpu/drm/xe/xe_drm_client.h
@@ -15,10 +15,23 @@
 
 struct drm_file;
 struct drm_printer;
+struct xe_bo;
 
 struct xe_drm_client {
 	struct kref kref;
 	unsigned int id;
+#ifdef CONFIG_PROC_FS
+	/**
+	 * @bos_lock: lock protecting @bos_list
+	 */
+	spinlock_t bos_lock;
+	/**
+	 * @bos_list: list of bos created by this client
+	 *
+	 * Protected by @bos_lock.
+	 */
+	struct list_head bos_list;
+#endif
 };
 
 	static inline struct xe_drm_client *
@@ -41,5 +54,18 @@ xe_drm_client_get(struct xe_drm_client *client);
 static inline void xe_drm_client_put(struct xe_drm_client *client);
 #ifdef CONFIG_PROC_FS
 void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
+void xe_drm_client_add_bo(struct xe_drm_client *client,
+		struct xe_bo *bo);
+void xe_drm_client_remove_bo(struct xe_bo *bo);
+#else
+static inline void xe_drm_client_add_bo(struct xe_drm_client *client,
+		struct xe_bo *bo)
+{
+}
+
+static inline bool xe_drm_client_remove_bo(struct xe_bo *bo)
+{
+}
 #endif
+
 #endif
-- 
2.25.1

