Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9225DC5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 19:15:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE3510F0F7;
	Wed, 12 Aug 2026 19:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GSC9X1St";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4A810F0F2
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786562152; x=1818098152;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ut5r1yKqg6J7hQUklMcnZ6bRW0wrnE3yZ7XP5M8UnY4=;
 b=GSC9X1Stp3gxlf7RhY7GavyCiOzFDflpeJ6xtHEWQli4OctXjBSAU50/
 oeYNHLO+swjFYZygPy1ylmXUP3Ibe4aQF0yIq470sg35SKaGhPjC1ptyF
 taf8EQU6g2LXfpC/NjtFPW5jOWC1uZTCNYGDtTwUVRg2aVclUvAeyOjEY
 kA+31fKK3ORIYcf4+IeSqPXP7MRESEaEP0E8VlOO+a5kaUIi8MKMPFaGc
 Jz5vPSBpmHLo4Vb5qaD5I92Q5YwAFJ10WXCPg33HQZhlX2NVfZzHUPJhN
 ZGBfFpL43XbCkU/yK6CoESqmAhxQyxMle28oSNARK9WzYJFEGLNKYkpmO w==;
X-CSE-ConnectionGUID: HR81ALZHR7uL9T2ZaR08RA==
X-CSE-MsgGUID: mg2W7z4ZS0yNe4b+N2MuYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86987604"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86987604"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:52 -0700
X-CSE-ConnectionGUID: CWckVlB4QH2DioT/A7Rfpw==
X-CSE-MsgGUID: xKU4inETTZeNKTft1IFUdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="268892091"
Received: from miqurash-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:50 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v4 28/32] drm/xe/guc: Report 'GuC mmio' errors using SIGID
Date: Wed, 12 Aug 2026 21:14:44 +0200
Message-ID: <20260812191450.11690-29-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812191450.11690-1-michal.wajdeczko@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
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
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
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

