Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D782C55164
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 15:33:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1962110EFBF;
	Thu, 30 Jul 2026 15:33:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W//03QQ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7C410EFB9
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 15:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785425611; x=1816961611;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3GXSV3q46jBhhhpPlFL4zvlszcNlOke4qwPvzlt5AjM=;
 b=W//03QQ7/hmXe2VEBcr3nhYWFLmiRNZazdBdc/C9qhho5o7yrOdroASI
 tYdjzsN7x4Ic2fN45yNeUxxeghxMkekAvI7X27H0ntFOmCRWBTjf8ldWt
 QmreBTRkqo4bWgN6Y9tNT2GqW4bAxcePL4HveDNZZfB+JMqXaoGmOO4M/
 sBZJi+GFkeDlNdqCFVY8ymdsx42VNSrHPXRVDfV8LqPhAdaQMZOxZCLga
 CMAwUGT3vCl6b47Emv1IKjHYke5kzqeaDNsX2zdXiIzRzMm9GLg9+w0f1
 kfTHt29uavXK/cyLZgWSQbKZOl9qf0BelO++9+12NOXzOgWHVc7af3+Wi A==;
X-CSE-ConnectionGUID: pEcBUzD9TviyGu+7OOODzQ==
X-CSE-MsgGUID: R18vrwf0R1q43K7Ti14hNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="73583101"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="73583101"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 08:33:28 -0700
X-CSE-ConnectionGUID: Up2MfMxaT3mx3VdKe1gT0g==
X-CSE-MsgGUID: Mr3xbZy4QDuzNlyqZrBGcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="260387623"
Received: from psiebies-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.135])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 08:33:27 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v3 17/23] drm/xe: Report 'device wedged' errors using SIGID
Date: Thu, 30 Jul 2026 17:21:13 +0200
Message-ID: <20260730152121.576-18-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730152121.576-1-michal.wajdeczko@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
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

