Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDB9C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 15:25:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C8E0112203;
	Mon, 11 Mar 2024 15:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N/S93icq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE351112B2C
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 15:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710170744; x=1741706744;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yWHMLJmKKQ2v97IgeW1Cw5qNr4BxahbPZoN4TomcVVk=;
 b=N/S93icqPmwbsdl1/OQmGpF1rfbX4dWzJufFJx/Or/pGwMU3pUpO0lab
 H1eePAJbem3RUCBKI5fS0sN3s6Clr1MHbXXs7JD7dmEqVplpSFyVCEEHQ
 bsfgkHfkd7bG4Zs5+FeBerDeoNBjYDuecUjtgZVYxWh4dv2WD2UQUJts/
 dxmEVbkOVcqHigwwCLYwnbbt71zzXIUEmm/RdlC6mtT43M6zNoI3DHnSa
 Zzw2ohlwXQHEDcbKFoyZ+ARabrfYDF6f091sOmRT/Y+miVJexl7IujgCI
 HLVHUxGZJObrZ6NdL2hBTS/5kdvW8c87kNQJSsaiBojhWk/QgECRJotxs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="8654735"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="8654735"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 08:25:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="42115654"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 08:25:42 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/xe: Remove unused xe_bo->props struct
Date: Mon, 11 Mar 2024 16:11:59 +0100
Message-ID: <20240311151159.10036-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Property struct is not being used so remove it and related dead code.

Fixes: ddfa2d6a846a ("drm/xe/uapi: Kill VM_MADVISE IOCTL")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 59 +++++---------------------------
 drivers/gpu/drm/xe/xe_bo_types.h | 19 ----------
 2 files changed, 9 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index b89ac6db68a1..d7e0deb1b869 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -144,9 +144,6 @@ static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
 			.mem_type = XE_PL_TT,
 		};
 		*c += 1;
-
-		if (bo->props.preferred_mem_type == XE_BO_PROPS_INVALID)
-			bo->props.preferred_mem_type = XE_PL_TT;
 	}
 }
 
@@ -181,25 +178,15 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 	}
 	places[*c] = place;
 	*c += 1;
-
-	if (bo->props.preferred_mem_type == XE_BO_PROPS_INVALID)
-		bo->props.preferred_mem_type = mem_type;
 }
 
 static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
 			 u32 bo_flags, u32 *c)
 {
-	if (bo->props.preferred_gt == XE_GT1) {
-		if (bo_flags & XE_BO_CREATE_VRAM1_BIT)
-			add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM1, c);
-		if (bo_flags & XE_BO_CREATE_VRAM0_BIT)
-			add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM0, c);
-	} else {
-		if (bo_flags & XE_BO_CREATE_VRAM0_BIT)
-			add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM0, c);
-		if (bo_flags & XE_BO_CREATE_VRAM1_BIT)
-			add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM1, c);
-	}
+	if (bo_flags & XE_BO_CREATE_VRAM0_BIT)
+		add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM0, c);
+	if (bo_flags & XE_BO_CREATE_VRAM1_BIT)
+		add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM1, c);
 }
 
 static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
@@ -223,17 +210,8 @@ static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
 {
 	u32 c = 0;
 
-	bo->props.preferred_mem_type = XE_BO_PROPS_INVALID;
-
-	/* The order of placements should indicate preferred location */
-
-	if (bo->props.preferred_mem_class == DRM_XE_MEM_REGION_CLASS_SYSMEM) {
-		try_add_system(xe, bo, bo_flags, &c);
-		try_add_vram(xe, bo, bo_flags, &c);
-	} else {
-		try_add_vram(xe, bo, bo_flags, &c);
-		try_add_system(xe, bo, bo_flags, &c);
-	}
+	try_add_vram(xe, bo, bo_flags, &c);
+	try_add_system(xe, bo, bo_flags, &c);
 	try_add_stolen(xe, bo, bo_flags, &c);
 
 	if (!c)
@@ -1118,13 +1096,6 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
 	}
 }
 
-static bool should_migrate_to_system(struct xe_bo *bo)
-{
-	struct xe_device *xe = xe_bo_device(bo);
-
-	return xe_device_in_fault_mode(xe) && bo->props.cpu_atomic;
-}
-
 static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 {
 	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
@@ -1133,7 +1104,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	struct xe_bo *bo = ttm_to_xe_bo(tbo);
 	bool needs_rpm = bo->flags & XE_BO_CREATE_VRAM_MASK;
 	vm_fault_t ret;
-	int idx, r = 0;
+	int idx;
 
 	if (needs_rpm)
 		xe_device_mem_access_get(xe);
@@ -1145,17 +1116,8 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	if (drm_dev_enter(ddev, &idx)) {
 		trace_xe_bo_cpu_fault(bo);
 
-		if (should_migrate_to_system(bo)) {
-			r = xe_bo_migrate(bo, XE_PL_TT);
-			if (r == -EBUSY || r == -ERESTARTSYS || r == -EINTR)
-				ret = VM_FAULT_NOPAGE;
-			else if (r)
-				ret = VM_FAULT_SIGBUS;
-		}
-		if (!ret)
-			ret = ttm_bo_vm_fault_reserved(vmf,
-						       vmf->vma->vm_page_prot,
-						       TTM_BO_VM_NUM_PREFAULT);
+		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
+					       TTM_BO_VM_NUM_PREFAULT);
 		drm_dev_exit(idx);
 	} else {
 		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
@@ -1283,9 +1245,6 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	bo->flags = flags;
 	bo->cpu_caching = cpu_caching;
 	bo->ttm.base.funcs = &xe_gem_object_funcs;
-	bo->props.preferred_mem_class = XE_BO_PROPS_INVALID;
-	bo->props.preferred_gt = XE_BO_PROPS_INVALID;
-	bo->props.preferred_mem_type = XE_BO_PROPS_INVALID;
 	bo->ttm.priority = XE_BO_PRIORITY_NORMAL;
 	INIT_LIST_HEAD(&bo->pinned_link);
 #ifdef CONFIG_PROC_FS
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 14ef13b7b421..86422e113d39 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -56,25 +56,6 @@ struct xe_bo {
 	 */
 	struct list_head client_link;
 #endif
-	/** @props: BO user controlled properties */
-	struct {
-		/** @preferred_mem: preferred memory class for this BO */
-		s16 preferred_mem_class;
-		/** @prefered_gt: preferred GT for this BO */
-		s16 preferred_gt;
-		/** @preferred_mem_type: preferred memory type */
-		s32 preferred_mem_type;
-		/**
-		 * @cpu_atomic: the CPU expects to do atomics operations to
-		 * this BO
-		 */
-		bool cpu_atomic;
-		/**
-		 * @device_atomic: the device expects to do atomics operations
-		 * to this BO
-		 */
-		bool device_atomic;
-	} props;
 	/** @freed: List node for delayed put. */
 	struct llist_node freed;
 	/** @created: Whether the bo has passed initial creation */
-- 
2.42.0

