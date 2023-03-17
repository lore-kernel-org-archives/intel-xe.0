Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04F4C74A5B
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 06:22:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AEC410E127;
	Fri, 17 Mar 2023 06:22:15 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E0810E127
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Mar 2023 06:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679034132; x=1710570132;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dd+3p9I7OAW6iXU4ZLxTX5eejZXrbkgFU50xhTGTH0w=;
 b=JQ4Oe0EHFO5LImLTXAxCFA3pb0BBIigM7h4tKOwUqNVmserOC1sokV+b
 HEc1hEUfsBlCH/qCRLs77c2ao27xlosCVL/ffoVRVLOsng/CTXIyqg2hF
 UDlqdEdqSpDHPfRc1YpISWiORcJa6CVnLPjo5BfYkJ/AdtYH65QQ9NMwT
 5LE0todZFt/Wl+x3avFR6+fz81+sy2gm4idQwDx6Aps3oswdUJzBbkP/0
 8GbFGbNvoVT3lXf9gVbqR8+65gTa4lWlbA+fEf/kFvapfDhvxMP4jfdM6
 LQRBLFDvdd4RI0sIIoAFTiDCHQe/vbv5wAs486feAN6QdxxHOd5A8fuFP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="403065595"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="403065595"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 23:22:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="790612106"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="790612106"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 23:22:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 16 Mar 2023 23:22:13 -0700
Message-Id: <20230317062213.225989-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Decrement fault mode counts in
 xe_vm_close_and_put
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

Rather waiting for the VM to be destroyed (all refs to VM go to zero),
drop the fault mode counts when the VM is closed in xe_vm_close_and_put.
This avoids a window where user space can create a faulting VM, close
it, and a subsequent creation of a non-faulting VM fails.

VLK-45296

Suggested-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index cdba901ebf57..8c172d9f3a87 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1349,6 +1349,13 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	XE_WARN_ON(!list_empty(&vm->extobj.list));
 	up_write(&vm->lock);
 
+	mutex_lock(&xe->usm.lock);
+	if (vm->flags & XE_VM_FLAG_FAULT_MODE)
+		xe->usm.num_vm_in_fault_mode--;
+	else if (!(vm->flags & XE_VM_FLAG_MIGRATION))
+		xe->usm.num_vm_in_non_fault_mode--;
+	mutex_unlock(&xe->usm.lock);
+
 	xe_vm_put(vm);
 }
 
@@ -1393,18 +1400,10 @@ static void vm_destroy_work_func(struct work_struct *w)
 
 	drm_gpuva_manager_destroy(&vm->mgr);
 
-	mutex_lock(&xe->usm.lock);
-	if (vm->flags & XE_VM_FLAG_FAULT_MODE)
-		xe->usm.num_vm_in_fault_mode--;
-	else if (!(vm->flags & XE_VM_FLAG_MIGRATION))
-		xe->usm.num_vm_in_non_fault_mode--;
-	mutex_unlock(&xe->usm.lock);
-
 	trace_xe_vm_free(vm);
 	dma_fence_put(vm->rebind_fence);
 	dma_resv_fini(&vm->resv);
 	kfree(vm);
-
 }
 
 void xe_vm_free(struct kref *ref)
-- 
2.34.1

