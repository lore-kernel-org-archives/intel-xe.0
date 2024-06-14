Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3815C2BB9A
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 21:47:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C21610E2C5;
	Fri, 14 Jun 2024 21:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IoJEdd5O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7165710E2BD
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 21:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718401651; x=1749937651;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=venrHm8PyOaztmUEh411MgPERF93cLmU+7z2NZOMMF4=;
 b=IoJEdd5OqFPFRc67LM4lmpgpdcY6Fqjtuuv6dXD03lNGcaIyuGWSqrXP
 Dr6b1bh4BISx4VUDDMSgaVZdrfinrqhKY927ys/rs1tJXT9TnWN4RhpZE
 ijQUbj4saegoUQ+Bz8KyuJk8LZIwgzumJNLlRu6IgY3Vum7RfQA0UWxEj
 VbVyefnTej5PBETp8jnbT6n3+d0dqAnIeuRpJzZAdYMKQNIo6moq3F2Hn
 9E90abhtrer+f6S+F0zm809yTTgUuPVVhRoV2LN7O6Q8eMJyQM+3Mf42M
 xFwJlTyL5o79Iay5n4WtQmRZAZXYfDfEKCvf+nL2oqF2oCtxfdQJoO+Zi w==;
X-CSE-ConnectionGUID: 6ZZb0bh2RFS3Ux16JdePiQ==
X-CSE-MsgGUID: ZuQOR4wYTpK7ajg189ZAng==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="25886563"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="25886563"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:27 -0700
X-CSE-ConnectionGUID: aT90D/dFRxayFmmLhekvbw==
X-CSE-MsgGUID: C00n1Fq3RxiwjeM/0a3R9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="45572401"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:27 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 09/44] drm/svm: Mark drm_gpuvm to participate SVM
Date: Fri, 14 Jun 2024 17:57:42 -0400
Message-Id: <20240614215817.1097633-9-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240614215817.1097633-1-oak.zeng@intel.com>
References: <20240614215817.1097633-1-oak.zeng@intel.com>
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
index ffda487653d8..bcb0a38b31ae 100644
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

