Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BA1CD98E4
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 10:50:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A0EC10EFA6;
	Wed, 17 Jun 2026 10:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZFmMtrkE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451DB10EFAA
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 10:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781693451; x=1813229451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7NIzkhcUHxHqvAlNJw86Wq41G7UnkirG+weBujpPuWI=;
 b=ZFmMtrkEAoZ85w9Wk0lkjdPJnDXVS/YpVVZKxiGGO0Ouhbq8JTGI7co/
 6IXB09O6Mv8Ej+dmJgQbsyEOHezOT7M+oKlZJBaMYp8mERNrYUMtwp/XC
 V6SxmWsPt1+sJiiUIQ/46NGB+BFVh/nLTrifutr0iPkXBcJs++pQ/VJBW
 R+EnpPf24eIEnawlHTPUFMeVHcxlipkMdsZyW5qOlVCr3ZF1cJvujE4YH
 QnTEjoRFCUjz4asn+/BwXV9/SLFIaxhVLnrXnFNOHKIoSZpLGxypQ5aJR
 aeo+xuzQZFaMzw0pHRde61zZweizX7rpAC/IEOfa9pCKCXbNwgJYR0gAp w==;
X-CSE-ConnectionGUID: WeeHGcKSRBCkWU5so/Qv6g==
X-CSE-MsgGUID: yVRjSZNXTgKLkWhmva3VeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82677409"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="82677409"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 03:50:50 -0700
X-CSE-ConnectionGUID: ipTISSKrSbCrZ1ZosWIr+g==
X-CSE-MsgGUID: mKNwg1LSQN6W0aYGUegDlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="248099650"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa007.jf.intel.com with ESMTP; 17 Jun 2026 03:50:46 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com, sk.anirban@intel.com,
 raag.jadav@intel.com, Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [RFC PATCH v3 3/3] drm/xe: use XE_RAS_WEDGED macro in
 xe_device_declare_wedged
Date: Wed, 17 Jun 2026 16:17:15 +0530
Message-ID: <20260617104711.79646-8-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617104711.79646-5-mallesh.koujalagi@intel.com>
References: <20260617104711.79646-5-mallesh.koujalagi@intel.com>
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

v3:
- Update message in xe_ras_log_wedged().
---
 drivers/gpu/drm/xe/xe_device.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 089872507bdd..8284578b9156 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -61,6 +61,7 @@
 #include "xe_psmi.h"
 #include "xe_pxp.h"
 #include "xe_query.h"
+#include "xe_ras_log.h"
 #include "xe_shrinker.h"
 #include "xe_soc_remapper.h"
 #include "xe_survivability_mode.h"
@@ -1424,12 +1425,12 @@ void xe_device_declare_wedged(struct xe_device *xe)
 	if (!atomic_xchg(&xe->wedged.flag, 1)) {
 		xe->needs_flr_on_fini = true;
 		xe_pm_runtime_get_noresume(xe);
-		drm_err(&xe->drm,
-			"CRITICAL: Xe has declared device %s as wedged.\n"
-			"IOCTLs and executions are blocked.\n"
-			"For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
-			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
-			dev_name(xe->drm.dev));
+		xe_ras_log_wedged(xe, -EIO,
+				  "CRITICAL: Xe has declared device %s as wedged.\n"
+				  "IOCTLs and executions are blocked.\n"
+				  "For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
+				  "Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
+				  dev_name(xe->drm.dev));
 	}
 
 	for_each_gt(gt, xe, id)
-- 
2.34.1

