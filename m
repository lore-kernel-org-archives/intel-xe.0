Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4E8C47DD9
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 09:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC1AB10E2B7;
	Wed, 28 Feb 2024 09:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVWiaYN0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35ED310E87A
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Feb 2024 09:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709111421; x=1740647421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yp+a/MqNq4fHnfLH/hrBflhVZcLgtZVxdei2O9EV3HU=;
 b=AVWiaYN0ITtp0vzm5VUprY0tdUPdS06ynHymSR1NjA+7flZs1GcEAdO6
 EATd9gv6VJ8ZcdMA7kTek1+hMDEpSICycOVD2BKdN0w9gEO0py3y745rJ
 3RKeE+tRh5cDNiqBPGnCMZ0gUT5zAwFRz2Pc+LxLUYIs2CJKTUWePBZdo
 x4CIwH8PNeh+Fk6qlc1Alo+2nHLOW+6hHZed4OkTdq6TRI4QxUraTDYSc
 KLUzcitKlXzV0D74W+/IBD/sxB9rnhdzFB9Oso9BuBjk8eY0tO6hKLULG
 Nlf/Z3nSnbxhW1lOigIQdKFFmU6pI1FVAZ1NyrTz/dG/XZbAstTtgWc8l w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3618933"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="3618933"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 01:10:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7931383"
Received: from pltuser2-ms-7d25.iind.intel.com ([10.190.239.58])
 by orviesa008.jf.intel.com with ESMTP; 28 Feb 2024 01:10:19 -0800
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: haridhar.kalvala@intel.com,
	matthew.d.roper@intel.com
Subject: [PATCH 1/3] drm/xe/xelpg: Recognize graphics version 12.74 as Xe_LPG
Date: Wed, 28 Feb 2024 14:40:02 +0530
Message-Id: <20240228091004.3271151-2-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228091004.3271151-1-dnyaneshwar.bhadane@intel.com>
References: <20240228091004.3271151-1-dnyaneshwar.bhadane@intel.com>
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

From: Matt Roper <matthew.d.roper@intel.com>

Graphics version 12.74 (which is technically called "Xe_LPG+") should be
handled the same as versions Xe_LPG 12.70/12.71 by the KMD.  Only the
workaround lists (handled in the next patch) will be a bit different.

Bspec: 55420
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c    | 1 +
 drivers/gpu/drm/xe/xe_tuning.c | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 557f2d88a8c1e..c401d4890386d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -343,6 +343,7 @@ __diag_pop();
 static const struct gmdid_map graphics_ip_map[] = {
 	{ 1270, &graphics_xelpg },
 	{ 1271, &graphics_xelpg },
+	{ 1274, &graphics_xelpg },	/* Xe_LPG+ */
 	{ 2004, &graphics_xe2 },
 };
 
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 5c83c75bc4978..bb6db2817ada4 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -50,7 +50,7 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 
 static const struct xe_rtp_entry_sr engine_tunings[] = {
 	{ XE_RTP_NAME("Tuning: Set Indirect State Override"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1271),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1274),
 		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, INDIRECT_STATE_BASE_ADDR_OVERRIDE))
 	},
@@ -88,7 +88,7 @@ static const struct xe_rtp_entry_sr lrc_tunings[] = {
 	/* Xe_LPG */
 
 	{ XE_RTP_NAME("Tuning: L3 cache"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271), ENGINE_CLASS(RENDER)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1274), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(FIELD_SET(XEHP_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
 				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
 	},
-- 
2.34.1

