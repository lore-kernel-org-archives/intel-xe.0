Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1544BEB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 15:56:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E576010E5CF;
	Thu, 20 Jul 2023 15:55:59 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886B410E5CB
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 15:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689868553; x=1721404553;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o+hAgUw3Pg8wddVO+U6zilaa7q/hiAlsHMBtbyP5HTM=;
 b=ms0/gHeS/cPrrmvfgYCTyqd4nf2pl+/NK0pOuiBXTp3hp/rmk3uDOorV
 IMENg7Qu9X5v60a+zwp3+kxMd2A2ZBQ0mT4CuHyXNq8Z2ezojV6gaVfGk
 9TOnNn3Dd44EDft6FAVfcHXvtuOhvuGygyhlNTFRriSyt5pYcQDqOxgPw
 VmVGCa1ogFFPDmeirmXhwJH8i6kojmG3wRPLrd25T+ogz4v/0HOxgBXnG
 U4rLRp59A6O4BPbR9HA1uC0jjp6sZAxLdegGXXNlAGLkETeFrna/E5a2i
 MxkfRRbAl5mc0c8QEmYTM6NR5UrJ7CW+fhr9PtaHYzCr9L0++2iVcMUZ5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="347088644"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="347088644"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 08:55:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="754105486"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="754105486"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 08:55:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 20 Jul 2023 08:55:46 -0700
Message-Id: <20230720155546.199766-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720155546.199766-1-matthew.brost@intel.com>
References: <20230720155546.199766-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 7/7] drm/xe: Only alloc userptr part of xe_vma
 for userptrs
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Only alloc userptr part of xe_vma for userptrs, this will save on space
in the common BO case.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       |  8 +++--
 drivers/gpu/drm/xe/xe_vm_types.h | 56 ++++++++++++++++++--------------
 2 files changed, 37 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 25ecc196ce57..6003c0be5b59 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -880,14 +880,17 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	XE_BUG_ON(start >= end);
 	XE_BUG_ON(end >= vm->size);
 
-	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
+	if (!bo && !is_null)	/* userptr */
+		vma = kzalloc(sizeof(*vma), GFP_KERNEL);
+	else
+		vma = kzalloc(sizeof(*vma) - sizeof(struct xe_userptr),
+			      GFP_KERNEL);
 	if (!vma) {
 		vma = ERR_PTR(-ENOMEM);
 		return vma;
 	}
 
 	INIT_LIST_HEAD(&vma->combined_links.rebind);
-	INIT_LIST_HEAD(&vma->userptr.invalidate_link);
 	INIT_LIST_HEAD(&vma->notifier.rebind_link);
 	INIT_LIST_HEAD(&vma->extobj.link);
 
@@ -922,6 +925,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 			u64 size = end - start + 1;
 			int err;
 
+			INIT_LIST_HEAD(&vma->userptr.invalidate_link);
 			vma->gpuva.gem.offset = bo_offset_or_userptr;
 
 			err = mmu_interval_notifier_insert(&vma->userptr.notifier,
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 0f584bca3020..261a4b0e8570 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -34,6 +34,31 @@ struct xe_vm;
 #define XE_VMA_PTE_2M		(DRM_GPUVA_USERBITS << 6)
 #define XE_VMA_PTE_1G		(DRM_GPUVA_USERBITS << 7)
 
+/** struct xe_userptr - User pointer */
+struct xe_userptr {
+	/** @invalidate_link: Link for the vm::userptr.invalidated list */
+	struct list_head invalidate_link;
+	/**
+	 * @notifier: MMU notifier for user pointer (invalidation call back)
+	 */
+	struct mmu_interval_notifier notifier;
+	/** @sgt: storage for a scatter gather table */
+	struct sg_table sgt;
+	/** @sg: allocated scatter gather table */
+	struct sg_table *sg;
+	/** @notifier_seq: notifier sequence number */
+	unsigned long notifier_seq;
+	/**
+	 * @initial_bind: user pointer has been bound at least once.
+	 * write: vm->userptr.notifier_lock in read mode and vm->resv held.
+	 * read: vm->userptr.notifier_lock in write mode or vm->resv held.
+	 */
+	bool initial_bind;
+#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
+	u32 divisor;
+#endif
+};
+
 struct xe_vma {
 	/** @gpuva: Base GPUVA object */
 	struct drm_gpuva gpuva;
@@ -68,31 +93,6 @@ struct xe_vma {
 		struct work_struct destroy_work;
 	};
 
-	/** @userptr: user pointer state */
-	struct {
-		/** @invalidate_link: Link for the vm::userptr.invalidated list */
-		struct list_head invalidate_link;
-		/**
-		 * @notifier: MMU notifier for user pointer (invalidation call back)
-		 */
-		struct mmu_interval_notifier notifier;
-		/** @sgt: storage for a scatter gather table */
-		struct sg_table sgt;
-		/** @sg: allocated scatter gather table */
-		struct sg_table *sg;
-		/** @notifier_seq: notifier sequence number */
-		unsigned long notifier_seq;
-		/**
-		 * @initial_bind: user pointer has been bound at least once.
-		 * write: vm->userptr.notifier_lock in read mode and vm->resv held.
-		 * read: vm->userptr.notifier_lock in write mode or vm->resv held.
-		 */
-		bool initial_bind;
-#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
-		u32 divisor;
-#endif
-	} userptr;
-
 	/** @usm: unified shared memory state */
 	struct {
 		/** @tile_invalidated: VMA has been invalidated */
@@ -122,6 +122,12 @@ struct xe_vma {
 		 */
 		struct list_head link;
 	} extobj;
+
+	/**
+	 * @userptr: user pointer state, only allocated for VMAs that are
+	 * user pointers
+	 */
+	struct xe_userptr userptr;
 };
 
 struct xe_device;
-- 
2.34.1

