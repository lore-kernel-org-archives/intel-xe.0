Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6F1C982FA
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 15:17:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B3210ED64;
	Tue, 22 Sep 2026 15:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tv8PLD3J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAEC610ED64
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 15:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790090248; x=1821626248;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sRmGDjRR5CKzZuhOEV1ZeJhbuG51sJP9DlGuYKair/8=;
 b=Tv8PLD3JE9PzBeFKFuC/u6NUybKX9WHSfeaCbZgA96IWRDJFWG5vaaf9
 eySXpNUEhu4FGwPHwNIbhLFgR2EpgATaHvuij4IjYrhtCe3EHn6hKrY2N
 EmzRmK3COTZcaImUZ/6OWZ1GiTQRmIs41xw4H9RPKxHD4Sn8+iAziXjQq
 UlowtdDxZe39dEHsz1Mb98AnDvdNtGBYycC3B3trlPu2g7L/z8IcpHs3w
 Jz6f2kXM4bY69YxxqPd9s4Yg8UlIqGC1FmDuduva2/kgVTOy8LTFjmuQF
 vqcgN+YioARSrYI2ARqp2A45pEniNFc2zvAxJESjOMl/GCqml2jrPh5Mg A==;
X-CSE-ConnectionGUID: 6IhZrnROTb2y7+t2xm/PoA==
X-CSE-MsgGUID: hrIA4XFJTbOgQLGWDq6ApA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="89837499"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="89837499"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 08:17:26 -0700
X-CSE-ConnectionGUID: anVeZ+86SSKz8kZS5cLCOA==
X-CSE-MsgGUID: SDt84+WDQZifPRI2DPs1iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="301077292"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 08:17:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH] drm/xe/display: reduce includes in xe_display.c
Date: Tue, 22 Sep 2026 18:17:21 +0300
Message-ID: <20260922151721.1483978-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
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

xe_display.c has a bunch of extra leftover includes. Remove and
simplify.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 7b25c0814674..506f26e9c59a 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -6,31 +6,23 @@
 #include "xe_display.h"
 #include "regs/xe_irq_regs.h"
 
-#include <linux/fb.h>
+#include <linux/acpi.h>
 
-#include <drm/drm_client.h>
-#include <drm/drm_client_event.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
-#include <drm/drm_probe_helper.h>
 #include <drm/intel/display_member.h>
 #include <drm/intel/display_parent_interface.h>
-#include <uapi/drm/xe_drm.h>
 
-#include "intel_acpi.h"
 #include "intel_display.h"
 #include "intel_display_core.h"
 #include "intel_display_device.h"
 #include "intel_display_driver.h"
 #include "intel_display_irq.h"
-#include "intel_display_types.h"
 #include "intel_dmc.h"
 #include "intel_dmc_wl.h"
-#include "intel_dp.h"
 #include "intel_fbdev.h"
 #include "intel_hotplug.h"
 #include "intel_opregion.h"
-#include "skl_watermark.h"
 #include "xe_device.h"
 #include "xe_display_bo.h"
 #include "xe_display_pcode.h"
-- 
2.47.3

