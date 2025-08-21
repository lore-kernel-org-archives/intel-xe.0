Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5D9CA0EFA
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 17:04:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A16A10E38D;
	Thu, 21 Aug 2025 17:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cbheuFyy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A944410E38E
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 17:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755795855; x=1787331855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2Ra1pdmavHgCu4saErHTAMfvY3Rl5+uClEApyGcmG+Q=;
 b=cbheuFyyYwDdO6THOlkd326xbzOzbbc5n1KA83QplxD+BR5H9Jir/MCp
 c7dIkacT43Z2c4pLMb86P3XtFhIoIfwi8SIxItDFbtvxTR06iL1MbT4Zw
 jMLNvUXquGVdHk9jKGCc2a5Ruz0bCKy0UG/SXz42v+C7ayeH/HtaQ6XQh
 FYUTi1qaqVOx+L3t3ZFQezN0mTeIGvDWjy0wxxbpAhGrEfvSXBjN5tSqA
 a80dps6UvlLR0UnCHv90NJ/J7BamPkhOjaar/WUmKEI/sa33PXJsI/DzV
 zL3fHA879AfRon9/98Ymjf+6TkDsjF7Roc+DbRDkbY3gRpVpb3D2wbP05 Q==;
X-CSE-ConnectionGUID: Mfvi5vPNSZyFD7lraEjBHg==
X-CSE-MsgGUID: zw8lVJ7DQ4a+arqHRHtPIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57805869"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="57805869"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 10:04:15 -0700
X-CSE-ConnectionGUID: j9sQVg4+Te2fvxFFt7qKcw==
X-CSE-MsgGUID: 5qhhlQhoSnyf9LQwuZ4onA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="192143935"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 21 Aug 2025 10:04:14 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v9 19/20] drm/xe: Enable madvise ioctl for xe
Date: Thu, 21 Aug 2025 23:01:03 +0530
Message-Id: <20250821173104.3030148-20-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250821173104.3030148-1-himal.prasad.ghimiray@intel.com>
References: <20250821173104.3030148-1-himal.prasad.ghimiray@intel.com>
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

Ioctl enables setting up of memory attributes in user provided range.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 3e0402dff423..98a368a979eb 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -63,6 +63,7 @@
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
+#include "xe_vm_madvise.h"
 #include "xe_vram.h"
 #include "xe_vram_types.h"
 #include "xe_vsec.h"
@@ -201,6 +202,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
 };
 
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
-- 
2.34.1

