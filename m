Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71886CA6017
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 21:08:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC9210FD81;
	Thu,  8 Oct 2026 21:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kJAInPcF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCF910FD81
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 21:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791493721; x=1823029721;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l+w2uYLxAAhQUNfOXO+02OkDKBhdh8xACIV0jJWARj0=;
 b=kJAInPcFBKF9UX6Gqa5mAUwA9Uepw3Js+CJpvsJcVfgcTxrbhKUqNRiJ
 jdajfP3oKJacbAiDNNTv9194twehoAof8/t+Ftjy5f+UCunWvh5UXQrAY
 6vMTbOGPKL1pMw1LasNE5lvNJTdSRSJD1LJsinAVy8xWKVdsHJ/vXmfjA
 znMhH8pxAlTQGHe4KuNmHUxQB0rWTuzLlFt/PIWuz/sKH3voOMZkSpNVE
 ej1cZJtz3uIMUO294GyCb901RDAMb7UEDF0qC+t18uZMUyUUbc+/XRr/W
 sOYRGJGdLGImZhQY0QTFFFAF7YVoiHDwzFbZYpvWBjamG+WjH2cmFXYGo w==;
X-CSE-ConnectionGUID: EtDR5zwTQbOMs/N0GTHMCQ==
X-CSE-MsgGUID: eyeySADWRWuhj7lp72V3iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="187305"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="187305"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 14:08:40 -0700
X-CSE-ConnectionGUID: Ep/s9ZDLQLCjoQcMttwTTw==
X-CSE-MsgGUID: +ZuA2ORJRH+abdIrGtqVzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="473935"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by fmviesa006.fm.intel.com with ESMTP; 08 Oct 2026 14:08:40 -0700
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Fei Yang <fei.yang@intel.com>,
	Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH v1] drm/xe/cri: Set downstream access to L3 class 3 and
 write-back
Date: Thu,  8 Oct 2026 14:04:29 -0700
Message-ID: <20261008210429.49371-1-daniel.charles@intel.com>
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

From: Fei Yang <fei.yang@intel.com>

Program DWNSTRM_ACCESS_MODE (0x144154) with 0xcc on graphics
version 3511. Compared with 0x3c, this selects L3 class of service
3 instead of 0 and write-back rather than uncached L3 policy.
The L4 caching policy and coherency mode remain unchanged.

BSpec: 73603
Signed-off-by: Fei Yang <fei.yang@intel.com>
Signed-off-by: Daniel Charles <daniel.charles@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_mert_regs.h | 2 ++
 drivers/gpu/drm/xe/xe_wa.c             | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_mert_regs.h b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
index 99e5a26da6572..1e6ce818fcee9 100644
--- a/drivers/gpu/drm/xe/regs/xe_mert_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
@@ -8,6 +8,8 @@
 
 #include "regs/xe_reg_defs.h"
 
+#define DWNSTRM_ACCESS_MODE_GAMREQ_MERTSS	XE_REG(0x144154)
+
 #define MERT_LMEM_CFG				XE_REG(0x1448b0)
 
 #define MERT_TLB_CT_INTR_ERR_ID_PORT		XE_REG(0x145190)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index c94fe7753f9a9..ed7e1c4f297f6 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -16,6 +16,7 @@
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_guc_regs.h"
+#include "regs/xe_mert_regs.h"
 #include "regs/xe_regs.h"
 #include "xe_device_types.h"
 #include "xe_force_wake.h"
@@ -306,6 +307,13 @@ VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was = XE_RTP_TABLE_SR(
 	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)),
 	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
 	},
+
+	/* Xe3p_XPC */
+
+	{ XE_RTP_NAME("14028586678"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(3511)),
+	  XE_RTP_ACTIONS(WR(DWNSTRM_ACCESS_MODE_GAMREQ_MERTSS, 0xcc))
+	},
 );
 EXPORT_SYMBOL_IF_KUNIT(gt_was);
 
-- 
2.43.0

