Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10A7C54E67
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 02:17:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858E610E56F;
	Thu, 21 Mar 2024 02:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e+G+OmK9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B0610E5BF
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 02:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710987442; x=1742523442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=75gfS6PMxNKqJV06/637273Khns3dV6CGSbcs0kCV3c=;
 b=e+G+OmK9Qj0EplMBWBS/+xCRvPjmAp/gOVerw9CPr0z6L5bMZ53eOcbX
 Cy7tCcHnCyasRJSbCwlRork+WBekJqoWtvvAO0jbf1fVtezWYgSwQS9cr
 11gqe16NaUUEPh+xAqtTdbTIsrzHBmRA+X2A75G+H9zqBTkcpddPvsefd
 TdTaL3Ra/3LvNbK98rBAX27ogkNJS/uMDMYx1L7+qDBYhn69aldELQe7N
 GmDN/GaY8ovTm/q5Nlgok2Jn7dHomKaUI2RKg5YKwt6EaFVDxixYRkDPL
 aTka8qqxDYFm5K3YvVHid+wCi9fkIFCN8t7e81dRfFn+Dt9IQsT7wrOtM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="28425119"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="28425119"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 19:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="14338481"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 19:17:20 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, matthew.brost@intel.com, brian.welty@intel.com,
 himal.prasad.ghimiray@intel.com, lucas.demarchi@intel.com
Subject: [PATCH 4/4] drm/xe: destroy userptr vma on UNMAP event
Date: Wed, 20 Mar 2024 22:29:39 -0400
Message-Id: <20240321022939.2279979-5-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240321022939.2279979-1-oak.zeng@intel.com>
References: <20240321022939.2279979-1-oak.zeng@intel.com>
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

When there is MMU_NOTIFY_UNMAP event happens, the userptr
is munmapped from CPU. There is no need to keep the xe_vma
for this userptr from GPU side. So we destroy it.

But we can't destroy vma directly from the mmu notifier
callback function, because we need to remove mmu
notifier during vma destroy. If we remove mmu notifier
directly from mmu notifier callback, it is a deadlock.
xe_vma_destroy is modified to destroy vma in a worker
thread.

Another reason of this change is, for the future
hmmptr codes, we destroy vma when hmmptr is unmapped
from CPU. We want to unify the hmmptr and userptr
code.

I believe this is also the correct behavior for userptr.
This patch is experimental for CI and open to discuss

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 11a4bb9d5415..90d1163c1090 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -40,6 +40,8 @@
 #include "xe_wa.h"
 #include "xe_hmm.h"
 
+static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence);
+
 static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
 {
 	return vm->gpuvm.r_obj;
@@ -604,6 +606,9 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 
 	trace_xe_vma_userptr_invalidate_complete(vma);
 
+	if (range->event == MMU_NOTIFY_UNMAP)
+		xe_vma_destroy(vma, NULL);
+
 	return true;
 }
 
@@ -901,7 +906,8 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 			xe_vma_destroy_late(vma);
 		}
 	} else {
-		xe_vma_destroy_late(vma);
+		INIT_WORK(&vma->destroy_work, vma_destroy_work_func);
+		queue_work(system_unbound_wq, &vma->destroy_work);
 	}
 }
 
-- 
2.26.3

