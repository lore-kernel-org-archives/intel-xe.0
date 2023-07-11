Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662F0C001DC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jul 2023 21:27:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE8D10E435;
	Tue, 11 Jul 2023 21:27:39 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9499A10E433
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jul 2023 21:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689110855; x=1720646855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i3+1MNFuTQ8GLbgFwgjs9W69ISRyW09k3IpMdgm3Bes=;
 b=M4471d1UHZ5HNrA07nmIm6SEgrCU1vppZPB2bhnhYdNz5APsI5Co6LyH
 XJ/hru759HudCtm1LQb+t1br3j/QYDJgKhOuOkb7VsuC4E3RqqioZesg6
 lUC6z2jcMmfiHBx9KZa32gcSwe++KfK2BnabqpZVi5rAaQau0TNeLprMU
 sUVHAkeQTWQdDvfAVnmwFL6ZheVXiiZ7q0/Tmgd8PRARsg6fIXP3WhHuE
 eGiKpb5M+yJDC3zW8vDt4ZriT3H3twcKqJkWrWqjbcVB2KyuvnACrvPVu
 ODGkOe4p/1DW3sx40vFwX+BtsiuEq0wOKnQihA6G56aio5DH9wlwyhWCr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="451102349"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; d="scan'208";a="451102349"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 14:27:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="786782159"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; d="scan'208";a="786782159"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 14:27:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 11 Jul 2023 14:27:48 -0700
Message-Id: <20230711212748.2029455-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711212748.2029455-1-matthew.brost@intel.com>
References: <20230711212748.2029455-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/5] drm/xe: Only alloc userptr part of xe_vma
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This will save on space in common BO case.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       |  6 +++-
 drivers/gpu/drm/xe/xe_vm_types.h | 56 ++++++++++++++++++--------------
 2 files changed, 36 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 762aefa75ed4..d1fdc9974f3c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -880,7 +880,11 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
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
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 30beae541aca..80fb0b22bf0e 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -33,6 +33,31 @@ struct xe_vm;
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
@@ -58,31 +83,6 @@ struct xe_vma {
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
@@ -112,6 +112,12 @@ struct xe_vma {
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

