Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A041606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 23:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lquk7GJa
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C754810E4EF;
	Mon, 19 Oct 2026 23:01:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3238310E4EF
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 23:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792450913; x=1823986913;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZJypgauNVpw4NiBBFdx6yV3Eu/iUywI09A2PHcSoM0Q=;
 b=Lquk7GJayALl1iroMfSDFP3q0dtQaNiPj0msvOlCHry1xjY8/nO8oXMi
 fEhMRKzyu09WTljvk4u2kjfltc2lrZqo0KE2nHgRM8qutyFGrR2PE+cMl
 3GIIhQhLz1eL2GkVO9KVvwhzBVGtMoszxTLMMICTgUKRfkTz7WjJGb7FK
 oT56fxZUW25ZCOpmt5fHTJdqikPRuLO7/eYm/40qDMREfzKnlHC59Px2J
 bcdotcr5w5wMEcccyhRdc2WjFlw8IybGYTVsIXpD1rnwh7eBzP5hpt14m
 VKYXguWNZJwDsbYwbT2eRoiS/74SI1wIXdYplZ/wYViNpF1DM+70iFcpZ w==;
X-CSE-ConnectionGUID: W5A7LcThTmGI3zxrIQ24QA==
X-CSE-MsgGUID: R/dwqK+aTn+uzHqrWxOcoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1159259"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1159259"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 16:01:53 -0700
X-CSE-ConnectionGUID: HRTJ9X08Rg6kVQThmR72Zw==
X-CSE-MsgGUID: vh0QurVuTRicMEeyqpm0HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2607759"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.38])
 by orviesa005.jf.intel.com with ESMTP; 19 Oct 2026 16:01:53 -0700
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Jia Yao <jia.yao@intel.com>
Subject: [PATCH] drm/xe: Use a dedicated workqueue for VM rebinds
Date: Mon, 19 Oct 2026 23:01:42 +0000
Message-ID: <20261019230142.1112281-1-jia.yao@intel.com>
X-Mailer: git-send-email 2.43.0
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

VM rebind workers may block while handling HMM faults or waiting for VM
fences. Running them on ordered_wq can stall user-fence notifications
and VM TLB timeout work queued behind them, preventing forward progress.

Move rebind workers to a dedicated ordered workqueue. This keeps rebinds
serialized across VMs while allowing fence-related work to run
independently.

Signed-off-by: Jia Yao <jia.yao@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 12 +++++++++++-
 drivers/gpu/drm/xe/xe_device_types.h |  5 ++++-
 drivers/gpu/drm/xe/xe_vm.c           |  2 +-
 drivers/gpu/drm/xe/xe_vm.h           |  2 +-
 4 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index db0b883322ef..f1dd4b7842a9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -385,6 +385,9 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	if (xe->preempt_fence_wq)
 		destroy_workqueue(xe->preempt_fence_wq);
 
+	if (xe->rebind_wq)
+		destroy_workqueue(xe->rebind_wq);
+
 	if (xe->ordered_wq)
 		destroy_workqueue(xe->ordered_wq);
 
@@ -515,9 +518,16 @@ int xe_device_init_early(struct xe_device *xe)
 	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq",
 						       WQ_MEM_RECLAIM);
 	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
+	/*
+	 * Rebinding can block in HMM or wait for VM fences. Keep it off the
+	 * queue serving user-fence notifications and VM TLB fence timeouts,
+	 * which must be able to make progress while a rebind is waiting.
+	 * Preserve serialization between rebind workers on different VMs.
+	 */
+	xe->rebind_wq = alloc_ordered_workqueue("xe-rebind-wq", 0);
 	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", WQ_PERCPU, 0);
 	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", WQ_PERCPU | WQ_MEM_RECLAIM, 0);
-	if (!xe->ordered_wq || !xe->unordered_wq ||
+	if (!xe->ordered_wq || !xe->rebind_wq || !xe->unordered_wq ||
 	    !xe->preempt_fence_wq || !xe->destroy_wq) {
 		/*
 		 * Cleanup done in xe_device_destroy via
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 5553415afeaf..705c487e3c6f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -387,9 +387,12 @@ struct xe_device {
 	/** @preempt_fence_wq: used to serialize preempt fences */
 	struct workqueue_struct *preempt_fence_wq;
 
-	/** @ordered_wq: used to serialize compute mode resume */
+	/** @ordered_wq: ordered user-fence and VM TLB timeout work */
 	struct workqueue_struct *ordered_wq;
 
+	/** @rebind_wq: serializes compute mode rebinds and resume */
+	struct workqueue_struct *rebind_wq;
+
 	/** @unordered_wq: used to serialize unordered work */
 	struct workqueue_struct *unordered_wq;
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e7f421a43516..88b4f6b19fdd 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -501,7 +501,7 @@ static bool vm_suspend_rebind_worker(struct xe_vm *vm)
  */
 void xe_vm_resume_rebind_worker(struct xe_vm *vm)
 {
-	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
+	xe_vm_queue_rebind_worker(vm);
 }
 
 static void preempt_rebind_work_func(struct work_struct *w)
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 06138c3c4315..25c8760e2392 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -259,7 +259,7 @@ int xe_vm_validate_protected(struct xe_vm *vm);
 static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
 {
 	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
-	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
+	queue_work(vm->xe->rebind_wq, &vm->preempt.rebind_work);
 }
 
 /**
-- 
2.43.0

