Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B4DC83F27
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 13:09:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F5A10E690;
	Tue, 22 Jul 2025 13:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XBqRgBN4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C1110E694
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 13:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753189746; x=1784725746;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QGVRIXOYgbRAkdrjofD/GR75WsYbikMMJoFbMpy1g8E=;
 b=XBqRgBN4BscuQ+Whk6FGNoxSuqqhw4DLD5Q/njenANeBk83BNLcEQRCu
 L1zxZ1+obFJ9ol4RzhiU8MHBe5EipBKnzlZ62uK2WqqiheWj3mXFNqO69
 Qw59Te4a0tHDk2Omm6r+XCqlw27tG0APvWa1e9R5Nx2av+eMRCgIBOR/c
 JG5QTtykhx78mCUYFLe9m6dO5fHOlgLxhQMNIC44AJXiOADyubmiDHhOl
 QZzCjAheSdxKljuttw4zMXhC2Wlqxw0C/uQH2NR8pgCt4CM0l4uoDADef
 L4FelmZgR3Q+czlXjo/qo/4kYlCHZVBZ5rwcTdO/C7w2Tu3jccpfSsrlH Q==;
X-CSE-ConnectionGUID: qg1Gv+TdQ/6S+DXOlImvLg==
X-CSE-MsgGUID: gXbyKM7PSiqYxneOECubWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55530382"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="55530382"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 06:09:05 -0700
X-CSE-ConnectionGUID: Mqp1lo9BTBKwBOjuOitAmg==
X-CSE-MsgGUID: 20mdqv0FSiWrQyVGLxKaqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="163420633"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa005.fm.intel.com with ESMTP; 22 Jul 2025 06:09:04 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 13/23] drm/xe/svm: Support DRM_XE_SVM_ATTR_PAT memory
 attribute
Date: Tue, 22 Jul 2025 19:05:16 +0530
Message-Id: <20250722133526.3550547-14-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
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
 drivers/gpu/drm/xe/xe_vm_madvise.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 17959257ee1d..1dc4d19a5f2a 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -9,6 +9,7 @@
 #include <drm/xe_drm.h>
 
 #include "xe_bo.h"
+#include "xe_pat.h"
 #include "xe_pt.h"
 #include "xe_svm.h"
 
@@ -111,7 +112,13 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
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
+
 }
 
 typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
@@ -219,8 +226,22 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
 
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

