Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE95C3ABB0
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 11:54:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E74510E753;
	Wed, 30 Apr 2025 11:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aP6r/kwc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C2010E74B
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 11:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746014075; x=1777550075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v+nCLo+xtrvWL7FECFuUo8o2OoZXsqTJYKGMfVqyqrs=;
 b=aP6r/kwcxVaTvpozUGVQHK+nw5NiTPmjwIlcwm3jQ1G8lGCF+8hrfHhZ
 hDbvcWCyk3GOe6D/dbloBs7ZY4hOjs8TkWT3ywcamiHh3NOlAIZmzQIKe
 sNrtgWun3uBCw+T9QwL66/X0X6jwIimNHaFqwy8GFc9oIug7I03Q1h4tI
 ESlDXbuI5eaTL5ZoDzm39vJKNIjVJ/0/ZzyIaauwxdMT7DWSMRIvVRz3p
 yCRvCFwffRH0NKCwqcskeYSo1TXk3+yXEIkp9XrQr5y49MBawiInJivn3
 kSXSucw6lv8+cr7xQk3bW1ivgNeaoSpYLF76/LL8y5HcWCrpXoizES/nJ Q==;
X-CSE-ConnectionGUID: P1zHxR+tTT+fdj/xIipX6g==
X-CSE-MsgGUID: kL0GQ/D9QiW+yltOKj2X5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47759970"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="47759970"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 04:54:35 -0700
X-CSE-ConnectionGUID: 3XN7a12uTwK6lNJVG2sZ5Q==
X-CSE-MsgGUID: HNoc/0LzQn+kJhGC0dhMaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="134050756"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa007.fm.intel.com with ESMTP; 30 Apr 2025 04:54:33 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v6 20/20] drm/xe/vm: Add debug prints for SVM range prefetch
Date: Wed, 30 Apr 2025 17:49:12 +0530
Message-Id: <20250430121912.337601-21-himal.prasad.ghimiray@intel.com>
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

Introduce debug logs for the prefetch operation of SVM ranges.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index dd5c63ee8720..abadd2097d13 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2399,8 +2399,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 				goto unwind_prefetch_ops;
 			}
 
-			if (xe_svm_range_validate(vm, svm_range, tile_mask, !!prefetch_region))
+			if (xe_svm_range_validate(vm, svm_range, tile_mask, !!prefetch_region)) {
+				xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
 				goto check_next_range;
+			}
 
 			err = xa_alloc(&op->prefetch_range.range,
 				       &i, svm_range, xa_limit_32b,
@@ -2411,6 +2413,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 
 			op->prefetch_range.ranges_count++;
 			vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH;
+			xe_svm_range_debug(svm_range, "PREFETCH - RANGE CREATED");
 check_next_range:
 			if (range_end > xe_svm_range_end(svm_range) &&
 			    xe_svm_range_end(svm_range) < xe_vma_end(vma)) {
@@ -2911,6 +2914,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
 				return -ENODATA;
 			}
+			xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
 		}
 
 		err = xe_svm_range_get_pages(vm, svm_range, &ctx);
@@ -2921,6 +2925,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
 			return err;
 		}
+		xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
 	}
 	return err;
 }
-- 
2.34.1

