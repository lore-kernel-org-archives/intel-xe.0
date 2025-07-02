Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FD9C83F0B
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 23:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A77910E7B6;
	Wed,  2 Jul 2025 23:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dY77W4rd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0496B10E7B3
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 23:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751499643; x=1783035643;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ac/eEn2YTLRRWXhZOqsFsj/l09oTPnvTrhbxPhGuqG4=;
 b=dY77W4rdlYAD81Gljwd+8Um+cqZbpeSygHeg9w7Bfkg4oZH+Wshz79ge
 EgmsFeJnFpTLB0kbpan6ne8RkQ4pzoC3uXhiELjzfEl1UB0+Zg6kkpIvT
 Ayln6XRYONBmhlfrDoyvK2XJuhZ8QNzVWxpnfz2ECks47PUSMugVvtRwR
 LFYDauFweSTMlu/WnZ3sKUNRppQaG/Fe/TT1QAHIyZZQ24NO+EJfhCbHw
 3e2jAv93+BDTpnYlqd++vkAIzJSH+YF/40liueSSULxUpWgaHoqW/ImW0
 uv4rMyTV9bKk/Amk9HKhG3ZiNcLD5bRbLvQUk1OPUVt4Ok7PKFdZu64Oa w==;
X-CSE-ConnectionGUID: JNyQdItaTP6GvXfqRWx16Q==
X-CSE-MsgGUID: I3hbP1PfSx2rtzfy+KqbKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57489475"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="57489475"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:40:42 -0700
X-CSE-ConnectionGUID: l7Gq7+9fTemU5r/QHTyUnw==
X-CSE-MsgGUID: oySXSr0cTa+YB2LOOW3euA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="153624538"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:40:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 6/9] drm/xe: Add xe_migrate_job_lock/unlock helpers
Date: Wed,  2 Jul 2025 16:42:19 -0700
Message-Id: <20250702234222.3278264-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702234222.3278264-1-matthew.brost@intel.com>
References: <20250702234222.3278264-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add xe_migrate_job_lock/unlock helpers is used ensure ordering when
issuing GT TLB invalidation jobs.

v2:
 - Fix multi-line comments (checkpatch)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 36 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h |  4 ++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index b5f85162b9ed..1f57adcbb535 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1917,6 +1917,42 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 	return IS_ERR(fence) ? PTR_ERR(fence) : 0;
 }
 
+/**
+ * xe_migrate_job_lock() - Lock migrate job lock
+ * @m: The migration context.
+ * @q: Queue associated with the operation which requires a lock
+ *
+ * Lock the migrate job lock if the queue is a migration queue, otherwise
+ * assert the VM's dma-resv is held (user queue's have own locking).
+ */
+void xe_migrate_job_lock(struct xe_migrate *m, struct xe_exec_queue *q)
+{
+	bool is_migrate = q == m->q;
+
+	if (is_migrate)
+		mutex_lock(&m->job_mutex);
+	else
+		xe_vm_assert_held(q->vm);	/* User queues VM's should be locked */
+}
+
+/**
+ * xe_migrate_job_unlock() - Unlock migrate job lock
+ * @m: The migration context.
+ * @q: Queue associated with the operation which requires a lock
+ *
+ * Unlock the migrate job lock if the queue is a migration queue, otherwise
+ * assert the VM's dma-resv is held (user queue's have own locking).
+ */
+void xe_migrate_job_unlock(struct xe_migrate *m, struct xe_exec_queue *q)
+{
+	bool is_migrate = q == m->q;
+
+	if (is_migrate)
+		mutex_unlock(&m->job_mutex);
+	else
+		xe_vm_assert_held(q->vm);	/* User queues VM's should be locked */
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_migrate.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index fb9839c1bae0..e9d83d320f8c 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -134,4 +134,8 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 void xe_migrate_wait(struct xe_migrate *m);
 
 struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile);
+
+void xe_migrate_job_lock(struct xe_migrate *m, struct xe_exec_queue *q);
+void xe_migrate_job_unlock(struct xe_migrate *m, struct xe_exec_queue *q);
+
 #endif
-- 
2.34.1

