Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D16A606A329
	for <intel-xe@archiver.kernel.org>; Sat, 14 Nov 2026 08:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bh9f/WDf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D657E10E22D;
	Sat, 14 Nov 2026 08:39:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F278610E22D
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Nov 2026 08:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794645555; x=1826181555;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=wh0AityHE5DOgLh5UvzOLgH8/6N5eVo3X+tWJ2ETplU=;
 b=Bh9f/WDfsWyIlShn2FL9iv2wyhSV4KLFrYE0dJU6ETlUqHtVg3o6SFJT
 fXVcAsvf5gUPunAVf3pUPMmw9HlVNTAeTGGEr0lUopFDzWDr36jkizBVG
 AJLJ/YwMNUT0s8ICqSD/qKLwfUDOdju7tTnS91wX27xqWU8fz0NYN3XG+
 gUx+v3W/PitAWsS6lN2auAq+dCuMUUAynzriZA0P9epD5Sd68Nk5Os6K+
 e9A803aT9tHCPRVYbAVo7BSK5rUghIuIX578vjjA30I3L6VLmWZOgvXPD
 g4qtdTgvidaRZEgHQIyYk9YQjQLFT1bIFsSHkgigTQm9wFJM5Dpr2L4H+ g==;
X-CSE-ConnectionGUID: 30Jg2xQgS9KB30qAzniSgg==
X-CSE-MsgGUID: hCY9lwn7S9WYAG2XlEp0wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3527292"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3527292"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2026 00:39:13 -0800
X-CSE-ConnectionGUID: uk6pufy8RVC9mNzs3R6NSA==
X-CSE-MsgGUID: Gzm8gkwjT/i1OI58qPPfuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="9291398"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2026 00:39:13 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 1/3] CI_ONLY: Hold a device reference across deferred VM
Date: Sat, 14 Nov 2026 14:08:56 +0530
Message-ID: <20261114083859.1007095-2-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114083859.1007095-1-arvind.yadav@intel.com>
References: <20261114083859.1007095-1-arvind.yadav@intel.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

xe_vm_free() queues vm_destroy_work_func() and returns.
drm_gpuvm_free() then drops its device reference, but the worker
still accesses device state while finishing VM destruction.

Take a device reference before queueing the work and release it
after the worker has finished using the device.

Run the worker on the module-lifetime destroy workqueue. Releasing
the last device reference can call xe_device_destroy(), which drains
xe->destroy_wq. Running on that per-device workqueue would make the
worker wait for itself.

v2:
- Move final VM destruction to the module-lifetime destroy workqueue
  in this patch to avoid self-deadlock on the last device put. (Sashiko)

Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index dd855876f571..12afb3363e79 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2109,6 +2109,8 @@ static void vm_destroy_work_func(struct work_struct *w)
 		xe_file_put(vm->xef);
 
 	kfree(vm);
+
+	drm_dev_put(&xe->drm);
 }
 
 static void xe_vm_free(struct drm_gpuvm *gpuvm)
@@ -2116,11 +2118,18 @@ static void xe_vm_free(struct drm_gpuvm *gpuvm)
 	struct xe_vm *vm = container_of(gpuvm, struct xe_vm, gpuvm);
 
 	/*
-	 * To destroy the VM we need to be able to sleep.
-	 * drm_gpuvm keeps at least one device reference at this
-	 * point so xe->destroy_wq must still be alive.
+	 * drm_gpuvm drops its device reference as soon as this callback
+	 * returns, but vm_destroy_work_func() still uses device state. Hold a
+	 * reference across the deferred work.
+	 */
+	drm_dev_get(&vm->xe->drm);
+
+	/*
+	 * The worker may release the last device reference. Use the
+	 * module-lifetime workqueue so device destruction cannot drain
+	 * the workqueue running this worker.
 	 */
-	queue_work(vm->xe->destroy_wq, &vm->destroy_work);
+	xe_destroy_wq_queue(&vm->destroy_work);
 }
 
 struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
-- 
2.43.0

