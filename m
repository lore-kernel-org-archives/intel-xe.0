Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C865C001B0
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 16:37:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD4D10E49E;
	Wed, 26 Jul 2023 16:37:27 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE2D10E49E
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 16:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690389444; x=1721925444;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x5q2gY36qJ+McuQwdIVBmgzhRsgK3vcaweAEnI8l+7Y=;
 b=VLYNMxXtcUfRE8+l1UWB40Tg6FGkSOHnOnhGONzF2kAlAXTUTDMfAsTV
 2TGOUgJ/XKbkujLbINDDJw3QFIDvguQ9XbhNHSd2QYPHs2tLOMr4Nj1G2
 r9A3nHFgNtTxIKLWsMdSVFzhV/gt4NQtqdsdpjDB2oV6gpx8WxBnHF1Um
 mFCqKZ5iCSkKqq+kovnZKzpnS8EW0N95sTLwILFMJrI8Q1Ynjnq8bwopJ
 abBx6QtBOh9K2dySHPny5tW1fuCwM8G9GyzBi747m2dIphh+XMAxVdpeo
 3xULA6/ixosYxJq1Uy17wEo+TLQO6BcSCi+DfaX6V0QktWtrvbcR2hQIE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="371681025"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="371681025"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:37:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="726606364"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="726606364"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:37:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 26 Jul 2023 09:37:21 -0700
Message-Id: <20230726163721.353842-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Always use xe_vm_queue_rebind_worker
 helper
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

Do not queue the rebind worker directly, rather use the helper
xe_vm_queue_rebind_worker. This ensures we use the correct work queue.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c |  3 +--
 drivers/gpu/drm/xe/xe_vm.h | 14 +++++++-------
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index d4660520ac2c..c4270e7747bf 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1472,8 +1472,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 		}
 		if (!rebind && last_munmap_rebind &&
 		    xe_vm_in_compute_mode(vm))
-			queue_work(vm->xe->ordered_wq,
-				   &vm->preempt.rebind_work);
+			xe_vm_queue_rebind_worker(vm);
 	} else {
 		kfree(rfence);
 		kfree(ifence);
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index eaf11ac8ff51..4db777d7e375 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -185,6 +185,12 @@ extern struct ttm_device_funcs xe_ttm_funcs;
 
 struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm);
 
+static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
+{
+	XE_WARN_ON(!xe_vm_in_compute_mode(vm));
+	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
+}
+
 /**
  * xe_vm_reactivate_rebind() - Reactivate the rebind functionality on compute
  * vms.
@@ -198,7 +204,7 @@ static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
 {
 	if (xe_vm_in_compute_mode(vm) && vm->preempt.rebind_deactivated) {
 		vm->preempt.rebind_deactivated = false;
-		queue_work(system_unbound_wq, &vm->preempt.rebind_work);
+		xe_vm_queue_rebind_worker(vm);
 	}
 }
 
@@ -206,12 +212,6 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma);
 
 int xe_vma_userptr_check_repin(struct xe_vma *vma);
 
-static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
-{
-	XE_WARN_ON(!xe_vm_in_compute_mode(vm));
-	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
-}
-
 /*
  * XE_ONSTACK_TV is used to size the tv_onstack array that is input
  * to xe_vm_lock_dma_resv() and xe_vm_unlock_dma_resv().
-- 
2.34.1

