Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E81C54E55
	for <intel-xe@archiver.kernel.org>; Thu, 29 Feb 2024 07:08:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AAC810E162;
	Thu, 29 Feb 2024 07:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SpP8Vxyp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012C610E0F0
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Feb 2024 07:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709190483; x=1740726483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hx3mt2kkInOnT1+2GrZ2M5+R3Ii92V1ZCiWsIjJT8BQ=;
 b=SpP8VxypMJPyQM/cVy0WU4dEMK1c2oHbLi9iNXBo2tTi30hEvlqWIufV
 GDA5cgsSkA+0HwaES69ynAnKRBYCxCcPHPGwOc+OYbTE/Pc3PGHpUmUMW
 WGLk5XKRIqd23VgllTQ+ZFBscJ0JmRiLlm2+o05iQsmRU0qr6qhT+l6od
 xj1vpTcyqw3Wl07LKRbQY7ysbjaApYiMF1HzEyxGO+Qk3lA4rm+uN24gk
 jMiiSQfUkUpQ7g2AAefB8sCiyzb8QixYkVz3WIpoJkfQwVVHRNlxmAFC0
 1sXubmd19mbZwgX5J52VHI6NUCLWqMqLhEFWD6YZIEcX4gadf4w5nstQM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="29073965"
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; d="scan'208";a="29073965"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 23:08:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="8149832"
Received: from pltuser2-ms-7d25.iind.intel.com ([10.190.239.58])
 by orviesa006.jf.intel.com with ESMTP; 28 Feb 2024 23:08:01 -0800
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH V1 1/3] drm/xe/xelpg: Recognize graphics version 12.74 as
 Xe_LPG
Date: Thu, 29 Feb 2024 12:38:04 +0530
Message-Id: <20240229070806.3402641-2-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240229070806.3402641-1-dnyaneshwar.bhadane@intel.com>
References: <20240229070806.3402641-1-dnyaneshwar.bhadane@intel.com>
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
index 5b5c29761c5d..986c07d8b168 100644
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
index 5c83c75bc497..bb6db2817ada 100644
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

