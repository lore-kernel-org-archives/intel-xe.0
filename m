Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73289C44507
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 10:31:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372DA10E034;
	Wed, 15 Jul 2026 10:31:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fCNcYvVd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C103710E034
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 10:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784111475; x=1815647475;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w3FROChth//tuK+SCvVlWGnl5rL4ZnAc4D8ImRQIVZw=;
 b=fCNcYvVdvZ+TRp5svBZVGa4Hop96GRZgl4AQFcH8VPO6SJJgcuwWIFjk
 /KKUpO8MnLZ4CK/yqPZZTyV5zxhIWdGakClBwIonB1nI3ZRzvuzT4NgG9
 2GuQnzVwaMfNStG4Ya/TaBDml3m77pBSP3WQIS2RJM302aDABDK9LxHNH
 EGwCC2lUa706pTzoyQvbB6/Qe4i3VpzagDOfModAfejFsdwTlXuJDQyqe
 aGnjYnAr8SVA7W7iNe50g19AYIqDzetb9H0gHX7T9DwtFZw/c77mSwZ6g
 oj/kVHenCLcG9/laEFELyek/ATSq9hz3sfw89t2iJP76jzHUJYfIvD/cy A==;
X-CSE-ConnectionGUID: kBqY3PRFTA+BMlf24ndJsA==
X-CSE-MsgGUID: dMs/9wTFTdqd9kXsHTBwNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95389317"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="95389317"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 03:31:14 -0700
X-CSE-ConnectionGUID: 9Ah2xDrBR+Onxyy2xS/diA==
X-CSE-MsgGUID: KXUfZg5OQJOKA5o93QdsVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="255635510"
Received: from slindbla-desk.ger.corp.intel.com (HELO mkuoppal-desk.intel.com)
 ([10.245.246.26])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 03:31:12 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe: Remove ifdef in DRM_GPUVA_OP_DRIVER svm subop checking
Date: Wed, 15 Jul 2026 13:31:04 +0300
Message-ID: <20260715103104.63954-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Always emit the DRM_GPUVA_OP_DRIVER case so the previous break is
effective and we never fall through to the default warning.
This also allows adding more subops in the future without ifdef dancing.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 7111b5d0f6aa..d1b939dfaa13 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1547,7 +1547,6 @@ static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
 			err = vma_check_userptr(vm, gpuva_to_vma(op->base.prefetch.va), pt_update);
 		}
 		break;
-#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
 	case DRM_GPUVA_OP_DRIVER:
 		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
 			struct xe_svm_range *range = op->map_range.range;
@@ -1562,7 +1561,6 @@ static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
 			}
 		}
 		break;
-#endif
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 	}
-- 
2.43.0

