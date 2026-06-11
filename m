Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3949CCD98D2
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 11:19:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A2010EEB8;
	Thu, 11 Jun 2026 11:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M6XaWtqn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C28F10EEA7
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 11:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781176748; x=1812712748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l44VhBtpYm7V4AGAhfv6g09f0Gxcu32uppj8DlE6E7I=;
 b=M6XaWtqnsLK2OuwAhzsZCZy5HU4iN+XgNlvz56+vvbXGjtID/rlW8vVh
 cbQ/7rEO+CTplu805Mh1oNIpKxY+Whr35gVyFzpiVnDwS16NAHy4OQANE
 HqWWk5k4alu8ODd3ZRxnVpN43lKRogdP6cQDpaA8cKeh6/PwTN9FwecDS
 /RM+ccSnH+D7eyVjJFnRxr0+Pzj2LYyzAPQBYjCUpsHWqbzBiduGOnBIz
 1VcANSLDa4ma3gg52ptK+b5nZePhbLANxP1CMFvDLbLc11zjeD1Gd0TE5
 DFbNYovN0+GBajcMVGsTgFR6CnD7eYi0iuHKu9E7d5PZsu7E7wF7cpr/Z w==;
X-CSE-ConnectionGUID: 1ogjuE+UROuVLv2TwpqeXg==
X-CSE-MsgGUID: GXYBsfsqTmKQAWbebuK2dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85885142"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="85885142"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 04:19:08 -0700
X-CSE-ConnectionGUID: qV7KqCyhRRCWye52z5V3Jg==
X-CSE-MsgGUID: +FYRMYNJRFCdfNPkMe/Hhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="250741745"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa004.jf.intel.com with ESMTP; 11 Jun 2026 04:19:04 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com, sk.anirban@intel.com,
 raag.jadav@intel.com, Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [RFC PATCH v2 2/2] drm/xe: use XE_RAS_WEDGED macro in
 xe_device_declare_wedged
Date: Thu, 11 Jun 2026 16:45:45 +0530
Message-ID: <20260611111542.19256-6-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611111542.19256-4-mallesh.koujalagi@intel.com>
References: <20260611111542.19256-4-mallesh.koujalagi@intel.com>
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

Replace the open-coded drm_err() call with XE_RAS_WEDGED()
macro so that wedge events are reported through the unified
RAS/SIG logging path with a consistent format, CPER severity,
and errno.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2:
- Rebase.
---
 drivers/gpu/drm/xe/xe_device.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 51e3a2dd7b22..a4d7f226dc26 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -61,6 +61,7 @@
 #include "xe_psmi.h"
 #include "xe_pxp.h"
 #include "xe_query.h"
+#include "xe_sig_ids.h"
 #include "xe_shrinker.h"
 #include "xe_soc_remapper.h"
 #include "xe_survivability_mode.h"
@@ -1414,12 +1415,10 @@ void xe_device_declare_wedged(struct xe_device *xe)
 	if (!atomic_xchg(&xe->wedged.flag, 1)) {
 		xe->needs_flr_on_fini = true;
 		xe_pm_runtime_get_noresume(xe);
-		drm_err(&xe->drm,
-			"CRITICAL: Xe has declared device %s as wedged.\n"
-			"IOCTLs and executions are blocked.\n"
-			"For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
-			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
-			dev_name(xe->drm.dev));
+		XE_RAS_WEDGED(xe, -EIO,
+			      "IOCTLs and executions are blocked.\n"
+			      "For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
+			      "Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n");
 	}
 
 	for_each_gt(gt, xe, id)
-- 
2.34.1

