Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC66C0015E
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 14:00:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8708F10E446;
	Wed,  9 Aug 2023 14:00:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3EEF10E446
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 14:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691589650; x=1723125650;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ThLLfA0fWCalR+vB2odZNjFwmjVtMQBaYsuHqr+5tZk=;
 b=OnRsTUTjX7spMQ6m63PWEr3IJYVUk9gixP4/Aj/mrEzaxVCjsvF0UvwV
 fZRPupXsa19EcCXXpY4i66ly8YOdmI22RfpJpU1BRpReocY9Ib6phiJLu
 Qb5xhgEA578DLeKc1ydak1xhqPmHnmRIwHnsCDt7ENiwaX6NPgkWL2z+1
 E0XT7FTf4xBL6F7R3ofd+c1DEw+mYqJ5e1nsjA7JAG3LvVPAIIxYh2NLb
 UJDlImUj6gnfbAfc6OD3kZeqdC+P/UCz1GPDyZVUt08KXtt5kzjuGyUMm
 2Vi3737xJ4yrIsLNNb21+U7rkNRi6ZarvvIWVdZzZFV971eQDnQ8N89DJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="361257009"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="361257009"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 07:00:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="1062479987"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="1062479987"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga005.fm.intel.com with ESMTP; 09 Aug 2023 07:00:48 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  9 Aug 2023 19:37:46 +0530
Message-Id: <20230809140746.1614908-4-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230809140746.1614908-1-tejas.upadhyay@intel.com>
References: <20230809140746.1614908-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 3/3] drm/xe: Add tracking support for bos per client
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

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c         |  5 +++++
 drivers/gpu/drm/xe/xe_bo_types.h   | 10 +++++++++
 drivers/gpu/drm/xe/xe_drm_client.c | 35 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_drm_client.h | 27 +++++++++++++++++++++++
 4 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 284c86107a5f..ffdabf5c0175 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -16,6 +16,7 @@
 
 #include "xe_device.h"
 #include "xe_dma_buf.h"
+#include "xe_drm_client.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_map.h"
@@ -1178,6 +1179,7 @@ struct xe_bo *xe_bo_alloc(void)
  */
 void xe_bo_free(struct xe_bo *bo)
 {
+	xe_drm_client_remove_bo(bo);
 	kfree(bo);
 }
 
@@ -1228,6 +1230,9 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
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
index 89f057ba2a22..f1947faa496f 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -10,6 +10,7 @@
 
 #include "xe_drm_client.h"
 #include "xe_device_types.h"
+#include "xe_bo_types.h"
 
 struct xe_drm_client *xe_drm_client_alloc(void)
 {
@@ -20,7 +21,10 @@ struct xe_drm_client *xe_drm_client_alloc(void)
 		return NULL;
 
 	kref_init(&client->kref);
-	
+#ifdef CONFIG_PROC_FS
+	spin_lock_init(&client->bos_lock);
+	INIT_LIST_HEAD(&client->bos_list);
+#endif
 	return client;
 }
 
@@ -32,6 +36,35 @@ void __xe_drm_client_free(struct kref *kref)
 	kfree(client);
 }
 
+void xe_drm_client_add_bo(struct xe_drm_client *client,
+		struct xe_bo *bo)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&client->bos_lock, flags);
+	bo->client = xe_drm_client_get(client);
+	list_add_tail_rcu(&bo->client_link, &client->bos_list);
+	spin_unlock_irqrestore(&client->bos_lock, flags);
+}
+
+bool xe_drm_client_remove_bo(struct xe_bo *bo)
+{
+	struct xe_drm_client *client = bo->client;
+	unsigned long flags;
+
+	/* Object may not be associated with a client. */
+	if (!client)
+		return false;
+
+	spin_lock_irqsave(&client->bos_lock, flags);
+	list_del_rcu(&bo->client_link);
+	spin_unlock_irqrestore(&client->bos_lock, flags);
+
+	xe_drm_client_put(client);
+
+	return true;
+}
+
 void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
 {
 	/* show_meminfo() will be developed here */
diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_drm_client.h
index 6cd5a30d242d..c362be7a549d 100644
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
@@ -40,5 +53,19 @@ static inline struct xe_drm_client *
 xe_drm_client_get(struct xe_drm_client *client);
 static inline void xe_drm_client_put(struct xe_drm_client *client);
 void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
+#ifdef CONFIG_PROC_FS
+void xe_drm_client_add_bo(struct xe_drm_client *client,
+		struct xe_bo *bo);
+bool xe_drm_client_remove_bo(struct xe_bo *bo);
+#else
+static inline void xe_drm_client_add_bo(struct xe_drm_client *client,
+		struct xe_bo *bo)
+{
+}
+
+static inline bool xe_drm_client_remove_bo(struct xe_bo *bo)
+{
+}
+#endif
 
 #endif
-- 
2.25.1

