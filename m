Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307A6C71135
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 12:30:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCC110E296;
	Fri, 13 Jun 2025 12:30:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E1n9vN1S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A8410E25E
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 12:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749817806; x=1781353806;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J/ot2oEOwV6doZMAFBItnZEzluBwrL2EQjsSj+Wtauo=;
 b=E1n9vN1SH4C79j10p0vQjulXir7BiALVunCNPk3zGTiojVpk9NzOc4le
 3/pYcaTu0eGnhBEO3evoT8kVth3y2dh72RL/FeM3xVFmWIoXhJQgHm8vq
 A8oN6TGdsFhI2dvrzz084N6Qps2Z3uMJ9gVao4PzH72rL8J+jjTwMcf1E
 zClwqwBpZ6rKTDEfGZq1QOZqvOaXDS2iDW6u1wSt9Qgph7lNiw7YZ5jGY
 ZH7pX+LLdvu7NZj2TKdgeSnKN/2uiJuoPMrLsYMAHF4IapRNfmHnQkL5X
 jW4ugRm+d3+zeLW743f7UYi5/vry8yrH5zqyuY+dA6aPFjX75c1I5FYrq w==;
X-CSE-ConnectionGUID: aHHYlMytQxa2bsjrC/t5KQ==
X-CSE-MsgGUID: 56C6j3qbSIChMfymXRiQCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69610149"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="69610149"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 05:30:06 -0700
X-CSE-ConnectionGUID: PwQBkizxRG6E6dXFbmjGaw==
X-CSE-MsgGUID: kkx3ZT31RzSJXQBkUxfDYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="148290277"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa010.fm.intel.com with ESMTP; 13 Jun 2025 05:30:04 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 04/20] drm/xe/vma: Move pat_index to vma attributes
Date: Fri, 13 Jun 2025 18:25:42 +0530
Message-Id: <20250613125558.2607665-5-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
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
 drivers/gpu/drm/xe/xe_vm_types.h | 11 +++++------
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index f39d5cc9f411..9177c571689e 100644
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
index 1af858a98082..9b705526a3e3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1223,7 +1223,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	if (vm->xe->info.has_atomic_enable_pte_bit)
 		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
 
-	vma->pat_index = pat_index;
+	vma->attr.pat_index = pat_index;
 
 	if (bo) {
 		struct drm_gpuvm_bo *vm_bo;
@@ -2673,7 +2673,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			if (op->base.remap.prev) {
 				vma = new_vma(vm, op->base.remap.prev,
-					      old->pat_index, flags);
+					      old->attr.pat_index, flags);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
@@ -2703,7 +2703,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			if (op->base.remap.next) {
 				vma = new_vma(vm, op->base.remap.next,
-					      old->pat_index, flags);
+					      old->attr.pat_index, flags);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index c7663058a7e3..cde2583da303 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -96,6 +96,11 @@ struct xe_vma_mem_attr {
 
 	/** @atomic_access: The atomic access type for the vma */
 	u32 atomic_access;
+
+	/**
+	 * @pat_index: The pat index to use when encoding the PTEs for this vma.
+	 */
+	u16 pat_index;
 };
 
 struct xe_vma {
@@ -146,11 +151,6 @@ struct xe_vma {
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
@@ -162,7 +162,6 @@ struct xe_vma {
 	 * and encoding of the PTEs for this vma.
 	 */
 	struct xe_vma_mem_attr attr;
-
 };
 
 /**
-- 
2.34.1

