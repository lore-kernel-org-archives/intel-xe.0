Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB44C54FCE
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 14:50:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F5710E593;
	Tue, 28 Jul 2026 14:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xgu9nZN+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F4310E593
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 14:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785250233; x=1816786233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g79D4GXxi0U6fETgpmffpxiO/3z6PBH8FurDWHwUVt0=;
 b=Xgu9nZN+NHldVvJxYYuPRfxyxJNpy3qOS2lH0B7Ycm5/XYnnDmZb4EAW
 70ud9XxDbKQV0j1ThcpPK8F2TO2xllffLxH64RfsXCWiBikDazkY8Oz6M
 bjimBEA7p96ZaeWB3Vd36qZTquLt0c+0vymiR61eJx5I06Eg4pY4UO8wg
 H/WwE/rDolPcGVXFkoKKrNrMaOCpSF7y632f2RD3LlAB5YvjN7v5Y6fl2
 oThU3TeDyl1hKSs/WwHxJ1/86CxV87Z2ftAJbrhOZ2sDDcfVA7v37k7XK
 u6Vk3b58/cdhZcy6Ueg/GLa5rZG+RIxY+CBBmA6bsuoWJjX1m3GVhess8 A==;
X-CSE-ConnectionGUID: hB4wuQb8QGaoUXcjbBd2bQ==
X-CSE-MsgGUID: UAkFLDjSR823XmOPx24iDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97209989"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="97209989"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 07:50:33 -0700
X-CSE-ConnectionGUID: ZCs6w4WOQDyceQWszdrIUQ==
X-CSE-MsgGUID: XQVY+Ag5Qkabilw7GBQZIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="256372702"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.76])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 07:50:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 2/3] drm/xe/display: drop redundant
 intel_hdcp_component_fini() call
Date: Tue, 28 Jul 2026 17:50:20 +0300
Message-ID: <08355094a47cbf63f2092dae000780567636c967.1785250188.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785250188.git.jani.nikula@intel.com>
References: <cover.1785250188.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

intel_hdcp_component_fini() is already being called via
xe_display_fini_early() -> intel_display_driver_remove_noirq(). Remove
the redundant call.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 57088e24aba2..2fc12592627c 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -29,7 +29,6 @@
 #include "intel_dmc_wl.h"
 #include "intel_dp.h"
 #include "intel_fbdev.h"
-#include "intel_hdcp.h"
 #include "intel_hotplug.h"
 #include "intel_opregion.h"
 #include "skl_watermark.h"
@@ -129,7 +128,6 @@ static void xe_display_fini(void *arg)
 	struct xe_device *xe = arg;
 	struct intel_display *display = xe->display;
 
-	intel_hdcp_component_fini(display);
 	intel_audio_deinit(display);
 	intel_display_driver_remove(display);
 }
-- 
2.47.3

