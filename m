Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A885EC369DC
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 07:23:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DB510E3A6;
	Mon, 28 Apr 2025 07:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JpBuVJu3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA2B10E3A7
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 07:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745825031; x=1777361031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lJC54+ozvvjmy6guZV1c92JZ0/WG9sIp6uS50KriLxA=;
 b=JpBuVJu3ruL0eB66CoAaN/LqjO+rYY6SuHE/gldRrFzLwtxcdG8mjVru
 NdpIRDdjSXg19KpcDzWVYw8VBdUfGKxSbZ+DBGLL3Avb6iaO7hFlE1h+r
 v/BjX9JDWv+xMkSXlp0pbm0WQl5Lg7i8cbyhvJwmRfW/JEOPszf8yGhQI
 ybmPSyxT+zUL0RKUY0oExZzetqIt2oyKPwDvAL3sQHbY54MKfW3j7nq21
 N/1uv9KSZpVyVt8WAUzE+O2CYiDlacAX5hZQwNIcCz3undHFoa9Me1sCW
 B72scxJZMUmi94ERyMvQhHMcvY9MOPLmw1plh8UQYxFO5goM1xaREgeXb Q==;
X-CSE-ConnectionGUID: AuXcS48uTmmHfmXDoNxrLw==
X-CSE-MsgGUID: y4bnL/rOR62atBI1UM8ZfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="50057017"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="50057017"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 00:23:51 -0700
X-CSE-ConnectionGUID: 7w1nUkUCSjKyUy/tJF150Q==
X-CSE-MsgGUID: IodP+eeQS5q08p2wZmj8HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="133408769"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa007.fm.intel.com with ESMTP; 28 Apr 2025 00:23:50 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v3 18/18] drm/xe/vm: Add debug prints for SVM range prefetch
Date: Mon, 28 Apr 2025 13:18:29 +0530
Message-Id: <20250428074829.4125547-19-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428074829.4125547-1-himal.prasad.ghimiray@intel.com>
References: <20250428074829.4125547-1-himal.prasad.ghimiray@intel.com>
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
index d01e059886ed..e98fbe21562e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2417,8 +2417,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			}
 
 			if (xe_svm_range_validate_and_evict(vm, svm_range,
-							    tile_mask, !!prefetch_region))
+							    tile_mask, !!prefetch_region)) {
+				xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
 				goto check_next_range;
+			}
 
 			err = xa_alloc(&op->prefetch_range.range,
 				       &i, svm_range, xa_limit_32b,
@@ -2429,6 +2431,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 
 			op->prefetch_range.ranges_count++;
 			vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH;
+			xe_svm_range_debug(svm_range, "PREFETCH - RANGE CREATED");
 check_next_range:
 			if (range_end > xe_svm_range_end(svm_range) &&
 			    xe_svm_range_end(svm_range) < xe_vma_end(vma)) {
@@ -2922,6 +2925,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
 				return -ENODATA;
 			}
+			xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
 		}
 
 		err = xe_svm_range_get_pages(vm, svm_range, &ctx);
@@ -2932,6 +2936,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
 			return err;
 		}
+		xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
 	}
 	return err;
 }
-- 
2.34.1

