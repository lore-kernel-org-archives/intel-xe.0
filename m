Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34474CE8E8F
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 16:00:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB75B10E2A5;
	Thu, 24 Oct 2024 16:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VAZcTOyd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111EC10E2A5
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 16:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729785629; x=1761321629;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HdD6LFiCfxFHCFx4F91EgQcK3pcUN0AemqdP0RklwX0=;
 b=VAZcTOydp16Y0cb01j7KIf5+0iJgi34M+IaL2YW9q/T51kb2MRExxOVu
 EhCl494OROm1sVuYvebUi7uRw4LevgJgyDttd9mfLqpaNmMM+yFiM9eBe
 Er6kTN0XIQRa6AJxXziM/ncmm8xDcKLPqWQ64Tde4U7ZxPhVrgJjOKRXS
 hII0JUyf7dV1aaEmijrrrAXOSpgWBMX6vQnFU+X6ml+xweRyM8ZtZHeke
 ddBYjjjEH9PkW2f57SSIJzVAgDIKAbCIawzuU3N1T9NmiycG/Km4HQn6l
 EUh/I8263l15zUd5YLuvwVLkuiQVFrns7d5g8kyFA8S7ALgxCde1bd9kd w==;
X-CSE-ConnectionGUID: WwCxf78kQqmBIbjHszn8iQ==
X-CSE-MsgGUID: lnAO3JhmSmClHGiB5fA6KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="33331269"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="33331269"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 09:00:19 -0700
X-CSE-ConnectionGUID: pD0LmetCTleqkcJL+jaFqQ==
X-CSE-MsgGUID: 6ElvGkYiTwmk6LjakkP0Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="85415741"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 09:00:16 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, stable@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] drm/xe/ufence: Flush xe ordered_wq in case of ufence
 timeout
Date: Thu, 24 Oct 2024 17:18:15 +0200
Message-ID: <20241024151815.929142-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Flush xe ordered_wq in case of ufence timeout which is observed
on LNL and that points to the recent scheduling issue with E-cores.

This is similar to the recent fix:
commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
response timeout") and should be removed once there is E core
scheduling fix.

v2: Add platform check(Himal)
    s/__flush_workqueue/flush_workqueue(Jani)

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: <stable@vger.kernel.org> # v6.11+
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2754
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index f5deb81eba01..78a0ad3c78fe 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -13,6 +13,7 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_macros.h"
+#include "compat-i915-headers/i915_drv.h"
 #include "xe_exec_queue.h"
 
 static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
@@ -155,6 +156,19 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 		}
 
 		if (!timeout) {
+			if (IS_LUNARLAKE(xe)) {
+				/*
+				 * This is analogous to e51527233804 ("drm/xe/guc/ct: Flush g2h
+				 * worker in case of g2h response timeout")
+				 *
+				 * TODO: Drop this change once workqueue scheduling delay issue is
+				 * fixed on LNL Hybrid CPU.
+				 */
+				flush_workqueue(xe->ordered_wq);
+				err = do_compare(addr, args->value, args->mask, args->op);
+				if (err <= 0)
+					break;
+			}
 			err = -ETIME;
 			break;
 		}
-- 
2.46.0

