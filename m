Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14681C4167D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 18:47:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC93B10E209;
	Thu, 14 Dec 2023 18:47:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC8910E0D7
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 18:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702579648; x=1734115648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hcpHmyaX39cSh47c13I/gzZ38A4DrUVjjBFTV9VsQq8=;
 b=YTT9rctJEBXHM0jWmrW+rc+al+/Unbh/xHxkSebg6bLN0JASnV5RvBS6
 KSipDUPpliIEdoFb+zz5pjwydkLPY9YjFB4KZORe4v4j2u3c3UjLm4B38
 MrRqCqlIkz9MG7kBtF37DAA2HEcDQuOjBPSk+JE7aAM2ABFxgurlbAC9i
 tktlderLQqKPvXJz7ip8aKsldmxmL2aQLTlKNw2WNQ6HMJnrJlawAe4mx
 rkOeyWmT6OlW95v59ZoecjXHBktEwHKHsDJMsnflw997BtTk3G+ahAo5z
 tnwqz9Cghob7KVs/OSl2j67RG2roa7h4FioEy3d4daoBHHwrmQFm7ohDH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="397953932"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="397953932"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 10:47:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="892581843"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="892581843"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 10:47:11 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/8] drm/xe: Move engine base offsets to engine register header
Date: Thu, 14 Dec 2023 10:47:04 -0800
Message-ID: <20231214184659.2249559-14-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231214184659.2249559-10-matthew.d.roper@intel.com>
References: <20231214184659.2249559-10-matthew.d.roper@intel.com>
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

These offsets are primarily used as parameters for the engine register
definitions, so it makes more sense to define them in the engine header
rather than the general register header.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 33 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/regs/xe_regs.h        | 28 --------------------
 2 files changed, 33 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 7f82bef3a0db..5592774fc690 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -10,6 +10,39 @@
 
 #include "regs/xe_reg_defs.h"
 
+/*
+ * These *_BASE values represent the MMIO offset where each hardware engine's
+ * registers start.  The other definitions in this header are parameterized
+ * macros that will take one of these values as a parameter.
+ */
+#define RENDER_RING_BASE			0x02000
+#define BSD_RING_BASE				0x1c0000
+#define BSD2_RING_BASE				0x1c4000
+#define BSD3_RING_BASE				0x1d0000
+#define BSD4_RING_BASE				0x1d4000
+#define XEHP_BSD5_RING_BASE			0x1e0000
+#define XEHP_BSD6_RING_BASE			0x1e4000
+#define XEHP_BSD7_RING_BASE			0x1f0000
+#define XEHP_BSD8_RING_BASE			0x1f4000
+#define VEBOX_RING_BASE				0x1c8000
+#define VEBOX2_RING_BASE			0x1d8000
+#define XEHP_VEBOX3_RING_BASE			0x1e8000
+#define XEHP_VEBOX4_RING_BASE			0x1f8000
+#define COMPUTE0_RING_BASE			0x1a000
+#define COMPUTE1_RING_BASE			0x1c000
+#define COMPUTE2_RING_BASE			0x1e000
+#define COMPUTE3_RING_BASE			0x26000
+#define BLT_RING_BASE				0x22000
+#define XEHPC_BCS1_RING_BASE			0x3e0000
+#define XEHPC_BCS2_RING_BASE			0x3e2000
+#define XEHPC_BCS3_RING_BASE			0x3e4000
+#define XEHPC_BCS4_RING_BASE			0x3e6000
+#define XEHPC_BCS5_RING_BASE			0x3e8000
+#define XEHPC_BCS6_RING_BASE			0x3ea000
+#define XEHPC_BCS7_RING_BASE			0x3ec000
+#define XEHPC_BCS8_RING_BASE			0x3ee000
+#define GSCCS_RING_BASE				0x11a000
+
 #define RING_TAIL(base)				XE_REG((base) + 0x30)
 
 #define RING_HEAD(base)				XE_REG((base) + 0x34)
diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 4b427ec8cbff..b7d3b42ec003 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -7,38 +7,10 @@
 
 #include "regs/xe_reg_defs.h"
 
-#define RENDER_RING_BASE			0x02000
-#define BSD_RING_BASE				0x1c0000
-#define BSD2_RING_BASE				0x1c4000
-#define BSD3_RING_BASE				0x1d0000
-#define BSD4_RING_BASE				0x1d4000
-#define XEHP_BSD5_RING_BASE			0x1e0000
-#define XEHP_BSD6_RING_BASE			0x1e4000
-#define XEHP_BSD7_RING_BASE			0x1f0000
-#define XEHP_BSD8_RING_BASE			0x1f4000
-#define VEBOX_RING_BASE				0x1c8000
-#define VEBOX2_RING_BASE			0x1d8000
-#define XEHP_VEBOX3_RING_BASE			0x1e8000
-#define XEHP_VEBOX4_RING_BASE			0x1f8000
-#define COMPUTE0_RING_BASE			0x1a000
-#define COMPUTE1_RING_BASE			0x1c000
-#define COMPUTE2_RING_BASE			0x1e000
-#define COMPUTE3_RING_BASE			0x26000
-#define BLT_RING_BASE				0x22000
-#define XEHPC_BCS1_RING_BASE			0x3e0000
-#define XEHPC_BCS2_RING_BASE			0x3e2000
-#define XEHPC_BCS3_RING_BASE			0x3e4000
-#define XEHPC_BCS4_RING_BASE			0x3e6000
-#define XEHPC_BCS5_RING_BASE			0x3e8000
-#define XEHPC_BCS6_RING_BASE			0x3ea000
-#define XEHPC_BCS7_RING_BASE			0x3ec000
-#define XEHPC_BCS8_RING_BASE			0x3ee000
-
 #define DG1_GSC_HECI2_BASE			0x00259000
 #define PVC_GSC_HECI2_BASE			0x00285000
 #define DG2_GSC_HECI2_BASE			0x00374000
 
-#define GSCCS_RING_BASE				0x11a000
 #define   GT_WAIT_SEMAPHORE_INTERRUPT		REG_BIT(11)
 #define   GT_CONTEXT_SWITCH_INTERRUPT		REG_BIT(8)
 #define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	REG_BIT(4)
-- 
2.43.0

