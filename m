Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02F9C5479A
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 20:18:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C369810E090;
	Thu, 17 Aug 2023 20:18:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72C810E0C7
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 20:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692303529; x=1723839529;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nK40CJqGUXZEzghUHv+T3BlLv+sArk5kQM1jOFpiCf4=;
 b=k5Y9koB0MyFZ73tOAYUN1F063pLOFyL3R3jzjXVsS94CpIHXSu+C112w
 2NfXbnjUPi39DDaqV1KDXp+oR/Wp8n1zno9LK4mfFsz3QvGuKmKtx+xLv
 DyrSiWBTPeLU33FLUUHQGU3psZRxHviSjq73BJGbjFbDcdpcVLBhjgucp
 OhaWbDBpleqR+zaNHVsWYnZcY0h+0TH+bsqeXQ6tDiwYk/V3ZJuTLXQmc
 iwisjjTcAKH2ixxcS7UiZJZsmy6qws+/Y01h3KWWv419Cnl4tWr1trR22
 REe7LU7pWwiHxhCZoV7MAEV+yO4XkqVdzoDWrflDE8EYbBxFwoyD+10IU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="363077716"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="363077716"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 13:18:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="878379289"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 13:18:48 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 17 Aug 2023 13:18:25 -0700
Message-ID: <20230817201831.1583172-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817201831.1583172-1-daniele.ceraolospurio@intel.com>
References: <20230817201831.1583172-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/7] drm/xe: common function to assign queue
 name
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The queue name assignment is identical in both GuC and execlists
backends, so we can move it to a common function. This will make adding
a new entry in the next patch slightly cleaner.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
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

