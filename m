Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45DCCCD185
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 09:59:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E7C10E087;
	Mon, 13 Oct 2025 09:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VL72sZv+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E1D10E087
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 09:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760349595; x=1791885595;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eVQJKALZWXHbeeAIM15A+5stL3VX8kOnW9SLzoaLUSQ=;
 b=VL72sZv+5cevaOQysQe0aUz7QMrILiv1FqBZbgpU4w5LjRCjlEVRMcA7
 Q1Y0enQHWOQOOEm5eHLUyt6dMAZ7Dqm/xP+8Uw4QxCuE4yoNp0Ri4OJYI
 4mfdHK0wp/4/R4kExMZpfd1SaW0LtsXx6o3WXPGDhncMrFPwan8JSsxPi
 y5fVqlycKbiCDWVVVB7tALWVJ5OhvvWzKG8nX+ycDuMYEvHwzFuBBzFaG
 U56r+X44yuUZmliullUnnG7/zKai5FUe4spTu2gJloolbVFeOdDsX3uBO
 WmaxVgcd9Wn9JDJZjNiM5uMj6KEumoyW1EDW51PfSy2V1zNkk536efLZA w==;
X-CSE-ConnectionGUID: cNovOOnOTkSYHP13/aGSoA==
X-CSE-MsgGUID: dRPkNIvlR/ekV/gZJSsNfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="66337698"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="66337698"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 02:59:54 -0700
X-CSE-ConnectionGUID: UZJu4OydStqCz2BXcsgYXg==
X-CSE-MsgGUID: MbRJkizuRomwz1BoKSDrkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="212514915"
Received: from abhishek-optiplex-5060.iind.intel.com ([10.190.216.58])
 by fmviesa001.fm.intel.com with ESMTP; 13 Oct 2025 02:59:52 -0700
From: Arun Abhishek Chowhan <arun.abhishek.chowhan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: arun.abhishek.chowhan@intel.com,
	nitin.r.gote@intel.com
Subject: [PATCH] [PATCH] drm/xe: Sort include files alphabetically.
Date: Mon, 13 Oct 2025 15:29:14 +0530
Message-ID: <20251013095914.3742505-1-arun.abhishek.chowhan@intel.com>
X-Mailer: git-send-email 2.43.0
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

Sort the include lines alphabetically, no impact on code behavior.

Signed-off-by: Arun Abhishek Chowhan <arun.abhishek.chowhan@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 2 +-
 drivers/gpu/drm/xe/xe_guc_ads.c | 2 +-
 drivers/gpu/drm/xe/xe_tile.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 34f622bef3e0..1c3c9557a9bd 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -27,8 +27,8 @@
 #include "xe_sriov_vf.h"
 #include "xe_step.h"
 #include "xe_tile_debugfs.h"
-#include "xe_wa.h"
 #include "xe_vsec.h"
+#include "xe_wa.h"
 
 #ifdef CONFIG_DRM_XE_DEBUG
 #include "xe_bo_evict.h"
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 58e0b0294a5b..22ac2a8b74c8 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -18,6 +18,7 @@
 #include "xe_bo.h"
 #include "xe_gt.h"
 #include "xe_gt_ccs_mode.h"
+#include "xe_gt_mcr.h"
 #include "xe_gt_printk.h"
 #include "xe_guc.h"
 #include "xe_guc_buf.h"
@@ -30,7 +31,6 @@
 #include "xe_platform_types.h"
 #include "xe_uc_fw.h"
 #include "xe_wa.h"
-#include "xe_gt_mcr.h"
 
 /* Slack of a few additional entries per engine */
 #define ADS_REGSET_EXTRA_MAX	8
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 6edb5062c1da..8fd6ee990d14 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -19,9 +19,9 @@
 #include "xe_tile.h"
 #include "xe_tile_sysfs.h"
 #include "xe_ttm_vram_mgr.h"
-#include "xe_wa.h"
 #include "xe_vram.h"
 #include "xe_vram_types.h"
+#include "xe_wa.h"
 
 /**
  * DOC: Multi-tile Design
-- 
2.43.0

