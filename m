Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E23C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 03:31:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DFB10FA66;
	Wed, 24 Apr 2024 03:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WGmJ+Uni";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6460410FA77
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 03:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713929482; x=1745465482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NWXicp+Xva8CEUdfhbn3h5UcGDI6MmFoHGpG9wlkVVg=;
 b=WGmJ+Uni5czo+T9cepcE6JbGEj4HVhEn4J+xbmSRSsuYzodgDkJ448Yy
 JHw2geks1gJ1Y3rhnu6hsZgYALvH9ICjzb53CBczduPYdnQk+ggNw4eND
 QUvIGKA0QN8lp+af1kAfN72pT40/LYJNH+nVQh8bYxyFLx2C7a8WtfiZ5
 yFto5HrVyNFWrId2AjLOYAIvwzR8iKE0ILVjRT6o9ZKZD+ICDqxBDDNNR
 QJ4grDmA1dQhST/Fl9QRqrmmbduTNrxlSY7I9VhLcuDCWMX9Mavc1bX3d
 bMZukqp3ITHRQc2kSPJ7rslWR3P6rEZ4MGVqzVufI/RO9L+w7jJnA4L9O g==;
X-CSE-ConnectionGUID: ThyZJYTtTt6y75ch5x+SZQ==
X-CSE-MsgGUID: 8Evp5K52RZu9Mw+PedA++w==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9408520"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9408520"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 20:31:22 -0700
X-CSE-ConnectionGUID: VzwRulIWRBS7yn3yG8R4sA==
X-CSE-MsgGUID: Stj9oKPTRmyod3/riOHbIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="24605682"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa006.fm.intel.com with ESMTP; 23 Apr 2024 20:31:18 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH v2 1/2] drm/xe/vm: Use xe_vm_lock()/xe_vm_unlock() helpers
Date: Wed, 24 Apr 2024 09:15:14 +0530
Message-Id: <20240424034515.2161938-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240424034515.2161938-1-himal.prasad.ghimiray@intel.com>
References: <20240424034515.2161938-1-himal.prasad.ghimiray@intel.com>
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

