Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30CCCD1296
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 13:09:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78AD7112592;
	Mon,  8 Apr 2024 13:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Q5CPyhyR";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C0B112592
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 13:09:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BF8D561208;
 Mon,  8 Apr 2024 13:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D345C433F1;
 Mon,  8 Apr 2024 13:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1712581773;
 bh=mN/7eVPKnNP5nlhRT6fAB7m1zWiRmxxEHpqAJV5LIhY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q5CPyhyRXWToNyYL4lKU6k+rrAQo7tThKm61hoVxZAsYESTnc8BZOnvQpupwpN8Cy
 SQ1D3rKfEc2yjeiLll3s53IxUF2fjSz1l1NTToMdzPMjmWabWWEOaUxJvwfqmnlwty
 dH4xWZoS/Jqj2kLy0Et3Fzvd7+JAhYcKvDfqYaeY=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.8 019/273] drm/xe: Remove unused xe_bo->props struct
Date: Mon,  8 Apr 2024 14:54:54 +0200
Message-ID: <20240408125309.891281897@linuxfoundation.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240408125309.280181634@linuxfoundation.org>
References: <20240408125309.280181634@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
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

6.8-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Nirmoy Das <nirmoy.das@intel.com>

[ Upstream commit fd00fe8cdbb241644131ece133a2eb1c3951f21e ]

Property struct is not being used so remove it and related dead code.

Fixes: ddfa2d6a846a ("drm/xe/uapi: Kill VM_MADVISE IOCTL")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240311151159.10036-1-nirmoy.das@intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
(cherry picked from commit 002d8f0b4f76aabbf8e00c538a124b91625d7260)
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_bo.c       | 59 +++++---------------------------
 drivers/gpu/drm/xe/xe_bo_types.h | 19 ----------
 2 files changed, 9 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4d3b80ec906d0..eb2c44a328278 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -140,9 +140,6 @@ static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
 			.mem_type = XE_PL_TT,
 		};
 		*c += 1;
-
-		if (bo->props.preferred_mem_type == XE_BO_PROPS_INVALID)
-			bo->props.preferred_mem_type = XE_PL_TT;
 	}
 }
 
@@ -177,25 +174,15 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
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
@@ -219,17 +206,8 @@ static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
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
@@ -1106,19 +1084,12 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
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
 	struct drm_device *ddev = tbo->base.dev;
 	vm_fault_t ret;
-	int idx, r = 0;
+	int idx;
 
 	ret = ttm_bo_vm_reserve(tbo, vmf);
 	if (ret)
@@ -1129,17 +1100,8 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 
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
@@ -1253,9 +1215,6 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
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
index 64c2249a4e407..81dca15315d5c 100644
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
2.43.0



