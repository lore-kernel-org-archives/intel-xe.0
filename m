Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216AAC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 04:25:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02A310F26B;
	Wed, 24 Apr 2024 04:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JPcyCELH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89EC510F26B
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 04:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713932713; x=1745468713;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6+RRZk4PTsCHlYGbcBD+toV0D+kipZnEIPXxM+lao+c=;
 b=JPcyCELH9e5NEkwCwuHmjwQPr2p8zMe/T1RGI36dd44UKiWmj2rGCR++
 NPEHSD2NtSBz3Wxs6ZcooRpGV96DFt0/eeONGku5gCCcYBEgG3wDvx5au
 uftcFmYu3LdtpMvjl8n0Q8itxatw+dblk2UbXvs3XlyjRWFqzVpsDadK1
 zKpVCthPgqKvcA2ECnCZMP4ZTVjUuod9QEnvz3ISQJ722fJasfFd3wMk2
 eaLBTUgt/bMrMRcFby/ZoNj3On46kGTcEDJ0usEXjE2T3deZzOay2fV4Z
 jc6LYSqZE+edMlv7pzWNt3brC/7M+vKR3ujeRT6Kj5LiMGvVptzDPXKIF w==;
X-CSE-ConnectionGUID: QP8svJb0RqmCvXuu3J2xkQ==
X-CSE-MsgGUID: 04sXZRURRWG0Q+wqInmFAg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13334205"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="13334205"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 21:25:12 -0700
X-CSE-ConnectionGUID: 9pBNmRSgSlCbHTLxtdZGdg==
X-CSE-MsgGUID: zvCcN2JVQnuQbrGUWAkewQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="29222126"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa003.jf.intel.com with ESMTP; 23 Apr 2024 21:25:11 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH v3 1/2] drm/xe/vm: Use xe_vm_lock()/xe_vm_unlock() helpers
Date: Wed, 24 Apr 2024 10:09:09 +0530
Message-Id: <20240424043910.2190376-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240424043910.2190376-1-himal.prasad.ghimiray@intel.com>
References: <20240424043910.2190376-1-himal.prasad.ghimiray@intel.com>
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

There is no change in functionality. Using the helper function
defined within the driver.

-v2
Use xe_vm_unlock() (Ashutosh/Matt)

-v3
Use xe_vm_unlock() for error label too (Matt)

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 85d6f359142d..5c9d48203d73 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1279,7 +1279,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	drm_gem_object_put(vm_resv_obj);
 
-	err = dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
+	err = xe_vm_lock(vm, true);
 	if (err)
 		goto err_close;
 
@@ -1323,7 +1323,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 		xe_pt_populate_empty(tile, vm, vm->pt_root[id]);
 	}
-	dma_resv_unlock(xe_vm_resv(vm));
+	xe_vm_unlock(vm);
 
 	/* Kernel migration VM shouldn't have a circular loop.. */
 	if (!(flags & XE_VM_FLAG_MIGRATION)) {
@@ -1365,7 +1365,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	return vm;
 
 err_unlock_close:
-	dma_resv_unlock(xe_vm_resv(vm));
+	xe_vm_unlock(vm);
 err_close:
 	xe_vm_close_and_put(vm);
 	return ERR_PTR(err);
-- 
2.25.1

