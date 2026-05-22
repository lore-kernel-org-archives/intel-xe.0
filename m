Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5A0CD5BB4
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 14:40:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F57F10E222;
	Fri, 22 May 2026 14:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="FTEJYOn9";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C03010E222
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 14:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lF2ezQ3lLLm1NBIfX2wUuZ8rXDLpZEv1nlzpm3DNgG8=; b=FTEJYOn9E4w3jEM+cScQx3xOL7
 6uO+3sZF+VPGlpjosUFxQK76tXeVNe320okkiGAp9JsikNI7S9K0wEbzIaBA1xdl9P1r3tujGDsTk
 BhzJppZ6r5SaBXf1c7cNmOlrLQWRJzv2PIjPDjqCSWtqJsIjmjWnOmOOqqElTYWYcwTl9wmSQGQ/7
 pIbr/3zBDZl+f2+my2IuexJ6Y0KuCqrgt9ePHjkbH1OyluOGpDizl0CaKrDsqWNLEm8T+ZaJpvVq/
 qpc0IEJ85Wc3zyAGvT1kWZBEs7J9V5GhRY/T+prY5lJPCY0kT2T+UYuO2J6Yxk9VdxZ9UNY1gPBg+
 N1OacpAQ==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wQR2l-004tue-L0; Fri, 22 May 2026 16:40:07 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/xe: Assign queue name in time for drm_sched_init
Date: Fri, 22 May 2026 15:40:03 +0100
Message-ID: <20260522144003.12836-1-tvrtko.ursulin@igalia.com>
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

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index afd8cc7bd231..28f3b23527e6 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1961,6 +1961,13 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
 		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
 
+	mutex_lock(&guc->submission_state.lock);
+	err = alloc_guc_id(guc, q);
+	mutex_unlock(&guc->submission_state.lock);
+	if (err)
+		goto err_free;
+	xe_exec_queue_assign_name(q, q->guc->id);
+
 	/*
 	 * Use primary queue's submit_wq for all secondary queues of a
 	 * multi queue group. This serialization avoids any locking around
@@ -1977,28 +1984,20 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
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
 	mutex_unlock(&guc->submission_state.lock);
 
-	xe_exec_queue_assign_name(q, q->guc->id);
-
 	/*
 	 * Maintain secondary queues of the multi queue group in a list
 	 * for handling dependencies across the queues in the group.
@@ -2021,11 +2020,10 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 
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

