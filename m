Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38991C54F4D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 16:11:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F4510E88A;
	Tue, 28 Jul 2026 16:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XSeHuyFl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF7310E88A
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 16:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785255095; x=1816791095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3GXSV3q46jBhhhpPlFL4zvlszcNlOke4qwPvzlt5AjM=;
 b=XSeHuyFlWK8vTzj1fcpgJzLBe0AjDJEqgexTBMrQbqVRvHHZMWvJRe7+
 DdQGxo3wGq38d0y0kdWVhIEyMJArRXtP6RQ2Ck5wBoq7TD0hi7sVt+2bF
 Hkrvw0uwihX1iZDz29eSuHRmzOHBQVF9BIeGrTUVS6KohJJ8BAE4onkhV
 Rb14UBbSG1KVC0lAZXOEq6B4a882qPDx8C8+6t9K7utJLMXDU1VUrp60M
 TOUSrIxPvili2xoMXnvRj3XaqZHwS8meqCOMu9MTWK5iOn7zqI/ULK09o
 4uuvmRxAphq52+RIqQfDrWGsUQzJMJ/8KXE+PzEG/AL0ujX5obSoaW4xz A==;
X-CSE-ConnectionGUID: dZa5WvKmQnOIe5xdC6dSuw==
X-CSE-MsgGUID: bs1UhV7rSF+FeDpXuKuliA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103386293"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="103386293"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:35 -0700
X-CSE-ConnectionGUID: kDUK2/c5RUCy6g9gMcP1HQ==
X-CSE-MsgGUID: 7zoKCwtwRMWkmKPDZC9+bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="259819419"
Received: from dmagui1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.118.167])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:33 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v2 16/22] drm/xe: Report 'device wedged' errors using SIGID
Date: Tue, 28 Jul 2026 18:10:31 +0200
Message-ID: <20260728161039.579-17-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728161039.579-1-michal.wajdeczko@intel.com>
References: <20260728161039.579-1-michal.wajdeczko@intel.com>
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

