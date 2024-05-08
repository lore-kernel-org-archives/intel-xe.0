Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C07C10F1A
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 03:29:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C2110E0BA;
	Wed,  8 May 2024 03:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FIUzdvXZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7007610E0BA
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 03:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715138953; x=1746674953;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UAc25jDk2qrv+HXl/4A/kBCS25AKCiNfgRmACDxbgdo=;
 b=FIUzdvXZPkVfjZ1nUT3k89FPC2XT6nu9/VGlQTa5Uh3VZzdmcdfO2WLH
 gEjCKujC1R01vq1aP8cKn8XTUkrsHK+1BZoPk8yYDP5GzJoE6D0l0a3rd
 x/k5qmv9vySvHVsOwaYP2JqVQ1RMNcxsFAnHWfGlJLVVcAzJYrUxUAcXr
 JDaAAqDJin4FQ8ZXPa1QOCgI5APz0gHyE6WsqfNk6lWOpGsPbBmGRWgS6
 fq0ALx+OjEKM9/Vxh0vBEgMK54MFnTM4ol7ZU8Ze5CnlpWDPSJbV+Jhen
 z2ZCL3uEdS3c5CdYPpQ67JZvW/D/VHzBKmZ8lofRwJPKJBKQtQK5hW+Xv Q==;
X-CSE-ConnectionGUID: MzNb5+JUQm2E0jFmj/55ew==
X-CSE-MsgGUID: xOtqpQ9nRFuQ9aD3cKc0Pg==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="21536190"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; d="scan'208";a="21536190"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 20:29:13 -0700
X-CSE-ConnectionGUID: 45/iVSbaQD+ZaxHOXb9uJg==
X-CSE-MsgGUID: exRb5Sd5TVSnO619YfHodg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; d="scan'208";a="59585090"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa002.jf.intel.com with ESMTP; 07 May 2024 20:29:11 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2] drm/xe: Change pcode timeout to 50msec while polling again
Date: Wed,  8 May 2024 09:13:28 +0530
Message-Id: <20240508034328.3233072-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
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

Polling is initially attempted with timeout_base_ms enabled for
preemption, and if it exceeds this timeframe, another attempt is made
without preemption, allowing an additional 50 ms before timing out.

Display driver can request for timeout of 3 msec, hence modify the
warning condition.

v2
- Rebase

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index c010ef16fbf5..2771eed1e45f 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -10,6 +10,7 @@
 
 #include <drm/drm_managed.h>
 
+#include "xe_assert.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_mmio.h"
@@ -124,6 +125,8 @@ static int pcode_try_request(struct xe_gt *gt, u32 mbox,
 {
 	int slept, wait = 10;
 
+	xe_gt_assert(gt, timeout_us > 0);
+
 	for (slept = 0; slept < timeout_us; slept += wait) {
 		if (locked)
 			*status = pcode_mailbox_rw(gt, mbox, &request, NULL, 1, true,
@@ -166,7 +169,7 @@ static int pcode_try_request(struct xe_gt *gt, u32 mbox,
 int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
 		      u32 reply_mask, u32 reply, int timeout_base_ms)
 {
-	u32 status;
+	u32 status = 0;
 	int ret;
 
 	mutex_lock(&gt->pcode.lock);
@@ -188,10 +191,10 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
 	 */
 	drm_err(&gt_to_xe(gt)->drm,
 		"PCODE timeout, retrying with preemption disabled\n");
-	drm_WARN_ON_ONCE(&gt_to_xe(gt)->drm, timeout_base_ms > 1);
+	drm_WARN_ON_ONCE(&gt_to_xe(gt)->drm, timeout_base_ms > 3);
 	preempt_disable();
 	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
-				true, timeout_base_ms * 1000, true);
+				true, 50 * 1000, true);
 	preempt_enable();
 
 out:
-- 
2.25.1

