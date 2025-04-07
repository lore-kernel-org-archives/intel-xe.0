Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB49BC3601E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 09:53:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730CB10E40B;
	Mon,  7 Apr 2025 09:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZTgAfuug";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B10610E40B
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 09:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744019615; x=1775555615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N4aFgLx2yHyturXW25J2QLgMotLg2DQ5ZQjI/5x4b6Y=;
 b=ZTgAfuugFmdNlCGSQDrEwnq4ss36MydfHvdG9vo7uQIP/qXQziUTXSI1
 XEzbmqwVg8TfyjH7Cx41hrmQ/eHPNAuUmF3Q+QTwV1WjquM9mggccmMsw
 SSS7s/ty2clRsKL6eSCnFGUNtaPgHqR8CK7b9e0722Xd8I6uHPnj4rt6O
 cbdhPP81vlDW01TDDZESrNP9XkArPsMeeMziNeE6/VoAFFKk8Kgl6rfDu
 F7XSMa7GIoXUnvQMDzXGY/6OT7P5tr5g5RKCjeBjF8j5xDeOfy4Gn849O
 PJbZ+i35DXQSuzhgp83fKR0OMrjkeqaXTKDXKtREmn6sgVo5S5FzHbPUQ g==;
X-CSE-ConnectionGUID: 3P/L/RUpQgmE/YWNFt2zHg==
X-CSE-MsgGUID: j7mSKHFSS1ysvCtHOsePsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56029469"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56029469"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 02:53:35 -0700
X-CSE-ConnectionGUID: ey3/vKEkTQm0gX+mOYo/FQ==
X-CSE-MsgGUID: /kvSKie8Qi2rtno+6ZbXig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128778939"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 02:53:34 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 29/32] drm/xe/svm: Consult madvise preferred location in
 prefetch
Date: Mon,  7 Apr 2025 15:47:16 +0530
Message-Id: <20250407101719.3350996-30-himal.prasad.ghimiray@intel.com>
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

When prefetch region is DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, prefetch svm
ranges to preferred location provided by madvise.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0f9c45ce82b4..e5246c633e62 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2924,9 +2924,12 @@ static int prefetch_ranges_lock_and_prep(struct xe_vm *vm,
 		if (!xe_vma_is_cpu_addr_mirror(vma))
 			return 0;
 
-		region = op->prefetch_range.region;
+		region = (op->prefetch_range.region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) ?
+			  vma->attr.preferred_loc.devmem_fd : op->prefetch_range.region;
 
-		/* TODO: Threading the migration */
+		/* TODO: Threading the migration
+		 * TODO: Multigpu support migration
+		 */
 		for (i = 0; i < op->prefetch_range.ranges_count; i++) {
 			svm_range = xa_load(&op->prefetch_range.range, i);
 			if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
@@ -3001,7 +3004,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 		else
 			region = op->prefetch.region;
 
-		xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
+		xe_assert(vm->xe, region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC ||
+			  region <= ARRAY_SIZE(region_to_mem_type));
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.prefetch.va),
@@ -3426,8 +3430,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 				 op == DRM_XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, prefetch_region &&
 				 op != DRM_XE_VM_BIND_OP_PREFETCH) ||
-		    XE_IOCTL_DBG(xe, !(BIT(prefetch_region) &
-				       xe->info.mem_region_mask)) ||
+		    XE_IOCTL_DBG(xe, (is_cpu_addr_mirror &&
+				      prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) &&
+				      !(BIT(prefetch_region) & xe->info.mem_region_mask)) ||
 		    XE_IOCTL_DBG(xe, obj &&
 				 op == DRM_XE_VM_BIND_OP_UNMAP)) {
 			err = -EINVAL;
-- 
2.34.1

