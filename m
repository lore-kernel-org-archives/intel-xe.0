Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81515C87FCF
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 16:17:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4756A10E88A;
	Thu,  7 Aug 2025 16:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XkMGIZ8b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9393110E882
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 16:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754583429; x=1786119429;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BqwbKS67D2gMhOr5s0XzJApdMhxeq0OMXHyqD2M9VeI=;
 b=XkMGIZ8b/na5WK9QZdU8cyBE8QRZVvi59TBDjPaaoj5W/nV2WtbBIRnP
 S2nGn6J+f2YCMmvVlhCwObZJYJJDlmUY3j/CVmw4FTpsQoHEEewWY9nif
 SaRimjl9R5V29L8aaWJ+NZM6y3nmRzcLvmYcGRE7XeJzJ8hv7b+3Jn5di
 B0+VpvXFx+ZtG6fH899DxTq9h/k1/t2R3Zv1QOgdZvEtQL9XipE8gCtQ+
 vOBmCKMpm8nc2E+BW6Ws5WFHDf2xliha7DO/zOpKwELPi67nwdEGPbdqx
 zbB9HeHgAMmYvlrpf4FSmuQIfG1ZoRmwhHEmGJGqd3frRVEpzbMjIBKlL g==;
X-CSE-ConnectionGUID: sWU2btTmTlWU+uqtuw/7tA==
X-CSE-MsgGUID: cz4IiE8dSxCYwd7ZQoWmHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56845606"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="56845606"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 09:17:09 -0700
X-CSE-ConnectionGUID: IOYboQRcTWW2qZ11io40kA==
X-CSE-MsgGUID: ODBfFGZkRB6QYGBGDB7M3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="195937880"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 07 Aug 2025 09:17:08 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v6 17/26] drm/xe/svm: Support DRM_XE_SVM_MEM_RANGE_ATTR_PAT
 memory attribute
Date: Thu,  7 Aug 2025 22:13:29 +0530
Message-Id: <20250807164338.1832254-18-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
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

v3
- Add check for compression pat

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v2
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index b5fc1eedf095..675a05a24e3b 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -9,6 +9,7 @@
 #include <drm/xe_drm.h>
 
 #include "xe_bo.h"
+#include "xe_pat.h"
 #include "xe_pt.h"
 #include "xe_svm.h"
 
@@ -121,7 +122,17 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
 			      struct xe_vma **vmas, int num_vmas,
 			      struct drm_xe_madvise *op)
 {
-	/* Implementation pending */
+	int i;
+
+	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_PAT);
+
+	for (i = 0; i < num_vmas; i++) {
+		if (!xe_vma_bo(vmas[i]) &&
+		    xe_pat_index_get_comp_mode(xe, op->pat_index.val))
+			continue;
+
+		vmas[i]->attr.pat_index = op->pat_index.val;
+	}
 }
 
 typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
@@ -229,8 +240,22 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
 
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

