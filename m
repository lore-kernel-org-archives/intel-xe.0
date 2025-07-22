Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048B8C83F34
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 13:09:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C218E10E684;
	Tue, 22 Jul 2025 13:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C2C7f8+R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0037D10E30C
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 13:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753189761; x=1784725761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+9oaIN7uU2v4Dqur3EU8IvOM4g0oU4ZNBr0j7fU9PGY=;
 b=C2C7f8+RAirOlEL7GSFt6YoKLjmYRsJhYahLLwQ7G0pbVW5xi7NdxNc8
 HCORf6pzkReF4+w5j9JxWpU9YXT1aaXkIJx6DtQ4i0y1fv0ztM5wxSwz1
 E/1lyU0xoJ/zQ5nbrTjgDSJDBks2EF1JSKJK/Jyykjk9blN/GAE8Z7BAK
 2lCEbUuc87z01MAYP+HHcAx4Tkl+iubka9d2ObzgiOpNERUNEnyAvbZjw
 8dgXHGmYP9QvITVnSZY2d2Bot+3vs1kEEPd73IDLGjWK4RXg1XM6FkLBd
 284uCug1p3K4MXGOeAo3oSiuiTRpah6F/g9VEsxvrN9NhvupGWijMvkL8 g==;
X-CSE-ConnectionGUID: 1/iv/zKlR3yU2IA/h5cRqw==
X-CSE-MsgGUID: bHY2RKOmS8uTwozUeJvwiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55530410"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="55530410"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 06:09:21 -0700
X-CSE-ConnectionGUID: Z4G1LbCGT0SOvwjocZ8aSw==
X-CSE-MsgGUID: d5AfBOpXRIi5SHDIsXAAkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="163420747"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa005.fm.intel.com with ESMTP; 22 Jul 2025 06:09:20 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 22/23] drm/xe: Enable madvise ioctl for xe
Date: Tue, 22 Jul 2025 19:05:25 +0530
Message-Id: <20250722133526.3550547-23-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
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
---
 drivers/gpu/drm/xe/xe_device.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 6dc84e4ed281..b02c4ae0fdbf 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -63,6 +63,7 @@
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
+#include "xe_vm_madvise.h"
 #include "xe_vram.h"
 #include "xe_vsec.h"
 #include "xe_wait_user_fence.h"
@@ -200,6 +201,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
 };
 
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
-- 
2.34.1

