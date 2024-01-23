Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDBDC47DDB
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 20:45:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AAFA10E68C;
	Tue, 23 Jan 2024 20:45:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCBE10E5D3
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 20:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706042718; x=1737578718;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8MYhO1ohdlFbkTfzkGEfEuK8SFDCU/NjFHSalU2CAOY=;
 b=Sl1ZuSUhv2rx2iSeztejWuM/6lkjoaQTddlxw9LypW0zlxbcXDbj9t0k
 AEIXAAHqnhqgE8oYD4sM54VabJ3FZP+WPeyVH9WmjuijNaTsC+JAS0MMy
 EpfHAabfPcB0QtaOl+4OeX7F/uG/atjSXC0E3lv/zNDjeNs55nx9N5DYD
 I+vlBHPRr4nGrJlUV60pHxvvt+hRQt4nf5p2FBtCPcC+qpwqq2FyCK+Re
 gAq5kb5Yt/BBat7kf170xVakf6qpC9wG/OgXoP7D+xv10WtIg9IKCRC7T
 eQogF9lH6+87QUi/AYyZGmNjcljp/OjIjznEabyByYmyD+cNFX+fFRXhb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8319881"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8319881"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 12:45:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="909421997"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="909421997"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 12:45:16 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 9/9] drm/xe: Add batch buffer addresses to devcoredump
Date: Tue, 23 Jan 2024 12:44:54 -0800
Message-ID: <20240123204454.246788-9-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123204454.246788-1-jose.souza@intel.com>
References: <20240123204454.246788-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Maarten Lankhorst <dev@lankhorst.se>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Those addresses are necessary to Mesa tools knows where in VM are the
batch buffers to parse and print instructions that are human readable.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       |  5 +++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  3 ++
 drivers/gpu/drm/xe/xe_sched_job.c         | 38 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sched_job.h         |  5 +++
 drivers/gpu/drm/xe/xe_sched_job_types.h   |  5 +++
 5 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index e701f0d07b676..08d3f6cb72292 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -96,6 +96,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
 	xe_guc_exec_queue_snapshot_print(coredump->snapshot.ge, &p);
 
+	drm_printf(&p, "\n**** Job ****\n");
+	xe_sched_job_snapshot_print(coredump->snapshot.job, &p);
+
 	drm_printf(&p, "\n**** HW Engines ****\n");
 	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
 		if (coredump->snapshot.hwe[i])
@@ -116,6 +119,7 @@ static void xe_devcoredump_free(void *data)
 
 	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
 	xe_guc_exec_queue_snapshot_free(coredump->snapshot.ge);
+	xe_sched_job_snapshot_free(coredump->snapshot.job);
 	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
 		if (coredump->snapshot.hwe[i])
 			xe_hw_engine_snapshot_free(coredump->snapshot.hwe[i]);
@@ -155,6 +159,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 
 	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
 	coredump->snapshot.ge = xe_guc_exec_queue_snapshot_capture(job);
+	coredump->snapshot.job = xe_sched_job_snapshot_capture(job);
 
 	for_each_hw_engine(hwe, q->gt, id) {
 		if (hwe->class != q->hwe->class ||
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 50106efcbc29d..d259119b2c980 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -31,8 +31,11 @@ struct xe_devcoredump_snapshot {
 	struct xe_guc_ct_snapshot *ct;
 	/** @ge: Guc Engine snapshot */
 	struct xe_guc_submit_exec_queue_snapshot *ge;
+
 	/** @hwe: HW Engine snapshot array */
 	struct xe_hw_engine_snapshot *hwe[XE_NUM_HW_ENGINES];
+	/** @job: Snapshot of job state */
+	struct xe_sched_job_snapshot *job;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 01106a1156ad8..cde1407867db6 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -278,3 +278,41 @@ int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm)
 
 	return drm_sched_job_add_dependency(&job->drm, fence);
 }
+
+struct xe_sched_job_snapshot *
+xe_sched_job_snapshot_capture(struct xe_sched_job *job)
+{
+	struct xe_exec_queue *q = job->q;
+	struct xe_device *xe = q->gt->tile->xe;
+	struct xe_sched_job_snapshot *snapshot;
+	size_t len = sizeof(*snapshot) + (sizeof(u64) * q->width);
+	u16 i;
+
+	snapshot = kzalloc(len, GFP_ATOMIC);
+	if (!snapshot)
+		return NULL;
+
+	snapshot->batch_addr_len = q->width;
+	for (i = 0; i < q->width; i++)
+		snapshot->batch_addr[i] = xe_device_uncanonicalize_addr(xe, job->batch_addr[i]);
+
+	return snapshot;
+}
+
+void xe_sched_job_snapshot_free(struct xe_sched_job_snapshot *snapshot)
+{
+	kfree(snapshot);
+}
+
+void
+xe_sched_job_snapshot_print(struct xe_sched_job_snapshot *snapshot,
+			    struct drm_printer *p)
+{
+	u16 i;
+
+	if (!snapshot)
+		return;
+
+	for (i = 0; i < snapshot->batch_addr_len; i++)
+		drm_printf(p, "batch_addr[%u]: 0x%016llx\n", i, snapshot->batch_addr[i]);
+}
diff --git a/drivers/gpu/drm/xe/xe_sched_job.h b/drivers/gpu/drm/xe/xe_sched_job.h
index 34f475ba7f502..f1a660648cf00 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.h
+++ b/drivers/gpu/drm/xe/xe_sched_job.h
@@ -8,6 +8,7 @@
 
 #include "xe_sched_job_types.h"
 
+struct drm_printer;
 struct xe_vm;
 
 #define XE_SCHED_HANG_LIMIT 1
@@ -77,4 +78,8 @@ xe_sched_job_add_migrate_flush(struct xe_sched_job *job, u32 flags)
 
 bool xe_sched_job_is_migration(struct xe_exec_queue *q);
 
+struct xe_sched_job_snapshot *xe_sched_job_snapshot_capture(struct xe_sched_job *job);
+void xe_sched_job_snapshot_free(struct xe_sched_job_snapshot *snapshot);
+void xe_sched_job_snapshot_print(struct xe_sched_job_snapshot *snapshot, struct drm_printer *p);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index 8778c34d66203..b1d83da50a53d 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -43,4 +43,9 @@ struct xe_sched_job {
 	u64 batch_addr[];
 };
 
+struct xe_sched_job_snapshot {
+	u16 batch_addr_len;
+	u64 batch_addr[];
+};
+
 #endif
-- 
2.43.0

