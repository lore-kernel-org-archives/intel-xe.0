Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAB7C3601A
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 09:53:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2642110E3F7;
	Mon,  7 Apr 2025 09:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BmvBaClh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A36210E3EC
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 09:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744019590; x=1775555590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N/N99O+osMQzWRWFHjoa4gzgQAwQAwKE03emEk1lSOM=;
 b=BmvBaClh4JCa2FE1C1GKUUtuXI3a3R/WzUCRvwdEUmcV75RbabL8BlNb
 /Roxw0NNMX81jlbvfL9ETEbwYTUUZH/HKiCs69SiN0/PPae/B1gRC6dsD
 MwSHhzeqYPwHQhcT61VEk5wlDyDXBgQaMX2uJSH1rNbqmhO98LNZ1aymj
 w8bTXJ3ZdFlwB35RW5OVaF5dNMDVgZR5/e5PIdiEPdRzyeHNI0tI6fr2e
 Lj1/bGfE0OUTP8Rn9hhTFkrvwT7UwmEf0AqUVazHlbsUHUKBM8DEq9S3e
 ClY3hATrCbuOpFllqwYSTxu/kFkWsSrGXcEFdpuRKTJwlphWCsQ1q/M+A w==;
X-CSE-ConnectionGUID: jkjrqOgMQFyVvsEw+oQk3A==
X-CSE-MsgGUID: f1bsiw47R66+JwynY/rFcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56029413"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56029413"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 02:53:10 -0700
X-CSE-ConnectionGUID: OcURend/Trq65OYM6Q78eQ==
X-CSE-MsgGUID: VGeYM3IUSoi7inPROkhtIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128778746"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 02:53:09 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 15/32] drm/xe/vm: Add debug prints for SVM range prefetch
Date: Mon,  7 Apr 2025 15:47:02 +0530
Message-Id: <20250407101719.3350996-16-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
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
---
 drivers/gpu/drm/xe/xe_vm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ffd7ad664921..fd98e74485f4 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2398,6 +2398,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			xa_store(&op->prefetch_range.range, i, svm_range, GFP_KERNEL);
 			op->prefetch_range.ranges_count++;
 			vops->flags |= XE_VMA_OPS_HAS_SVM_PREFETCH;
+			xe_svm_range_debug(svm_range, "PREFETCH - RANGE CREATED");
 
 			if (range_end > xe_svm_range_end(svm_range) &&
 			    xe_svm_range_end(svm_range) < xe_vma_end(vma)) {
@@ -2898,6 +2899,7 @@ static int prefetch_ranges_lock_and_prep(struct xe_vm *vm,
 						vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
 					return -ENODATA;
 				}
+				xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
 			}
 
 			err = xe_svm_range_get_pages(vm, svm_range, &ctx);
@@ -2909,6 +2911,7 @@ static int prefetch_ranges_lock_and_prep(struct xe_vm *vm,
 					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
 				return err;
 			}
+			xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
 		}
 	}
 	return err;
-- 
2.34.1

