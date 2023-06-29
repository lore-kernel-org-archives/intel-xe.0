Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2892EB64DD
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 20:51:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0B310E3FA;
	Thu, 29 Jun 2023 20:51:57 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9830610E3FA
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 20:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688071915; x=1719607915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jZblCBLxgEqULD54aZhGRFKF0Cjh7DHDr1vN6HWtLwQ=;
 b=d74/A0FjS7Wntn7mHZpKF7taJ8EOgfGaS9Rof/xMFjPnBdszMzup+VNz
 KYvOEEh6igF39nP8lPzi1Tvm+0Medw0f/Rvod0rABhZSN/v8LHxzbtL5B
 3lzfOxRDUuA5zMyMbHAKe8CcOgHLF3IT7y6nXhSOpGN1YAMaadM0wUlfr
 VCVVC36MqnSvVBZdx2Ruw0dDcZ8KpkupSBoZAN7VIi2+UVZALp3Kj7dGw
 aYNw0JV4sC49ULyvMU2qRzRmH8+Xtr+6UyzYu2rqDoMnjgpHhv7p6wqQj
 U5UNxUaAbSIsJQTG3Huh01i3Y2bIw/moDeB12I2BtmTBTuOw+w+yrvtwz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="448605263"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="448605263"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 13:51:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="711577975"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="711577975"
Received: from sfhansen-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.200])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 13:51:54 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 29 Jun 2023 22:51:34 +0200
Message-Id: <20230629205134.111849-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230629205134.111849-1-thomas.hellstrom@linux.intel.com>
References: <20230629205134.111849-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Fix the separate bind-engine race
 using coarse-granularity dependencies
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

Separate bind-engines operating on the same VM range might race updating
page-tables. To make sure that doesn't happen, each page-table update
operation needs to collect internal dependencies to await before the
job is executed.

Provide an infrastructure to do that. Initially we save a single dma-fence
for the entire VM, which thus removes the benefit of separate bind-engines
in favour of fixing the race, but a more fine-grained dependency
tracking can be achieved by using, for example, the same method as the
i915 vma_resources (an interval tree storing unsignaled fences). That
of course comes with increasing code complexity.

This patch will break the xe_vm@bind-engines-independent igt test, but that
would need an update anyway to avoid the independent binds using the
same address range. In any case, such a test would not work with the
initial xe implementation unless the binds were using different vms.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c  |  2 ++
 drivers/gpu/drm/xe/xe_migrate.h  |  2 ++
 drivers/gpu/drm/xe/xe_pt.c       | 48 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.c       |  1 +
 drivers/gpu/drm/xe/xe_vm_types.h |  8 ++++++
 5 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 41c90f6710ee..ff0a422f59a5 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1073,6 +1073,7 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 		return ERR_PTR(-ETIME);
 
 	if (ops->pre_commit) {
+		pt_update->job = NULL;
 		err = ops->pre_commit(pt_update);
 		if (err)
 			return ERR_PTR(err);
@@ -1294,6 +1295,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 		goto err_job;
 
 	if (ops->pre_commit) {
+		pt_update->job = job;
 		err = ops->pre_commit(pt_update);
 		if (err)
 			goto err_job;
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 204337ea3b4e..b4135876e3f7 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -69,6 +69,8 @@ struct xe_migrate_pt_update {
 	const struct xe_migrate_pt_update_ops *ops;
 	/** @vma: The vma we're updating the pagetable for. */
 	struct xe_vma *vma;
+	/** @job: The job if a GPU page-table update. NULL otherwise */
+	struct xe_sched_job *job;
 };
 
 struct xe_migrate *xe_migrate_init(struct xe_tile *tile);
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index fe1c77b139e4..f38e7b5a3b32 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1119,6 +1119,42 @@ struct xe_pt_migrate_pt_update {
 	bool locked;
 };
 
+/*
+ * This function adds the needed dependencies to a page-table update job
+ * to make sure racing jobs for separate bind engines don't race writing
+ * to the same page-table range, wreaking havoc. Initially use a single
+ * fence for the entire VM. An optimization would use smaller granularity.
+ */
+static int xe_pt_vm_dependencies(struct xe_sched_job *job, struct xe_vm *vm)
+{
+	int err;
+
+	if (!vm->last_update_fence)
+		return 0;
+
+	if (dma_fence_is_signaled(vm->last_update_fence)) {
+		dma_fence_put(vm->last_update_fence);
+		vm->last_update_fence = NULL;
+		return 0;
+	}
+
+	/* Is this a CPU update? GPU is busy updating, so return an error */
+	if (!job)
+		return -ETIME;
+
+	dma_fence_get(vm->last_update_fence);
+	err = drm_sched_job_add_dependency(&job->drm, vm->last_update_fence);
+	if (err)
+		dma_fence_put(vm->last_update_fence);
+
+	return err;
+}
+
+static int xe_pt_pre_commit(struct xe_migrate_pt_update *pt_update)
+{
+	return xe_pt_vm_dependencies(pt_update->job, pt_update->vma->vm);
+}
+
 static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 {
 	struct xe_pt_migrate_pt_update *userptr_update =
@@ -1126,6 +1162,10 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 	struct xe_vma *vma = pt_update->vma;
 	unsigned long notifier_seq = vma->userptr.notifier_seq;
 	struct xe_vm *vm = vma->vm;
+	int err = xe_pt_vm_dependencies(pt_update->job, vm);
+
+	if (err)
+		return err;
 
 	userptr_update->locked = false;
 
@@ -1164,6 +1204,7 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 
 static const struct xe_migrate_pt_update_ops bind_ops = {
 	.populate = xe_vm_populate_pgtable,
+	.pre_commit = xe_pt_pre_commit,
 };
 
 static const struct xe_migrate_pt_update_ops userptr_bind_ops = {
@@ -1345,6 +1386,9 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 	if (!IS_ERR(fence)) {
 		LLIST_HEAD(deferred);
 
+		dma_fence_put(vm->last_update_fence);
+		vm->last_update_fence = dma_fence_get(fence);
+
 		/* TLB invalidation must be done before signaling rebind */
 		if (ifence) {
 			int err = invalidation_fence_init(tile->primary_gt, ifence, fence,
@@ -1591,6 +1635,7 @@ xe_pt_commit_unbind(struct xe_vma *vma,
 
 static const struct xe_migrate_pt_update_ops unbind_ops = {
 	.populate = xe_migrate_clear_pgtable_callback,
+	.pre_commit = xe_pt_pre_commit,
 };
 
 static const struct xe_migrate_pt_update_ops userptr_unbind_ops = {
@@ -1666,6 +1711,9 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
 	if (!IS_ERR(fence)) {
 		int err;
 
+		dma_fence_put(vm->last_update_fence);
+		vm->last_update_fence = dma_fence_get(fence);
+
 		/* TLB invalidation must be done before signaling unbind */
 		err = invalidation_fence_init(tile->primary_gt, ifence, fence, vma);
 		if (err) {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8b8c9c5aeb01..f90f3a7c6ede 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1517,6 +1517,7 @@ static void vm_destroy_work_func(struct work_struct *w)
 
 	trace_xe_vm_free(vm);
 	dma_fence_put(vm->rebind_fence);
+	dma_fence_put(vm->last_update_fence);
 	dma_resv_fini(&vm->resv);
 	kfree(vm);
 }
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index c148dd49a6ca..5d9eebe5c6bb 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -343,6 +343,14 @@ struct xe_vm {
 		bool capture_once;
 	} error_capture;
 
+	/**
+	 * @last_update_fence: fence representing the last page-table
+	 * update on this VM. Used to avoid races between separate
+	 * bind engines. Ideally this should be an interval tree of
+	 * unsignaled fences. Protected by the vm resv.
+	 */
+	struct dma_fence *last_update_fence;
+
 	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
 	bool batch_invalidate_tlb;
 };
-- 
2.40.1

