Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BB4C25B74
	for <intel-xe@archiver.kernel.org>; Sat, 25 May 2024 00:39:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACDB910E068;
	Sat, 25 May 2024 00:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ENtoHvC5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894FD10E068
 for <intel-xe@lists.freedesktop.org>; Sat, 25 May 2024 00:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716597574; x=1748133574;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N913RugVcsAmbZJHpby8m+LOtdcJD0+gFNJQtOfCTgQ=;
 b=ENtoHvC5uyd6pRmdPGFKfqjguw2nZLZsLWFePwUvnilK2Y/aw320SpHS
 GB/XPk7AR6edLTmt3mtb4Ozq/03YqrgnHsUo42ClWY3jvrJzHAIOjk+Gz
 tqIPvrCOaWR96+JFRDUu4eJvu6/gcTdghuuc6GPLEi+lSuyvggGyAKNRS
 lbQTgkWgCZTBIQITdTtbKDKw/oGZG/nwckP8bxjmt5v+t/uDxDO5PDMUL
 L+Ld4gLMbWRq+qNn8QegZM0ooRqein/7h7Mrt2pA/jXdhLdUKv7o8W2T2
 kUi4vxKMyOyv7F/UE4W6YGYg2ZfsFl9/p2axhq8AyDC8VtdzVUgRlgvmZ A==;
X-CSE-ConnectionGUID: dZFtwXoESnmuqXBaUlgWWQ==
X-CSE-MsgGUID: tOhfXQDmQr6BGXQpPF1Unw==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="30507217"
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; d="scan'208";a="30507217"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 17:39:33 -0700
X-CSE-ConnectionGUID: 0ptdhgUaTreXh4XObu3AeA==
X-CSE-MsgGUID: tRvDpA2FSPG6AQSH2QdCzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; d="scan'208";a="39161968"
Received: from pallavim-desk.iind.intel.com ([10.145.162.180])
 by orviesa004.jf.intel.com with ESMTP; 24 May 2024 17:39:32 -0700
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Pallavi Mishra <pallavi.mishra@intel.com>
Subject: [PATCH] drm/xe/xe2: Enable Priority Mem Read
Date: Sat, 25 May 2024 06:19:33 +0530
Message-Id: <20240525004933.1124012-1-pallavi.mishra@intel.com>
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
on the read path, but may introduce RAW hazards.

Bspec: 45845, 60237, 60187, 60188

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 1 +
 drivers/gpu/drm/xe/xe_hw_engine.c        | 7 +++++++
 2 files changed, 8 insertions(+)

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
index de1aefaa2335..34aa8b5270b0 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -424,6 +424,13 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 					   0xA,
 					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 		},
+		/* Enable Priority Mem Read */
+		{ XE_RTP_NAME("Priority_Mem_Read"),
+		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2000, 2004)),
+		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
+				     CS_PRIORITY_MEM_READ)),
+		  XE_RTP_ACTION_FLAG(ENGINE_BASE),
+		},
 		{}
 	};
 
-- 
2.25.1

