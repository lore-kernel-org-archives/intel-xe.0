Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E825CA0EDC
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 10:33:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F7510E849;
	Thu, 14 Aug 2025 10:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nY8UELCL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA2B10E849
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 10:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755167590; x=1786703590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gh6pYXa3kQHrr0HDCd8d2s80l1fKF2XaDZvZsG52G9g=;
 b=nY8UELCLbAQKbnFP2FsB0PRPIIIQQr8EIOBhxSIGs0CuzHVqb2MeA/lq
 IEP6OZarwP0vHQq7F6X+tU5bscE5EP58YXpMyl4WJDLB/Jo1gg2S90gIP
 Y0yChlEQaKxxO6Segr8GGlRQxdh9StjdEbVt1uKzrQygXWjhHEH382ps1
 KxmV35Lf5Or1ki4hBNTGVbCikeQkMxzFdg0znk0/A56oVRdAA+m0C8eXU
 K1Q6kfodxPSkgPg+VYdMXfwnK1xEwQH1JD2Va44KL3R4LiG7EKl2B+l1c
 G9rqXXvgD94S5WL/S5fCNlQDD/bfnaAVMPgiLYbsHPRgg5s4DEHvToWmH g==;
X-CSE-ConnectionGUID: hIIvLynkRUulVT6Vgkk7tA==
X-CSE-MsgGUID: RqmT4TLwTo+GW+0r5auRDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68083780"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="68083780"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 03:33:10 -0700
X-CSE-ConnectionGUID: OzE5bGNoTGioGrswSi3gXQ==
X-CSE-MsgGUID: B8HwCgm0Ssq7mHiYgeYSNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="197579401"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 14 Aug 2025 03:33:09 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v7 15/24] drm/xe/svm: Support DRM_XE_SVM_MEM_RANGE_ATTR_PAT
 memory attribute
Date: Thu, 14 Aug 2025 16:29:41 +0530
Message-Id: <20250814105950.2177480-16-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814105950.2177480-1-himal.prasad.ghimiray@intel.com>
References: <20250814105950.2177480-1-himal.prasad.ghimiray@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index b5fc1eedf095..3bd52063f9c2 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -9,6 +9,7 @@
 #include <drm/xe_drm.h>
 
 #include "xe_bo.h"
+#include "xe_pat.h"
 #include "xe_pt.h"
 #include "xe_svm.h"
 
@@ -121,7 +122,12 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
 			      struct xe_vma **vmas, int num_vmas,
 			      struct drm_xe_madvise *op)
 {
-	/* Implementation pending */
+	int i;
+
+	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_PAT);
+
+	for (i = 0; i < num_vmas; i++)
+		vmas[i]->attr.pat_index = op->pat_index.val;
 }
 
 typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
@@ -229,8 +235,22 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
 
 		break;
 	case DRM_XE_MEM_RANGE_ATTR_PAT:
-		/*TODO: Add valid pat check */
+	{
+		u16 coh_mode = xe_pat_index_get_coh_mode(xe, args->pat_index.val);
+
+		if (XE_IOCTL_DBG(xe, !coh_mode))
+			return false;
+
+		if (XE_WARN_ON(coh_mode > XE_COH_AT_LEAST_1WAY))
+			return false;
+
+		if (XE_IOCTL_DBG(xe, args->pat_index.pad))
+			return false;
+
+		if (XE_IOCTL_DBG(xe, args->pat_index.reserved))
+			return false;
 		break;
+	}
 	default:
 		if (XE_IOCTL_DBG(xe, 1))
 			return false;
-- 
2.34.1

