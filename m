Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FB7C3DA45
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 21:18:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F1310E0C7;
	Thu, 11 Jul 2024 21:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WJXYjNa2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F12F10E0C7
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 21:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720732701; x=1752268701;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kMdEe9JWDwhKGHojHskKkwialm2TvNyT/j3kPsMN0Fc=;
 b=WJXYjNa2hXYTX7u8XJa64DRJnPbD/DT+oQyZzVLL05A2aQ0Yh24JWtEs
 Jsai4ldzLoNA0ErUc+jrS6Atp4khrIEEw/9k0gJAbrp2wepvQN+MhljKp
 dk87qWCSxlp26bRh1G+GPKNfYhvvdM3suJFbCSzQBOv13ZOQaQ7xOn5HR
 Gzi4eHkMfVyET9nJW70hcsa6H8ywjsUZxCAfW0h7I3SyvEN0CiuYC9p9C
 aErGzxehzA2MZzRf3dZruUcf1MVBoxoT74AqzKD/5WyQeqMlg9b0qwsjA
 J0K+eQFLMOtgdX2ymGfNAwDaAtADitGhYKRT7Y0KP1DKY//sxatv8Pzll Q==;
X-CSE-ConnectionGUID: TUUCAB/RRPibsV13xBZ2QA==
X-CSE-MsgGUID: YeG+tIDKSQKWc7D8Y5S2pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="21909101"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="21909101"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 14:18:21 -0700
X-CSE-ConnectionGUID: AwiPA10/Q3C1MKugXlclqQ==
X-CSE-MsgGUID: PCPwWSOoShattppS9hmfDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="48593743"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.125.150])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 14:18:19 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com,
 matthew.d.roper@intel.com, jose.souza@intel.com, carl.zhang@intel.com,
 pallavi.mishra@intel.com
Subject: [PATCH v3] drm/xe/xe2: Enable Priority Mem Read
Date: Thu, 11 Jul 2024 14:00:42 -0700
Message-Id: <20240711210042.3822494-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Pallavi Mishra <pallavi.mishra@intel.com>

Enable feature to allow memory reads to take a priority memory path.
This will reduce latency on the read path, but may introduce read after
write (RAW) hazards as read and writes will no longer be ordered.

To avoid RAW hazards, SW can use the MI_MEM_FENCE command or any other
MI command that generates non posted memory writes.  This will ensure
data is coherent in memory prior to execution of commands which read
data from memory.

No pattern identified in KMD that could lead to a hazard.

v2: Modify commit message, enable priority mem read feature for media,
modify version range, modify bspec detail (Matt Roper)

v3: Rebase, fix cramped line-wrapping (jcavitt)

Bspec: 60298, 60237, 60187, 60188

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Acked-by: José Roberto de Souza <jose.souza@intel.com>
Acked-by: Carl Zhang <carl.zhang@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
 drivers/gpu/drm/xe/xe_hw_engine.c        | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index c38db2a746140..81b71903675e0 100644
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
index 07ed9fd28f195..5483deaab1bd4 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -425,6 +425,17 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
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

