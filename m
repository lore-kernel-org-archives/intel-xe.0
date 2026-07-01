Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2C4C43327
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 16:33:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7322010F064;
	Wed,  1 Jul 2026 16:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IzA2sFxH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2954310F064
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Jul 2026 16:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782923603; x=1814459603;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pQUjeVk7dLora7Dqrt1Cz7lMN/9VvPqJCsA1+3ad4qc=;
 b=IzA2sFxH12l/Uz1HXOtJEUdEG7OumyS5wVnsnIsAR6jhDuzi2zpxa97E
 O8zkiRTBtwcmJSV8kgHVKOVzUXDMk1JdxolP6CVLL6V/bVuLY3EopkebX
 /I8wVJXnz4MsW34WlXPViOPLyAGLMnplPjI18rZQ12FqT7uhDxKUHTReC
 9areV88amGuP8NBdFO1fvFE/gFEVdha0E8sLcW84PUgHDnAF5oFePRGaw
 kcQL0dY0eZyotyvuYoPLqPGC1nQvSAgUKi4pZlEtLUdbXRYDboxV699Nz
 kkVc7juEVL85hzmo0PAfACTOzoERPesKMqwUM8K3pLc3zIs8V3lJFU2ir w==;
X-CSE-ConnectionGUID: LSIV44cSTr2SBYVmzJ6MJg==
X-CSE-MsgGUID: ow935wYfSmW85v3IqA23XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82779258"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="82779258"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 09:33:23 -0700
X-CSE-ConnectionGUID: 5Ykt93nBS2a6M6cCI32l6A==
X-CSE-MsgGUID: V+UkKAL+R0CEeJZveuzebw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="256196455"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa003.jf.intel.com with ESMTP; 01 Jul 2026 09:33:21 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v2 7/8] drm/xe/vm: validate large-page user BO bind alignment
Date: Wed,  1 Jul 2026 22:03:47 +0530
Message-ID: <20260701163348.3432358-8-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701163348.3432358-1-naresh.kumar.g@intel.com>
References: <20260701163348.3432358-1-naresh.kumar.g@intel.com>
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

Add VM bind validation for BOs that request 64K, 2M, or 1G pages.

When a BO is created with XE_BO_FLAG_NEEDS_64K, XE_BO_FLAG_NEEDS_2M,
or XE_BO_FLAG_NEEDS_1G, require the bind offset, virtual address, and
range to be aligned to the requested page size for map operations.
Skip these checks for unmap and unmap-all.

Also allow the corresponding VMA page table flags in the user-visible
VMA flag mask.

This prevents invalid bind requests for large-page BOs from reaching
later VM setup paths.

v2:(sashiko)
- add 64K alignment validation alongside 2M and 1G
  for user bindpaths
- keep large-page alignment checks skipped for
  UNMAP and UNMAP_ALL
- refine commit message wordings

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 50ca29a79533..3fc5f1db93d0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -721,7 +721,10 @@ static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask,
 	XE_VMA_DUMPABLE |		    \
 	XE_VMA_SYSTEM_ALLOCATOR |           \
 	DRM_GPUVA_SPARSE |		    \
-	XE_VMA_MADV_AUTORESET)
+	XE_VMA_MADV_AUTORESET |		    \
+	XE_VMA_PTE_64K |		    \
+	XE_VMA_PTE_2M  |		    \
+	XE_VMA_PTE_1G)
 
 static void xe_vm_populate_rebind(struct xe_vma_op *op, struct xe_vma *vma,
 				  u8 tile_mask)
@@ -3835,6 +3838,36 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 		}
 	}
 
+	if (bo->flags & XE_BO_FLAG_NEEDS_64K &&
+	    (op != DRM_XE_VM_BIND_OP_UNMAP &&
+	     op != DRM_XE_VM_BIND_OP_UNMAP_ALL)) {
+		if (XE_IOCTL_DBG(xe, obj_offset & (SZ_64K - 1)) ||
+		    XE_IOCTL_DBG(xe, addr & (SZ_64K - 1)) ||
+		    XE_IOCTL_DBG(xe, range & (SZ_64K - 1))) {
+			return -EINVAL;
+		}
+	}
+
+	if (bo->flags & XE_BO_FLAG_NEEDS_2M &&
+	    (op != DRM_XE_VM_BIND_OP_UNMAP &&
+	     op != DRM_XE_VM_BIND_OP_UNMAP_ALL)) {
+		if (XE_IOCTL_DBG(xe, obj_offset & (SZ_2M - 1)) ||
+		    XE_IOCTL_DBG(xe, addr & (SZ_2M - 1)) ||
+		    XE_IOCTL_DBG(xe, range & (SZ_2M - 1))) {
+			return -EINVAL;
+		}
+	}
+
+	if (bo->flags & XE_BO_FLAG_NEEDS_1G &&
+	    (op != DRM_XE_VM_BIND_OP_UNMAP &&
+	     op != DRM_XE_VM_BIND_OP_UNMAP_ALL)) {
+		if (XE_IOCTL_DBG(xe, obj_offset & (SZ_1G - 1)) ||
+		    XE_IOCTL_DBG(xe, addr & (SZ_1G - 1)) ||
+		    XE_IOCTL_DBG(xe, range & (SZ_1G - 1))) {
+			return -EINVAL;
+		}
+	}
+
 	coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
 	if (bo->cpu_caching) {
 		if (XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
-- 
2.43.0

