Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC8DC25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 06:15:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3407A11B478;
	Thu, 30 May 2024 06:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aW7Ua+jr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305EF11B46D
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 06:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717049715; x=1748585715;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Cir5gGy/2TgHbkFG7Tj6ub49V/oWSuyQ9iwoGvgyQWI=;
 b=aW7Ua+jrdcnLUHFIvHSAeYg0TX6eIfKrzDs/lwTmlF8I86+wL+g6an8j
 HkjzqnKSk2KVWhlDUg23fxnNiYXqWBnZQpxXPvBtYRO4aFauPYKDuxTJP
 4g40JwFtGpJbskkPN9SptTkg2EKXg0NwGNqEexW3npCkgfNmuHGqDSlpF
 HZ5pMXpvTaqBvyCE69xw9YacjK+5f9M6Py1yDQOTrwo/h6G8ILfY+4/E2
 2pm6+EY9txXxC97mAq529yJB56WhL1BxHlpwRhn4OKJyeJdKe2bbF2Ogf
 uDINL0K4gZ2TfpFRNuOFgyWRLrLlB1zsrUxJYy0qVyQ0YIjyrm6Zx8h2o w==;
X-CSE-ConnectionGUID: rve/PxehRt6oFeh5Gdof8w==
X-CSE-MsgGUID: ziyzlIFfT6uAgWs4CVK1Zw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13450584"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="13450584"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 23:15:15 -0700
X-CSE-ConnectionGUID: MahLXoqMQQChj3KZkeUCWA==
X-CSE-MsgGUID: v5XhtYgTQlG1Ht3j6XevOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="40138728"
Received: from pallavim-desk.iind.intel.com ([10.145.162.180])
 by fmviesa005.fm.intel.com with ESMTP; 29 May 2024 23:15:13 -0700
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: intel-xe@lists.freedesktop.org,
	matthew.d.roper@intel.com
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Subject: [PATCH v2] drm/xe/xe2: Enable Priority Mem Read
Date: Thu, 30 May 2024 11:55:09 +0530
Message-Id: <20240530062509.1529357-1-pallavi.mishra@intel.com>
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

Enable feature to allow memory reads to take a
priority memory path. This will reduce latency
on the read path, but may introduce read after
write (RAW) hazards as read and writes will no
longer be ordered.

To avoid RAW hazards, SW can use the MI_MEM_FENCE
command or any other MI command that generates
non posted memory writes. This will ensure data
is coherent in memory prior to execution of
commands which read data from memory.

No pattern identified in KMD that could lead to a
hazard.

v2: Modify commit message, enable priority mem
read feature for media, modify version range,
modify bspec detail (Matt Roper)

Bspec: 60298, 60237, 60187, 60188

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
 drivers/gpu/drm/xe/xe_hw_engine.c        | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 263ffc7bc2ef..4e8f9a61f0bf 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -104,6 +104,7 @@
 #define CSFE_CHICKEN1(base)			XE_REG((base) + 0xd4, XE_REG_OPTION_MASKED)
 #define   GHWSP_CSB_REPORT_DIS			REG_BIT(15)
 #define   PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS	REG_BIT(14)
+#define   CS_PRIORITY_MEM_READ			REG_BIT(7)
 
 #define FF_SLICE_CS_CHICKEN1(base)		XE_REG((base) + 0xe0, XE_REG_OPTION_MASKED)
 #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 9eef789be897..f03e5cc9063e 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -424,6 +424,17 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 					   0xA,
 					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 		},
+		/* Enable Priority Mem Read */
+		{ XE_RTP_NAME("Priority_Mem_Read"),
+		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
+		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
+				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+		},
+		{ XE_RTP_NAME("Priority_Mem_Read_For_Media"),
+		  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, XE_RTP_END_VERSION_UNDEFINED)),
+		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
+				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+		},
 		{}
 	};
 
-- 
2.25.1

