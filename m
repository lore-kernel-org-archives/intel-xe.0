Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8750EC36010
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 09:53:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F14710E3FB;
	Mon,  7 Apr 2025 09:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nbho9LPX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1421710E3FA
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 09:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744019598; x=1775555598;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UGX4JQw8WOqu2UpNmo7054xaFkc7xTX0k4FXVmVIMFY=;
 b=Nbho9LPXLAes9tOVh3rZCpZwsXeANzU/lZhLbtRyKng8O0WLTUUy8OJI
 PzDo7MIGKRB2MbW7mADexmwipQaoGxkzjXDADL91qd1otqFHxMfDF72b3
 QRiInzohUR2lntGNQ2Ov4mywN1mgykp77NI4KZJXF431ahSBm+m5FPHfR
 hXTSxtI6XLOdUDKSDmg/OHV/GB9vk/HXp7XI1H6wn1eEEaNF2qcOrzJBH
 oas1DSd4zG24gEZLPZhSgpjn+ZzfFYCQ2/hq/FYmpUvausCS/dWiK1pIC
 DOdZWxIKoz8rzajAfK3j64xzueqLMDIGCtmzkkSFjUQ4T6JQ3hb1+6cvY w==;
X-CSE-ConnectionGUID: cu6dWXS2SMuJkyqW2HuPhg==
X-CSE-MsgGUID: eYZxH+2mTfiiQrEm4xwUtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56029440"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56029440"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 02:53:18 -0700
X-CSE-ConnectionGUID: wIqmJxVWRGOgPKgknc6m1w==
X-CSE-MsgGUID: VwP4tGonR6GqaDBwpMzKKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128778814"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 02:53:16 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 19/32] drm/xe/vma: Move pat_index to vma attributes
Date: Mon,  7 Apr 2025 15:47:06 +0530
Message-Id: <20250407101719.3350996-20-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
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
---
 drivers/gpu/drm/xe/xe_pt.c       |  2 +-
 drivers/gpu/drm/xe/xe_vm.c       |  6 +++---
 drivers/gpu/drm/xe/xe_vm_types.h | 10 ++++------
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 59dc065fae93..2479d830d90a 100644
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
index 1ff9e477e061..59e2a951db25 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1224,7 +1224,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	if (vm->xe->info.has_atomic_enable_pte_bit)
 		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
 
-	vma->pat_index = pat_index;
+	vma->attr.pat_index = pat_index;
 
 	if (bo) {
 		struct drm_gpuvm_bo *vm_bo;
@@ -2657,7 +2657,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			if (op->base.remap.prev) {
 				vma = new_vma(vm, op->base.remap.prev,
-					      old->pat_index, flags);
+					      old->attr.pat_index, flags);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
@@ -2687,7 +2687,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			if (op->base.remap.next) {
 				vma = new_vma(vm, op->base.remap.next,
-					      old->pat_index, flags);
+					      old->attr.pat_index, flags);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 5f5feffecb82..2fcc48d9d776 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -88,6 +88,10 @@ struct xe_vma_mem_attr {
 	} preferred_loc;
 	/** @atomic_access: The atomic access type for the vma */
 	u32 atomic_access;
+	/**
+	 * @pat_index: The pat index to use when encoding the PTEs for this vma.
+	 */
+	u16 pat_index;
 };
 
 struct xe_vma {
@@ -131,11 +135,6 @@ struct xe_vma {
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
@@ -147,7 +146,6 @@ struct xe_vma {
 	 * and encoding of the PTEs for this vma.
 	 */
 	struct xe_vma_mem_attr attr;
-
 };
 
 /**
-- 
2.34.1

