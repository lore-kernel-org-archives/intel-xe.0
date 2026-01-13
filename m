Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0337BD31883
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A40F10E58C;
	Tue, 13 Jan 2026 23:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aHeSrjZ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD0010E56F
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345422; x=1799881422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TJUWHSZLOhJHW9x7q8FBd+tz8AVUREktto5QlRPp0zM=;
 b=aHeSrjZ5i+dkJfxJP0+tvlzJFDbd81acVFFSdxuo5vcMOLPacfW5POlL
 e6baxl3cidYEV9t2cQKOZEoT/tRTEvmZeRhzsA9Rww1EjtJhRMZVRITTG
 gqU0WSuui/WxAc+P4MD6O++J+dfeTTIhzdUgfpa290mX8hDwTvUD2IVHt
 NaYA915Ofbu0i+QSU2OicWyUVNjZtG3qK5zKkj6cabJFCrsGvV2FZ18+y
 SFDKndl79PBTj+kuFKggTUV1+x1IeaOZiqL7GlIZkmBTzKtGIGhsdJWr3
 Xu+6Vjux45/3TleatC6LVUk3OdvC8Ejp9vMarV8Xfo5JCvz6dux5qbXyN Q==;
X-CSE-ConnectionGUID: 0Umvje2XR9G2X9C9BZ2NAQ==
X-CSE-MsgGUID: NG+rCKmSSu235PM/nfDp+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311151"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311151"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:41 -0800
X-CSE-ConnectionGUID: 2k8gmAEuQyKtbA8AXO2zIA==
X-CSE-MsgGUID: 7kdkgeiUSRq9COY2JWVZzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147406"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 46/79] drm/xe: Simplify include in xe_module.c
Date: Tue, 13 Jan 2026 15:03:51 -0800
Message-ID: <20260113230315.3081153-127-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113230315.3081153-81-matthew.d.roper@intel.com>
References: <20260113230315.3081153-81-matthew.d.roper@intel.com>
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

xe_module.c only needs the device types header and doesn't use anything
from the main device header.  Replace the include of xe_device.h with
xe_device_types.h.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 9934f90691fd..a0048f64ed12 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -10,7 +10,7 @@
 
 #include <drm/drm_module.h>
 
-#include "xe_device.h"
+#include "xe_device_types.h"
 #include "xe_drv.h"
 #include "xe_configfs.h"
 #include "xe_hw_fence.h"
-- 
2.52.0

