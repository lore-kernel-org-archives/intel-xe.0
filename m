Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CEFC3ABA9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 10:18:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E7410E431;
	Tue, 29 Apr 2025 10:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CHSizGYD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE2E10E431
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 10:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745921885; x=1777457885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e53PuYCBnUAdXcz2z0uQEB0wHWffo7gSP77pXAYKSRI=;
 b=CHSizGYDyLIO/aJAOctTrhf9udte/R9SoM6GzSduGGpZF9TIZpx7IyLS
 3lxOciJV8iKWpr24gOEVsi6WtEipbRjs9n8CJ7Du1/6/Rk13omj0lSX7U
 LLNtBtNuzerxglSbPtOkRUZVyAj6loq2C/gPRbl/D/1smMrwb2mz+tRWJ
 D7qvsQV6/dcnG10Bvw4f0vPtfspt17OllF8dSM//pFJH6GUYquRNP1piS
 +JfoJoDFmqV+bgoPTPXA5OMllQ1annPHooLoZ/whppVurvuG5sJ5axQ+q
 mF4aMp8mmt69OTQjZLm+uTlX6l7V7hWUUQOnocQffnBweVlxz6+ezWGbx w==;
X-CSE-ConnectionGUID: i5sqF04wSOm6EzYYzdRqxQ==
X-CSE-MsgGUID: vKjaG+9zRu+HvMznRnbc0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47243214"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="47243214"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 03:18:05 -0700
X-CSE-ConnectionGUID: Uiw2P66eTzWv1BjHHNIAGQ==
X-CSE-MsgGUID: WY6vjLAnQcmnqmhN8ISV7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="134287643"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa007.jf.intel.com with ESMTP; 29 Apr 2025 03:18:02 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 20/20] drm/xe/vm: Add debug prints for SVM range prefetch
Date: Tue, 29 Apr 2025 16:12:33 +0530
Message-Id: <20250429104233.215602-21-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429104233.215602-1-himal.prasad.ghimiray@intel.com>
References: <20250429104233.215602-1-himal.prasad.ghimiray@intel.com>
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

Introduce debug logs for the prefetch operation of SVM ranges.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 47133ce0e8b3..d2ce74a028fa 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2398,8 +2398,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			}
 
 			if (xe_svm_range_validate_and_evict(vm, svm_range,
-							    tile_mask, !!prefetch_region))
+							    tile_mask, !!prefetch_region)) {
+				xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
 				goto check_next_range;
+			}
 
 			err = xa_alloc(&op->prefetch_range.range,
 				       &i, svm_range, xa_limit_32b,
@@ -2410,6 +2412,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 
 			op->prefetch_range.ranges_count++;
 			vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH;
+			xe_svm_range_debug(svm_range, "PREFETCH - RANGE CREATED");
 check_next_range:
 			if (range_end > xe_svm_range_end(svm_range) &&
 			    xe_svm_range_end(svm_range) < xe_vma_end(vma)) {
@@ -2906,6 +2909,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
 				return -ENODATA;
 			}
+			xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
 		}
 
 		err = xe_svm_range_get_pages(vm, svm_range, &ctx);
@@ -2916,6 +2920,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
 			return err;
 		}
+		xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
 	}
 	return err;
 }
-- 
2.34.1

