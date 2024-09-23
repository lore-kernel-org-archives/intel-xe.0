Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBECCF9C69
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 12:58:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C3010E260;
	Mon, 23 Sep 2024 12:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LYvjGgQA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08D910E155
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Sep 2024 12:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727096328; x=1758632328;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7ngXVKCh1STEoKdjuAOoCj9RlsZ6ADtQyYwb6tD4Mbc=;
 b=LYvjGgQAG2SXOC/NAdpYWm6UXtd7UCMAoPdRVa9b8F6kbLOYyIhvjT7f
 dRbRUOu0vGfYPl5MIb59xfcSCHZBfJ34cmVncOswXfsCjlwW7/8Eue8tw
 Rqex0LcCs+yBDll5A227oFyK+GmbdnXGAt2zvUdksvZYCT8bZsVIu13Gc
 PuQktVszJSxBNVrPh6AP2d54CgGVluoTIIj45wNHzhJ1u1n1rs7ONLaXf
 O3Gqqizu0+ME7O2QbMBBDJI06QshNPjuFOZqzdhqq4sH6PUYJ4NpSE79e
 HSJL4Vq4FF2uOw1NFyMpkWiBxLjOe1j/aFgGUwQMACDcI3v8aQYScO3hl w==;
X-CSE-ConnectionGUID: UpQnvizBSU6UM0x44ngjsw==
X-CSE-MsgGUID: 4QNaQ4SdTh28nG8lSzw4kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26160078"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="26160078"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 05:58:48 -0700
X-CSE-ConnectionGUID: sT2NRJGUQ0aUlw57rsAdgA==
X-CSE-MsgGUID: OgUZrcsQQX2m+dweGYqBWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="101910403"
Received: from johunt-mobl9.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.234])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 05:58:46 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] drm/xe/vm: move xa_alloc to prevent UAF
Date: Mon, 23 Sep 2024 13:57:34 +0100
Message-ID: <20240923125733.62883-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.1
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

Evil user can guess the next id of the vm before the ioctl completes and
then call vm destroy ioctl to trigger UAF since create ioctl is still
referencing the same vm. Move the xa_alloc all the way to the end to
prevent this.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/xe/xe_vm.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a3d7cb7cfd22..f7182ef3d8e6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1765,12 +1765,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
-	mutex_lock(&xef->vm.lock);
-	err = xa_alloc(&xef->vm.xa, &id, vm, xa_limit_32b, GFP_KERNEL);
-	mutex_unlock(&xef->vm.lock);
-	if (err)
-		goto err_close_and_put;
-
 	if (xe->info.has_asid) {
 		down_write(&xe->usm.lock);
 		err = xa_alloc_cyclic(&xe->usm.asid_to_vm, &asid, vm,
@@ -1778,12 +1772,11 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 				      &xe->usm.next_asid, GFP_KERNEL);
 		up_write(&xe->usm.lock);
 		if (err < 0)
-			goto err_free_id;
+			goto err_close_and_put;
 
 		vm->usm.asid = asid;
 	}
 
-	args->vm_id = id;
 	vm->xef = xe_file_get(xef);
 
 	/* Record BO memory for VM pagetable created against client */
@@ -1796,12 +1789,17 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	args->reserved[0] = xe_bo_main_addr(vm->pt_root[0]->bo, XE_PAGE_SIZE);
 #endif
 
-	return 0;
-
-err_free_id:
+	/* user id alloc must always be last in ioctl to prevent UAF */
 	mutex_lock(&xef->vm.lock);
-	xa_erase(&xef->vm.xa, id);
+	err = xa_alloc(&xef->vm.xa, &id, vm, xa_limit_32b, GFP_KERNEL);
 	mutex_unlock(&xef->vm.lock);
+	if (err)
+		goto err_close_and_put;
+
+	args->vm_id = id;
+
+	return 0;
+
 err_close_and_put:
 	xe_vm_close_and_put(vm);
 
-- 
2.46.1

