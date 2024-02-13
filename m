Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04D2C4829A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 15:44:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7734110E7F8;
	Tue, 13 Feb 2024 15:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZVIPW7nk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B5010E801
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 15:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707839053; x=1739375053;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zgEMo6RdpVYOqsuphnuwyP681TiPQHDK5Bp7phLuDc8=;
 b=ZVIPW7nkhLcrYfjUxdKCTtA39sKDB23h674bIDSiCDW41WVFGg7jeRY+
 1vvSsiTGJJaZaW3d4wpW6ErpRX9Wua/2q4uuwS+tDz2QOgzQUIoAn+W5+
 pykf2TZ646ObGtG1pXwPe5V/WFDTEoDiYxKhUyGq53b+r70mPMDeNphZA
 h9D9jSonpp+15LPVc/rxh3NtpdaABO6ukP2+5I0Ao5H52lfVhev49FjWj
 sZcXF9CmVKxWheOWK4lDLwRbHWcdshgnHjQCYKUgphbU0FgmFkWcQXsEM
 VMtV3EPigakONRdtP+QRn4sKnQYIPHfP+6DIm2Rrb9bJvyhmbyM+akVxD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="19262918"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; d="scan'208";a="19262918"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 07:44:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="7564496"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.153.144])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 07:44:12 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 2/8] drm/xe/vf: Don't try to capture engine data unavailable to VF
Date: Tue, 13 Feb 2024 16:43:49 +0100
Message-Id: <20240213154355.1221-3-michal.wajdeczko@intel.com>
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

Don't capture engine ring registers as thoe are not available for
the VF driver.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 0d17e32d70c8..b5e83ea172f3 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -25,6 +25,7 @@
 #include "xe_reg_sr.h"
 #include "xe_rtp.h"
 #include "xe_sched_job.h"
+#include "xe_sriov.h"
 #include "xe_tuning.h"
 #include "xe_uc_fw.h"
 #include "xe_wa.h"
@@ -767,6 +768,10 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 						    hwe->domain);
 	snapshot->mmio_base = hwe->mmio_base;
 
+	/* no more VF accessible data below this point */
+	if (IS_SRIOV_VF(gt_to_xe(hwe->gt)))
+		return snapshot;
+
 	snapshot->reg.ring_execlist_status =
 		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0));
 	val = hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0));
-- 
2.43.0

