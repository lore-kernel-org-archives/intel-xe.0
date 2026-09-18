Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63026C982D8
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 13:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F5910E0E9;
	Fri, 18 Sep 2026 13:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YM0Se9uG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B95C10E0E9
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 13:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789737044; x=1821273044;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=08s0nUfFfgFtWNY0epk5/ASsmlssl/l5/0UOkn4p6qI=;
 b=YM0Se9uGab1Dzhvn4lQM/s9IchngqD/TrfIBvL/hNlXTenvtB8nQPvop
 pR9dag9gHH1I5e6jBEj7DH8ui0PJvd+bO9SJCJSRiRRAgFPs4WhSbtVB+
 spCnEoPksXx2hp1OpsW7CBq88nh6QxvIiq96t7E3fYrnMEyF+Te3q0eLS
 LJ11FuGBS29O7lDSKhIAsEhkGcJx3qudS5616E9OD0OuP5xIDKQEAreXn
 Fc3A8gKltp7D83GWKGtE/PrueGfFMJROlTA9+ChTejYubzsA1ysSTLL2Q
 99hWfZUouMCUaIrV20ECUCB8ZfJ013gwtkycyn4bIuw9BHa1YKskhGgmQ A==;
X-CSE-ConnectionGUID: BQhsEK6DSdmiZLOx6ynqRQ==
X-CSE-MsgGUID: HNQfCrWhRG2FRNt8QROUdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="100838060"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="100838060"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 06:10:44 -0700
X-CSE-ConnectionGUID: rALQkDELTAmNXPg8949eiQ==
X-CSE-MsgGUID: t9gwWTIhQwebCwz6s1hakg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="270709239"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.222])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 06:10:42 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
Subject: [PATCH] drm/xe/vm: nuke PTs only after unlinking contested VMAs
Date: Fri, 18 Sep 2026 14:10:35 +0100
Message-ID: <20260918131034.598078-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

In xe_vm_close_and_put(), external-BO VMAs are queued on the contested
list for deferred destruction via xe_vma_destroy_unlocked(). However,
xe_vm_pt_destroy() was previously invoked before processing contested
VMAs, destroying vm->pt_root while those VMAs were still linked to their
respective buffer objects (vm_bo->list.gpuva).

If a concurrent thread evicts one of those shared buffer objects,
xe_bo_trigger_rebind() holding only bo->resv walks the BO's VMAs and, in
fault mode, calls xe_vm_invalidate_vma() -> xe_pt_zap_ptes(). Because
vm->pt_root[tile->id] is already NULL, dereferencing pt->level causes a
NULL ptr deref.

Fix this by deferring xe_vm_free_scratch() and xe_vm_pt_destroy() until
after all contested VMAs have been unlinked and destroyed.

User is reporting hitting a NULL ptr deref in xe_pt_zap_ptes(), which
could be explained by this race.

Assisted-by: LLM
Fixes: b06d47be7c83 ("drm/xe: Port Xe to GPUVA")
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9290
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.12+
---
 drivers/gpu/drm/xe/xe_vm.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 17dc4debe7c1..390da884c727 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1979,21 +1979,13 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 		vma->gpuva.flags |= XE_VMA_DESTROYED;
 	}
 
-	/*
-	 * All vm operations will add shared fences to resv.
-	 * The only exception is eviction for a shared object,
-	 * but even so, the unbind when evicted would still
-	 * install a fence to resv. Hence it's safe to
-	 * destroy the pagetables immediately.
-	 */
-	xe_vm_free_scratch(vm);
-	xe_vm_pt_destroy(vm);
 	xe_vm_unlock(vm);
 
 	/*
-	 * VM is now dead, cannot re-add nodes to vm->vmas if it's NULL
-	 * Since we hold a refcount to the bo, we can remove and free
-	 * the members safely without locking.
+	 * Unlink and destroy all contested external-BO VMAs before destroying
+	 * the page tables. Otherwise, concurrent eviction holding only bo->resv
+	 * can walk the BO's VMAs and attempt to invalidate/zap page tables that
+	 * have already been freed.
 	 */
 	list_for_each_entry_safe(vma, next_vma, &contested,
 				 combined_links.destroy) {
@@ -2001,6 +1993,11 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 		xe_vma_destroy_unlocked(vma);
 	}
 
+	xe_vm_lock(vm, false);
+	xe_vm_free_scratch(vm);
+	xe_vm_pt_destroy(vm);
+	xe_vm_unlock(vm);
+
 	xe_svm_fini(vm);
 
 	up_write(&vm->lock);
-- 
2.55.0

