Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE80CA0FE2
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 17:03:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F4110E38D;
	Thu, 21 Aug 2025 17:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iC7kpBxj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B17F10E2A4
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 17:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755795834; x=1787331834;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7BFkDE/P6x2kQsq2dxXK9GDn8TtTg4IW7hXANCp4u+0=;
 b=iC7kpBxjBOMEITdhF8KDdRadBLmbVfch4PtDVS8YRGYyha4LBA76HW4W
 JZrtF4GomGmD5AHKhNX/4cVKyp0k8utlxu8tVdpMlsNqdghhuPWlpky2h
 pPTdzV7b96om+JFibjAcckHSvLAN29F00crBX2vCSO1k3t72k3gEKhc/e
 PM9dYLll4nWkcrxSlJjH/okTJy+TyCzd0EUkqE7XwEoVFOh+b6vBJnooE
 SoMterdv+zBFSQEegpsOZEqzbJMBPdjgPz0nkWsu+sbQPMe/u4rFKkQOF
 /YyRigPn4GVi9Kd2jOxSCOrfdjdm/BIXpFDJOh3J6U1UIWQTasUPjl6+r A==;
X-CSE-ConnectionGUID: ZZw9GVbcRqKHXvJSRpeNhg==
X-CSE-MsgGUID: 8otIpMhEST+4DWjiz4YVvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57805829"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="57805829"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 10:03:51 -0700
X-CSE-ConnectionGUID: APMQI7W1TJi++Ua16SLwlw==
X-CSE-MsgGUID: uKN3B4bTS7yFL068fmHaZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="192143717"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 21 Aug 2025 10:03:49 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v9 03/20] drm/xe/vma: Move pat_index to vma attributes
Date: Thu, 21 Aug 2025 23:00:47 +0530
Message-Id: <20250821173104.3030148-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250821173104.3030148-1-himal.prasad.ghimiray@intel.com>
References: <20250821173104.3030148-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
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

The PAT index determines how PTEs are encoded and can be modified by
madvise. Therefore, it is now part of the vma attributes.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       |  2 +-
 drivers/gpu/drm/xe/xe_vm.c       |  6 +++---
 drivers/gpu/drm/xe/xe_vm_types.h | 10 +++++-----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index f3a39e734a90..ba7a50bf3a2d 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -518,7 +518,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 {
 	struct xe_pt_stage_bind_walk *xe_walk =
 		container_of(walk, typeof(*xe_walk), base);
-	u16 pat_index = xe_walk->vma->pat_index;
+	u16 pat_index = xe_walk->vma->attr.pat_index;
 	struct xe_pt *xe_parent = container_of(parent, typeof(*xe_parent), base);
 	struct xe_vm *vm = xe_walk->vm;
 	struct xe_pt *xe_child;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f35d69c0b4c6..d7f829fba49c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1223,7 +1223,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	if (vm->xe->info.has_atomic_enable_pte_bit)
 		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
 
-	vma->pat_index = pat_index;
+	vma->attr.pat_index = pat_index;
 
 	if (bo) {
 		struct drm_gpuvm_bo *vm_bo;
@@ -2700,7 +2700,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			if (op->base.remap.prev) {
 				vma = new_vma(vm, op->base.remap.prev,
-					      old->pat_index, flags);
+					      old->attr.pat_index, flags);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
@@ -2730,7 +2730,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			if (op->base.remap.next) {
 				vma = new_vma(vm, op->base.remap.next,
-					      old->pat_index, flags);
+					      old->attr.pat_index, flags);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 8e8138c2b80a..c7b2bfa0a0d1 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -102,6 +102,11 @@ struct xe_vma_mem_attr {
 	 * values. These are defined in uapi/drm/xe_drm.h.
 	 */
 	u32 atomic_access;
+
+	/**
+	 * @pat_index: The pat index to use when encoding the PTEs for this vma.
+	 */
+	u16 pat_index;
 };
 
 struct xe_vma {
@@ -152,11 +157,6 @@ struct xe_vma {
 	/** @tile_staged: bind is staged for this VMA */
 	u8 tile_staged;
 
-	/**
-	 * @pat_index: The pat index to use when encoding the PTEs for this vma.
-	 */
-	u16 pat_index;
-
 	/**
 	 * @ufence: The user fence that was provided with MAP.
 	 * Needs to be signalled before UNMAP can be processed.
-- 
2.34.1

