Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5DEC04FDF
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 18:05:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B3610E39F;
	Wed, 16 Aug 2023 18:05:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F310810E39E
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 18:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692209110; x=1723745110;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9gwYLxk8Rty0IuZzM5ERfBsW84FOiOOFJ+IZDXuoFhs=;
 b=iJnHsgu8iMRQpkaS7bMlfv/bHAZd0+lx6rQ1j/gqN+GlWi7Tr/s2uozz
 sdPsbzHcexQQLNd3OE8LjzbZTDXgu/2Z2wTMt1KXlksohkRly0qLfjCL1
 h2SHos8HW2DZ5ZhBpATQ9TyVedtDdrl9a6mMVSkOETc1BnBjSVh8UKroL
 l1tJS/nuMizKk4V4eppdZHerbuBVQkHjnFCkZ0CHrIBfRQG/6AFy68C3+
 dOrnrxM8lp9nP7ov0CPxQaCBszC3g6fAIMCQl0CLUfLDdIp+tIFXlKem1
 iG741iJUzJaPCtY/qF56zPwKnoapvID1FUkrbCLgOHXEbkaLwbQNsNFON w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="458956573"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="458956573"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 11:04:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="980816332"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="980816332"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 11:04:34 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 16 Aug 2023 11:04:20 -0700
Message-ID: <20230816180425.1481448-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816180425.1481448-1-daniele.ceraolospurio@intel.com>
References: <20230816180425.1481448-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/6] drm/xe: common function to assign queue name
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

The queue name assignment is identical in both GuC and execlists
backends, so we can move it to a common function. This will make adding
a new entry in the next patch slightly cleaner.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h |  1 +
 drivers/gpu/drm/xe/xe_execlist.c   | 20 +-------------------
 drivers/gpu/drm/xe/xe_guc_submit.c | 20 +-------------------
 4 files changed, 26 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 382a572746ad..bf40154ddd6f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -177,6 +177,29 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
 	kfree(q);
 }
 
+void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance)
+{
+	switch (q->class) {
+	case XE_ENGINE_CLASS_RENDER:
+		sprintf(q->name, "rcs%d", instance);
+		break;
+	case XE_ENGINE_CLASS_VIDEO_DECODE:
+		sprintf(q->name, "vcs%d", instance);
+		break;
+	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
+		sprintf(q->name, "vecs%d", instance);
+		break;
+	case XE_ENGINE_CLASS_COPY:
+		sprintf(q->name, "bcs%d", instance);
+		break;
+	case XE_ENGINE_CLASS_COMPUTE:
+		sprintf(q->name, "ccs%d", instance);
+		break;
+	default:
+		XE_WARN_ON(q->class);
+	}
+}
+
 struct xe_exec_queue *xe_exec_queue_lookup(struct xe_file *xef, u32 id)
 {
 	struct xe_exec_queue *q;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 024bc26a7006..ce1ec2243b6a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -23,6 +23,7 @@ struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe
 
 void xe_exec_queue_fini(struct xe_exec_queue *q);
 void xe_exec_queue_destroy(struct kref *ref);
+void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance);
 
 struct xe_exec_queue *xe_exec_queue_lookup(struct xe_file *xef, u32 id);
 
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 8ef98c7fd8e2..a4757817b1ac 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -352,25 +352,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
 	q->execlist = exl;
 	q->entity = &exl->entity;
 
-	switch (q->class) {
-	case XE_ENGINE_CLASS_RENDER:
-		sprintf(q->name, "rcs%d", ffs(q->logical_mask) - 1);
-		break;
-	case XE_ENGINE_CLASS_VIDEO_DECODE:
-		sprintf(q->name, "vcs%d", ffs(q->logical_mask) - 1);
-		break;
-	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
-		sprintf(q->name, "vecs%d", ffs(q->logical_mask) - 1);
-		break;
-	case XE_ENGINE_CLASS_COPY:
-		sprintf(q->name, "bcs%d", ffs(q->logical_mask) - 1);
-		break;
-	case XE_ENGINE_CLASS_COMPUTE:
-		sprintf(q->name, "ccs%d", ffs(q->logical_mask) - 1);
-		break;
-	default:
-		XE_WARN_ON(q->class);
-	}
+	xe_exec_queue_assign_name(q, ffs(q->logical_mask) - 1);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index a1e1f2c86912..8f64b164987a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1165,25 +1165,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 
 	mutex_unlock(&guc->submission_state.lock);
 
-	switch (q->class) {
-	case XE_ENGINE_CLASS_RENDER:
-		sprintf(q->name, "rcs%d", q->guc->id);
-		break;
-	case XE_ENGINE_CLASS_VIDEO_DECODE:
-		sprintf(q->name, "vcs%d", q->guc->id);
-		break;
-	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
-		sprintf(q->name, "vecs%d", q->guc->id);
-		break;
-	case XE_ENGINE_CLASS_COPY:
-		sprintf(q->name, "bcs%d", q->guc->id);
-		break;
-	case XE_ENGINE_CLASS_COMPUTE:
-		sprintf(q->name, "ccs%d", q->guc->id);
-		break;
-	default:
-		XE_WARN_ON(q->class);
-	}
+	xe_exec_queue_assign_name(q, q->guc->id);
 
 	trace_xe_exec_queue_create(q);
 
-- 
2.41.0

