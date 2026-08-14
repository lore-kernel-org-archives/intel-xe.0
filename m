Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D93C5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:19:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1791910F6C8;
	Fri, 14 Aug 2026 17:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eiB31i+c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C355210F6D6
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786727942; x=1818263942;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wj8Hy8+dxR7AYJ1mgebe6KqSWaURiDOq4n0dX0gMlDs=;
 b=eiB31i+ccMhUJoKEUtYE8sO97t5yhGfbLXnU7KGCYGRcx/T2CrnU+Yzg
 sOn7rKESfKMuXPvvWQqjigLvLC9m4Uk53/BZOTMOPswLHjy96EI0DP22M
 VU+dFjpzPA9kEB7M9XwVSKSfhRc7nvfder8f1ko8nnNWacaQs/coR2boX
 9mcdztKfyRtMkJL30vEMXVRI2wZBO+fLDtMiXlgHLq7N849pTiiCtQeZR
 /oVq1TIReSrFTyZlgRjt2qH40WtFdLXroSdLlNv3ghvzyWggdoC6M1Hgq
 g6N9MBiBp9umL0gUtIfVZTv0NuKkpEtFf0ejHTmSMjM5JOAmpye3+oR6e w==;
X-CSE-ConnectionGUID: 5b9A0pNXSPCQnt7ya3H+sA==
X-CSE-MsgGUID: BcTo52L7THm8EisiXj6euA==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98464096"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98464096"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:19:02 -0700
X-CSE-ConnectionGUID: OO7c0sxHS4SzGCIVVk6qUg==
X-CSE-MsgGUID: 1v5IPGNhTiyi+Pj/NT2Afw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="262946292"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:19:01 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v5 25/33] drm/xe: Report 'device wedged' errors using SIGID
Date: Fri, 14 Aug 2026 19:17:51 +0200
Message-ID: <20260814171801.13347-26-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814171801.13347-1-michal.wajdeczko@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
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
The hints about the recovery method and bug filing are now
separated as it only needs to be printed once.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 71111ad32465..74d566693dfd 100644
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
@@ -1442,6 +1443,9 @@ void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
 	xe->wedged.method = method;
 }
 
+#define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
+#define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
+
 /**
  * xe_device_declare_wedged - Declare device wedged
  * @xe: xe device instance
@@ -1473,12 +1477,12 @@ void xe_device_declare_wedged(struct xe_device *xe)
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

