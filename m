Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4A4CA1012
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 07:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC2610E163;
	Thu,  4 Sep 2025 07:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i2RSSPeM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45AB610E163
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 07:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756970360; x=1788506360;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kt6o/F90LzajF4SVHv01s9Ndsr4WUUR9cmza3G+kxco=;
 b=i2RSSPeMWNkn09zRjvhGRUuXtF9sa4c8AY+m3fWyTZywm7wXdbQg42rW
 598XhVENzNqJDPnQPwFlEICYVn5AmEIPEkRhA9DEhb1n8krKDIOpgmrCB
 dtbZPecS2ZFxC35onAhb/wpDBt+4L/va5FsEZNah2uTSNL3EGFoeJqLGK
 QeHhWlw2aSd7xXkoKKY4AvUC5M7r9YxdOhR73y/dhyXBTMeCyyZjEvbQV
 wQZPeORTBMf5hAo0n3diD42lu3LrA8G8t3ZD1kO9Pz7TAsF2usnmcIyi0
 N9+f2H0L+kFKNDfH83TXTjdbA+BTr3EilEwLUBDXl1a7BmZe0PYH6x1y1 w==;
X-CSE-ConnectionGUID: p9MSsDQxTzW1V4NEtPmrOg==
X-CSE-MsgGUID: ZX2O/1WGQEGNSeeLoJHR2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="70672439"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="70672439"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 00:19:20 -0700
X-CSE-ConnectionGUID: 2C5N1kPBSuezo33xESSWtA==
X-CSE-MsgGUID: 2c3Eub5uT86IJJpyKRx2yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="172179378"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by fmviesa008.fm.intel.com with ESMTP; 04 Sep 2025 00:19:18 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>
Subject: [PATCH] drm/xe/uapi: Remove support for PAT memory range attribute
Date: Thu,  4 Sep 2025 13:16:53 +0530
Message-Id: <20250904074653.3943708-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
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

The DRM_XE_MEM_RANGE_ATTR_PAT attribute and its associated struct fields
have been removed from drm_xe_madvise. This simplifies the memory range
attribute handling by eliminating unused support.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 37 ------------------------------
 include/uapi/drm/xe_drm.h          | 18 ---------------
 2 files changed, 55 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 732577dfe519..7c80baabc6af 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -9,7 +9,6 @@
 #include <drm/xe_drm.h>
 
 #include "xe_bo.h"
-#include "xe_pat.h"
 #include "xe_pt.h"
 #include "xe_svm.h"
 
@@ -145,24 +144,6 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
 	}
 }
 
-static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
-			      struct xe_vma **vmas, int num_vmas,
-			      struct drm_xe_madvise *op)
-{
-	int i;
-
-	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_PAT);
-
-	for (i = 0; i < num_vmas; i++) {
-		if (vmas[i]->attr.pat_index == op->pat_index.val) {
-			vmas[i]->skip_invalidation = true;
-		} else {
-			vmas[i]->skip_invalidation = false;
-			vmas[i]->attr.pat_index = op->pat_index.val;
-		}
-	}
-}
-
 typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
 			     struct xe_vma **vmas, int num_vmas,
 			     struct drm_xe_madvise *op);
@@ -170,7 +151,6 @@ typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
 static const madvise_func madvise_funcs[] = {
 	[DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC] = madvise_preferred_mem_loc,
 	[DRM_XE_MEM_RANGE_ATTR_ATOMIC] = madvise_atomic,
-	[DRM_XE_MEM_RANGE_ATTR_PAT] = madvise_pat_index,
 };
 
 static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
@@ -271,23 +251,6 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
 			return false;
 
 		break;
-	case DRM_XE_MEM_RANGE_ATTR_PAT:
-	{
-		u16 coh_mode = xe_pat_index_get_coh_mode(xe, args->pat_index.val);
-
-		if (XE_IOCTL_DBG(xe, !coh_mode))
-			return false;
-
-		if (XE_WARN_ON(coh_mode > XE_COH_AT_LEAST_1WAY))
-			return false;
-
-		if (XE_IOCTL_DBG(xe, args->pat_index.pad))
-			return false;
-
-		if (XE_IOCTL_DBG(xe, args->pat_index.reserved))
-			return false;
-		break;
-	}
 	default:
 		if (XE_IOCTL_DBG(xe, 1))
 			return false;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 40ff19f52a8d..a3fbfe2488f8 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -2031,7 +2031,6 @@ struct drm_xe_madvise {
 
 #define DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC	0
 #define DRM_XE_MEM_RANGE_ATTR_ATOMIC		1
-#define DRM_XE_MEM_RANGE_ATTR_PAT		2
 	/** @type: type of attribute */
 	__u32 type;
 
@@ -2094,24 +2093,7 @@ struct drm_xe_madvise {
 			/** @atomic.reserved: Reserved */
 			__u64 reserved;
 		} atomic;
-
-		/**
-		 * @pat_index: Page attribute table index
-		 *
-		 * Used when @type == DRM_XE_MEM_RANGE_ATTR_PAT.
-		 */
-		struct {
-			/** @pat_index.val: PAT index value */
-			__u32 val;
-
-			/** @pat_index.pad: MBZ */
-			__u32 pad;
-
-			/** @pat_index.reserved: Reserved */
-			__u64 reserved;
-		} pat_index;
 	};
-
 	/** @reserved: Reserved */
 	__u64 reserved[2];
 };
-- 
2.34.1

