Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803A6C43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 11:58:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4146510EC57;
	Tue, 30 Jun 2026 11:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FdcXlVoS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3004410EC55
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 11:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782820737; x=1814356737;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mH/xTODmI6cVgOPkEkNup28e39ZrWSYr7i3ROGiagaI=;
 b=FdcXlVoSWHZmd8tZN/ZVwuVSBz2HjjOuRtruN0ytkkHz8V1Hw2Hz0SHZ
 45gKhjhZ0J2HV3dOZUu5ndDVzXSKe1wRO630wnhiTPkPBt0KaekX7APam
 wI0CTpdg4nyNXlhQ3fsS22Jp5IbcaQFGQJmw/aA6dSI8OKjZRDNNvugoR
 jfGkC9H1WpVMIo9yRcTZGjO1CZrsQIwIpP4lpJRUKN5lT2ItxZGG9q0se
 Bglm3kxpslzTJF7yIskeFgvGP2EwtzyNAnFo5+SZwS2uP281vurgiZwK1
 +MkN3KBFT89rkg6TnM31+PCjLu7eeGPhNS6IgClwyQXGOpHmvWc9NfA0Z Q==;
X-CSE-ConnectionGUID: ZVSzrypqQY+6eB3bj697yQ==
X-CSE-MsgGUID: grRkG568TE2O6zTtKTeseA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="106323576"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="106323576"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 04:58:57 -0700
X-CSE-ConnectionGUID: aaV8I51cSfanOtfx6YW8tg==
X-CSE-MsgGUID: 3ChkhjjES2yBLBQ1jWUowQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="255839683"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 30 Jun 2026 04:58:52 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com, sk.anirban@intel.com,
 raag.jadav@intel.com, Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [RFC PATCH v4 3/5] drm/xe: use xe_ras_log_wedged macro in
 xe_device_declare_wedged
Date: Tue, 30 Jun 2026 17:25:07 +0530
Message-ID: <20260630115503.407158-10-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630115503.407158-7-mallesh.koujalagi@intel.com>
References: <20260630115503.407158-7-mallesh.koujalagi@intel.com>
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

Replace the open-coded drm_err() call with xe_ras_log_wedged()
macro so that wedge events are reported through the unified
RAS/SIG logging path with a consistent format, CPER severity,
and errno.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2:
- Rebase.

v3:
- Update message in xe_ras_log_wedged().

v4:
- Replace XE_RAS_WEDGED to xe_ras_log_wedged. (Dnyaneshwar)
---
 drivers/gpu/drm/xe/xe_device.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b6e49309a99f..7538ac7c7dfb 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -62,6 +62,7 @@
 #include "xe_pxp.h"
 #include "xe_query.h"
 #include "xe_ras.h"
+#include "xe_ras_log.h"
 #include "xe_shrinker.h"
 #include "xe_soc_remapper.h"
 #include "xe_survivability_mode.h"
@@ -1428,12 +1429,12 @@ void xe_device_declare_wedged(struct xe_device *xe)
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

