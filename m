Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4F9C04A6A
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 04:11:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFDA10E555;
	Thu, 20 Jul 2023 04:11:08 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B334D10E553
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 04:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689826264; x=1721362264;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iOZ1fAQ5RJ9fLseB4Ee+VACqq9C3A2QFOKTe7giGfiI=;
 b=AtQqSlURx5PMKTbmRHplG8dK5ub9zONKwPhxKhkpl2P+HmTapyTS+77a
 fUJtb+VsN07VD+lA9o5YchJja45W50VQ6b19JggUqOkvNnYOboEeoSWtC
 xc9boG9nh7k4Rv0nUrXkI6kLfPNIsvr52CyhQYXZCkBr0pqsLzKkDb04x
 k/WY7EE1E8cPH7AF9sbo2z6EAVMuSb832fRrzUGuT+L7io067ChU2JlEG
 XqUkJp8ZZXW5cu/RL73pAdKJtO8LOUyOFJcEgUMqjeg4K50Y73KMb3EvB
 Ee+aVmnC85Ag6ihPFzarCQxZviMJS+MmbvRuniGvdAhXb1vvFuaEOlVuN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="397500424"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="397500424"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 21:11:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="753924810"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="753924810"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 21:11:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 19 Jul 2023 21:10:57 -0700
Message-Id: <20230720041057.112903-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720041057.112903-1-matthew.brost@intel.com>
References: <20230720041057.112903-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 6/6] drm/xe: Only alloc userptr part of xe_vma
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
 drivers/gpu/drm/xe/xe_vm.c       |  6 +++-
 drivers/gpu/drm/xe/xe_vm_types.h | 56 ++++++++++++++++++--------------
 2 files changed, 36 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 92d97d347a44..766830d21e01 100644
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
index 809cfe734d43..621cf13d0a7d 100644
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
@@ -67,31 +92,6 @@ struct xe_vma {
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
@@ -121,6 +121,12 @@ struct xe_vma {
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

