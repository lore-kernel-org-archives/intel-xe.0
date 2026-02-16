Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657C3E7BD8B
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 10:38:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0535C10E028;
	Mon, 16 Feb 2026 10:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TPh0DMXE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C9310E028
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 10:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771238321; x=1802774321;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Rujodgq9uYpr6mGcgHyVyFgWsh0NVTGM8b7VFCqw0kU=;
 b=TPh0DMXEslbB8RQhX/30sK3pm9JRRZBXmKtwQOomni2O6T7mLOtyBJah
 990etto9Fj9DdhnZLJ+6vyptrA3VMwlvYDPuOSEuRWIspjHzl8FPwBmRb
 SsSDfDoPP08ItgmP8ycFl4NbXKb0yql0wXEjQv1wGGzuCkVumilv6ZKWU
 bVUZNFB04ZwHGuWirZHL38AzgbkAB6yhx+fNotWFp5USkYlzAiXZh+1Iu
 3rIKw76DeAnkA7xdDVV7kGsXXU+iirUJ7/OSh5Ts4sfyWkRJE2c6AUCiW
 z/hE7gbShHGsIsEfX5b1/GIjAZajvhGbFzqjtZFDCv1FKQA57uoKPrCzK Q==;
X-CSE-ConnectionGUID: 0lqzkEi4QXCfZcY1UNIIQA==
X-CSE-MsgGUID: 6waVrqCsSYqzWuOC2bAcUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="71341710"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="71341710"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 02:38:41 -0800
X-CSE-ConnectionGUID: 2dACdUFERvy6yKfDuqLCeA==
X-CSE-MsgGUID: LkdgSh55TIOkpS1sVMheJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="218112614"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa004.jf.intel.com with ESMTP; 16 Feb 2026 02:38:40 -0800
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, tejas.upadhyay@intel.com,
 Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH] drm/xe/xe3: Add Wa_14026781792
Date: Mon, 16 Feb 2026 16:41:42 +0530
Message-ID: <20260216111141.90541-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

Wa_14026781792 applies to xe3lpg and xe3p_lpg.

Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_wa.c           | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index a375ffd666ba..90b9017770ea 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -131,6 +131,7 @@
 #define   VS_HIT_MAX_VALUE_MASK			REG_GENMASK(25, 20)
 #define   DIS_MESH_PARTIAL_AUTOSTRIP		REG_BIT(16)
 #define   DIS_MESH_AUTOSTRIP			REG_BIT(15)
+#define   DIS_TE_PATCH_CTRL			REG_BIT(4)
 
 #define VFLSKPD					XE_REG_MCR(0x62a8, XE_REG_OPTION_MASKED)
 #define   DIS_PARTIAL_AUTOSTRIP			REG_BIT(9)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 61c4187dc0ae..05d7a0eddbdc 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -939,6 +939,11 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
 	},
+	{ XE_RTP_NAME("14026781792"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(3000), ENGINE_CLASS(RENDER), OR,
+		       GRAPHICS_VERSION(3510), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(FF_MODE, DIS_TE_PATCH_CTRL))
+	},
 };
 
 static __maybe_unused const struct xe_rtp_entry oob_was[] = {
-- 
2.50.1

