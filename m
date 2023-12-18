Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931BBC46CD3
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 19:01:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6E310E3AA;
	Mon, 18 Dec 2023 19:01:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1368710E3B7
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 19:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702926048; x=1734462048;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=OlkW9qvNtxhjQTYtVdOGTfgs8vmCtmcw6fydwIyI1Io=;
 b=fzyMB3Pud/IizH7Bh4+u8Mi//EY01huqDZ2g/BoVwaqxEaw05qpMjEgH
 UyX481Xm1gzHJ06cwJUaC0NNtnP1GonlWlk0aogtxFS2VNE57BQecyYZp
 TNzT0RiAzY+MwcApaAlIGbGu8/b22O4dI331VeyEDg4UBEf4tNH8A8c4h
 SWXxwgI84lspo8KaoleWurNdpi4uIEioERv+AvzFF3OWpQut751VAZTJn
 20QGUA8/bi/mxN23SD2Xd0ih0N+lb+lfW1TzT4LSGcNvgJOLJAUvSDSrz
 q9cSGdagUPFiWGCTkmKVoxyyktZU7kJ2tyf3wLeSRkPrwJhuGJDMuU69d A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="461984338"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="461984338"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 08:53:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="779157444"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="779157444"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.130.107])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 08:53:58 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 08/10] drm/xe/vf: Update LRC with memory based interrupts data
Date: Mon, 18 Dec 2023 17:53:42 +0100
Message-Id: <20231218165344.458-9-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231218165344.458-1-michal.wajdeczko@intel.com>
References: <20231218165344.458-1-michal.wajdeczko@intel.com>
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

When Memory Based Interrupts are used, the VF driver must provide
in the LRC the references to the Source and Status Report Pages.

Update the LRC according to the requirements.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Link: https://lore.kernel.org/r/20231214185955.1791-9-michal.wajdeczko@intel.com
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 44586e612eaf..f17e9785355e 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -19,6 +19,8 @@
 #include "xe_gt_printk.h"
 #include "xe_hw_fence.h"
 #include "xe_map.h"
+#include "xe_memirq.h"
+#include "xe_sriov.h"
 #include "xe_vm.h"
 
 #define CTX_VALID				(1 << 0)
@@ -532,6 +534,27 @@ static void set_context_control(u32 *regs, struct xe_hw_engine *hwe)
 	/* TODO: Timestamp */
 }
 
+static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
+{
+	struct xe_memirq *memirq = &gt_to_tile(hwe->gt)->sriov.vf.memirq;
+	struct xe_device *xe = gt_to_xe(hwe->gt);
+
+	if (!IS_SRIOV_VF(xe) || !xe_device_has_memirq(xe))
+		return;
+
+	regs[CTX_LRM_INT_MASK_ENABLE] = MI_LOAD_REGISTER_MEM |
+					MI_LRI_LRM_CS_MMIO | MI_LRM_USE_GGTT;
+	regs[CTX_INT_MASK_ENABLE_REG] = RING_IMR(0).addr;
+	regs[CTX_INT_MASK_ENABLE_PTR] = xe_memirq_enable_ptr(memirq);
+
+	regs[CTX_LRI_INT_REPORT_PTR] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(2) |
+				       MI_LRI_LRM_CS_MMIO | MI_LRI_FORCE_POSTED;
+	regs[CTX_INT_STATUS_REPORT_REG] = RING_INT_STATUS_RPT_PTR(0).addr;
+	regs[CTX_INT_STATUS_REPORT_PTR] = xe_memirq_status_ptr(memirq);
+	regs[CTX_INT_SRC_REPORT_REG] = RING_INT_SRC_RPT_PTR(0).addr;
+	regs[CTX_INT_SRC_REPORT_PTR] = xe_memirq_source_ptr(memirq);
+}
+
 static int lrc_ring_mi_mode(struct xe_hw_engine *hwe)
 {
 	struct xe_device *xe = gt_to_xe(hwe->gt);
@@ -667,6 +690,7 @@ static void *empty_lrc_data(struct xe_hw_engine *hwe)
 	regs = data + LRC_PPHWSP_SIZE;
 	set_offsets(regs, reg_offsets(xe, hwe->class), hwe);
 	set_context_control(regs, hwe);
+	set_memory_based_intr(regs, hwe);
 	reset_stop_ring(regs, hwe);
 
 	return data;
-- 
2.25.1

