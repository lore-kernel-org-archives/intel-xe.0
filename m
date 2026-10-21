Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB616606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 04:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RL/LOQ7e
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF6B10F8C4;
	Wed, 21 Oct 2026 04:14:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD9810F8C4
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 04:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792556039; x=1824092039;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9RLAvrQKoF62rQLcBOJWyi6C51VWcYWny9lIOFYKssE=;
 b=RL/LOQ7eDBE8zh8yvsiw63ZVz3eHuF2ZDSeW4sdWUov4o+horzCe9zs/
 90cz9mJj1H7KGV3vGqZ0Ponh/tEYkplRCIeijmseIOqWvJ8oQZOChQnAR
 OcY1vGyeY+4UEkCpayqr88mgPAyXpJiaVxek2wRbCgXoywtY0Rc7ZI/c6
 3ja+AJxxNGBteJowjSDb+j5yHMswGPXVJmQHT/y0KsFaunmBP882IiutE
 hQraZ/8BbCwrbs9cTcCAExiCX9uS0DPzbIdf8N7u4M80o9rWJNbuCBDsC
 XvoywW6u51/V/Pl9/df4ikkPxBksSpoAYYp69wV+sxCD8vtea8vc4d55y A==;
X-CSE-ConnectionGUID: ejQ0IjH+QWmZGC7brx8UIg==
X-CSE-MsgGUID: 2Z1hzQS5TFKTuoGR+2uD/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1264321"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1264321"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 21:13:57 -0700
X-CSE-ConnectionGUID: DlrPIYRRStq6IHnWp1QV5g==
X-CSE-MsgGUID: AlaDpLJITEymT69dnvQ7IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="2868706"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa008.jf.intel.com with ESMTP; 20 Oct 2026 21:13:55 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 6/6] drm/xe/pagefault: add CPU mirror VMA for SVA faults
 without PRI
Date: Wed, 21 Oct 2026 09:41:17 +0530
Message-ID: <20261021041117.1774877-7-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021041117.1774877-1-naresh.kumar.g@intel.com>
References: <20261021041117.1774877-1-naresh.kumar.g@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On ATS/PASID platforms without PRI, xe cannot rely on the hardware
page request path to populate missing CPU mirror mappings for SVA faults.
This can leave xe_pagefault_service() without a VMA even when the faulting
address is valid in the process address space.

Create a CPU-address-mirror VMA on demand for such faults so they can
proceed through the existing SVM fault handling path.

Faults against unmapped addresses or unusable VMs continue to fail.

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c       | 49 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pagefault_types.h |  6 +++
 2 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 98cce0f12b12..c3acec28e115 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -17,6 +17,7 @@
 #include "xe_migrate.h"
 #include "xe_pagefault.h"
 #include "xe_pagefault_types.h"
+#include "xe_pci.h"
 #include "xe_pm.h"
 #include "xe_svm.h"
 #include "xe_trace_bo.h"
@@ -268,6 +269,7 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 {
 	struct xe_gt *gt = pf->gt;
 	struct xe_device *xe = gt_to_xe(gt);
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	struct xe_vm *vm;
 	struct xe_vma *vma = NULL;
 	int err;
@@ -298,6 +300,51 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	}
 
 	vma = xe_vm_find_vma_by_addr(vm, xe_pagefault_addr(pf));
+
+	/*
+	 * ATS/PASID is negotiated but this hardware has no PRI, so there is
+	 * no IOMMU self-healing path to fault the page in - the driver has
+	 * to create the missing CPU-address-mirror binding itself and let
+	 * the SVM path below service the fault.
+	 */
+	if (!vma && vm->sva_handle && xe_pci_svm_needs_sw_iopf(pdev)) {
+		u64 page_size = vm->flags & XE_VM_FLAG_64K ? SZ_64K : SZ_4K;
+		u64 start = ALIGN_DOWN(xe_pagefault_addr(pf), page_size);
+		u64 end = start + page_size;
+		int alloc_err = 0;
+
+		up_read(&vm->lock);
+		down_write(&vm->lock);
+		/* Lock was dropped, re-check: a racing fault may have won */
+		vma = xe_vm_find_vma_by_addr(vm, xe_pagefault_addr(pf));
+		if (!vma) {
+			if (xe_vm_is_closed_or_banned(vm)) {
+				alloc_err = -ENOENT;
+			} else {
+				/* Merge with adjacent mirror VMAs instead of leaving singletons */
+				xe_vm_find_cpu_addr_mirror_vma_range(vm, &start, &end);
+				alloc_err = xe_vm_alloc_cpu_addr_mirror_vma(vm, start, end - start);
+			}
+			if (!alloc_err)
+				vma = xe_vm_find_vma_by_addr(vm, xe_pagefault_addr(pf));
+		}
+		downgrade_write(&vm->lock);
+
+		if (alloc_err || !vma || !xe_vma_is_cpu_addr_mirror(vma)) {
+			/*
+			 * err is what actually tells guc_ack_fault() to NACK;
+			 * distinguish a transient allocation failure from a
+			 * genuinely unmapped/closed address for diagnostics.
+			 */
+			err = alloc_err ? : -EINVAL;
+			if (alloc_err == -ENOMEM)
+				xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_VMA_ALLOC);
+			else
+				xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_VMA_NOT_FOUND);
+			goto unlock_vm;
+		}
+	}
+
 	if (!vma) {
 		err = -EINVAL;
 		xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_VMA_NOT_FOUND);
@@ -589,6 +636,8 @@ static const char *xe_pagefault_error_to_str(enum xe_pagefault_error error)
 		return "VM_CLOSED";
 	case XE_PAGEFAULT_ERROR_VMA_NOT_FOUND:
 		return "VMA_NOT_FOUND";
+	case XE_PAGEFAULT_ERROR_VMA_ALLOC:
+		return "VMA_ALLOC";
 	case XE_PAGEFAULT_ERROR_READ_ONLY_VIOLATION:
 		return "READ_ONLY_VIOLATION";
 	case XE_PAGEFAULT_ERROR_VMA_NEEDS_VRAM_CHECK:
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
index 56defc05922e..d95d47ee0c0c 100644
--- a/drivers/gpu/drm/xe/xe_pagefault_types.h
+++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
@@ -59,6 +59,12 @@ enum xe_pagefault_error {
 	XE_PAGEFAULT_ERROR_VM_CLOSED,
 	/** @XE_PAGEFAULT_ERROR_VMA_NOT_FOUND: No VMA covers the faulted address */
 	XE_PAGEFAULT_ERROR_VMA_NOT_FOUND,
+	/**
+	 * @XE_PAGEFAULT_ERROR_VMA_ALLOC: Failed to allocate a CPU-address-mirror
+	 * VMA to service a PRI-less SVA fault (e.g. -ENOMEM); distinct from a
+	 * genuinely unmapped address
+	 */
+	XE_PAGEFAULT_ERROR_VMA_ALLOC,
 	/**
 	 * @XE_PAGEFAULT_ERROR_READ_ONLY_VIOLATION: Write/atomic fault on a
 	 * read-only VMA
-- 
2.43.0

