Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889F0C27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 04:14:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201BD10E17A;
	Thu, 13 Jun 2024 04:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jvZpir+O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC95410E0E3
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 04:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718252028; x=1749788028;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=kAR/rZXQtDK44SKrq3NBFPwI6ghIJjnPv/F32bVH6PM=;
 b=jvZpir+OSR2hpIQBxdBEu6lFJGObLuOhEsMQ23ZJMuZgSnjLdMQJ7U6c
 7+j2IhWOA/7xLTifTziKvxbI50MaueCMDZXdnJc1GEvXPzGrGEAmtmWtK
 ZnClVaAkH/+b7pSdeXnyQjMXLi4YDpO4gkFVRJDR62dUhR5zkw1ClH/8I
 sAN0gI9q67RFCVlj6n5rht02/8hwYyTba9dbSE/MAgmNxn9G+APArQroI
 0yvVZQzN80rKWCwD1cj4docQEjLbcPyMHZtRynGh0H68oLbB9M/oy6hs+
 IDfkgeMzGltaSklBvlX7/ZqILH7GE89hh8iDn4XlenN6a/B1vcdaMd1/C w==;
X-CSE-ConnectionGUID: DhNwILGZQZyJODMmjjMfww==
X-CSE-MsgGUID: Ozcf2NB4RUeNhjXYomljuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14847957"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14847957"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:47 -0700
X-CSE-ConnectionGUID: WCoOPT6ARfGLV3fHUSzeQA==
X-CSE-MsgGUID: m0pnjOR6S16Ij8pJn9Q1Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40476324"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:47 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 08/42] drm/svm: Mark drm_gpuvm to participate SVM
Date: Thu, 13 Jun 2024 00:23:55 -0400
Message-Id: <20240613042429.637281-8-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240613042429.637281-1-oak.zeng@intel.com>
References: <20240613042429.637281-1-oak.zeng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

A mm_struct field is added to drm_gpuvm. Also add a parameter to
drm_gpuvm_init to say whether this gpuvm participate svm (shared
virtual memory with CPU process). Under SVM, CPU program and GPU
program share one process virtual address space.

Cc: Dave Airlie <airlied@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Felix Kuehling <felix.kuehling@amd.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/drm_gpuvm.c            | 7 ++++++-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 2 +-
 drivers/gpu/drm/xe/xe_vm.c             | 2 +-
 include/drm/drm_gpuvm.h                | 8 +++++++-
 4 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 7402ed6f1d33..5f246ca472a8 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -984,6 +984,8 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_resv_object_alloc);
  * @reserve_offset: the start of the kernel reserved GPU VA area
  * @reserve_range: the size of the kernel reserved GPU VA area
  * @ops: &drm_gpuvm_ops called on &drm_gpuvm_sm_map / &drm_gpuvm_sm_unmap
+ * @participate_svm: whether this gpuvm participat shared virtual memory
+ * with CPU mm
  *
  * The &drm_gpuvm must be initialized with this function before use.
  *
@@ -997,7 +999,7 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 	       struct drm_gem_object *r_obj,
 	       u64 start_offset, u64 range,
 	       u64 reserve_offset, u64 reserve_range,
-	       const struct drm_gpuvm_ops *ops)
+	       const struct drm_gpuvm_ops *ops, bool participate_svm)
 {
 	gpuvm->rb.tree = RB_ROOT_CACHED;
 	INIT_LIST_HEAD(&gpuvm->rb.list);
@@ -1016,6 +1018,9 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 	gpuvm->drm = drm;
 	gpuvm->r_obj = r_obj;
 
+	if (participate_svm)
+		gpuvm->mm = current->mm;
+
 	drm_gem_object_get(r_obj);
 
 	drm_gpuvm_warn_check_overflow(gpuvm, start_offset, range);
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index ee02cd833c5e..0d11f1733e29 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1861,7 +1861,7 @@ nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
 		       NOUVEAU_VA_SPACE_END,
 		       init->kernel_managed_addr,
 		       init->kernel_managed_size,
-		       &gpuvm_ops);
+		       &gpuvm_ops, false);
 	/* GPUVM takes care from here on. */
 	drm_gem_object_put(r_obj);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 99bf7412475c..14069fc9d820 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1363,7 +1363,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	}
 
 	drm_gpuvm_init(&vm->gpuvm, "Xe VM", DRM_GPUVM_RESV_PROTECTED, &xe->drm,
-		       vm_resv_obj, 0, vm->size, 0, 0, &gpuvm_ops);
+		       vm_resv_obj, 0, vm->size, 0, 0, &gpuvm_ops, false);
 
 	drm_gem_object_put(vm_resv_obj);
 
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 429dc0d82eba..838dd7137f07 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -242,6 +242,12 @@ struct drm_gpuvm {
 	 * @drm: the &drm_device this VM lives in
 	 */
 	struct drm_device *drm;
+	/**
+	 * @mm: the process &mm_struct which create this gpuvm.
+	 * This is only used for shared virtual memory where virtual
+	 * address space is shared b/t CPU and GPU program.
+	 */
+	struct mm_struct *mm;
 
 	/**
 	 * @mm_start: start of the VA space
@@ -342,7 +348,7 @@ void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 		    struct drm_gem_object *r_obj,
 		    u64 start_offset, u64 range,
 		    u64 reserve_offset, u64 reserve_range,
-		    const struct drm_gpuvm_ops *ops);
+		    const struct drm_gpuvm_ops *ops, bool participate_svm);
 
 /**
  * drm_gpuvm_get() - acquire a struct drm_gpuvm reference
-- 
2.26.3

