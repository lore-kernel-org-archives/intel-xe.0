Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14875CD5BB1
	for <intel-xe@archiver.kernel.org>; Sat, 23 May 2026 10:34:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43AA010E02A;
	Sat, 23 May 2026 10:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="l992U399";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FAE10E02A
 for <intel-xe@lists.freedesktop.org>; Sat, 23 May 2026 10:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=67EWVI4FKPWoODafgyykYyfHbis3UufkpVLU/XfJPK8=; b=l992U3993v5e+im3s+3+mjOIQP
 gNnlYmr5lEDSBNTwXM6ppp2UKf3spdQ4GJqQlBALSjNixIFmy/IqlILI+unLDjkQ6lEF/cgPU++y/
 HaZ0sgBm3N84NG6YCj6M+EgHu5p6dBKHoMUphMh9mUv4cniIhGxrXKq/ZZky965IzfzIeApqkIH1f
 w/+nhBG1ZIwqtNxdpajHaR47OHHjLcIrXJuUBNlQYk4znFLJT4E0szRn1yqBAEU48awcJ8jb5djTG
 O/8h0vUJ+24kX8yIUymh8fWNFU0zpCBjzRt2HOuLdRL55Go3IWW0SZeHGlEQqH1bICeDyFmBPN1V9
 d3bJ9vkg==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wQjgS-005gSo-RE; Sat, 23 May 2026 12:34:20 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2] drm/xe: Assign queue name in time for drm_sched_init
Date: Sat, 23 May 2026 11:34:18 +0100
Message-ID: <20260523103418.61832-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.54.0
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

Currently the queue name is only assigned after the drm scheduler instance
has been created. This loses information with all logging or debug
workqueue facilities so lets re-order things a bit so the name gets
assigned in time.

To be able to assign a GuC ID early we split the allocation into
reservation and publish phases.

First, with the submission state lock held, we reserve the ID in the GuC
ID manager, which serves as an authoritative source of truth. Then we can
drop the lock and reserve entries in the exec queue lookup XArray. This
can be lockless since the NULL entries are invisible both to the kernel
and userspace. Only after the queue has been fully created we replace the
reserved entries with the queue pointer, which can be done locklessly for
single width queues.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
---
v2:
 * Split the id allocation into reserve and publish. (Rodrigo)
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 72 +++++++++++++++++-------------
 1 file changed, 40 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index afd8cc7bd231..ab501513d806 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -408,46 +408,43 @@ void xe_guc_submit_disable(struct xe_guc *guc)
 	guc->submission_state.enabled = false;
 }
 
-static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q, u32 xa_count)
+static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q,
+			     int count)
 {
 	int i;
 
-	lockdep_assert_held(&guc->submission_state.lock);
+	mutex_lock(&guc->submission_state.lock);
 
-	for (i = 0; i < xa_count; ++i)
-		xa_erase(&guc->submission_state.exec_queue_lookup, q->guc->id + i);
+	for (i = 0; i < count; ++i)
+		xa_erase(&guc->submission_state.exec_queue_lookup,
+			 q->guc->id + i);
 
 	xe_guc_id_mgr_release_locked(&guc->submission_state.idm,
 				     q->guc->id, q->width);
 
 	if (xa_empty(&guc->submission_state.exec_queue_lookup))
 		wake_up(&guc->submission_state.fini_wq);
+
+	mutex_unlock(&guc->submission_state.lock);
 }
 
 static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
 {
-	int ret;
-	int i;
-
-	/*
-	 * Must use GFP_NOWAIT as this lock is in the dma fence signalling path,
-	 * worse case user gets -ENOMEM on engine create and has to try again.
-	 *
-	 * FIXME: Have caller pre-alloc or post-alloc /w GFP_KERNEL to prevent
-	 * failure.
-	 */
-	lockdep_assert_held(&guc->submission_state.lock);
+	int ret, i;
 
+	mutex_lock(&guc->submission_state.lock);
 	ret = xe_guc_id_mgr_reserve_locked(&guc->submission_state.idm,
 					   q->width);
+	mutex_unlock(&guc->submission_state.lock);
 	if (ret < 0)
 		return ret;
 
 	q->guc->id = ret;
 
+	/* Reserve empty slots. */
 	for (i = 0; i < q->width; ++i) {
-		ret = xa_err(xa_store(&guc->submission_state.exec_queue_lookup,
-				      q->guc->id + i, q, GFP_NOWAIT));
+		ret = xa_insert(&guc->submission_state.exec_queue_lookup,
+				 q->guc->id + i, NULL, GFP_KERNEL);
 		if (ret)
 			goto err_release;
 	}
@@ -460,11 +457,24 @@ static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
 	return ret;
 }
 
+static void publish_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
+{
+	int i;
+
+	lockdep_assert_held(&guc->submission_state.lock);
+
+	for (i = 0; i < q->width; ++i) {
+		void *old;
+
+		old = xa_store(&guc->submission_state.exec_queue_lookup,
+			       q->guc->id + i, q, GFP_NOWAIT);
+		XE_WARN_ON(old || xa_is_err(old));
+	}
+}
+
 static void release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
 {
-	mutex_lock(&guc->submission_state.lock);
 	__release_guc_id(guc, q, q->width);
-	mutex_unlock(&guc->submission_state.lock);
 }
 
 struct exec_queue_policy {
@@ -1961,6 +1971,12 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
 		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
 
+	err = alloc_guc_id(guc, q);
+	if (err)
+		goto err_free;
+
+	xe_exec_queue_assign_name(q, q->guc->id);
+
 	/*
 	 * Use primary queue's submit_wq for all secondary queues of a
 	 * multi queue group. This serialization avoids any locking around
@@ -1977,28 +1993,21 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
 			    q->name, gt_to_xe(q->gt)->drm.dev);
 	if (err)
-		goto err_free;
+		goto err_release_id;
 
 	sched = &ge->sched;
 	err = xe_sched_entity_init(&ge->entity, sched);
 	if (err)
 		goto err_sched;
 
-	mutex_lock(&guc->submission_state.lock);
-
-	err = alloc_guc_id(guc, q);
-	if (err)
-		goto err_entity;
-
 	q->entity = &ge->entity;
 
+	mutex_lock(&guc->submission_state.lock);
 	if (xe_guc_read_stopped(guc) || vf_recovery(guc))
 		xe_sched_stop(sched);
-
+	publish_guc_id(guc, q);
 	mutex_unlock(&guc->submission_state.lock);
 
-	xe_exec_queue_assign_name(q, q->guc->id);
-
 	/*
 	 * Maintain secondary queues of the multi queue group in a list
 	 * for handling dependencies across the queues in the group.
@@ -2021,11 +2030,10 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 
 	return 0;
 
-err_entity:
-	mutex_unlock(&guc->submission_state.lock);
-	xe_sched_entity_fini(&ge->entity);
 err_sched:
 	xe_sched_fini(&ge->sched);
+err_release_id:
+	release_guc_id(guc, q);
 err_free:
 	kfree(ge);
 
-- 
2.54.0

