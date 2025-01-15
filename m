Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA73C02180
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 08:04:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B9110E51E;
	Wed, 15 Jan 2025 08:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jgq36eaQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F0510E523
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jan 2025 08:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736928242; x=1768464242;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h+8DLJUvVJS4sWz2T1+RqJYf2ReXbAzQnJJI7CKo1co=;
 b=jgq36eaQn7hZFGPsUBcIIk1jzwi2FFJvUWd1QWSt2/7mlAyrAciln3O0
 58dpZ6GbMlvOmQAVbgrs4RU/t91QkDnQ4TmbNWtKDQClWPEbZOD1zmspF
 0d0ESNTufyBt6Y8e0MoHJhqzcTzJsW35D4aW2yZhkqOeIQ5J++fKJLYrH
 POtNQj42KvgfkZIXWl+38JKvTBYDDYEHRIAgjppFUv3GAIrNV477XSyRl
 MivAe6KunuTsf01fnH1I6JOKKTgCkhXh6BG87T+qP4gj8M1bzklVZ2B4e
 XeySG2SQfFkC6gR/O3CPW9HVvmcqOpicvyCdL/XgQOaDsS91PYp6wn86z g==;
X-CSE-ConnectionGUID: ESeYO0BdQUqjE/bzwLZWrQ==
X-CSE-MsgGUID: oi1aNi5MTPSFGdAqN2B7mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="41014140"
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; d="scan'208";a="41014140"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 00:04:02 -0800
X-CSE-ConnectionGUID: mATf5B2OS3OLAiu3eR9+Fw==
X-CSE-MsgGUID: X1vZvciFQ1q+v7UuVTpqgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; d="scan'208";a="105653602"
Received: from aradhyab-desk.iind.intel.com ([10.145.169.55])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 00:04:00 -0800
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Intel XE List <intel-xe@lists.freedesktop.org>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Aradhya Bhatia <aradhya.bhatia@intel.com>
Subject: [PATCH] drm/xe/xe_lpg: Port 2 WAs from i915 to Xe
Date: Wed, 15 Jan 2025 13:30:48 +0530
Message-Id: <20250115080048.2282183-1-aradhya.bhatia@intel.com>
X-Mailer: git-send-email 2.34.1
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

Port Wa_16021333562 and Wa_14016712196 for Xe_LPG_MD (G:12.70), and
Xe_LPG_LG (G:12.71) MeteorLake (MTL) platforms, from drm/i915 to drm/xe.

Also fix the lineage number of Wa_18013179988 for the MTL platform.

Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c     | 3 +++
 drivers/gpu/drm/xe/xe_guc_ads.c    | 5 +++++
 drivers/gpu/drm/xe/xe_oa.c         | 3 +--
 drivers/gpu/drm/xe/xe_ring_ops.c   | 3 +++
 drivers/gpu/drm/xe/xe_wa_oob.rules | 2 ++
 5 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index a1676b787fdc..0471baff635d 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -5,6 +5,8 @@
 
 #include "xe_gt_mcr.h"
 
+#include <generated/xe_wa_oob.h>
+
 #include "regs/xe_gt_regs.h"
 #include "xe_assert.h"
 #include "xe_gt.h"
@@ -14,6 +16,7 @@
 #include "xe_guc_hwconfig.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
+#include "xe_wa.h"
 
 /**
  * DOC: GT Multicast/Replicated (MCR) Register Support
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index fab259adc380..8ef044ddd682 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -376,6 +376,11 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 					GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
 					&offset, &remain);
 
+	if (XE_WA(gt, 16021333562))
+		guc_waklv_enable_simple(ads,
+					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
+					&offset, &remain);
+
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
 		return;
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index eeb96b5f49e2..90d62e621d3e 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1854,9 +1854,8 @@ u32 xe_oa_timestamp_frequency(struct xe_gt *gt)
 	u32 reg, shift;
 
 	/*
-	 * Wa_18013179988:dg2
+	 * Wa_18013179988:dg2/mtl
 	 * Wa_14015568240:pvc
-	 * Wa_14015846243:mtl
 	 */
 	switch (gt_to_xe(gt)->info.platform) {
 	case XE_DG2:
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 9f327f27c072..22c226c30df9 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -192,6 +192,9 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
 	else if (job->q->class == XE_ENGINE_CLASS_COMPUTE)
 		flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
 
+	if (XE_WA(gt, 14016712196))
+		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_DEPTH_CACHE_FLUSH, 0, 0);
+
 	return emit_pipe_control(dw, i, PIPE_CONTROL0_HDC_PIPELINE_FLUSH, flags, 0, 0);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 40438c3d9b72..4872c5d21610 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -42,3 +42,5 @@
 no_media_l3	MEDIA_VERSION(3000)
 14022866841	GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)
 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
+16021333562	GRAPHICS_VERSION_RANGE(1270, 1271)
+14016712196	GRAPHICS_VERSION_RANGE(1270, 1271)

base-commit: 3318ef9888d5b4f5c5a9473180fd0b16e9ef266d
-- 
2.34.1

