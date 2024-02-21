Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB2FC48BF6
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 13:30:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2DC10E745;
	Wed, 21 Feb 2024 13:30:31 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441E410E740
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 13:30:30 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v5 1/9] drm/xe/snapshot: Remove drm_err on guc alloc failures
Date: Wed, 21 Feb 2024 14:30:16 +0100
Message-ID: <20240221133024.898315-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

The kernel will complain loudly if allocation fails, no need to do it
ourselves.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 3ac51162cfa72..ff77bc8da1b27 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1794,18 +1794,14 @@ struct xe_guc_submit_exec_queue_snapshot *
 xe_guc_exec_queue_snapshot_capture(struct xe_sched_job *job)
 {
 	struct xe_exec_queue *q = job->q;
-	struct xe_guc *guc = exec_queue_to_guc(q);
-	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	struct xe_guc_submit_exec_queue_snapshot *snapshot;
 	int i;
 
 	snapshot = kzalloc(sizeof(*snapshot), GFP_ATOMIC);
 
-	if (!snapshot) {
-		drm_err(&xe->drm, "Skipping GuC Engine snapshot entirely.\n");
+	if (!snapshot)
 		return NULL;
-	}
 
 	snapshot->guc.id = q->guc->id;
 	memcpy(&snapshot->name, &q->name, sizeof(snapshot->name));
@@ -1821,9 +1817,7 @@ xe_guc_exec_queue_snapshot_capture(struct xe_sched_job *job)
 	snapshot->lrc = kmalloc_array(q->width, sizeof(struct lrc_snapshot),
 				      GFP_ATOMIC);
 
-	if (!snapshot->lrc) {
-		drm_err(&xe->drm, "Skipping GuC Engine LRC snapshot.\n");
-	} else {
+	if (snapshot->lrc) {
 		for (i = 0; i < q->width; ++i) {
 			struct xe_lrc *lrc = q->lrc + i;
 
@@ -1851,9 +1845,7 @@ xe_guc_exec_queue_snapshot_capture(struct xe_sched_job *job)
 					       sizeof(struct pending_list_snapshot),
 					       GFP_ATOMIC);
 
-	if (!snapshot->pending_list) {
-		drm_err(&xe->drm, "Skipping GuC Engine pending_list snapshot.\n");
-	} else {
+	if (snapshot->pending_list) {
 		struct xe_sched_job *job_iter;
 
 		i = 0;
-- 
2.43.0

