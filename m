Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742F2C54F4D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 14:50:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3047C10E942;
	Tue, 28 Jul 2026 14:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ede3IgIU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6782C10E942
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 14:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785250237; x=1816786237;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=20pbj+VTxmK7Mcgop1WL/kwjdkayerNqMu9J6OJMNcg=;
 b=ede3IgIUqwEUcxsH5EZBcEKqXYuOMsnmxKzyWvjOPNWLFoWKQBiOkhb7
 AczJCvlx/21E3lFjzs3xu3tPULXPbOp7oPM3UOhi+EQbHueTMfWdL5wQ0
 a5zV/rP+KIJp0ULDHuWjQzSJOl6quHYKvSSu9eOj7fmMt/IAbpht7t4/U
 W8q+xk3efpGRm7zC+5R/fG+2ZfGadnnI7HvWKjfmoBvgysu0eLgKz8iKk
 sLGfGM0Agu5C8Oc2cxAmJkX7J2mU2kxaZHFG/ZBRIdDg1RZ4A30bfp0UG
 /USeLG4EFkmiV5QjzKj7luePQasbh4S9ol7M9d5R43d3T3zpetqkBaT0I g==;
X-CSE-ConnectionGUID: 7qxm3UmVQXu+X7CQc/h/5Q==
X-CSE-MsgGUID: ccywSZG3QvSdHKUqv/9HtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="84815360"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="84815360"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 07:50:37 -0700
X-CSE-ConnectionGUID: FKKhJuhkRaOvOBTVPiDVmA==
X-CSE-MsgGUID: bqDuhrzxTtygc0g6Mbfb1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="257927589"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.76])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 07:50:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 3/3] drm/xe/display: drop redundant intel_audio_deinit() call
Date: Tue, 28 Jul 2026 17:50:21 +0300
Message-ID: <b2b376f5d6f7ecb48bf9028ab5d0b9c95dbe9859.1785250188.git.jani.nikula@intel.com>
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

intel_audio_deinit() is already being called via xe_display_unregister()
-> intel_display_driver_unregister(). Remove the redundant call.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 2fc12592627c..6800a831c76c 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -18,7 +18,6 @@
 #include <uapi/drm/xe_drm.h>
 
 #include "intel_acpi.h"
-#include "intel_audio.h"
 #include "intel_display.h"
 #include "intel_display_core.h"
 #include "intel_display_device.h"
@@ -128,7 +127,6 @@ static void xe_display_fini(void *arg)
 	struct xe_device *xe = arg;
 	struct intel_display *display = xe->display;
 
-	intel_audio_deinit(display);
 	intel_display_driver_remove(display);
 }
 
-- 
2.47.3

