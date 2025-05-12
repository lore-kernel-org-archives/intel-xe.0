Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86ADBC3ABCD
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 12:31:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF9010E3D1;
	Mon, 12 May 2025 12:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kqlnQRy1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D447F10E3CF
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 12:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747053055; x=1778589055;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jrrxjMQxPdmdevylULN+1mwmKzVRSd2YfRYYIPeIs80=;
 b=kqlnQRy1Kx7/x3qRv0g4LdClcQecPxOWoM0WhR/HM7N1Ev7o2+PWpjoh
 7LX9sSVDasK6ePqYVSJPRZMBNoxzIdBDLktlDS6X20964erKZazk43snY
 nT+tIZkbzQivlupitoqdGsIbpF2sKobQz40/1pnbrSJWl1QOS+FpOd7/8
 rE9Kh03U4oUKqS7FK+XqXemUCbkJEA2KtKm55kT5PZ6icioYOlXp0Fnne
 ktB+V1VVcXCbHH9Q57/KKOfFz1cSkZnA86EkQc1ZsRc7A48AXCi6hw95i
 UgDhvb72YpSixgcP0x4nVYiiheUq/QkgdhDhBbNE4FqaaW5+HgPnnYlni Q==;
X-CSE-ConnectionGUID: 0BG0bhEATa+VtVp6C48h4g==
X-CSE-MsgGUID: mf/jloDhRtSUujqZmWg6CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48711660"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="48711660"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 05:30:54 -0700
X-CSE-ConnectionGUID: 9cwMiL7GSEq5aNgzta08bA==
X-CSE-MsgGUID: xvEtzv9iRyWWKwfj4IxLSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="142464443"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 05:30:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	himal.prasad.ghimiray@intel.com
Subject: [PATCH v7 4/5] drm/xe: Timeslice GPU on atomic SVM fault
Date: Mon, 12 May 2025 05:32:16 -0700
Message-Id: <20250512123217.1373106-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250512123217.1373106-1-matthew.brost@intel.com>
References: <20250512123217.1373106-1-matthew.brost@intel.com>
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

Ensure GPU can make forward progress on an atomic SVM GPU fault by
giving the GPU a timeslice of 5ms

v2:
 - Reduce timeslice to 5ms
 - Double timeslice on retry
 - Split out GPU SVM changes into independent patch
v5:
 - Double timeslice in a few more places

Fixes: 2f118c949160 ("drm/xe: Add SVM VRAM migration")
Cc: stable@vger.kernel.org
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index c68e01a1ad77..33354670d79e 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -797,6 +797,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
 		.devmem_only = atomic && IS_DGFX(vm->xe) &&
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
+		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
+			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? 5 : 0,
 	};
 	struct xe_svm_range *range;
 	struct drm_gpusvm_range *r;
@@ -836,6 +838,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (--migrate_try_count >= 0 &&
 	    xe_svm_range_needs_migrate_to_vram(range, vma)) {
 		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
+		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
 		if (err) {
 			if (migrate_try_count || !ctx.devmem_only) {
 				drm_dbg(&vm->xe->drm,
@@ -855,6 +858,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
 	/* Corner where CPU mappings have changed */
 	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
+		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
 		if (migrate_try_count > 0 || !ctx.devmem_only) {
 			if (err == -EOPNOTSUPP) {
 				range_debug(range, "PAGE FAULT - EVICT PAGES");
@@ -894,6 +898,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			drm_exec_fini(&exec);
 			err = PTR_ERR(fence);
 			if (err == -EAGAIN) {
+				ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
 				range_debug(range, "PAGE FAULT - RETRY BIND");
 				goto retry;
 			}
-- 
2.34.1

