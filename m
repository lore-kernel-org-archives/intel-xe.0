Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BC4E7FDF2
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 21:44:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F54C10E45D;
	Mon,  2 Feb 2026 21:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lz3SnSsV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342A010E471;
 Mon,  2 Feb 2026 21:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770068656; x=1801604656;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=t8zQaEMStMvCgC9aVtCEROW3xPscRs65jV2ix+7Do3Y=;
 b=lz3SnSsVaKV84JRlCUUiBBxBfmt5RU8b3O/D3N9O1MPly8geESNzvT3D
 AO2km5zBvMlknhsSuNTPxCCRSXbtMJ1yYXsejCY2GMuvUkr7NE6BwSe4Z
 t9pDfiKuRnl8pgC7V5AbgYYiN+zovupKKQhcO1NjJPeCWBR1qam0J+BQD
 O6SoPghN0to+SsKkuy4ghSJHzqNR8HhjgtyR2PKTCSNMpGqzKr38TXbsS
 bhMH9fi6KFveZEBevuPqx0fiwuOF/Ei2ct5HzzDjPILFfFZoRSY6WQbI6
 HRH1+6A6cc0E7lKOOpBycruXALlNlHEUmgeqlWDjJJHj0myfBKpivAkB4 A==;
X-CSE-ConnectionGUID: 0PdDOTKYSly1GeyeO2CiVw==
X-CSE-MsgGUID: 2RaO4rrgQpaWR8VdoEI2ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="58814344"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="58814344"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:44:16 -0800
X-CSE-ConnectionGUID: 3e9ObwWhTCasdm7GGv5btA==
X-CSE-MsgGUID: b5J/GgfzRY+0WHOW9sV3Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="209646845"
Received: from smoehrl-linux.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.51])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:44:14 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 02 Feb 2026 18:43:13 -0300
Subject: [PATCH 07/16] drm/xe/xe3p_lpg: Disable reporting of context switch
 status to GHWSP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-nvl-p-upstreaming-v1-7-653e4ff105dc@intel.com>
References: <20260202-nvl-p-upstreaming-v1-0-653e4ff105dc@intel.com>
In-Reply-To: <20260202-nvl-p-upstreaming-v1-0-653e4ff105dc@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.15-dev
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

By default the hardware reports context switch status into the global
hardware status page.  The Xe driver doesn't use this information for
anything, and as of Xe3p, leaving this setting enabled will prevent
other hardware optimizations from being enabled.  Disable this reporting
as suggested by the tuning guide.

Bspec: 72161
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_tuning.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 5766fa7742d3..a97872b3214b 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -10,6 +10,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
+#include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "xe_gt_types.h"
 #include "xe_platform_types.h"
@@ -107,6 +108,12 @@ static const struct xe_rtp_entry_sr engine_tunings[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
 	},
+	{ XE_RTP_NAME("Tuning: disable HW reporting of ctx switch to GHWSP"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3500, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
+			     GHWSP_CSB_REPORT_DIS,
+			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+	},
 };
 
 static const struct xe_rtp_entry_sr lrc_tunings[] = {

-- 
2.52.0

