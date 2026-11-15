Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED31606A31F
	for <intel-xe@archiver.kernel.org>; Sun, 15 Nov 2026 08:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JaXdbIdw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 783B310E1D1;
	Sun, 15 Nov 2026 08:55:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC2210E1BA
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Nov 2026 08:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794732950; x=1826268950;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=tNsJhT+PTWyeKNfB6Uw5B6Ycv0atPLREpEYZoIWs6tU=;
 b=JaXdbIdwthyVjgU39lmkQdFELPGBEHiGzJgm88WZhvapVE5AASi3Md50
 bCHAB3wIPHOC0agNQI9yvKD2EV824osW/JiaidjKp2sUWVEM4Ufx69Ief
 1xqfpkVDexDV4xt5qfjOHS0Fh9OncQ98rEYbt5CbSLfJcNiJFNtDLa2t0
 L0njvf3WpS+3QmVBpRLRLdN+5/5pMHd6IpFmFI96VsHSDrt8s9KTCgv7R
 wFURx3/DjfbydK0ap97/afBlxPgIXwbjxndho3geC3peIGdryfvNkFm8M
 cv+RF3GLALAjNZf1Gh5hJEu7i4uT1XSpCE+KBMa0h5AYcqO9yLAmBeVh+ g==;
X-CSE-ConnectionGUID: 50hmLX8rSTyEZtrmsCb9Ag==
X-CSE-MsgGUID: cXkHcbi+TlmfktAm0cCmIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3496478"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3496478"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 00:55:49 -0800
X-CSE-ConnectionGUID: APsDtEaOSaWi+TVkDD2rEA==
X-CSE-MsgGUID: ildXNorZRyKCixO0rluM9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9306637"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 00:55:48 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 1/3] CI-ONLY Hold a device reference across deferred VM
 destruction
Date: Sun, 15 Nov 2026 14:25:16 +0530
Message-ID: <20261115085518.1135138-2-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115085518.1135138-1-arvind.yadav@intel.com>
References: <20261115085518.1135138-1-arvind.yadav@intel.com>
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

Fixes: 61e18525023a ("drm/xe: Route deferred xe_vma/xe_vm teardown off system_dfl_wq")
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

