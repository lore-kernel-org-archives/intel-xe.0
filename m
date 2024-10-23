Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E6BCFA462
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 20:07:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C2010E859;
	Wed, 23 Oct 2024 20:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lrS+EaVw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4853E10E859
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Oct 2024 20:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729714041; x=1761250041;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SK5lPv3YuFK1hBUvd2UwNmsHOsoJKtMnR8B4JUF4BHQ=;
 b=lrS+EaVwObZ+ciWIDw4h5+Hb5Yw0Nd6P4LPYV8NVIY2kdAiADh2d/ygD
 0xoJpI0bxjgUcM6K3PlQSqN1kcmqzbCrgaQmDl5AKKPRs9Fkss6aAShKk
 ZAeYbr0S+27szwjN3FsgjrmCbgcld7Cf3VYEwW67on8C/1ZkeNSj49NIS
 ipL9eFieDr4pZVpEkhEAB+BoPt9Cq8u1w4FzhdJEDJcL4J3y5BPtsd6By
 8h5JXd+a53H/COyTU3KG9mFqNjJfIL+CU5pxLomsEJ0BpuXdAbd2/eYAV
 uoHA2UvNcG0NhGa05PQBLXIzw4Elu0RNeDrKhHtuZvSZ/7eCFhOn6l2bS Q==;
X-CSE-ConnectionGUID: zcD1hH1iQ8WZ9u9bTcThtA==
X-CSE-MsgGUID: JObAzriDSEudBYb3sgXxkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="29423308"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="29423308"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 13:07:21 -0700
X-CSE-ConnectionGUID: jvk8Op5RSlKDSKdXTkhXnA==
X-CSE-MsgGUID: o6BQM40KTEySnoEJ5NT3bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="80543976"
Received: from dut4413lnl.fm.intel.com ([10.105.8.97])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 13:07:18 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 umesh.nerlige.ramappa@intel.com, john.c.harrison@intel.com,
 stable@vger.kernel.org
Subject: [PATCH v3] drm/xe/xe_guc_ads: save/restore OA registers
Date: Wed, 23 Oct 2024 20:07:15 +0000
Message-ID: <20241023200716.82624-1-jonathan.cavitt@intel.com>
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

Several OA registers and allowlist registers were missing from the
save/restore list for GuC and could be lost during an engine reset.  Add
them to the list.

v2:
- Fix commit message (Umesh)
- Add missing closes (Ashutosh)

v3:
- Add missing fixes (Ashutosh)

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2249
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Suggested-by: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: stable@vger.kernel.org # v6.11+
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 4e746ae98888..a196c4fb90fc 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -15,6 +15,7 @@
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_guc_regs.h"
+#include "regs/xe_oa_regs.h"
 #include "xe_bo.h"
 #include "xe_gt.h"
 #include "xe_gt_ccs_mode.h"
@@ -740,6 +741,11 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 		guc_mmio_regset_write_one(ads, regset_map, e->reg, count++);
 	}
 
+	for (i = 0; i < RING_MAX_NONPRIV_SLOTS; i++)
+		guc_mmio_regset_write_one(ads, regset_map,
+					  RING_FORCE_TO_NONPRIV(hwe->mmio_base, i),
+					  count++);
+
 	/* Wa_1607983814 */
 	if (needs_wa_1607983814(xe) && hwe->class == XE_ENGINE_CLASS_RENDER) {
 		for (i = 0; i < LNCFCMOCS_REG_COUNT; i++) {
@@ -748,6 +754,14 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 		}
 	}
 
+	guc_mmio_regset_write_one(ads, regset_map, EU_PERF_CNTL0, count++);
+	guc_mmio_regset_write_one(ads, regset_map, EU_PERF_CNTL1, count++);
+	guc_mmio_regset_write_one(ads, regset_map, EU_PERF_CNTL2, count++);
+	guc_mmio_regset_write_one(ads, regset_map, EU_PERF_CNTL3, count++);
+	guc_mmio_regset_write_one(ads, regset_map, EU_PERF_CNTL4, count++);
+	guc_mmio_regset_write_one(ads, regset_map, EU_PERF_CNTL5, count++);
+	guc_mmio_regset_write_one(ads, regset_map, EU_PERF_CNTL6, count++);
+
 	return count;
 }
 
-- 
2.43.0

