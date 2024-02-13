Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AC7C4829A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 15:44:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD3910E7EB;
	Tue, 13 Feb 2024 15:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G1A5iaXS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4B910E7CF
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 15:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707839054; x=1739375054;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=JngWwgTr9RDIuh3163XZ1e7K7o+R7UX8xWuuQwf7Rwg=;
 b=G1A5iaXSwRTyE7snK80s8CnpZKMP6KLphjKCU1/ygmNMFKDG4cjCUznP
 5BWqARFP7SKIxktEyUdZ/p88PkHx4/SKE9P/6DBmHTEzpy6xcL2V8jBxY
 0RFqDkaA8yIv6LSKO2f03WtM9jv69YEe6Oh9bKT7M1JTVx2KlNzCRmzfN
 x1XuqGLsPMi56CAMs6nt370M7/+TLV4lh1P3dAbEN+jL40wNuR6/9IKWL
 IzJg+tl1sF5QV5CQmWnttngPv3C4tcJip54XEXa+SIqE5gGotaMYf9zoT
 azvHK0AvwxEoDAOvmf9Q/pCj0rZ21VrxiyUKKvJiov1+Q+Hp0rZvjL8bM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="19262920"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; d="scan'208";a="19262920"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 07:44:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="7564498"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.153.144])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 07:44:13 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 3/8] drm/xe/vf: Don't program MOCS if VF
Date: Tue, 13 Feb 2024 16:43:50 +0100
Message-Id: <20240213154355.1221-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240213154355.1221-1-michal.wajdeczko@intel.com>
References: <20240213154355.1221-1-michal.wajdeczko@intel.com>
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

MOCS programming may only be done by the PF driver.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index d205d684d809..609d997b3e9b 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -13,6 +13,7 @@
 #include "xe_gt_mcr.h"
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
+#include "xe_sriov.h"
 #include "xe_step_types.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
@@ -539,6 +540,9 @@ void xe_mocs_init(struct xe_gt *gt)
 	struct xe_mocs_info table;
 	unsigned int flags;
 
+	if (IS_SRIOV_VF(gt_to_xe(gt)))
+		return;
+
 	/*
 	 * MOCS settings are split between "GLOB_MOCS" and/or "LNCFCMOCS"
 	 * registers depending on platform.
-- 
2.43.0

