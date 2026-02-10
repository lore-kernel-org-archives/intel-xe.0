Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA8DE94619
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 11:21:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598F610E10F;
	Tue, 10 Feb 2026 11:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lu4HilAm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F069510E10F;
 Tue, 10 Feb 2026 11:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770722479; x=1802258479;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B/KarfDUmBJUVGjSILUNbu4cSeVHblKvwghCV6bT3hU=;
 b=Lu4HilAmtN8K5iRKU735oySVTvXL/3DwwGvHPn2NAVUdFPUKeIl+53zM
 VtqJopNWrpOqS4Xy5zkUuIbS8fqrTpBZlKUiB5qTa5tVzG+LcU8bOPEEn
 QXVAPyDs91yiWW8AHAtuTIUA5rLwg6hj6qoDZ2gUKQ2VQCz/buX6WvoSx
 WrcqaKZbhYYN35Uzbq7kiIC0Kq7mvH6/25YSH2EshO/Hh2CDBn4QwzR1V
 mHiUoDpRUddE5fbD4Pat8VKqt9o2hHJfVaXqVac0mjDpcKT46UbLxnksi
 EbMxDqdcmpamxoVOMPn+FygiN9ALg9TRDXBlFRZ1LGYjrq3/tjJ2Lyf44 w==;
X-CSE-ConnectionGUID: 6menQxpYQNq5pt0/I4uufA==
X-CSE-MsgGUID: dhsLejWDQlSqK3+VT128mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="75693246"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="75693246"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 03:21:18 -0800
X-CSE-ConnectionGUID: vxzY8NwUTg+T92Op8s7MmA==
X-CSE-MsgGUID: 3CTpHz1wT3OjOrrTyCwVeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="216426334"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by orviesa004.jf.intel.com with ESMTP; 10 Feb 2026 03:21:18 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v1] drm/i915/aux: use polling when irqs are unavailable
Date: Tue, 10 Feb 2026 12:19:52 +0100
Message-ID: <20260210111952.4138954-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

PTL with physically disconnected display was observed to have 40s longer
execution time when testing xe_fault_injection@xe_guc_mmio_send_recv.
The issue has not been seen when reverting commit 40a9f77a28fa ("Revert
"drm/i915/dp: change aux_ctl reg read to polling read"").

Apparently the configuration suffers from not having AUX enabled when
using interrupts. One probable cause can be xe enabling interrupts too
late: interrupts need memory allocations which currently can't be done
before the display FB takeover is done.

As for now, use polling for AUX in case interrupts are unavailable.

Fixes: 40a9f77a28fa ("Revert "drm/i915/dp: change aux_ctl reg read to polling read"")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
index b20ec3e589fad..9c9b6410366d5 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
@@ -12,6 +12,7 @@
 #include "intel_dp.h"
 #include "intel_dp_aux.h"
 #include "intel_dp_aux_regs.h"
+#include "intel_parent.h"
 #include "intel_pps.h"
 #include "intel_quirks.h"
 #include "intel_tc.h"
@@ -60,18 +61,29 @@ intel_dp_aux_wait_done(struct intel_dp *intel_dp)
 	struct intel_display *display = to_intel_display(intel_dp);
 	i915_reg_t ch_ctl = intel_dp->aux_ch_ctl_reg(intel_dp);
 	const unsigned int timeout_ms = 10;
+	bool done = true;
 	u32 status;
-	bool done;
+	int ret;
 
+	if (intel_parent_irq_enabled(display)) {
 #define C (((status = intel_de_read_notrace(display, ch_ctl)) & DP_AUX_CH_CTL_SEND_BUSY) == 0)
-	done = wait_event_timeout(display->gmbus.wait_queue, C,
-				  msecs_to_jiffies_timeout(timeout_ms));
+		done = wait_event_timeout(display->gmbus.wait_queue, C,
+					  msecs_to_jiffies_timeout(timeout_ms));
+
+#undef C
+	} else {
+		ret = intel_de_wait_ms(display, ch_ctl,
+				       DP_AUX_CH_CTL_SEND_BUSY, 0,
+				       timeout_ms, &status);
+
+		if (ret == -ETIMEDOUT)
+			done = false;
+	}
 
 	if (!done)
 		drm_err(display->drm,
 			"%s: did not complete or timeout within %ums (status 0x%08x)\n",
 			intel_dp->aux.name, timeout_ms, status);
-#undef C
 
 	return status;
 }
-- 
2.45.2

