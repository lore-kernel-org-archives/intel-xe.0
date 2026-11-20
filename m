Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865BC60A260B
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 13:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mpBv67NA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA2B112A14;
	Fri, 20 Nov 2026 13:03:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58FA112A17
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 13:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795179810; x=1826715810;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=FxLqy8reenhAN8LERTMKP2FqbTjtdcRyXt/ux0hg/aY=;
 b=mpBv67NAggJYt854Q3/QE3nydj6287iaf9vUaDNdbXzmtN4GJSfWmvXO
 8C08mfxjEajm0n59k8YONDF5qBp7aUf2y3Kps0OJTVkqG09d1+Q7fHeka
 JS7oZc+vGbYvmaQkt/OHR2EuyPNCP2Le+ptzUa9+49CzfSsDWQvZn9gHJ
 FkFpjZBU2WMoEUNr5TMxTHSxzLAGJkz4ptF2u5YMz2804kGazBrzYQ6/9
 HBaY1c6tjjQ5zuYMEcKBtDCtZ/cRDskAuhRJpRBd0DVrvw01hdnSK5LWV
 lwpVuSPVcE4jWgSas+EUExzlsCaecUhXB5CocLqRELIzkPij4ceNFuAlL w==;
X-CSE-ConnectionGUID: Vh6gpMkOSmSCCmWgJrJ8IQ==
X-CSE-MsgGUID: 0A5jvFchQa23Es3yRciqBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4072689"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4072689"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 05:03:29 -0800
X-CSE-ConnectionGUID: mPNJESyHQXeGYosL2eCSJQ==
X-CSE-MsgGUID: T4qjuJ8rTvOE5frQbauvTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10639269"
Received: from slindbla-desk.ger.corp.intel.com (HELO [192.168.0.182])
 ([10.245.244.23])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 05:03:28 -0800
From: Matthew Auld <matthew.auld@intel.com>
Date: Fri, 20 Nov 2026 13:02:21 +0000
Subject: [PATCH v2 6/6] drm/xe: run compute rebind worker on device NUMA node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261120-userptr-repin-v2-6-65e1f6e582ef@intel.com>
References: <20261120-userptr-repin-v2-0-65e1f6e582ef@intel.com>
In-Reply-To: <20261120-userptr-repin-v2-0-65e1f6e582ef@intel.com>
To: Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, 
 Stuart Summers <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
X-Mailer: b4 0.14.3
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

preempt_rebind_work_func() currently runs on xe->ordered_wq, whose
unbound worker pool spans all NUMA nodes. On multi-socket systems, if
the rebind worker runs on a remote socket when faulting userptr pages
marked PROT_NONE by AutoNUMA, hmm_range_fault() invokes do_numa_page()
using the worker's NUMA node and triggers migrate_misplaced_folio(),
pulling pages away from the GPU's local node and causing self-inflicted
MMU notifier invalidations.

Historically, xe->ordered_wq also serialised compute VM rebinds across
the device to avoid eviction ping-pong, which should no longer be
necessary since commit 8f25e5abcbfb ("drm/xe: Convert existing drm_exec
transactions for exhaustive eviction") serialises OOM eviction via
xe_validation_ctx.

Move vm->preempt.rebind_work onto a dedicated WQ_UNBOUND workqueue
queued via queue_work_node() with dev_to_node(), leaving user-fence
signalling on xe->ordered_wq.

v2 (Thomas):
 - Drop the whole 1-at-a-time ordered wq requirement for the worker.
 - Move the rebind destroy before destroy_wq; much safer.

Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 7 ++++++-
 drivers/gpu/drm/xe/xe_device_types.h | 6 +++++-
 drivers/gpu/drm/xe/xe_vm.c           | 2 +-
 drivers/gpu/drm/xe/xe_vm.h           | 6 +++++-
 4 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f0c88d3297f9..8dfc8ef9dbd7 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -10,6 +10,7 @@
 #include <linux/error-injection.h>
 #include <linux/nodemask.h>
 #include <linux/units.h>
+#include <linux/workqueue.h>
 
 #include <drm/drm_client.h>
 #include <drm/drm_gem_ttm_helper.h>
@@ -390,6 +391,9 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	if (xe->preempt_fence_wq)
 		destroy_workqueue(xe->preempt_fence_wq);
 
+	if (xe->rebind_wq)
+		destroy_workqueue(xe->rebind_wq);
+
 	if (xe->ordered_wq)
 		destroy_workqueue(xe->ordered_wq);
 
@@ -523,10 +527,11 @@ int xe_device_init_early(struct xe_device *xe)
 
 	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq",
 						       WQ_MEM_RECLAIM);
+	xe->rebind_wq = alloc_workqueue("xe-rebind-wq", WQ_UNBOUND, 0);
 	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
 	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", WQ_PERCPU, 0);
 	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", WQ_PERCPU | WQ_MEM_RECLAIM, 0);
-	if (!xe->ordered_wq || !xe->unordered_wq ||
+	if (!xe->ordered_wq || !xe->unordered_wq || !xe->rebind_wq ||
 	    !xe->preempt_fence_wq || !xe->destroy_wq) {
 		/*
 		 * Cleanup done in xe_device_destroy via
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index fc80cd2c766e..778cc1c9b39a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -7,6 +7,7 @@
 #define _XE_DEVICE_TYPES_H_
 
 #include <linux/pci.h>
+#include <linux/workqueue.h>
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
@@ -375,7 +376,10 @@ struct xe_device {
 	/** @preempt_fence_wq: used to serialize preempt fences */
 	struct workqueue_struct *preempt_fence_wq;
 
-	/** @ordered_wq: used to serialize compute mode resume */
+	/** @rebind_wq: used to run compute mode rebind work on device node */
+	struct workqueue_struct *rebind_wq;
+
+	/** @ordered_wq: used to serialize ordered work */
 	struct workqueue_struct *ordered_wq;
 
 	/** @unordered_wq: used to serialize unordered work */
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0c5121361f8e..ab138d495f3f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -540,7 +540,7 @@ static bool vm_suspend_rebind_worker(struct xe_vm *vm)
  */
 void xe_vm_resume_rebind_worker(struct xe_vm *vm)
 {
-	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
+	xe_vm_queue_rebind_worker(vm);
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index b1c5f940bcc5..ed590bad892c 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -6,6 +6,9 @@
 #ifndef _XE_VM_H_
 #define _XE_VM_H_
 
+#include <linux/device.h>
+#include <linux/workqueue.h>
+
 #include "xe_assert.h"
 #include "xe_bo_types.h"
 #include "xe_macros.h"
@@ -259,7 +262,8 @@ int xe_vm_validate_protected(struct xe_vm *vm);
 static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
 {
 	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
-	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
+	queue_work_node(dev_to_node(vm->xe->drm.dev), vm->xe->rebind_wq,
+			&vm->preempt.rebind_work);
 }
 
 /**

-- 
2.56.1

