Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C86C36005
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 10:07:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1121E10E3E4;
	Mon, 28 Apr 2025 10:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k6ZC9Vox";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422E910E3E0
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 10:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745834870; x=1777370870;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=reK8MfWE7Qk37/ULO3/WJBR/Yi7H0ZK+sp57TI9tTAU=;
 b=k6ZC9VoxL0r+v7j0wT3P+tsYDiVVeeUWDrr0H4EDnhz5ga3p+Hb0PlN7
 BiKu6AmgO/e96Nn61cHH+6r//HZxNscMNWML0khYnM48HPDdeU5Hds/t8
 CQqdsEiQ0sH0Ibfn2uPsZ/xMNwy3p4zJRyrmo8b/ZLq2uiyzZ7cjJOref
 Q41UMLYhL8rz8OluzuUO03nD+4IzcNClmL6uZLPmUqzud8U3rjRhzASTn
 cL0nErevR3l4+0qh7BdSuuZj7uR5ZPuNeArymA4t5ZqXqqAAZirXDkf6f
 4vWI3yScdIganEUnGC3resJ9uBFgKTTdMU0mmNJbDHEgkWLCy25fsQBrk Q==;
X-CSE-ConnectionGUID: iCk5oTsaQJucPVjXQU2wHw==
X-CSE-MsgGUID: JnPw0HOSS465Sho6BmBObQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="58783997"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="58783997"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 03:07:50 -0700
X-CSE-ConnectionGUID: KHawOxwVQNSMiU/dJz/dXQ==
X-CSE-MsgGUID: pCY/bV21TGOaU6HyDf3vGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="138291527"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa003.jf.intel.com with ESMTP; 28 Apr 2025 03:07:48 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 18/18] drm/xe/vm: Add debug prints for SVM range prefetch
Date: Mon, 28 Apr 2025 16:02:24 +0530
Message-Id: <20250428103224.69534-19-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428103224.69534-1-himal.prasad.ghimiray@intel.com>
References: <20250428103224.69534-1-himal.prasad.ghimiray@intel.com>
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
index 14c01e155cb7..4dde32121f85 100644
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

