Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC92C624D3
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 14:55:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9170610F260;
	Wed,  2 Sep 2026 14:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H96qflWV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DA310F260
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 14:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788360909; x=1819896909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1mhk1itkXtdJ1MOUvMopLz0K3MZUk7tWcuLNu3JMbzQ=;
 b=H96qflWV33VS4Y8VdiKOK1lsgNWEgT1xllDnLZdvBanSoiYtD0RZSbH1
 BM/v446mzLfaGpk5PYqq752v//T3pEE88wKfcvivDeCamxmYPVGKrzas8
 MwOXPIk2zjKfAua5u4f5nHt18B2/9M8mTvvkY51Zo/CbORbHTqXU+o83d
 m2EZU5D9sp9zqCeWSxFOrE4F9mkioMnrx9mpiOihj2XOzgW9Z74AiMPvU
 yusqDEDB6Se6qrAYQsUc0bT8zZCEu+0encLRPbEXMQyCXM5vtlF/lalLj
 lp9IRYk+dh9Xh/psgU30UNuDM9Ixpmi5vRArF3tNatTxa3l7DWSnrW8ef g==;
X-CSE-ConnectionGUID: G6k1+DfTRpC5DxpSX0C/aA==
X-CSE-MsgGUID: EalJ8jciRWW0tsxCCQALhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92526033"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="92526033"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:55:09 -0700
X-CSE-ConnectionGUID: 4zBpzH3zQOe39EsKNmj04Q==
X-CSE-MsgGUID: soomHKV7Rh6fIOsG7zXr2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="263260135"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:55:06 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH V20 11/15] drm/xe/ras: Cache disable_vram_page_offline policy
 at init
Date: Wed,  2 Sep 2026 20:23:54 +0530
Message-ID: <20260902145343.465686-28-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260902145343.465686-17-tejas.upadhyay@intel.com>
References: <20260902145343.465686-17-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The configfs disable_vram_page_offline attribute can only be
set before device bind, so its value is immutable at runtime.
Cache it in struct xe_drm_ras during xe_ras_init() to avoid
repeated configfs lookups on every fault.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_ras_types.h | 3 +++
 drivers/gpu/drm/xe/xe_ras.c           | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h b/drivers/gpu/drm/xe/xe_drm_ras_types.h
index 8d729ad6a264..0be218ba2db7 100644
--- a/drivers/gpu/drm/xe/xe_drm_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
@@ -43,6 +43,9 @@ struct xe_drm_ras {
 
 	/** @info: info array for all types of errors */
 	struct xe_drm_ras_counter *info[DRM_XE_RAS_ERR_SEV_MAX];
+
+	/** @disable_vram_page_offline: cached configfs policy, immutable after init */
+	bool disable_vram_page_offline;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index de4cb9ef7355..7a85735c57d5 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -3,6 +3,7 @@
  * Copyright © 2026 Intel Corporation
  */
 
+#include "xe_configfs.h"
 #include "xe_debugfs.h"
 #include "xe_device.h"
 #include "xe_drm_ras.h"
@@ -915,6 +916,14 @@ void xe_ras_init(struct xe_device *xe)
 {
 	int ret;
 
+	/*
+	 * TODO: Replace platform check with xe->info.has_disable_vram_page_offline
+	 * once the feature flag is plumbed through device info.
+	 */
+	if (xe->info.platform == XE_CRESCENTISLAND)
+		xe->ras.disable_vram_page_offline =
+			xe_configfs_get_disable_vram_page_offline(to_pci_dev(xe->drm.dev));
+
 	xe_drm_ras_init(xe);
 
 	if (!xe->info.has_sysctrl)
-- 
2.52.0

