Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEF9606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 16:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fspSYUVH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E24B2112604;
	Thu, 26 Nov 2026 16:58:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD925112607
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 16:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795712311; x=1827248311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=40MbQdZoZa8BJciYoEd5WYX9Jt/Ipweb2VgCnc1PiOE=;
 b=fspSYUVHKtmWGU9U4DA7w7aeeWTBmeZR/N2Vc2XSQW838jGGUsNG+hmX
 H0SRCnE/RAABbpPQG6gJ1vFkgvT2JeCcxMmWOm2Hj3FXqatkRWy1/BNYP
 P2mcU6xz5woj9/lu3EBublNO51iujksU9B9f/QolSJLFTxZG+0IHQEbJv
 Qc1fl7m8RBQNjPRblNGVnbDYlOm+gQ8duTWaOTstbvmueN9rBvYKEjU5x
 MWEHucBfeQDyc/zJ0IWzZ+u+/E7jmjd9tyZq0dzGBFn91CVGm2Y0K0cPY
 dHCXw28PupZ/Dgi9DwAUoPpaYRXuTCf57DBzmK2BjexqkMXzbGZUCN6uk g==;
X-CSE-ConnectionGUID: YYw9opU6TTWRONpTHvjY0A==
X-CSE-MsgGUID: NkqT5TL6R6iafN97ox/bzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4532783"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4532783"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 08:58:31 -0800
X-CSE-ConnectionGUID: BADcM/yRSaCoQ0GBGdXg6g==
X-CSE-MsgGUID: scLO3hL4SXy9l6qpfm/uHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12549167"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 08:58:29 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v3 1/2] drm/xe/bo: Defer the final VM put from BO destroy
Date: Thu, 26 Nov 2026 22:19:25 +0530
Message-ID: <20261126164923.3892097-5-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261126164923.3892097-4-sanjay.kumar.yadav@intel.com>
References: <20261126164923.3892097-4-sanjay.kumar.yadav@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since drm_gpuvm holds a device reference, the final VM put from
xe_ttm_bo_destroy() can drop the last device reference and run device
teardown in a worker that teardown itself waits for: the async BO free
worker, flushed by xe_bo_dev_fini(), or the TTM delayed delete worker,
drained by ttm_device_fini(). The rest of xe_ttm_bo_destroy() would
also use the freed device.

Add xe_vm_put_async(), which defers the final VM put to the
module-lifetime xe_destroy_wq, and use it in xe_ttm_bo_destroy(). As
kref has no put-unless-last helper, it uses refcount_dec_not_one() on
the embedded refcount. Do the parent BO and VM puts last, as once a
reference is dropped another context may drop the last device
reference, so the device must not be used after that.

v3:
- Defer the final VM put from BO destroy instead of holding a device
  reference in the async BO free worker, which also covers TTM delayed
  delete (Sashiko).
- Drop the inline free in xe_bo_dev_fini() (Sashiko).
- Add Fixes: c2d72717e0a9.

Fixes: c2d72717e0a9 ("drm/gpuvm: take refcount on DRM device")
Fixes: 0e33330f1238 ("drm/xe: Add struct xe_pt_job_ops")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 16 ++++++++++++----
 drivers/gpu/drm/xe/xe_vm.c       | 28 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h       |  2 ++
 drivers/gpu/drm/xe/xe_vm_types.h |  3 +++
 4 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 353ac1e9a9d6..687d758588a8 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2009,6 +2009,8 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 {
 	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
 	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
+	struct xe_bo *parent = bo->parent_obj;
+	struct xe_vm *vm = NULL;
 	struct xe_tile *tile;
 	u8 id;
 
@@ -2030,10 +2032,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 #endif
 
 	if (bo->vm && (xe_bo_is_user(bo) || bo->flags & XE_BO_FLAG_PAGETABLE))
-		xe_vm_put(bo->vm);
-
-	if (bo->parent_obj)
-		xe_bo_put(bo->parent_obj);
+		vm = bo->vm;
 
 	mutex_lock(&xe->mem_access.vram_userfault.lock);
 	if (!list_empty(&bo->vram_userfault_link))
@@ -2041,6 +2040,15 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 	mutex_unlock(&xe->mem_access.vram_userfault.lock);
 
 	kfree(bo);
+
+	/*
+	 * Once a reference is dropped, another context may drop the last
+	 * device reference, so nothing may use @xe after these puts.
+	 */
+	if (parent)
+		xe_bo_put(parent);
+	if (vm)
+		xe_vm_put_async(vm);
 }
 
 static void xe_gem_object_free(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index dd855876f571..b5dc909521a0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1625,6 +1625,33 @@ static const struct xe_pt_ops xelp_pt_ops = {
 
 static void vm_destroy_work_func(struct work_struct *w);
 
+static void vm_put_work_func(struct work_struct *w)
+{
+	struct xe_vm *vm = container_of(w, struct xe_vm, put_work);
+
+	xe_vm_put(vm);
+}
+
+/**
+ * xe_vm_put_async() - Put a VM reference, deferring the final put
+ * @vm: The VM.
+ *
+ * The final VM put may drop the last device reference and run device
+ * teardown. Defer it to xe_destroy_wq, which device teardown doesn't wait
+ * for, for callers that teardown does wait for, like the async BO free and
+ * TTM delayed delete workers.
+ */
+void xe_vm_put_async(struct xe_vm *vm)
+{
+	/*
+	 * kref has no put-unless-last helper. Only the holder of the last
+	 * reference queues put_work, so it can't already be pending. @vm may
+	 * be freed once queued, so only the return value is checked.
+	 */
+	if (!refcount_dec_not_one(&vm->gpuvm.kref.refcount))
+		WARN_ON(!xe_destroy_wq_queue(&vm->put_work));
+}
+
 /**
  * xe_vm_create_scratch() - Setup a scratch memory pagetable tree for the
  * given tile and vm.
@@ -1766,6 +1793,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
 
 	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
+	INIT_WORK(&vm->put_work, vm_put_work_func);
 
 	INIT_LIST_HEAD(&vm->preempt.exec_queues);
 	for (id = 0; id < XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE; ++id)
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index b1c5f940bcc5..9aae8c3d5ce0 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -49,6 +49,8 @@ static inline void xe_vm_put(struct xe_vm *vm)
 	drm_gpuvm_put(&vm->gpuvm);
 }
 
+void xe_vm_put_async(struct xe_vm *vm);
+
 int xe_vm_lock(struct xe_vm *vm, bool intr);
 
 void xe_vm_unlock(struct xe_vm *vm);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index fb9305124679..7c2bec7aa1c1 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -313,6 +313,9 @@ struct xe_vm {
 	 */
 	struct work_struct destroy_work;
 
+	/** @put_work: worker for the final VM put, see xe_vm_put_async() */
+	struct work_struct put_work;
+
 	/**
 	 * @rftree: range fence tree to track updates to page table structure.
 	 * Used to implement conflict tracking between independent bind engines.
-- 
2.52.0

