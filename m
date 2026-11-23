Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7566606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 08:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YIPQwaaO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1A010E2E6;
	Mon, 23 Nov 2026 08:23:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A0210E2E6
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 08:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795422217; x=1826958217;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L6wtovo0m4XKOk+t4CclOSfYK/2lmZcr9cljEx6FJcM=;
 b=YIPQwaaO7UgY/VWxSbwbUIK5a9VwCFvk0yP3RY12T8tskK1XO6JXZX6q
 WPQHayM+xm15tjzqpyt2PDEhgLTEvzZLDKDGEL/rYMJ30/LKOMi4AHGCb
 uNZix6XOzhill0yKcTka4tiCCNrGc5gdTFznm12/DZUE0Y9fL/nBM9jF4
 fKbKdTO14QY4zQOGJBInFHETOO3FScBh0BhK+0PbPU8B+Bzb5gnkfsGzW
 L9J64TxcQ2Al1Z8yZRJOSmwnWPMuV2rGc+c9stS9cbH9D/I+2TzR0l1iC
 hvEkjev2IF8ZZTV+NDrTq30AE+Jf0Y70eAY+w0iI8t10Ect0AxbSJBIlZ g==;
X-CSE-ConnectionGUID: Egr/DOX1RDyW8Ow5XqiWNA==
X-CSE-MsgGUID: KOdlOfPxRxeeNNdsDdbhJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4113337"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4113337"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 00:23:36 -0800
X-CSE-ConnectionGUID: sA56jhCGQTCOjRdBDBNTVA==
X-CSE-MsgGUID: D7R2E/c6R0WlcfSwAbt53A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="13048993"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 00:23:34 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v2] drm/xe/vm: Hold a device reference until VM teardown
 completes
Date: Mon, 23 Nov 2026 13:44:39 +0530
Message-ID: <20261123081438.3640008-2-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since drm_gpuvm holds a device reference, the last VM put can drop the
last device reference and run device teardown in that context. Two such
contexts are workers that teardown itself waits for:

  The async BO free worker, freeing a page-table BO, flushes itself
  from xe_bo_dev_fini():

  WARNING: possible recursive locking detected
  kworker/7:0/50249 is trying to acquire lock:
  ((work_completion)(&bo_dev->async_free)), at: __flush_work+0x25d/0x640
  but task is already holding lock:
  ((work_completion)(&bo_dev->async_free)), at: process_one_work+0x26d/0x890
  ...
  Workqueue: events xe_bo_dev_work_func [xe]
  Call Trace:
   flush_work+0x2d/0x40
   xe_bo_dev_fini+0xe/0x20 [xe]
   xe_device_destroy+0x19/0xa0 [xe]
   drm_managed_release+0x8b/0x170
   drm_dev_put+0x69/0x90
   drm_gpuvm_free+0xc2/0x2e0 [drm_gpuvm]
   drm_gpuvm_put+0x48/0x80 [drm_gpuvm]
   xe_ttm_bo_destroy+0xfa/0x320 [xe]
   ttm_bo_release+0x70/0x310 [ttm]
   ttm_bo_fini+0x3c/0x70 [ttm]
   xe_gem_object_free+0x1a/0x30 [xe]
   drm_gem_object_free+0x1d/0x40
   xe_bo_dev_work_func+0x3a/0x60 [xe]

TTM's delayed delete worker drains its own workqueue from
ttm_device_fini(), and xe_ttm_bo_destroy() then uses the freed
xe_device.

Take a device reference in xe_vm_free() and drop it at the end of
vm_destroy_work_func(), so a VM put never drops the last device
reference. Queue the destroy work on the module-lifetime xe_destroy_wq,
as xe->destroy_wq is destroyed by device teardown.

v2:
- Replace v1 with a single fix in xe_vm_free(), which also covers TTM
  delayed delete (Sashiko).
- Drop the xe_bo_dev_fini() inline free and the async free wq move
  (Sashiko).
- Add Fixes: c2d72717e0a9.


Fixes: c2d72717e0a9 ("drm/gpuvm: take refcount on DRM device")
Fixes: 0e33330f1238 ("drm/xe: Add struct xe_pt_job_ops")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index dd855876f571..bd589b1268eb 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2109,6 +2109,9 @@ static void vm_destroy_work_func(struct work_struct *w)
 		xe_file_put(vm->xef);
 
 	kfree(vm);
+
+	/* Pairs with xe_vm_free(), may run device teardown. */
+	drm_dev_put(&xe->drm);
 }
 
 static void xe_vm_free(struct drm_gpuvm *gpuvm)
@@ -2116,11 +2119,12 @@ static void xe_vm_free(struct drm_gpuvm *gpuvm)
 	struct xe_vm *vm = container_of(gpuvm, struct xe_vm, gpuvm);
 
 	/*
-	 * To destroy the VM we need to be able to sleep.
-	 * drm_gpuvm keeps at least one device reference at this
-	 * point so xe->destroy_wq must still be alive.
+	 * Destroy needs to sleep. Hold a device ref until it is done so a VM
+	 * put can't drop the last one, and use xe_destroy_wq since
+	 * xe->destroy_wq goes away with the device.
 	 */
-	queue_work(vm->xe->destroy_wq, &vm->destroy_work);
+	drm_dev_get(&vm->xe->drm);
+	xe_destroy_wq_queue(&vm->destroy_work);
 }
 
 struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
-- 
2.52.0

