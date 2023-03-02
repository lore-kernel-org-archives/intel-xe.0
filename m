Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401A0C7EE39
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 01:35:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FA410E372;
	Thu,  2 Mar 2023 01:35:02 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA7C10E35A
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 01:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677720899; x=1709256899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3AAaSqLF2SWk+P4ZbZ/mRbbuSDiZ1UcHv81cIvOxBEY=;
 b=LSM43Mu+BUejaz0sGseay+pSx+KN6fSNfgamlau/vOpdPRatrq7UTCea
 Bi8qvx3omsOmNueBcyH9W+Fx0oajZlOu4cW0ugQxVF1KOCZrvMwAo+JHm
 z/z8jsAWAVhRNgRb0h3kKgAGfoyMXxvrqRbi6KyZF2k614BbESbMYUaId
 T6EMahqctEBiNn3DIRcdz7dOtTS5iHPDj+YP1TUAgCkYCxFT/6E9s/Rov
 c0MfkZbsUYADnZJIAInFSG1fenbEe7iSyPt2fizXAkPoEh9GwZmMGUK22
 4iJ52TArm/HZ+t9nv5NaZ/X8KECHs4Ulp6/OZIrtcoaNCM6VrD9OV9KvC A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="397148701"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; d="scan'208";a="397148701"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 17:34:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="798635047"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; d="scan'208";a="798635047"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 17:34:58 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  1 Mar 2023 17:34:05 -0800
Message-Id: <20230302013411.3262608-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230302013411.3262608-1-lucas.demarchi@intel.com>
References: <20230302013411.3262608-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/7] drm/xe: Fix typo persitent->persistent
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, maarten.lankhorst@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fix typo as noticed by Matt Roper:

	git grep -l persitent | xargs sed -i 's/persitent/persistent/g'

... and then fix coding style issues.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 46 ++++++++++++++--------------
 drivers/gpu/drm/xe/xe_device.h       |  6 ++--
 drivers/gpu/drm/xe/xe_device_types.h |  8 ++---
 drivers/gpu/drm/xe/xe_engine.c       |  6 ++--
 drivers/gpu/drm/xe/xe_engine_types.h |  6 ++--
 drivers/gpu/drm/xe/xe_execlist.c     |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c   |  2 +-
 7 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1f12b0fc0634..afc6fd516f6f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -52,8 +52,8 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 	return 0;
 }
 
-static void device_kill_persitent_engines(struct xe_device *xe,
-					  struct xe_file *xef);
+static void device_kill_persistent_engines(struct xe_device *xe,
+					   struct xe_file *xef);
 
 static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 {
@@ -70,7 +70,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 	}
 	mutex_unlock(&xef->engine.lock);
 	mutex_destroy(&xef->engine.lock);
-	device_kill_persitent_engines(xe, xef);
+	device_kill_persistent_engines(xe, xef);
 
 	mutex_lock(&xef->vm.lock);
 	xa_for_each(&xef->vm.xa, idx, vm)
@@ -199,8 +199,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	drmm_mutex_init(&xe->drm, &xe->usm.lock);
 	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC1);
 
-	drmm_mutex_init(&xe->drm, &xe->persitent_engines.lock);
-	INIT_LIST_HEAD(&xe->persitent_engines.list);
+	drmm_mutex_init(&xe->drm, &xe->persistent_engines.lock);
+	INIT_LIST_HEAD(&xe->persistent_engines.list);
 
 	spin_lock_init(&xe->pinned.lock);
 	INIT_LIST_HEAD(&xe->pinned.kernel_bo_present);
@@ -376,35 +376,35 @@ void xe_device_shutdown(struct xe_device *xe)
 {
 }
 
-void xe_device_add_persitent_engines(struct xe_device *xe, struct xe_engine *e)
+void xe_device_add_persistent_engines(struct xe_device *xe, struct xe_engine *e)
 {
-	mutex_lock(&xe->persitent_engines.lock);
-	list_add_tail(&e->persitent.link, &xe->persitent_engines.list);
-	mutex_unlock(&xe->persitent_engines.lock);
+	mutex_lock(&xe->persistent_engines.lock);
+	list_add_tail(&e->persistent.link, &xe->persistent_engines.list);
+	mutex_unlock(&xe->persistent_engines.lock);
 }
 
-void xe_device_remove_persitent_engines(struct xe_device *xe,
-					struct xe_engine *e)
+void xe_device_remove_persistent_engines(struct xe_device *xe,
+					 struct xe_engine *e)
 {
-	mutex_lock(&xe->persitent_engines.lock);
-	if (!list_empty(&e->persitent.link))
-		list_del(&e->persitent.link);
-	mutex_unlock(&xe->persitent_engines.lock);
+	mutex_lock(&xe->persistent_engines.lock);
+	if (!list_empty(&e->persistent.link))
+		list_del(&e->persistent.link);
+	mutex_unlock(&xe->persistent_engines.lock);
 }
 
-static void device_kill_persitent_engines(struct xe_device *xe,
-					  struct xe_file *xef)
+static void device_kill_persistent_engines(struct xe_device *xe,
+					   struct xe_file *xef)
 {
 	struct xe_engine *e, *next;
 
-	mutex_lock(&xe->persitent_engines.lock);
-	list_for_each_entry_safe(e, next, &xe->persitent_engines.list,
-				 persitent.link)
-		if (e->persitent.xef == xef) {
+	mutex_lock(&xe->persistent_engines.lock);
+	list_for_each_entry_safe(e, next, &xe->persistent_engines.list,
+				 persistent.link)
+		if (e->persistent.xef == xef) {
 			xe_engine_kill(e);
-			list_del_init(&e->persitent.link);
+			list_del_init(&e->persistent.link);
 		}
-	mutex_unlock(&xe->persitent_engines.lock);
+	mutex_unlock(&xe->persistent_engines.lock);
 }
 
 void xe_device_wmb(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 263620953c3b..25c5087f5aad 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -37,9 +37,9 @@ int xe_device_probe(struct xe_device *xe);
 void xe_device_remove(struct xe_device *xe);
 void xe_device_shutdown(struct xe_device *xe);
 
-void xe_device_add_persitent_engines(struct xe_device *xe, struct xe_engine *e);
-void xe_device_remove_persitent_engines(struct xe_device *xe,
-					struct xe_engine *e);
+void xe_device_add_persistent_engines(struct xe_device *xe, struct xe_engine *e);
+void xe_device_remove_persistent_engines(struct xe_device *xe,
+					 struct xe_engine *e);
 
 void xe_device_wmb(struct xe_device *xe);
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9743987fc883..ec36cedb87cc 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -196,13 +196,13 @@ struct xe_device {
 		struct mutex lock;
 	} usm;
 
-	/** @persitent_engines: engines that are closed but still running */
+	/** @persistent_engines: engines that are closed but still running */
 	struct {
-		/** @lock: protects persitent engines */
+		/** @lock: protects persistent engines */
 		struct mutex lock;
-		/** @list: list of persitent engines */
+		/** @list: list of persistent engines */
 		struct list_head list;
-	} persitent_engines;
+	} persistent_engines;
 
 	/** @pinned: pinned BO state */
 	struct {
diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index f1e0f700d96c..3b6f8a25112a 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -47,7 +47,7 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
 	e->fence_irq = &gt->fence_irq[hwe->class];
 	e->ring_ops = gt->ring_ops[hwe->class];
 	e->ops = gt->engine_ops;
-	INIT_LIST_HEAD(&e->persitent.link);
+	INIT_LIST_HEAD(&e->persistent.link);
 	INIT_LIST_HEAD(&e->compute.link);
 	INIT_LIST_HEAD(&e->multi_gt_link);
 
@@ -620,7 +620,7 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 		goto put_engine;
 	}
 
-	e->persitent.xef = xef;
+	e->persistent.xef = xef;
 
 	mutex_lock(&xef->engine.lock);
 	err = xa_alloc(&xef->engine.xa, &id, e, xa_limit_32b, GFP_KERNEL);
@@ -716,7 +716,7 @@ int xe_engine_destroy_ioctl(struct drm_device *dev, void *data,
 	if (!(e->flags & ENGINE_FLAG_PERSISTENT))
 		xe_engine_kill(e);
 	else
-		xe_device_add_persitent_engines(xe, e);
+		xe_device_add_persistent_engines(xe, e);
 
 	trace_xe_engine_close(e);
 	xe_engine_put(e);
diff --git a/drivers/gpu/drm/xe/xe_engine_types.h b/drivers/gpu/drm/xe/xe_engine_types.h
index a2e09b6d997c..d0f1849e8ad5 100644
--- a/drivers/gpu/drm/xe/xe_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_engine_types.h
@@ -81,14 +81,14 @@ struct xe_engine {
 	};
 
 	/**
-	 * @persitent: persitent engine state
+	 * @persistent: persistent engine state
 	 */
 	struct {
 		/** @xef: file which this engine belongs to */
 		struct xe_file *xef;
-		/** @link: link in list of persitent engines */
+		/** @link: link in list of persistent engines */
 		struct list_head link;
-	} persitent;
+	} persistent;
 
 	union {
 		/**
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 92da72f663f9..02021457b1f0 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -401,7 +401,7 @@ static void execlist_engine_fini_async(struct work_struct *w)
 	spin_unlock_irqrestore(&exl->port->lock, flags);
 
 	if (e->flags & ENGINE_FLAG_PERSISTENT)
-		xe_device_remove_persitent_engines(gt_to_xe(e->gt), e);
+		xe_device_remove_persistent_engines(gt_to_xe(e->gt), e);
 	drm_sched_entity_fini(&exl->entity);
 	drm_sched_fini(&exl->sched);
 	kfree(exl);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 8c9a6cb0013e..e857013070b9 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -890,7 +890,7 @@ static void __guc_engine_fini_async(struct work_struct *w)
 	trace_xe_engine_destroy(e);
 
 	if (e->flags & ENGINE_FLAG_PERSISTENT)
-		xe_device_remove_persitent_engines(gt_to_xe(e->gt), e);
+		xe_device_remove_persistent_engines(gt_to_xe(e->gt), e);
 	release_guc_id(guc, e);
 	drm_sched_entity_fini(&ge->entity);
 	drm_sched_fini(&ge->sched);
-- 
2.39.0

