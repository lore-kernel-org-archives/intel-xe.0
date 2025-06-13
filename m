Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A4BC71135
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 12:30:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1447310E1F7;
	Fri, 13 Jun 2025 12:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mnn/9QGX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4149110E29D
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 12:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749817823; x=1781353823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DVeaA2vwNgqndocuC1ZysfcnmPisrOdQNxn692rU73c=;
 b=mnn/9QGXtzySA5f11V/FM/31E47zqheRhxWBHhL83TChMa9hqVsm7jKy
 R7q0jEIKGyiZb1ABsrLwIxqjGXyiLtkksCRMG4VZUMcJULbiCTSmiv2kT
 eMnNiecDO3F9GNDRFNNt//Zm6r27lGoL7POX62Ly8JWlqQ16Jv/XuR0+N
 y+QtidWLPmD9tPsSGPx8aJQ39RGrmJFuk4tvQIEgu2KYiCNxiWwYfyDCx
 jIUfVYv0dBDGEBrlsFeKG8zYZggpZvEyWy/ylTrw48eWtHb1vODpJQpjx
 UHG2ng3YSY7xTLUfgKDdZpIpH/TOqpqI4le94d2GaPsdcwRNWCsaK6gyO w==;
X-CSE-ConnectionGUID: R6sVSjoyS2qaWrehYEGP4w==
X-CSE-MsgGUID: laXGYgqkROiuHUx5u7ZRIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69610179"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="69610179"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 05:30:23 -0700
X-CSE-ConnectionGUID: PE8bjsBDREuBpSzNSeUB6g==
X-CSE-MsgGUID: rK1wNHoFQWqtXB/TH2YsbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="148290353"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa010.fm.intel.com with ESMTP; 13 Jun 2025 05:30:22 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 14/20] drm/xe/svm: Support DRM_XE_SVM_ATTR_PAT memory
 attribute
Date: Fri, 13 Jun 2025 18:25:52 +0530
Message-Id: <20250613125558.2607665-15-himal.prasad.ghimiray@intel.com>
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

This attributes sets the pat_index for the svm used vma range, which is
utilized to ascertain the coherence.

v2 (Matthew Brost)
- Pat index sanity check

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 64352fbebd25..973627edb23c 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -11,6 +11,7 @@
 
 #include "xe_bo.h"
 #include "xe_gt_tlb_invalidation.h"
+#include "xe_pat.h"
 #include "xe_pt.h"
 #include "xe_svm.h"
 
@@ -115,7 +116,13 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
 			      struct xe_vma **vmas, int num_vmas,
 			      struct drm_xe_madvise *op)
 {
-	/* Implementation pending */
+	int i;
+
+	xe_assert(vm->xe, op->type == DRM_XE_VMA_ATTR_PAT);
+
+	for (i = 0; i < num_vmas; i++)
+		vmas[i]->attr.pat_index = op->pat_index.val;
+
 }
 
 typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
@@ -195,7 +202,13 @@ static int drm_xe_madvise_args_are_sane(struct xe_device *xe, const struct drm_x
 			return -EINVAL;
 		break;
 	case DRM_XE_VMA_ATTR_PAT:
-		/*TODO: Add valid pat check */
+		u16 coh_mode = xe_pat_index_get_coh_mode(xe, args->pat_index.val);
+
+		if (XE_IOCTL_DBG(xe, !coh_mode))
+			return -EINVAL;
+
+		if (XE_WARN_ON(coh_mode > XE_COH_AT_LEAST_1WAY))
+			return -EINVAL;
 		break;
 	case DRM_XE_VMA_ATTR_PREFERRED_LOC:
 		s32 fd = (s32)args->preferred_mem_loc.devmem_fd;
-- 
2.34.1

