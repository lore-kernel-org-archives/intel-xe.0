Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B02C4167D
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 21:01:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088A910E695;
	Tue, 12 Dec 2023 21:01:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B41C10E685
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 21:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702414886; x=1733950886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MrqovpiWEqzV2Hm2M7kfg4zS6EH9+EAGf5WLkOJr+TE=;
 b=eG6QwvU9fKQ549vVE4SMebPAqLed9+1R26waWBupIxHPNhcpGdxU0BF0
 q4Wt/MqfqNLS0mhkEoVzZmK3lvppvYTLZfW0fKPUzL1rj97YEweF2KQ1q
 P0a6ZC2wP7DTKZQ8fZHKj2ic2KVHK+cZNJy8bovgZp9CMC8Lo5+C6+DP2
 I3lStgct6mA3ps7Y1KJBF01fkMgApSGyylWqb2VnpOxxxhzfvs5LK15OA
 +VnyHNNfvD6eRMocw3XBlsfh2BRZMjjeQnST52VQX7Mmblv88bMYa9WGi
 SVQTG1dsW+avEOjilanT3cP3YbtajmHBF4NDbBU9sqWnk1jrIYdAMB3oy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="397654614"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="397654614"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 13:01:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="917417226"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="917417226"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.128.218])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 13:01:23 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 08/10] drm/xe/vf: Update LRC with memory based interrupts data
Date: Tue, 12 Dec 2023 22:00:52 +0100
Message-Id: <20231212210054.1747-9-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231212210054.1747-1-michal.wajdeczko@intel.com>
References: <20231212210054.1747-1-michal.wajdeczko@intel.com>
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

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index d6dfbd0bdc70..4101558f01ce 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -21,6 +21,8 @@
 #include "xe_gt_printk.h"
 #include "xe_hw_fence.h"
 #include "xe_map.h"
+#include "xe_memirq.h"
+#include "xe_sriov.h"
 #include "xe_vm.h"
 
 #define CTX_VALID				(1 << 0)
@@ -534,6 +536,27 @@ static void set_context_control(u32 *regs, struct xe_hw_engine *hwe)
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
@@ -669,6 +692,7 @@ static void *empty_lrc_data(struct xe_hw_engine *hwe)
 	regs = data + LRC_PPHWSP_SIZE;
 	set_offsets(regs, reg_offsets(xe, hwe->class), hwe);
 	set_context_control(regs, hwe);
+	set_memory_based_intr(regs, hwe);
 	reset_stop_ring(regs, hwe);
 
 	return data;
-- 
2.25.1

