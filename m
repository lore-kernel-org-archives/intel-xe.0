Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48A4C04FF6
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 11:32:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76AAE10E651;
	Fri, 12 Apr 2024 11:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L3RPDthU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC3D10E135
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 11:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712921569; x=1744457569;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LuUx6TVXg7T4q4J5BxRy9ihegPG/MxAaq+oUU6NYDe0=;
 b=L3RPDthUAQV2TREHSCaaXC5cxL8bdBeG8dscXlVmoWiRgB6B2OHMS88P
 2dG+Uw5nji8AJqErTQQFqhjpWNpXUa7vfP399CNvR8qpDNvYDG+PBNLMg
 mCAZ7tAPTNlBxXarxFtJ11MXe19PWtEUC/wbsMeSr8pJQ2UEzS8vxdUV1
 2TxMo9Uyq4Ne559wou2K4jtlpV7cI62URWMtYb4e1PDHzIKgIYOfbN+X4
 ywWwsRvFBkW5HJtauWQYA/2Kbcp1ex8TypnZ9WDtK+34ovEApZBMiKrA6
 5dgcS/WeHKhJeAppD9worfhEF8GYeg1+eiH/CsY6d9Q6yc7ajDVwN2VA2 A==;
X-CSE-ConnectionGUID: jhJ3c+bjRAmaAy3RZamYAQ==
X-CSE-MsgGUID: yrYWU5u4ROKlJCI5SwypFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="11335424"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="11335424"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 04:32:48 -0700
X-CSE-ConnectionGUID: tpqTNdCxTLiyMmbQifWa6A==
X-CSE-MsgGUID: Vg6jNz0CTAeB6auPESV6ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="21272587"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.44])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 04:32:47 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/3] drm/xe/vm: drop vm->destroy_work
Date: Fri, 12 Apr 2024 12:31:46 +0100
Message-ID: <20240412113144.259426-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412113144.259426-4-matthew.auld@intel.com>
References: <20240412113144.259426-4-matthew.auld@intel.com>
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

Now that we no longer grab the usm.lock mutex (which might sleep) it
looks like it should be safe to directly perform xe_vm_free when vm
refcount reaches zero, instead of punting that off to some worker.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 17 ++---------------
 drivers/gpu/drm/xe/xe_vm_types.h |  7 -------
 2 files changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c5c26b3d1b76..300d166f412e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1279,8 +1279,6 @@ static const struct xe_pt_ops xelp_pt_ops = {
 	.pde_encode_bo = xelp_pde_encode_bo,
 };
 
-static void vm_destroy_work_func(struct work_struct *w);
-
 /**
  * xe_vm_create_scratch() - Setup a scratch memory pagetable tree for the
  * given tile and vm.
@@ -1360,8 +1358,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	init_rwsem(&vm->userptr.notifier_lock);
 	spin_lock_init(&vm->userptr.invalidated_lock);
 
-	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
-
 	INIT_LIST_HEAD(&vm->preempt.exec_queues);
 	vm->preempt.min_run_period_ms = 10;	/* FIXME: Wire up to uAPI */
 
@@ -1599,10 +1595,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	xe_vm_put(vm);
 }
 
-static void vm_destroy_work_func(struct work_struct *w)
+static void xe_vm_free(struct drm_gpuvm *gpuvm)
 {
-	struct xe_vm *vm =
-		container_of(w, struct xe_vm, destroy_work);
+	struct xe_vm *vm = container_of(gpuvm, struct xe_vm, gpuvm);
 	struct xe_device *xe = vm->xe;
 	struct xe_tile *tile;
 	u8 id;
@@ -1622,14 +1617,6 @@ static void vm_destroy_work_func(struct work_struct *w)
 	kfree(vm);
 }
 
-static void xe_vm_free(struct drm_gpuvm *gpuvm)
-{
-	struct xe_vm *vm = container_of(gpuvm, struct xe_vm, gpuvm);
-
-	/* To destroy the VM we need to be able to sleep */
-	queue_work(system_unbound_wq, &vm->destroy_work);
-}
-
 struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
 {
 	struct xe_vm *vm;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index badf3945083d..7570c2c6c463 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -177,13 +177,6 @@ struct xe_vm {
 	 */
 	struct list_head rebind_list;
 
-	/**
-	 * @destroy_work: worker to destroy VM, needed as a dma_fence signaling
-	 * from an irq context can be last put and the destroy needs to be able
-	 * to sleep.
-	 */
-	struct work_struct destroy_work;
-
 	/**
 	 * @rftree: range fence tree to track updates to page table structure.
 	 * Used to implement conflict tracking between independent bind engines.
-- 
2.44.0

