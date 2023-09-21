Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD12CD494F
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 11:42:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5839C10E5D1;
	Thu, 21 Sep 2023 11:42:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7405010E5CA
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 11:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695296532; x=1726832532;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=agJorjjP7Gb4nMaFq0XcN0IhtoY5MT466NT1q4kWDnE=;
 b=nzgKyU0gA1p/nSaJ7K4ft7dvmZbcyVqHQRh2YoipXpYnvdKF3NuuOprw
 UWPwthdWZpRRMyNFG5sjWglZQI60JscMBwrl0Xhv4lDmmppPCLGUUQ/wU
 im/8tf4nDY6J3g4K0K98wYIyeIAjEYpVyM2BH+puEX5A/3+9DsiMW6Aaz
 3C7DQCdiEyF2mUCzKRJ9f/orrXEhkS0k37qlhXAFlTPHLN4I3eMJDvJPQ
 2K1YZR4V4ZZiHiYCmpAvB1voBfXsMh9U5HaPyXTdbr1KAwiQ8hayQUBoD
 cHyIq5HnUHdvNFveYOgq9CCxMqxkGPPqrl2wknEbeOJ9pwTgabYXbZDsK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="370812825"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="370812825"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 04:42:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="696697332"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="696697332"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga003.jf.intel.com with ESMTP; 21 Sep 2023 04:42:10 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 21 Sep 2023 17:19:58 +0530
Message-Id: <20230921115002.22884-4-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230921115002.22884-1-tejas.upadhyay@intel.com>
References: <20230921115002.22884-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V5 3/7] drm/xe: Add tracking support for bos per
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

V5:
  - Rebase
V4:
  - remove client bo before vm_put
  - spin_lock_irqsave not required - Auld
V3:
  - update .h to return xe_drm_client_remove_bo void
  - protect xe_drm_client_remove_bo under CONFIG_PROC_FS check - Himal
  - Fixed Checkpatch error - CI
V2:
  - make xe_drm_client_remove_bo return void - Himal

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c         |  9 ++++++
 drivers/gpu/drm/xe/xe_bo_types.h   | 10 +++++++
 drivers/gpu/drm/xe/xe_drm_client.c | 48 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_drm_client.h | 25 ++++++++++++++++
 4 files changed, 92 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c5e4d04c4d58..047eae071d03 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -16,6 +16,7 @@
 
 #include "xe_device.h"
 #include "xe_dma_buf.h"
+#include "xe_drm_client.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_map.h"
@@ -1051,6 +1052,11 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 	if (bo->ggtt_node.size)
 		xe_ggtt_remove_bo(bo->tile->mem.ggtt, bo);
 
+#ifdef CONFIG_PROC_FS
+	if (bo->client)
+		xe_drm_client_remove_bo(bo);
+#endif
+
 	if (bo->vm && xe_bo_is_user(bo))
 		xe_vm_put(bo->vm);
 
@@ -1230,6 +1236,9 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	bo->props.preferred_mem_type = XE_BO_PROPS_INVALID;
 	bo->ttm.priority = DRM_XE_VMA_PRIORITY_NORMAL;
 	INIT_LIST_HEAD(&bo->pinned_link);
+#ifdef CONFIG_PROC_FS
+	INIT_LIST_HEAD(&bo->client_link);
+#endif
 
 	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
 
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 946427fd3fe8..051fe990c133 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -43,6 +43,16 @@ struct xe_bo {
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
index 98c8a0cf2f56..b5ac9bc1f685 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -8,8 +8,10 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
+#include "xe_bo_types.h"
 #include "xe_device_types.h"
 #include "xe_drm_client.h"
+#include "xe_trace.h"
 
 /**
  * xe_drm_client_alloc() - Allocate drm client
@@ -31,6 +33,10 @@ struct xe_drm_client *xe_drm_client_alloc(void)
 
 	kref_init(&client->kref);
 
+#ifdef CONFIG_PROC_FS
+	spin_lock_init(&client->bos_lock);
+	INIT_LIST_HEAD(&client->bos_list);
+#endif
 	return client;
 }
 
@@ -52,6 +58,48 @@ void __xe_drm_client_free(struct kref *kref)
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
+	XE_WARN_ON(bo->client);
+	XE_WARN_ON(!list_empty(&bo->client_link));
+
+	spin_lock(&client->bos_lock);
+	bo->client = xe_drm_client_get(client);
+	list_add_tail_rcu(&bo->client_link, &client->bos_list);
+	spin_unlock(&client->bos_lock);
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
+
+	spin_lock(&client->bos_lock);
+	list_del_rcu(&bo->client_link);
+	spin_unlock(&client->bos_lock);
+
+	xe_drm_client_put(client);
+}
+
 /**
  * xe_drm_client_fdinfo() - Callback for fdinfo interface
  * @p: The drm_printer ptr
diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_drm_client.h
index dbe3a083c9df..a9649aa36011 100644
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
@@ -41,5 +54,17 @@ xe_drm_client_get(struct xe_drm_client *client);
 static inline void xe_drm_client_put(struct xe_drm_client *client);
 #ifdef CONFIG_PROC_FS
 void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
+void xe_drm_client_add_bo(struct xe_drm_client *client,
+			  struct xe_bo *bo);
+void xe_drm_client_remove_bo(struct xe_bo *bo);
+#else
+static inline void xe_drm_client_add_bo(struct xe_drm_client *client,
+					struct xe_bo *bo)
+{
+}
+
+static inline void xe_drm_client_remove_bo(struct xe_bo *bo)
+{
+}
 #endif
 #endif
-- 
2.25.1

