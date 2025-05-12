Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE45BC3ABCB
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 16:22:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881E110E458;
	Mon, 12 May 2025 16:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h61Pu8l6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D4510E458
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 16:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747066952; x=1778602952;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6ESw8tMPBDwQ3mF5AZP9iMuLwB9hNAFiuVTdZ3QspVE=;
 b=h61Pu8l6DUWVse6J63wtm9udH6DWDcpmOINP9DTXmUmuCbYbMZ9DSG63
 AF6kYAEpKKnWBZdKfBhvzF8W5as6mU8rXk8Q5oeehJOK3Rw63jDnCDVQI
 0yYUI5HGkllrAbTTpnGqrWaRXaQUaLomBiTL/DTTV8wVzI62FGDvHsvTh
 jzAbgHEqiftecEU8R2fP01ZWBG/xTSDzHwnWh1Iuv7NNwQRsrZcES3DKc
 qS7OaWGXySIL+8MmrCcSu0UN809EUTQzz/8IuRGT0KbbX/PLa4aqeORZ4
 DSNf4A5blXW4ExS1EYwxotc48F7byxX8P9f4NjcgDqXLR+0MklswyQm2H w==;
X-CSE-ConnectionGUID: QGgxhN3ZS564GlJokR0TYw==
X-CSE-MsgGUID: jIav6utDRWu+8Mx2OxN1bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="59508097"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="59508097"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 09:22:32 -0700
X-CSE-ConnectionGUID: J/Ds49akTlqV1YPvCzE1Hg==
X-CSE-MsgGUID: 5sG2r2mkQC6WJg7ZkuXQ4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="142532720"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa005.jf.intel.com with ESMTP; 12 May 2025 09:22:30 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v7 08/20] drm/xe/svm: Helper to add tile masks to svm ranges
Date: Mon, 12 May 2025 22:17:28 +0530
Message-Id: <20250512164740.466852-9-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250512164740.466852-1-himal.prasad.ghimiray@intel.com>
References: <20250512164740.466852-1-himal.prasad.ghimiray@intel.com>
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

