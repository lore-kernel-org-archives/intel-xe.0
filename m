Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC722C25B78
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 18:46:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FE710E494;
	Tue,  4 Jun 2024 18:46:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c/+/9tqF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C3D10E494
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 18:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717526793; x=1749062793;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/D6RhWW+AvYG4/Qse1sc7CRVS5AQEe+Rgz0TR2sZj1s=;
 b=c/+/9tqF86ze6+5zUNtn6MUiqfb2Z5kVXy0hTyx7HskO6Nmn80agTj0/
 sj6OLDT/a9TldsE7XVDAaSq/bOipUQYFTxNVihv8gFTC7iHCNfsJcpqTE
 uV00OpjzOtoTbB9MX2Ydo/YrkjSrrvbouToH7atw59Af2rXQf0W/qmgEY
 YTh60Nif0eA0UcZyz3OOeb0+FZ2keZYcLXEVe+dkqc61D9rrMTR+6rDGP
 xGYcnWJ1HejaCvd5JuVDlK1imfagc/kMq6a3/AbUoJoMJCFvLXpmGNGyM
 T6j1/mrZj2DrfIMdKFOFLlnNxestCGBOY3YnWl15xvLRwI+AZC/sqrcV3 A==;
X-CSE-ConnectionGUID: vOC6rv9iT16O/PW0fw0dIg==
X-CSE-MsgGUID: p1fzESAGT+2iQmMS9PC4cg==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="24757181"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="24757181"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 11:46:32 -0700
X-CSE-ConnectionGUID: nPfzBb+eQWCxChbyus6XzQ==
X-CSE-MsgGUID: 8x6tqgKaRoG8YLxPJzFAVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="37394087"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 11:46:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Drop EXEC_QUEUE_FLAG_BANNED
Date: Tue,  4 Jun 2024 11:47:00 -0700
Message-Id: <20240604184700.1946918-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Clean up laying violation of setting q->flags EXEC_QUEUE_FLAG_BANNED bit
in GuC backend. Move banned to GuC owned bit and report banned status to
upper layers via reset_status vfunc. This is a slight change in behavior
as reset_status returns true if wedged or killed bits set too, but in
all of these cases submission to queue is no longer allowed.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c             |  2 +-
 drivers/gpu/drm/xe/xe_exec_queue.c       |  2 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 12 +++++-------
 drivers/gpu/drm/xe/xe_guc_submit.c       | 10 ++++++----
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 97eeb973e897..4cf6c6ab4866 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -141,7 +141,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			 q->width != args->num_batch_buffer))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_BANNED)) {
+	if (XE_IOCTL_DBG(xe, q->ops->reset_status(q))) {
 		err = -ECANCELED;
 		goto err_exec_queue;
 	}
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 27215075c799..cf45df0328da 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -677,7 +677,7 @@ int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
 
 	switch (args->property) {
 	case DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN:
-		args->value = !!(q->flags & EXEC_QUEUE_FLAG_BANNED);
+		args->value = q->ops->reset_status(q);
 		ret = 0;
 		break;
 	default:
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 18d8b2a60928..f0c5f82ce7e3 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -70,18 +70,16 @@ struct xe_exec_queue {
 	 */
 	struct dma_fence *last_fence;
 
-/* queue no longer allowed to submit */
-#define EXEC_QUEUE_FLAG_BANNED			BIT(0)
 /* queue used for kernel submission only */
-#define EXEC_QUEUE_FLAG_KERNEL			BIT(1)
+#define EXEC_QUEUE_FLAG_KERNEL			BIT(0)
 /* kernel engine only destroyed at driver unload */
-#define EXEC_QUEUE_FLAG_PERMANENT		BIT(2)
+#define EXEC_QUEUE_FLAG_PERMANENT		BIT(1)
 /* for VM jobs. Caller needs to hold rpm ref when creating queue with this flag */
-#define EXEC_QUEUE_FLAG_VM			BIT(3)
+#define EXEC_QUEUE_FLAG_VM			BIT(2)
 /* child of VM queue for multi-tile VM jobs */
-#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(4)
+#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
 /* kernel exec_queue only, set priority to highest level */
-#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(5)
+#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 47aab04cf34f..4464ba337d12 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -61,6 +61,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
 #define EXEC_QUEUE_STATE_RESET			(1 << 6)
 #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
 #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
+#define EXEC_QUEUE_STATE_BANNED			(1 << 9)
 
 static bool exec_queue_registered(struct xe_exec_queue *q)
 {
@@ -134,12 +135,12 @@ static void set_exec_queue_destroyed(struct xe_exec_queue *q)
 
 static bool exec_queue_banned(struct xe_exec_queue *q)
 {
-	return (q->flags & EXEC_QUEUE_FLAG_BANNED);
+	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_BANNED;
 }
 
 static void set_exec_queue_banned(struct xe_exec_queue *q)
 {
-	q->flags |= EXEC_QUEUE_FLAG_BANNED;
+	atomic_or(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
 }
 
 static bool exec_queue_suspended(struct xe_exec_queue *q)
@@ -189,8 +190,9 @@ static void set_exec_queue_wedged(struct xe_exec_queue *q)
 
 static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
 {
-	return exec_queue_banned(q) || (atomic_read(&q->guc->state) &
-		(EXEC_QUEUE_STATE_WEDGED | EXEC_QUEUE_STATE_KILLED));
+	return (atomic_read(&q->guc->state) &
+		(EXEC_QUEUE_STATE_WEDGED | EXEC_QUEUE_STATE_KILLED |
+		 EXEC_QUEUE_STATE_BANNED));
 }
 
 #ifdef CONFIG_PROVE_LOCKING
-- 
2.34.1

