Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C30FC87FD1
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 08:12:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34CA10E2E5;
	Wed,  6 Aug 2025 08:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OTMMJhPd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BE110E2E5
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 08:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754467944; x=1786003944;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XdimF+bUQ5MCTd9XRrQYiGAjQmu71dY3P9cA66NFfuo=;
 b=OTMMJhPdB1oZKKwumsMc0g6NTYpkwqpwvFbDqJuVYM0UwdG66O9/5axu
 8Xh87OFzIP/lPYtAZhUogh/OUm/+nFP+EJvnrTeMEbhpp1GK2L7sEf/79
 vu/PPgUzY3vKC7zyYBnr/rMSeRjlG1IXUxjgz5rt3q5SAvZVfF4K3chX3
 2vetnbtmBLTk+1NtsKzfgtD4CwksqQeUWJqBhj2hK5edggmpWPHcSvB2S
 /54t+gwZnw5AcwBgOPVwwGsz9cmGh7UFv83A4TC/arTmN+CvsWEoa9fny
 z5Ox2aQTa+QC3GkfBLiIIEZ4VfQmHx1iRxpMK2eRTFLcZz2984O0eXZEF w==;
X-CSE-ConnectionGUID: 4MCqMDZuRsGxTX9rw2gnDw==
X-CSE-MsgGUID: mJPZBii/S9CuXOIKZBgW3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="55815328"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="55815328"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 01:12:24 -0700
X-CSE-ConnectionGUID: c0Mcca6kQLS52Qozgg7B+w==
X-CSE-MsgGUID: u//UrONnTpW4K40dVqnZhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164625058"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa006.fm.intel.com with ESMTP; 06 Aug 2025 01:12:22 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 2/2] drm/xe/guc: Scale mmio send/recv timeout for CCS
 save/restore with smem size
Date: Wed,  6 Aug 2025 13:59:10 +0530
Message-ID: <20250806082910.15845-3-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250806082910.15845-1-satyanarayana.k.v.p@intel.com>
References: <20250806082910.15845-1-satyanarayana.k.v.p@intel.com>
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

After VF migration, GUC restores CCS metadata scaled to system memory size.
The default timeout (50ms) is calibrated for 4GB memory capacity per
specification. Timeouts for other memory sizes are proportionally derived
from this baseline.

This ensures adequate restoration time for CCS metadata across
different hardware configurations while maintaining spec compliance.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 9e34401e4489..d836ded83491 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -10,6 +10,7 @@
 #include <generated/xe_wa_oob.h>
 
 #include "abi/guc_actions_abi.h"
+#include "abi/guc_actions_sriov_abi.h"
 #include "abi/guc_errors_abi.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_gtt_defs.h"
@@ -1397,6 +1398,36 @@ int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr)
 	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
 }
 
+/*
+ * After VF migration, GUC restores CCS metadata scaled to system memory size.
+ * Default timeout (50ms) is calibrated for 4GB memory capacity per
+ * specification. Timeouts for other memory sizes are proportionally derived
+ * from this baseline.
+ */
+static u32 guc_mmio_send_recv_timeout(struct xe_guc *guc, const u32 *request)
+{
+	struct xe_device *xe = guc_to_xe(guc);
+	u32 timeout = 50000;
+	u32 action, factor;
+	struct sysinfo si;
+	u64 sys_mem_size;
+
+	action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, request[0]);
+	if (action != GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE || IS_DGFX(xe) ||
+	    !xe_device_has_flat_ccs(xe))
+		return timeout;
+
+	si_meminfo(&si);
+	sys_mem_size = si.totalram * si.mem_unit;
+
+	if (sys_mem_size <= SZ_4G)
+		return timeout;
+
+	factor = (sys_mem_size + SZ_4G) / SZ_4G;
+	timeout *= factor;
+
+	return timeout;
+}
 int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 			  u32 len, u32 *response_buf)
 {
@@ -1439,7 +1470,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 
 	ret = xe_mmio_wait32(mmio, reply_reg, GUC_HXG_MSG_0_ORIGIN,
 			     FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_GUC),
-			     50000, &reply, false);
+			     guc_mmio_send_recv_timeout(guc, request), &reply, false);
 	if (ret) {
 		/* scratch registers might be cleared during FLR, try once more */
 		if (!reply && !lost) {
-- 
2.43.0

