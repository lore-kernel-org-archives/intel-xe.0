Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7726EE6B4A
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 18:36:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F47F10E8C6;
	Fri,  6 Feb 2026 18:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k/6qBrNM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB8B10E89C;
 Fri,  6 Feb 2026 18:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770402999; x=1801938999;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=qLjj+NK0ia7sdthiXGw9mwgMywo13eYkGugrczq2PAI=;
 b=k/6qBrNMJgbEv63gowBkIdLIplf0MyJKK4ETLvzM7jRQltvwLHyTXG2E
 QmAIB+JdbaWiG9RP8/HPmcdIJn7gVaGfvuMBuYsI+9rO6G8s1Q5Ip9zLB
 gGWe41Waw2zn7SZGs6dXDUKy2ELgR26lzRD13yUuDSYyNvzRH/XCbTdzX
 aV2n2gIgQ+zQl4JLhRPpEgv/qVWXjXbB50wpLiWtIqeKIGL3mhBS3FoZg
 Sp0ARh3wadwz/8ey2bWETV4BCKDY57+r9wDwpUZlVlZRLE2DLJaAE6voy
 C0UZ+xO/xqQTgObp8rD6bqmz72jfMGpHVztfNY+Y7OXBgTKz0ZOil/6GH A==;
X-CSE-ConnectionGUID: trGQY8D1QzOJXUA8dgKs2w==
X-CSE-MsgGUID: LGqW3NkzShWDwsELs2oE+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71516938"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="71516938"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 10:36:39 -0800
X-CSE-ConnectionGUID: PyRzF2SPR7aLfC3SrOn92w==
X-CSE-MsgGUID: mcGXgV3RREGrIe2/HkljWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="210224746"
Received: from vverma7-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.159])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 10:36:38 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 06 Feb 2026 15:36:03 -0300
Subject: [PATCH v3 07/15] drm/xe/xe3p_lpg: Disable reporting of context
 switch status to GHWSP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-nvl-p-upstreaming-v3-7-636e1ad32688@intel.com>
References: <20260206-nvl-p-upstreaming-v3-0-636e1ad32688@intel.com>
In-Reply-To: <20260206-nvl-p-upstreaming-v3-0-636e1ad32688@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>, 
 Matt Atwood <matthew.s.atwood@intel.com>
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
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
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

