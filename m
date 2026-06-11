Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE521CD98D2
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 09:16:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B68D10E739;
	Thu, 11 Jun 2026 09:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WooWsv+4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F4810E739
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 09:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781169360; x=1812705360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uBasQU9enNl6ZxZlJI7p0ttX3yHpQ2aFk8Yav9Ae5f4=;
 b=WooWsv+4SRT+E/wnHeD7Fbxmq4tYTLHlW0s9I+aplBvSFpsY+YTaAFXa
 gjwxNdIX/rReo48t4XnBvUQWQpRwsln89N1cxk1y44qFn6A8dUjlF4VI5
 Q7RcOhzSu6/AIv52HZJ63kA5bLT5FUnv2NZjetdRkU0dRhMa4NP4pL0GM
 MhiMjdOgcj+W4zrfNSFCQgWQQBJbzAOpBCqJMbfMc4ROSmamrlf4PkKkq
 fUKU+5eGN1ClvZy6znSWIi5I3bJM6T0EM0QL3ubsqwsv7EMmYnQJVX0T4
 Ew730v7g5k3UdWg7HnCmn7AtRA4BpDq1+ctvgIfXtQzcfsNMf7QqGJobD Q==;
X-CSE-ConnectionGUID: c3X+HC2MQbSbhysiKj3BlQ==
X-CSE-MsgGUID: 1ybLIvVlRJazfLnk2rnDXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92654759"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="92654759"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 02:15:49 -0700
X-CSE-ConnectionGUID: vgP0Z60/R22oNB+hmV3MQw==
X-CSE-MsgGUID: Teesk9QCT1yQ5/B/SNGf2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="250346688"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 11 Jun 2026 02:15:45 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com, sk.anirban@intel.com,
 raag.jadav@intel.com, Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH 2/2] drm/xe: use XE_RAS_WEDGED macro in
 xe_device_declare_wedged
Date: Thu, 11 Jun 2026 14:42:27 +0530
Message-ID: <20260611091224.17275-6-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611091224.17275-4-mallesh.koujalagi@intel.com>
References: <20260611091224.17275-4-mallesh.koujalagi@intel.com>
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
 drivers/gpu/drm/xe/xe_device.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 7ee2148f1321..93a5b9202c1b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -62,6 +62,7 @@
 #include "xe_pxp.h"
 #include "xe_query.h"
 #include "xe_ras.h"
+#include "xe_sig_ids.h"
 #include "xe_shrinker.h"
 #include "xe_soc_remapper.h"
 #include "xe_survivability_mode.h"
@@ -1418,12 +1419,10 @@ void xe_device_declare_wedged(struct xe_device *xe)
 		xe_device_wedged_get(xe);
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

