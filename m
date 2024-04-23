Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79237C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 06:49:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5BE113159;
	Tue, 23 Apr 2024 06:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CvpwMvlD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBFAD113159
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 06:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713854982; x=1745390982;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bJ3MUYxDzkTvu9EtVeJaiIN404doR4LMmCUwqeZnErI=;
 b=CvpwMvlD1PRf86xzHEMm8m7Azv2UMeEZJtubfs46xJyn2L6OiETb4ylP
 dASnP6zM0tJD+dVQETGT0djXIkbo7TnkQghFRHpMIfCAnt5mEmObhPWA0
 cXWKTMTCNrHdZ26ks/6MomSza+bCFf38SCmv5S8MWHK+ITNYCJJz+aqGa
 nAGfF3iL0BD1ttZyNR72AMlMqPlD7Uv3ydvvYKoNsUI/Jv6cTWIOw3f24
 seo8zzJNKLq1q9B1WvFnsVQOD9Jb+iWmpfH8ZIZG7tKvuzXaxwbnxLMCl
 9We/sB3Hv9FTZXX3N0rRT3UZe/7mrVMUvghTXZt14kwvW+mPEqaIiO59+ w==;
X-CSE-ConnectionGUID: 66mzGcUDTWuxbSNl4kXNjg==
X-CSE-MsgGUID: okiqVE/5QC2vuN7e0tq9wg==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20034375"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="20034375"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 23:49:41 -0700
X-CSE-ConnectionGUID: fsvnqtWeSO+IizooQgzFIw==
X-CSE-MsgGUID: v5v1hRA+Q56yiJ8hCenVBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="28776913"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa003.fm.intel.com with ESMTP; 22 Apr 2024 23:49:36 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/vm: Use xe_vm_lock() helper for locking
Date: Tue, 23 Apr 2024 12:33:32 +0530
Message-Id: <20240423070332.2036539-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
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

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 85d6f359142d..e9c8dc6d7b83 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1279,7 +1279,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	drm_gem_object_put(vm_resv_obj);
 
-	err = dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
+	err = xe_vm_lock(vm, true);
 	if (err)
 		goto err_close;
 
-- 
2.25.1

