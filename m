Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D626606A321
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 07:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gT8CoVGF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295FF10E72F;
	Fri, 13 Nov 2026 07:36:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24AB310E72F
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 07:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794555361; x=1826091361;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=XTHu7cAl0rd0djGNjzFFHr7fI76vNDUsSSOkAoFyMI8=;
 b=gT8CoVGFAw0EYCBYHPuOHTXCFBLaDvciz8jbw0FWuYAHuTLICYN+/qun
 m3wUpa8GAsiKuawIuyLGFVx7nYCNwY15cKTcZDX9BoLBwDCDH5FNbjI9Q
 L9kAl9znmGEfWr73ZBtyEWkiLrnwpqHPx245s+/8dbNYhuIwwi5VGgrvp
 Xo4EGUkLbfbA2LrfSxAMF7F4J9it8ANg/qG7NznW4sI2tGXSGsKnkuE6h
 xjkOsEG4sqdUNZm04uUsfJOWGCWMSqK9kbs4mu1jvXLNaeimQxXLR6i0G
 yNbrTGSdpuLmJxtm9IKa4i82oph5hbd9vugfaRIFfmnBReoSk9pDhLOV9 A==;
X-CSE-ConnectionGUID: QxtMujt0SG+Y8yUjcu7jQw==
X-CSE-MsgGUID: xdMB3bi4Si2sLUn9iGEJ8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3347932"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3347932"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 23:36:00 -0800
X-CSE-ConnectionGUID: xGgmzyX3Q3ewp+S6bywNgA==
X-CSE-MsgGUID: 7M6rJMQXRraI8Od0D9nZGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9030591"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 23:35:59 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 1/3] CI_ONLY: Hold a device reference across deferred VM
Date: Fri, 13 Nov 2026 13:05:47 +0530
Message-ID: <20261113073549.352746-2-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113073549.352746-1-arvind.yadav@intel.com>
References: <20261113073549.352746-1-arvind.yadav@intel.com>
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

v3:
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

