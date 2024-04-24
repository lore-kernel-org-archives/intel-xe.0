Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C530C10F1A
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 03:44:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17EDD10FB84;
	Wed, 24 Apr 2024 03:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gPs9WPhW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1014D10FB47
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 03:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713930239; x=1745466239;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nclnakHG6MgXVOUqWXyz4fGzS7cM311L5KyKPmCyLrQ=;
 b=gPs9WPhWEu24B/IJCwMzlp5BExQHNdvOVe/AhabdcUaa+hu8VjyvKgrm
 xu/ju+xRrk8rwbFXP0cqMipOCe0sgtNGhYE8i39kz1d2zcGOsEjcBPun6
 ymna7kARtrDVZs2j0TKMCA+sVMxhp/dZjZFiqaY4TI/Ki25tTt3v5rQbk
 LChxitQgGWWIYY2VnMj8qnC7bUri0oegnqSlBYvVHB8SOuc4WwHv3S9In
 Sso3lDoFqK0LB6Z2NHXuQkuYQWrA28eJiGo1/abi4t5WOkG2QHWfORQW7
 jRbmz2cDK4IiIxAu+J9vReSMR/1l6bCHhjMFvf7gsI6x38HfYrBx6s4w/ A==;
X-CSE-ConnectionGUID: ceKw4ugXSnytAw0BNkcBDA==
X-CSE-MsgGUID: ro+6F1hPQJKFiu89mUuyPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9371048"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9371048"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 20:43:59 -0700
X-CSE-ConnectionGUID: ybULjRklReC2rm+/rMfaTQ==
X-CSE-MsgGUID: G5aBArPNT2+kIuqCz4jZ9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="25089190"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa007.jf.intel.com with ESMTP; 23 Apr 2024 20:43:57 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 1/2] drm/xe/vm: Use xe_vm_lock()/xe_vm_unlock() helpers
Date: Wed, 24 Apr 2024 09:27:55 +0530
Message-Id: <20240424035756.2169209-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240424035756.2169209-1-himal.prasad.ghimiray@intel.com>
References: <20240424035756.2169209-1-himal.prasad.ghimiray@intel.com>
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

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 85d6f359142d..c350c561e7d9 100644
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
-- 
2.25.1

