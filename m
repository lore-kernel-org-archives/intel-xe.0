Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83133C3ABAA
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 10:17:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4691710E423;
	Tue, 29 Apr 2025 10:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QHmsgF3D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA81310E41F
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 10:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745921852; x=1777457852;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KmQsVARs8uW8LAwHjvrQ9oG87EtmccU5w9krCu1lp+k=;
 b=QHmsgF3D2cfhlr4NjJ8B00rx9WaJDeoNo6H65Y0nrH15VsfizzCyY5L5
 YWzOpgRmkrsufpatGPKNOvHdZuUV5UqO52rw30SB5+DYM9RZJUJ0DHY2Y
 C4n2t8PJ+kr+MRx9aP9HztKTacu8TtsPjB3yrVrYXwsIG8T35if4QeHGv
 nRVUhdAzodhPC+Geh9rP9KnVj0L7AdSYoogSTGOea7w8R30xrEMBtp711
 AjHd7SrBW1fbFfuD6PXhIrfHWW7qwAedfOng9mVUgwHy6BNTW9EWOhVAo
 yVlZgUWpccGKL3sOiuCeOAWo26u7QfDR871llLZBoz6xLry3COJSJ3dwS w==;
X-CSE-ConnectionGUID: Y2hcZCtrSNqHhat2nMPMsw==
X-CSE-MsgGUID: X8l4vsmBT+OICrDhnHfBYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47243179"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="47243179"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 03:17:32 -0700
X-CSE-ConnectionGUID: uXkPDcnNSGaVGwPzlwRIxA==
X-CSE-MsgGUID: VAJJlrj7SXKMT9dGRHxhhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="134287541"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa007.jf.intel.com with ESMTP; 29 Apr 2025 03:17:30 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 04/20] drm/xe: Timeslice GPU on atomic SVM fault
Date: Tue, 29 Apr 2025 16:12:17 +0530
Message-Id: <20250429104233.215602-5-himal.prasad.ghimiray@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Ensure GPU can make forward progress on an atomic SVM GPU fault by
giving the GPU a timeslice of 5ms

v2:
 - Reduce timeslice to 5ms
 - Double timeslice on retry
 - Split out GPU SVM changes into independent patch

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index f749ae367a8f..d5376a76cdd1 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -783,6 +783,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
 		.devmem_only = atomic && IS_DGFX(vm->xe) &&
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
+		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
+			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? 5 : 0,
 	};
 	struct xe_svm_range *range;
 	struct drm_gpusvm_range *r;
@@ -819,6 +821,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (--migrate_try_count >= 0 &&
 	    xe_svm_range_needs_migrate_to_vram(range, vma)) {
 		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
+		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
 		if (err) {
 			if (migrate_try_count || !ctx.devmem_only) {
 				drm_dbg(&vm->xe->drm,
-- 
2.34.1

