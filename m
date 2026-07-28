Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D902BC54F5C
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 16:11:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECAC10E969;
	Tue, 28 Jul 2026 16:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UeWbtsZS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF85810E88A
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 16:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785255099; x=1816791099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0jwxlfkrGrVwjVytB9u+L474s6F0gRR63bYrvGUWEMY=;
 b=UeWbtsZSNPVdhB9x27BJqHTWKAj992YwceMy8izf2K4G9zrhha6ox3EX
 JbyLGUBl/CFeU8UO01P4O542WA/1OA98iYOx0wTPBljVAMqjHWtKh2jsH
 Es+I3ZN1g9hNo94oGRkDcTBnsz8JlqhzoauA4CiJPmEi06M1OtA4X6XeW
 pRa+hLf4ZkEqupUGKhV+wl2lM1S7/a8f4lzW03ejpKugT9TYULkLLChYL
 EGzBw8FG3K7AelP+/4EHU9HMFQS7bVYkJpVORTr4RiWza21yUq+2KldTK
 61GkWnUUVj7C8Y0gjUMzOM8Sx0r0u95FKleTJbzimgxQoKmCuoIuktap3 Q==;
X-CSE-ConnectionGUID: 1ufXSkoBRRmpvxArUQ2vyg==
X-CSE-MsgGUID: 6lVMCe9eRfyXaw6KYu/VCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103386297"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="103386297"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:39 -0700
X-CSE-ConnectionGUID: X4y8MhgqRBS8vusl4tkmlA==
X-CSE-MsgGUID: qJEAxmm4Rlalc/8D0O4mwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="259819438"
Received: from dmagui1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.118.167])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:37 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v2 18/22] drm/xe/guc: Report 'GuC mmio' errors using SIGID
Date: Tue, 28 Jul 2026 18:10:33 +0200
Message-ID: <20260728161039.579-19-michal.wajdeczko@intel.com>
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

Report various 'GuC mmio' errors using xe_log() helpers.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 4286bd05c686..c7f8bbd4cb92 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -39,6 +39,7 @@
 #include "xe_guc_rc.h"
 #include "xe_guc_relay.h"
 #include "xe_guc_submit.h"
+#include "xe_log.h"
 #include "xe_memirq.h"
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
@@ -1542,8 +1543,9 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 		/* scratch registers might be cleared during FLR, try once more */
 		if (!header) {
 			if (++lost > MAX_RETRIES_ON_FLR) {
-				xe_gt_err(gt, "GuC mmio request %#x: lost, too many retries %u\n",
-					  request[0], lost);
+				xe_log_err(gt, GUC, -ENOLINK,
+					   "MMIO request %#x: lost, too many retries %u\n",
+					   request[0], lost);
 				return -ENOLINK;
 			}
 			xe_gt_dbg(gt, "GuC mmio request %#x: lost, trying again\n", request[0]);
@@ -1551,8 +1553,8 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 			goto retry;
 		}
 timeout:
-		xe_gt_err(gt, "GuC mmio request %#x: no reply %#x\n",
-			  request[0], header);
+		xe_log_err(gt, GUC, ret, "MMIO request %#x: no reply %#x\n",
+			   request[0], header);
 		return ret;
 	}
 
@@ -1607,16 +1609,16 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 			return -EREMCHG;
 		}
 
-		xe_gt_err(gt, "GuC mmio request %#x: failure %#x hint %#x\n",
-			  request[0], error, hint);
+		xe_log_err(gt, GUC, -ENXIO, "MMIO request %#x: failure %#x hint %#x\n",
+			   request[0], error, hint);
 		return -ENXIO;
 	}
 
 	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) !=
 	    GUC_HXG_TYPE_RESPONSE_SUCCESS) {
 proto:
-		xe_gt_err(gt, "GuC mmio request %#x: unexpected reply %#x\n",
-			  request[0], header);
+		xe_log_err(gt, GUC, -EPROTO, "MMIO request %#x: unexpected reply %#x\n",
+			   request[0], header);
 		return -EPROTO;
 	}
 
-- 
2.47.1

