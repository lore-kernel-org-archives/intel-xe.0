Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3224AC04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 15:08:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DD010FC83;
	Wed,  8 May 2024 15:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PVqJS7b9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15CD810FC83
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 15:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715180886; x=1746716886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nE2DroKQm6zBizmCpfqHlfN8n5dWMnrEOy7XKqAFK4s=;
 b=PVqJS7b9SjsC7jI4cDs2qL23ogQgaGIiP9CDQXqI/mQ2OZUpuoi0QXVZ
 RPCH+ahj16iiG41mY2+xIjjpBtFnSP2+UKg2wNXPbNrMaegOXOySauL35
 mf01NLnDijgI0w1rp7cwu0bm16OqfBPAPR8PKMXyVGmngNZweDQ+23KT+
 aKXFtmT5hLDPSyW173qqFz/4qU7vV3xH89x+JsS6ZJFHg8u2kEoxu+zdo
 YOi8FJoKP8uq+PwivCl0SRYIxeJ/7lqxP3LBFqR95Yb1OP/owo6+ujaeD
 dL8dn0LNxmi10w+qWvijefmxpQ5Y+HQYTIIDrOKGJjvsPbAGfyDP4EIMQ Q==;
X-CSE-ConnectionGUID: JN/tzNnYRkewXkvlWsbwcg==
X-CSE-MsgGUID: Nxr9i1TcTDSlOMBXkAZOKQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="22442163"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="22442163"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 08:08:06 -0700
X-CSE-ConnectionGUID: 9b0CdWDrQimx0dV7/go0tQ==
X-CSE-MsgGUID: 7w3svYM0Qai+6jlruuxnJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33474820"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa004.fm.intel.com with ESMTP; 08 May 2024 08:08:04 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 2/2] drm/xe: Fix the warning conditions
Date: Wed,  8 May 2024 20:52:16 +0530
Message-Id: <20240508152216.3263109-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240508152216.3263109-1-himal.prasad.ghimiray@intel.com>
References: <20240508152216.3263109-1-himal.prasad.ghimiray@intel.com>
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

The maximum timeout display uses in xe_pcode_request is 3 msec, add the
warning in cases the function is misused with higher timeouts.

Add a warning if pcode_try_request is not passed the timeout parameter
greater than 0.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index a5e7da8cf944..9c4eefdf6642 100644
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
@@ -169,6 +172,8 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
 	u32 status;
 	int ret;
 
+	xe_gt_assert(gt, timeout_base_ms <= 3);
+
 	mutex_lock(&gt->pcode.lock);
 
 	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
@@ -188,7 +193,6 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
 	 */
 	drm_err(&gt_to_xe(gt)->drm,
 		"PCODE timeout, retrying with preemption disabled\n");
-	drm_WARN_ON_ONCE(&gt_to_xe(gt)->drm, timeout_base_ms > 1);
 	preempt_disable();
 	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
 				true, 50 * 1000, true);
-- 
2.25.1

