Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B878C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 13:07:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCF610E509;
	Tue,  5 Dec 2023 13:07:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6180610E509
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 13:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701781669; x=1733317669;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6B9iv6xf1ZdB3GtV2Ek7aarhk09ldLbaQdXQfQZXbCI=;
 b=C5O6MA1rmUD0aD8lxx0T7BeVVdXVWrtSSUpTH+sbOE7w2wYjnkqD+LbL
 Lk3etPgghxBXHKppjbQkvx0UpriSVsEq6vPSn2ZczrWh+OU3f9R8s4Pzw
 kCj1PSrUDuYjCh6dLsPWkjN1jKLQGyMFtrqPJrRup5otHX2UcRHT5Pr+0
 lXzseeHHy4+4oXY+f0KI+kUKS1MyLYgAwIY6KTByd8fy7u9Zi1+BD8gOH
 dR4AD0am0YUxFKD7hsZ3uMIcpXfLX6gL0OwbazALzL5QCFNTD18fjJ2PF
 GfrfQSfc1NJonzkOlEQWnGQcXZg9eKDU7E5K7O1BT6ibBycv6KKxhra2l w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="733522"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="733522"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 05:07:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="805268185"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="805268185"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga001.jf.intel.com with ESMTP; 05 Dec 2023 05:07:46 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Dec 2023 18:47:16 +0530
Message-Id: <20231205131716.847721-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/xe2: Add workaround 16021639441
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This workaround applies to graphics 20.04 and on
non render engine.

Workaround has three parts :
1. Pipe flush before MI_ATOMIC - This part isn't relevant to Xe
   (at least not right now) since we don't use MI_ATOMIC anywhere
   in the kernel mode driver.
2. Memory-based interrupt masking - Memory-based interrupt processing
   isn't supported on physical functions, only virtual functions,
   according to bspec 60352. So this is probably only relevant once
   SRIOV support lands in the driver.
3. Disabling CSB/timestamp updates to the ghwsp and pphwsp - Workaround
   is added by this change.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  4 ++++
 drivers/gpu/drm/xe/xe_rtp.c              |  6 ++++++
 drivers/gpu/drm/xe/xe_rtp.h              | 10 ++++++++++
 drivers/gpu/drm/xe/xe_wa.c               |  7 +++++++
 4 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 444ff9b83bb1..0875b2cc0f01 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -47,6 +47,10 @@
 #define RING_ESR(base)				XE_REG((base) + 0xb8)
 
 #define RING_CMD_CCTL(base)			XE_REG((base) + 0xc4, XE_REG_OPTION_MASKED)
+
+#define CSFE_CHICKEN1_REG(base)			XE_REG((base) + 0xd4, XE_REG_OPTION_MASKED)
+#define   GHWSP_CSB_REPORT_DIS			REG_BIT(15)
+#define   PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS	REG_BIT(14)
 /*
  * CMD_CCTL read/write fields take a MOCS value and _not_ a table index.
  * The lsb of each can be considered a separate enabling bit for encryption.
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index fb44cc7521d8..e84e08a66af3 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -309,6 +309,12 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
 		hwe->engine_id == __ffs(render_compute_mask);
 }
 
+bool xe_rtp_match_non_render(const struct xe_gt *gt,
+			     const struct xe_hw_engine *hwe)
+{
+	return hwe->class == XE_ENGINE_CLASS_RENDER ? false : true;
+}
+
 bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
 					 const struct xe_hw_engine *hwe)
 {
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index c56fedd126e6..a30f89d80046 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -427,4 +427,14 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
 bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
 					 const struct xe_hw_engine *hwe);
 
+/*
+ * xe_rtp_match_non_render - Match when non render engine in GT
+ *
+ * @gt: GT structure
+ * @hwe: Engine instance
+ *
+ * Returns: true if engine is not render, false otherwise.
+ */
+bool xe_rtp_match_non_render(const struct xe_gt *gt,
+			     const struct xe_hw_engine *hwe);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 63bd4bb1af03..45a910fe0141 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -596,6 +596,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
 	},
+	{ XE_RTP_NAME("16021639441"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
+		       FUNC(xe_rtp_match_non_render)),
+	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1_REG(0),
+			     GHWSP_CSB_REPORT_DIS |
+			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS))
+	},
 
 	{}
 };
-- 
2.25.1

