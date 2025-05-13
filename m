Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9621DC3ABCB
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 03:37:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5104710E4D6;
	Tue, 13 May 2025 03:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U9IdT86F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB54D10E4D6
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 03:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747107428; x=1778643428;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6ESw8tMPBDwQ3mF5AZP9iMuLwB9hNAFiuVTdZ3QspVE=;
 b=U9IdT86FBCmuY0wkqfjH6okBM2wLG3ap1CdKL8KuoFYNojRyy92URCp/
 1pbgKmWcN93uiWNxE4swvJulpP/xX3PXplTzy5XZKDketZgTs5HhSCJWT
 uvtbyocT7/aSvA5u5r7HlXXF4McfdEIADFvEisvTaKYZjLF5PjFfiJ8Go
 V7aVBcik8dNYjz3Xv5oEj0x8WS2OV8AKHy0rK5yIKCzoJGrrnQ6ZY74bv
 Fejf5vmVIAMvJQBEDpbtxWEBaP4wvZ022o1WPPYEy8Q/7fSLCUsIYvfVl
 ZWBW6yLMCGl9Rdg1q9/h3FTCwI54Fl6Nq3sX5p1aXweSpFVAlKOhdyf0t w==;
X-CSE-ConnectionGUID: olxi67CbTs+pgm585WooXw==
X-CSE-MsgGUID: IEJ4hODVS6a6lRNiiggk2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48858803"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="48858803"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 20:37:08 -0700
X-CSE-ConnectionGUID: rrmS3UpTRkOqcyQ938L7cQ==
X-CSE-MsgGUID: qY9jJFFwRUKADZ5ezJwGmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="142690171"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa005.jf.intel.com with ESMTP; 12 May 2025 20:37:06 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v8 03/15] drm/xe/svm: Helper to add tile masks to svm ranges
Date: Tue, 13 May 2025 09:32:16 +0530
Message-Id: <20250513040228.470682-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513040228.470682-1-himal.prasad.ghimiray@intel.com>
References: <20250513040228.470682-1-himal.prasad.ghimiray@intel.com>
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

Introduce a helper to add tile mask of binding present and invalidated
for the range. Add a lockdep_assert to ensure it is protected by GPU SVM
notifier lock.

-v7
rebased

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index b04756a97cdc..4d248d06bfa5 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -2216,6 +2216,18 @@ static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 	}
 }
 
+static void range_present_and_invalidated_tile(struct xe_vm *vm,
+					       struct xe_svm_range *range,
+					       u8 tile_id)
+{
+	/* WRITE_ONCE pairs with READ_ONCE in xe_svm.c */
+
+	lockdep_assert_held(&vm->svm.gpusvm.notifier_lock);
+
+	WRITE_ONCE(range->tile_present, range->tile_present | BIT(tile_id));
+	WRITE_ONCE(range->tile_invalidated, range->tile_invalidated & ~BIT(tile_id));
+}
+
 static void op_commit(struct xe_vm *vm,
 		      struct xe_tile *tile,
 		      struct xe_vm_pgtable_update_ops *pt_update_ops,
@@ -2271,19 +2283,13 @@ static void op_commit(struct xe_vm *vm,
 	case DRM_GPUVA_OP_DRIVER:
 	{
 		/* WRITE_ONCE pairs with READ_ONCE in xe_svm.c */
-
-		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
-			WRITE_ONCE(op->map_range.range->tile_present,
-				   op->map_range.range->tile_present |
-				   BIT(tile->id));
-			WRITE_ONCE(op->map_range.range->tile_invalidated,
-				   op->map_range.range->tile_invalidated &
-				   ~BIT(tile->id));
-		} else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE) {
+		if (op->subop == XE_VMA_SUBOP_MAP_RANGE)
+			range_present_and_invalidated_tile(vm, op->map_range.range, tile->id);
+		else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
 			WRITE_ONCE(op->unmap_range.range->tile_present,
 				   op->unmap_range.range->tile_present &
 				   ~BIT(tile->id));
-		}
+
 		break;
 	}
 	default:
-- 
2.34.1

