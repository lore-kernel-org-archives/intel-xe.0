Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD7CC48BC3
	for <intel-xe@archiver.kernel.org>; Mon, 19 Feb 2024 21:15:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62A410E0C4;
	Mon, 19 Feb 2024 21:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JXQMXIdh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B77210E088
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Feb 2024 21:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708377337; x=1739913337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bisk4pIS9G8zieTm3O5nhGIBDGHWtnzsi+gHzmskASY=;
 b=JXQMXIdhF0qc4Ucq2i4fP+GijTf3o9TSMGCBA6tX60OdeevSp5qwjmsS
 eu2atQVM0gjr3AgcNhdGhEbZ3prRV3wPyJ2F+UcZiYVqDknPgtPNACpUi
 sUSAgXnSd0dWAcgSMi/LrAz1D7oGTsv2rBkjKZ6k2DRZ+16VTND/Xu6lO
 5V23tY26cbGOwHS1iJcvhnPGiMa+T+Egy+34UmSc/VQxZB1iZ7oNCzRtA
 4FNonORdFcn/kYFQXByuitcePoVrUSb1l4OlznFBNsPdFYJfE6ONe1t+8
 p1CLUGWxhv19EvayznDo+Lf7BDw1qVFcagI1wh3sg8w67tS5OQ2hp3+WZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2610040"
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="2610040"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 13:15:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="9218677"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 13:15:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/3] drm/xe: Add XE_VMA_PTE_64K VMA flag
Date: Mon, 19 Feb 2024 13:16:15 -0800
Message-Id: <20240219211616.3633630-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219211616.3633630-1-matthew.brost@intel.com>
References: <20240219211616.3633630-1-matthew.brost@intel.com>
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

Add XE_VMA_PTE_64K VMA flag to ensure skipping rebinds does not cross
64k page boundaries.

Fixes: 8f33b4f054fc ("drm/xe: Avoid doing rebinds")
Fixes: c47794bdd63d ("drm/xe: Set max pte size when skipping rebinds")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       | 6 ++++--
 drivers/gpu/drm/xe/xe_vm.c       | 5 +++++
 drivers/gpu/drm/xe/xe_vm_types.h | 1 +
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 1e35c7525447..46cea37bdac5 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -499,10 +499,12 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 		 * this device *requires* 64K PTE size for VRAM, fail.
 		 */
 		if (level == 0 && !xe_parent->is_compact) {
-			if (xe_pt_is_pte_ps64K(addr, next, xe_walk))
+			if (xe_pt_is_pte_ps64K(addr, next, xe_walk)) {
+				xe_walk->vma->gpuva.flags |= XE_VMA_PTE_64K;
 				pte |= XE_PTE_PS64;
-			else if (XE_WARN_ON(xe_walk->needs_64K))
+			} else if (XE_WARN_ON(xe_walk->needs_64K)) {
 				return -EINVAL;
+			}
 		}
 
 		ret = xe_pt_insert_entry(xe_walk, xe_parent, offset, NULL, pte);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2b0c76c663e5..7781290d2b99 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2192,6 +2192,8 @@ static u64 xe_vma_max_pte_size(struct xe_vma *vma)
 		return SZ_1G;
 	else if (vma->gpuva.flags & XE_VMA_PTE_2M)
 		return SZ_2M;
+	else if (vma->gpuva.flags & XE_VMA_PTE_64K)
+		return SZ_64K;
 	else if (vma->gpuva.flags & XE_VMA_PTE_4K)
 		return SZ_4K;
 
@@ -2207,6 +2209,9 @@ static void xe_vma_set_pte_size(struct xe_vma *vma, u64 size)
 	case SZ_2M:
 		vma->gpuva.flags |= XE_VMA_PTE_2M;
 		break;
+	case SZ_64K:
+		vma->gpuva.flags |= XE_VMA_PTE_64K;
+		break;
 	case SZ_4K:
 		vma->gpuva.flags |= XE_VMA_PTE_4K;
 		break;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 5ac9c5bebabc..91800ce70845 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -29,6 +29,7 @@ struct xe_vm;
 #define XE_VMA_PTE_4K		(DRM_GPUVA_USERBITS << 5)
 #define XE_VMA_PTE_2M		(DRM_GPUVA_USERBITS << 6)
 #define XE_VMA_PTE_1G		(DRM_GPUVA_USERBITS << 7)
+#define XE_VMA_PTE_64K		(DRM_GPUVA_USERBITS << 8)
 
 /** struct xe_userptr - User pointer */
 struct xe_userptr {
-- 
2.34.1

