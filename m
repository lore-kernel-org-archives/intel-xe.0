Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CCAC83F22
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 15:21:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A43710E5F5;
	Tue, 15 Jul 2025 15:21:22 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA1D10E5F5
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 15:21:20 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH] drm/xe: Fix oops in xe_gem_fault when running core_hotunplug
 test.
Date: Tue, 15 Jul 2025 17:20:58 +0200
Message-ID: <20250715152057.23254-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
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

I saw an oops in xe_gem_fault when running the xe-fast-feedback
testlist against the realtime kernel without debug options enabled.

The panic happens after core_hotunplug unbind-rebind finishes.
Presumably what happens is that a process mmaps, unlocks because
of the FAULT_FLAG_RETRY_NOWAIT logic, has no process memory left,
causing ttm_bo_vm_dummy_page() to return VM_FAULT_NOPAGE, since
there was nothing left to populate, and then oopses in
"mem_type_is_vram(tbo->resource->mem_type)" because tbo->resource
is NULL.

It's convoluted, but fits the data and explains the oops after
the test exits.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_bo.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c5a5154e1363b..68aefb6f23cde 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1716,22 +1716,26 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
 					       TTM_BO_VM_NUM_PREFAULT);
 		drm_dev_exit(idx);
+
+		if (ret == VM_FAULT_RETRY &&
+		    !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
+			goto out;
+
+		/*
+		 * ttm_bo_vm_reserve() already has dma_resv_lock.
+		 */
+		if (ret == VM_FAULT_NOPAGE &&
+		    mem_type_is_vram(tbo->resource->mem_type)) {
+			mutex_lock(&xe->mem_access.vram_userfault.lock);
+			if (list_empty(&bo->vram_userfault_link))
+				list_add(&bo->vram_userfault_link,
+					 &xe->mem_access.vram_userfault.list);
+			mutex_unlock(&xe->mem_access.vram_userfault.lock);
+		}
 	} else {
 		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
 	}
 
-	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
-		goto out;
-	/*
-	 * ttm_bo_vm_reserve() already has dma_resv_lock.
-	 */
-	if (ret == VM_FAULT_NOPAGE && mem_type_is_vram(tbo->resource->mem_type)) {
-		mutex_lock(&xe->mem_access.vram_userfault.lock);
-		if (list_empty(&bo->vram_userfault_link))
-			list_add(&bo->vram_userfault_link, &xe->mem_access.vram_userfault.list);
-		mutex_unlock(&xe->mem_access.vram_userfault.lock);
-	}
-
 	dma_resv_unlock(tbo->base.resv);
 out:
 	if (needs_rpm)
-- 
2.45.2

