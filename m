Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3B2C3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 15:24:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAB210E2D4;
	Wed, 14 May 2025 15:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CzButDb2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3604210E2D4
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 15:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747236289; x=1778772289;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PlXXRGNWhnRk0Q1+rvXDWhWYp+c8A0DvTO0vjnUxWk0=;
 b=CzButDb2K1d9W1Sy7cSF1xKIgR3UfzLt7yeAVu5Q5npWFBFanzoQQAES
 5kIVPeUoITxB3uCMdVHII3FQeKmKvg7MPvR/HxBg0+B8NKLRkzx34XDPw
 eKdENgTav4psqrLGm+DOlV7I7614uMsmKhkaPP5swnbFFxPeDd3LCQi0A
 SeVwPgppDXmeip6IFc/7ofKm1x2FPwL95KKmG6heN78XCwMSZ2zk7WIY1
 m6juw7vuxeA2QfcfDL8Lb9zaY264NGALQYJLuwDSV1udaGoLebGx4ZNWj
 Y+8SViVHG3YsQvRMR+H2c1TN1enVfzKsk6LsEYDDBTukIeJO7evPUZPo0 A==;
X-CSE-ConnectionGUID: Ol5QnAm8S6mU2yGVzr09Vg==
X-CSE-MsgGUID: DfJC6LnlR/SfXQ3+7c3NQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="60149647"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="60149647"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 08:24:49 -0700
X-CSE-ConnectionGUID: 0FojRwz4S1ekR4xjmPjmjA==
X-CSE-MsgGUID: 6XIXT2SYTry+xxDwiCnFJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="137949219"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.203])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 08:24:48 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/2] drm/xe/vm: move xe_svm_init() earlier
Date: Wed, 14 May 2025 16:24:26 +0100
Message-ID: <20250514152424.149591-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514152424.149591-3-matthew.auld@intel.com>
References: <20250514152424.149591-3-matthew.auld@intel.com>
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

In xe_vm_close_and_put() we need to be able to call xe_svm_fini(),
however during vm creation we can call this on the error path, before
having actually initialised the svm state, leading to various splats
followed by a fatal NPD.

Fixes: 6fd979c2f331 ("drm/xe: Add SVM init / close / fini to faulting VMs")
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4967
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 168756fb140b..7140d8856bad 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1709,10 +1709,16 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		xe_pm_runtime_get_noresume(xe);
 	}
 
+	if (flags & XE_VM_FLAG_FAULT_MODE) {
+		err = xe_svm_init(vm);
+		if (err)
+			goto err_no_resv;
+	}
+
 	vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
 	if (!vm_resv_obj) {
 		err = -ENOMEM;
-		goto err_no_resv;
+		goto err_svm_fini;
 	}
 
 	drm_gpuvm_init(&vm->gpuvm, "Xe VM", DRM_GPUVM_RESV_PROTECTED, &xe->drm,
@@ -1783,12 +1789,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		}
 	}
 
-	if (flags & XE_VM_FLAG_FAULT_MODE) {
-		err = xe_svm_init(vm);
-		if (err)
-			goto err_close;
-	}
-
 	if (number_tiles > 1)
 		vm->composite_fence_ctx = dma_fence_context_alloc(1);
 
@@ -1802,6 +1802,11 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	xe_vm_close_and_put(vm);
 	return ERR_PTR(err);
 
+err_svm_fini:
+	if (flags & XE_VM_FLAG_FAULT_MODE) {
+		vm->size = 0; /* close the vm */
+		xe_svm_fini(vm);
+	}
 err_no_resv:
 	mutex_destroy(&vm->snap_mutex);
 	for_each_tile(tile, xe, id)
-- 
2.49.0

