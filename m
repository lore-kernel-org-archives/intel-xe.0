Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B52C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 13:35:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4E4113C14;
	Thu, 30 May 2024 13:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OAMjvb0n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ADFF113C3F
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 13:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717076139; x=1748612139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hjdkGchONJV4rwGTF1SsfrKVUREf0pfP7QYK8kmfPgM=;
 b=OAMjvb0n98VCGNYMmMWefoKkoIZNmTnDwR5xMqlg21rdqetGApwVNQ9U
 CUWgGdZfhlojYpaMBkjCrMUI0O0Qrm6rYRFX7P79GKev6ukl+SCnsbzp8
 cjPmTyDyeuV3FDN55X9NMnmtoUjcj4kUpFoUz93HELPZJadMh7cmLa57H
 GH4MwW6LpM4DlaEH1EmGEeM1diInVkDvPOQYmlePppAvvPX3f7/EICwQ7
 BKCIhMz7FvFDx6vq18KAWJ7h3XYTsvV9VbVL7wbC85KGd2pNhesQ6zzZA
 nlV1UqAdhUOFQKu1BZDKTr+IZvIAsFpDuBSeLZj0nqFJW4rleUx6QkrGI Q==;
X-CSE-ConnectionGUID: ztYbPQFMT7S54FruDpb7dA==
X-CSE-MsgGUID: 0plfW4FWRUe4zEeslQufkw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24681346"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="24681346"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:35:38 -0700
X-CSE-ConnectionGUID: UCuZ+O3jRcOTI2waPzvtSg==
X-CSE-MsgGUID: z0B7nobxSTSgzWC4CLIazA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="40733743"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.25.139])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:35:37 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 1/5] drm/xe: Move XEHP_MTCFG_ADDR register definition to
 xe_regs.h
Date: Thu, 30 May 2024 15:35:23 +0200
Message-Id: <20240530133527.1328-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240530133527.1328-1-michal.wajdeczko@intel.com>
References: <20240530133527.1328-1-michal.wajdeczko@intel.com>
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

We should not define registers directly in the code while we have
dedicated files for all register definitions. Move XEHP_MTCFG_ADDR
to regs/xe_regs.h

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_mmio.c      | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 722fb6dbb72e..23e33ec84902 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -30,6 +30,9 @@
 #define XEHP_CLOCK_GATE_DIS			XE_REG(0x101014)
 #define   SGSI_SIDECLK_DIS			REG_BIT(17)
 
+#define XEHP_MTCFG_ADDR				XE_REG(0x101800)
+#define   TILE_COUNT				REG_GENMASK(15, 8)
+
 #define GGC					XE_REG(0x108040)
 #define   GMS_MASK				REG_GENMASK(15, 8)
 #define   GGMS_MASK				REG_GENMASK(7, 6)
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 248e93ec6df7..44bff104c011 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -28,9 +28,6 @@
 #include "xe_sriov.h"
 #include "xe_tile.h"
 
-#define XEHP_MTCFG_ADDR		XE_REG(0x101800)
-#define TILE_COUNT		REG_GENMASK(15, 8)
-
 #define BAR_SIZE_SHIFT 20
 
 static void
-- 
2.43.0

