Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0435606A324
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 18:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=CN8zO9w5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D9410E6EA;
	Mon,  2 Nov 2026 18:57:49 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2585710E6EA
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 18:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1793645860;
 bh=XOfux8BlcLwXcPn+N0Q6LJhfwhota6g2M55aQhKyW8k=;
 h=From:To:Cc:Subject:Date:From;
 b=CN8zO9w5A7ueaosLqY95fOxuVU1bEPgivY6qAvKnK1ntM7B6w4TJtpf3Xx2bkGSUn
 FTpKC55OdhqIxJBa9FBERJ/wtF/adB6LUsL4A1fqEYYhWF9wieL+ROYszcsEeOIDhr
 qZT+IV9mjnG/EyaOlSsNNEk+yB9xUqgh3CxjCA42FavpThnQQIlNv4Ai7jqgrFUatV
 XU6KqUCiKuJb75+IUopDFNdoFSJ8Hb7zUQ72pyjr9OTqKJ9+Hdt6eHcgF1sMuOykfc
 9bgMw+9/PHEHnTx8VNkywIPl+NJJpNn9pGkkFolevTybVglTvfMwMZm0EcYCQJp9/K
 vlrgQmWSaqN2A==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH] drm/xe: Keep ulls alive while servicing ops.
Date: Mon,  2 Nov 2026 19:58:35 +0100
Message-ID: <20261102185834.136370-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Instead of bumping at the start, when performing a lot of work ulls may
run longer, so keep track using a refcount to keep the full benefit of
ulls.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_migrate.c   | 32 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_migrate.h   |  1 +
 drivers/gpu/drm/xe/xe_pagefault.c |  1 +
 drivers/gpu/drm/xe/xe_vm.c        |  6 ++++--
 4 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 19c37eb315893..308bc52e1be52 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -209,6 +209,8 @@ struct xe_migrate {
 	struct xe_tile *tile;
 	/** @job_mutex: Timeline mutex for @eng. */
 	struct mutex job_mutex;
+	/** @ulls_used: How many outstanding ulls operations there are */
+	atomic_t ulls_used;
 	/** @pt_bo: Page-table buffer object. */
 	struct xe_bo *pt_bo;
 	/** @batch_base_ofs: VM offset of the migration batch buffer */
@@ -679,6 +681,8 @@ static struct dma_fence *xe_migrate_job_push(struct xe_migrate *m,
  *
  * If DGFX, enter ULLS mode bypassing GuC / HW context switches by utilizing
  * semaphore and continuously running batches.
+ *
+ * Pairs with xe_migrate_ulls_leave().
  */
 void xe_migrate_ulls_enter(struct xe_migrate *m)
 {
@@ -692,6 +696,12 @@ void xe_migrate_ulls_enter(struct xe_migrate *m)
 	if (!IS_DGFX(xe) || !m->ulls.exit_ms)
 		return;
 
+	/* Bump */
+	if (atomic_inc_return(&m->ulls_used) > 1)
+		return;
+
+	cancel_delayed_work_sync(&m->ulls.exit_work);
+
 job_alloc:
 	if (alloc) {
 		/*
@@ -725,10 +735,30 @@ void xe_migrate_ulls_enter(struct xe_migrate *m)
 	}
 	if (job)
 		xe_sched_job_put(job);
+	mutex_unlock(&m->job_mutex);
+}
+
+/**
+ * xe_migrate_ulls_leave() - Leave ULLS mode
+ * @m: The migration context.
+ *
+ * Leaves the critical part of the migration context, it may continue to be enabled.
+ * Pairs with xe_migrate_ulls_enter().
+ */
+void xe_migrate_ulls_leave(struct xe_migrate *m)
+{
+	struct xe_device *xe = tile_to_xe(m->tile);
+
+	if (!IS_DGFX(xe) || !m->ulls.exit_ms)
+		return;
+
+	if (atomic_dec_return(&m->ulls_used))
+		return;
+
+	guard(mutex)(&m->job_mutex);
 	if (xe_migrate_ulls_enabled(m))
 		mod_delayed_work(system_percpu_wq, &m->ulls.exit_work,
 				 ULLS_EXIT_JIFFIES(m));
-	mutex_unlock(&m->job_mutex);
 }
 
 static void xe_migrate_ulls_exit(struct work_struct *work)
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 2e8be10fdb71f..c909e1afb476e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -98,5 +98,6 @@ int xe_migrate_debug_ccs_overlap(struct xe_migrate *m,
 #endif
 
 void xe_migrate_ulls_enter(struct xe_migrate *m);
+void xe_migrate_ulls_leave(struct xe_migrate *m);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 5247321c805ec..fa2bdb76cef7f 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -326,6 +326,7 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 					xe_pagefault_get_error(pf), err);
 
 	up_read(&vm->lock);
+	xe_migrate_ulls_leave(gt_to_tile(gt)->migrate);
 	xe_vm_put(vm);
 
 	return err;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a26f6b20a22e3..a3770709aef3d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2632,7 +2632,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 				if (addr)
 					goto alloc_next_range;
 				else
-					goto print_op_label;
+					goto ulls_leave;
 			}
 
 			if (IS_ERR(svm_range)) {
@@ -2678,8 +2678,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			if (need_put)
 				xe_svm_range_put(svm_range);
 
+ulls_leave:
+			for_each_tile(tile, vm->xe, id)
+				xe_migrate_ulls_leave(tile->migrate);
 		}
-print_op_label:
 		print_op(vm->xe, __op);
 	}
 
-- 
2.55.0

