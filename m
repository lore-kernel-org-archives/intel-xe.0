Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A631DC25B10
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 15:01:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4807F10E35D;
	Fri, 10 May 2024 15:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PMwEx1mP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD3110E6DF
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 15:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715353278; x=1746889278;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=52FI3dmGq8EAZTKQ/1HlC92QWQb4lPygqJPcHstDAJo=;
 b=PMwEx1mPqCCk2lIkpnCGNIk63mPeGMVVclfiAjHqYH5SnsvWQLwepLhP
 wHHFXFa/PZnNDxhf4xMz3W0mdjMBUa8H+6xNg2Up63M7HzEOZuBO0IE9r
 hCOoG9VXLwZy9iJcgZseA9r3BWyUTqmELv9VCQKj1u2HZk0q2LpKEOvwS
 ODGvKgnhGa4GoQtCmcm19surn0BL+tIl9OKORKrtq3p+EZXBRuBvDhrEt
 pXemxLxYYxI0WT59XRhegD25rOYwhGlB28Fyy/cN/tX18N+41+zHH4x2W
 Qe0MnfcspEGYj1PRHdUIH3NMXu/Um+5TbgmzDAwdb3oIswp9BITAC9Wzp Q==;
X-CSE-ConnectionGUID: l7RAxts1RQiuCfcuiRRHUg==
X-CSE-MsgGUID: 6diz89ODTCybnrDtnYCDVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="21935426"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="21935426"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:01:18 -0700
X-CSE-ConnectionGUID: 6EEVJC58T1+vk/oTk2WJnw==
X-CSE-MsgGUID: 76H3l1PXQaGbw0+3R0SIug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="29702092"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:01:17 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH] drm/xe: Replace RING_START_UDW by u64 RING_START
Date: Fri, 10 May 2024 08:01:08 -0700
Message-ID: <20240510150108.80679-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.45.0
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

Other u64 registers are printed in a single line so RING_START
needs to follow that too.
As there is no upstream decoder tool parsing RING_START this will
not break any decoder application.

Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c       | 10 +++++-----
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  4 +---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 45f582a7caaa5..e19af179af338 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -908,11 +908,13 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 	snapshot->reg.ring_hwstam = hw_engine_mmio_read32(hwe, RING_HWSTAM(0));
 	snapshot->reg.ring_hws_pga = hw_engine_mmio_read32(hwe, RING_HWS_PGA(0));
 	snapshot->reg.ring_start = hw_engine_mmio_read32(hwe, RING_START(0));
+	if (GRAPHICS_VERx100(hwe->gt->tile->xe) >= 2000) {
+		val = hw_engine_mmio_read32(hwe, RING_START_UDW(0));
+		snapshot->reg.ring_start |= val << 32;
+	}
 	if (xe_gt_has_indirect_ring_state(hwe->gt)) {
 		snapshot->reg.indirect_ring_state =
 			hw_engine_mmio_read32(hwe, INDIRECT_RING_STATE(0));
-		snapshot->reg.ring_start_udw =
-			hw_engine_mmio_read32(hwe, RING_START_UDW(0));
 	}
 
 	snapshot->reg.ring_head =
@@ -1003,9 +1005,7 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
 		   snapshot->reg.ring_execlist_status);
 	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS: 0x%016llx\n",
 		   snapshot->reg.ring_execlist_sq_contents);
-	drm_printf(p, "\tRING_START: 0x%08x\n", snapshot->reg.ring_start);
-	drm_printf(p, "\tRING_START_UDW: 0x%08x\n",
-		   snapshot->reg.ring_start_udw);
+	drm_printf(p, "\tRING_START: 0x%016llx\n", snapshot->reg.ring_start);
 	drm_printf(p, "\tRING_HEAD: 0x%08x\n", snapshot->reg.ring_head);
 	drm_printf(p, "\tRING_TAIL: 0x%08x\n", snapshot->reg.ring_tail);
 	drm_printf(p, "\tRING_CTL: 0x%08x\n", snapshot->reg.ring_ctl);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 5f4b67acba991..b2f64b92a6362 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -188,9 +188,7 @@ struct xe_hw_engine_snapshot {
 		/** @reg.ring_hws_pga: RING_HWS_PGA */
 		u32 ring_hws_pga;
 		/** @reg.ring_start: RING_START */
-		u32 ring_start;
-		/** @reg.ring_start_udw: RING_START_UDW */
-		u32 ring_start_udw;
+		u64 ring_start;
 		/** @reg.ring_head: RING_HEAD */
 		u32 ring_head;
 		/** @reg.ring_tail: RING_TAIL */
-- 
2.45.0

