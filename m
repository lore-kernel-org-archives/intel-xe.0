Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F12BC531D0
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 20:38:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B24710F203;
	Thu, 23 Jul 2026 20:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z7iD4UCg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462A910F200
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 20:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784839110; x=1816375110;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3GXSV3q46jBhhhpPlFL4zvlszcNlOke4qwPvzlt5AjM=;
 b=Z7iD4UCgDSyzsLi9D+kfHHsGm3UAQkeGR54BVzM3sUrzR29/NYHRt1X2
 8eS4eiGdZvZftPgNQCuMZiEs9VqS4tLoYrEAp3/f/eIQ/PXe9EK4yCX3N
 XT9DZD6bDizf2rQlgQMaL6mmw7JRkhRZEdd1RFWj1Q49xuFuAzPliMMmS
 OaYO88H2xmc8x9yAjg+pNkLBhMMU9C7c85n2UaewYyMYYWhegeKvRPdv+
 9Ihpy1mOXlRZNAJI8dmajA54krHmtaj7SqrydVSqvVKOwvFfEdd9wuMQn
 Hbo5F2xvzI43thAJFivTypd7UGVF8sCZs1bofNZo241+cHNbGQrRDt25R Q==;
X-CSE-ConnectionGUID: oxUOPKiZTuCja5xuixDhkA==
X-CSE-MsgGUID: x1hXl977Tx63D0Og7x0lcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="84484317"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="84484317"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:38:30 -0700
X-CSE-ConnectionGUID: LrAdhpj9ThKspoRG71rICA==
X-CSE-MsgGUID: bYtGfjujSw6TERC3yx2Anw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="254578618"
Received: from psiebies-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.135])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:38:29 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH 13/19] drm/xe: Report 'device wedged' errors using SIGID
Date: Thu, 23 Jul 2026 22:37:46 +0200
Message-ID: <20260723203754.3782-14-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723203754.3782-1-michal.wajdeczko@intel.com>
References: <20260723203754.3782-1-michal.wajdeczko@intel.com>
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

Report 'device wedged' error using xe_log_err_fatal() helper.
Use -EIO as the error cause, as nothing else is provided here.
The hints about the recovery method and bug filling are now
separated as it only needs to be printed once.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4eed9a251e65..b1e9bcd9f5b4 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -48,6 +48,7 @@
 #include "xe_i2c.h"
 #include "xe_irq.h"
 #include "xe_late_bind_fw.h"
+#include "xe_log.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_nvm.h"
@@ -1396,6 +1397,9 @@ void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
 	xe->wedged.method = method;
 }
 
+#define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
+#define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
+
 /**
  * xe_device_declare_wedged - Declare device wedged
  * @xe: xe device instance
@@ -1427,12 +1431,12 @@ void xe_device_declare_wedged(struct xe_device *xe)
 	if (!atomic_xchg(&xe->wedged.flag, 1)) {
 		xe->needs_flr_on_fini = true;
 		xe_pm_runtime_get_noresume(xe);
-		drm_err(&xe->drm,
-			"CRITICAL: Xe has declared device %s as wedged.\n"
-			"IOCTLs and executions are blocked.\n"
-			"For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
-			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
-			dev_name(xe->drm.dev));
+
+		xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
+		xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
+			    "For recovery procedure, refer to %s\n"
+			    "Please file a _new_ bug report at %s\n",
+			    WEDGED_URL, XE_BUG_URL);
 	}
 
 	for_each_gt(gt, xe, id)
-- 
2.47.1

