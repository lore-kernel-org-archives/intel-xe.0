Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAB0C3ABA9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 11:54:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23ED10E0D8;
	Wed, 30 Apr 2025 11:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hf+7z5St";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0563610E762
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 11:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746014048; x=1777550048;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fs26V17h76t01JEPGoJS9nTLSiKVzdPULcD1Uqy+rKY=;
 b=hf+7z5StSEpK89VgKE46RdHtdCaWhI0UR7oMHui4Kp7vEssVAtpWgTnP
 u3q8kYLwCiBml+3YfM6icH7LRrpvC3TkAxbUCq1ASbxlCCORm7d+wb823
 UpcRpwxxohOWHxPbnnNOH3vGM0yDp/bYHxZ93qZ+MXCHfM0KmC1sMFOyb
 RkYiOudNBAj+WoPAnGL4imCN8ckPYQ+ji2yAyQSjxV38ldTag8tc86WKy
 +z//vnYvXLxlHJqslBrgZgnZ/2s49asaTadlYg5HS63nUoSpm6Snjedda
 A6F6KVbgcGRX2TbrFwoF+s6GYveYh1wVd75snh3LQmjR+7NrcA+4qA2Xp A==;
X-CSE-ConnectionGUID: ci1U2BJ0RJO/0622TT445A==
X-CSE-MsgGUID: c2ZDUoERRYCWSsh4GYqRxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47759920"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="47759920"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 04:54:08 -0700
X-CSE-ConnectionGUID: Yd/1QwrHQXSip6+qHs9UXA==
X-CSE-MsgGUID: VU5mwDSnTRSD0pfXUlrvew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="134050599"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa007.fm.intel.com with ESMTP; 30 Apr 2025 04:54:06 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 stable@vger.kernel.org
Subject: [PATCH v6 04/20] drm/xe: Timeslice GPU on atomic SVM fault
Date: Wed, 30 Apr 2025 17:48:56 +0530
Message-Id: <20250430121912.337601-5-himal.prasad.ghimiray@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

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
---
 drivers/gpu/drm/xe/xe_svm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index dcc84e65ca96..f967caabc895 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -790,6 +790,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
 		.devmem_only = atomic && IS_DGFX(vm->xe) &&
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
+		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
+			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? 5 : 0,
 	};
 	struct xe_svm_range *range;
 	struct drm_gpusvm_range *r;
@@ -829,6 +831,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (--migrate_try_count >= 0 &&
 	    xe_svm_range_needs_migrate_to_vram(range, vma)) {
 		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
+		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
 		if (err) {
 			if (migrate_try_count || !ctx.devmem_only) {
 				drm_dbg(&vm->xe->drm,
@@ -848,6 +851,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
 	/* Corner where CPU mappings have changed */
 	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
+		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
 		if (migrate_try_count > 0 || !ctx.devmem_only) {
 			if (err == -EOPNOTSUPP) {
 				range_debug(range, "PAGE FAULT - EVICT PAGES");
@@ -887,6 +891,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			drm_exec_fini(&exec);
 			err = PTR_ERR(fence);
 			if (err == -EAGAIN) {
+				ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
 				range_debug(range, "PAGE FAULT - RETRY BIND");
 				goto retry;
 			}
-- 
2.34.1

