Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52E8C369DC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 11:54:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D2010E743;
	Wed, 30 Apr 2025 11:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mpZO5icB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC31510E747
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 11:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746014055; x=1777550055;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MOjsNzj5Avc7x0JZbJS2us27o5EEGTgGclfGdx2kG0o=;
 b=mpZO5icB58RxFbLntO+ACH6Py3rUVTIvTq7gxRYG8kgtCdP1vuR9AF7o
 c3mARtQU49OvHg8yEj5qtbMykpmI8S3tQxmW2t2rjpnNkrOu3l/fzoCDw
 H10tJ+mPkdf21afXqBYM23WjTO3nPY5yTA9z54Yepf+Z90rIVlJi8SF7h
 kpUoG/0jqcY8WngpIWvQE1BivANKWM/PgvTHqSDoR2sqpJcKmaUKlrAv9
 Pt4eA9BJZ/r3fRXKdNAozutdxTwxFuNGbq0MetpzYC8hxnT7hxrSdz3kF
 FrKXijLaP7zIz1VmgKPomJbCLmw0jxOXx9IGPRvxTgAxSOE7apLqqavzF w==;
X-CSE-ConnectionGUID: AcFUFBnlRMKrfeyrIPFLKw==
X-CSE-MsgGUID: cxKUz5ewTuOFt1aSJhg9IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47759937"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="47759937"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 04:54:15 -0700
X-CSE-ConnectionGUID: 6R3Z9b+PSgGgwDODHXxZWw==
X-CSE-MsgGUID: OpeUBT3MTU+3OkNIyddLQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="134050645"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa007.fm.intel.com with ESMTP; 30 Apr 2025 04:54:13 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v6 08/20] drm/xe/svm: Helper to add tile masks to svm ranges
Date: Wed, 30 Apr 2025 17:49:00 +0530
Message-Id: <20250430121912.337601-9-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250430121912.337601-1-himal.prasad.ghimiray@intel.com>
References: <20250430121912.337601-1-himal.prasad.ghimiray@intel.com>
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

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index b42cf5d1b20c..de4e3edda758 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -2216,6 +2216,16 @@ static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 	}
 }
 
+static void range_present_and_invalidated_tile(struct xe_vm *vm,
+					       struct xe_svm_range *range,
+					       u8 tile_id)
+{
+	lockdep_assert_held(&vm->svm.gpusvm.notifier_lock);
+
+	range->tile_present |= BIT(tile_id);
+	range->tile_invalidated &= ~BIT(tile_id);
+}
+
 static void op_commit(struct xe_vm *vm,
 		      struct xe_tile *tile,
 		      struct xe_vm_pgtable_update_ops *pt_update_ops,
@@ -2270,12 +2280,11 @@ static void op_commit(struct xe_vm *vm,
 	}
 	case DRM_GPUVA_OP_DRIVER:
 	{
-		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
-			op->map_range.range->tile_present |= BIT(tile->id);
-			op->map_range.range->tile_invalidated &= ~BIT(tile->id);
-		} else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE) {
+		if (op->subop == XE_VMA_SUBOP_MAP_RANGE)
+			range_present_and_invalidated_tile(vm, op->map_range.range, tile->id);
+		else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
 			op->unmap_range.range->tile_present &= ~BIT(tile->id);
-		}
+
 		break;
 	}
 	default:
-- 
2.34.1

