Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D558EC3ABBF
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 23:00:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 763DD10E363;
	Tue,  6 May 2025 23:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SqrXzgl7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2CF10E112
 for <intel-xe@lists.freedesktop.org>; Tue,  6 May 2025 23:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746572411; x=1778108411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SZsUaTJrUTSxjrQ+RLDjOHAWgYxe9VwdYkd7E7huR+I=;
 b=SqrXzgl79uewZiiZ6i5TA4mHTSjEDkY1ZNLG6FfyOgPkzSbBdEdxpMTa
 +4NQSIle9ub0xSl3CNqBgP2SkKrpu/7ORx4fJF2q19M5RDyzcaWMXuqK1
 AgqX1NypYVjWgGcrmDwUcX3V0/hbdTav45fXTOEDsXOaJkrT95CR+Cz1P
 MIussD/wgU/XenKvqWT5nbPK5S4GgT2dkdov82743+Pgh1sb2xZnOF3Y5
 2AdTxbeAgyfaE9Ya5izJaEu3mFMZ2/WE9YxB9sdoD4AszScVhp1uGi92L
 KPVH8rdPyp8K7cfd7lhnSrN2XD1byaxeBw0WY1Ufl4curlMNnadn4z1OM g==;
X-CSE-ConnectionGUID: FR2RRSa2T+ykIZLUlsd8iQ==
X-CSE-MsgGUID: Dx5+1T+uRBugRpa3R9jokw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48353964"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; d="scan'208";a="48353964"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 16:00:10 -0700
X-CSE-ConnectionGUID: ustoTGLDSa6ILcoBI31rmA==
X-CSE-MsgGUID: jItYQHU9T0qVr9ulkx1AKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; d="scan'208";a="166690649"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 16:00:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	himal.prasad.ghimiray@intel.com
Subject: [PATCH v6 4/5] drm/xe: Timeslice GPU on atomic SVM fault
Date: Tue,  6 May 2025 16:01:31 -0700
Message-Id: <20250506230132.1188732-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250506230132.1188732-1-matthew.brost@intel.com>
References: <20250506230132.1188732-1-matthew.brost@intel.com>
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
index 8c0ef55cfd57..6ceefd44554c 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -796,6 +796,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
 		.devmem_only = atomic && IS_DGFX(vm->xe) &&
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
+		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
+			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? 5 : 0,
 	};
 	struct xe_svm_range *range;
 	struct drm_gpusvm_range *r;
@@ -835,6 +837,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (--migrate_try_count >= 0 &&
 	    xe_svm_range_needs_migrate_to_vram(range, vma)) {
 		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
+		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
 		if (err) {
 			if (migrate_try_count || !ctx.devmem_only) {
 				drm_dbg(&vm->xe->drm,
@@ -854,6 +857,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
 	/* Corner where CPU mappings have changed */
 	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
+		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
 		if (migrate_try_count > 0 || !ctx.devmem_only) {
 			if (err == -EOPNOTSUPP) {
 				range_debug(range, "PAGE FAULT - EVICT PAGES");
@@ -893,6 +897,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			drm_exec_fini(&exec);
 			err = PTR_ERR(fence);
 			if (err == -EAGAIN) {
+				ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
 				range_debug(range, "PAGE FAULT - RETRY BIND");
 				goto retry;
 			}
-- 
2.34.1

