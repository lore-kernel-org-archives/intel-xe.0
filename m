Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49A2C31D97
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jul 2024 18:37:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F9210E679;
	Tue,  2 Jul 2024 18:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lRVgLpKG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782BC10E676
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jul 2024 18:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719945439; x=1751481439;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z9mJkVE8c6NdnzTX/r9GrQiFJUbyszK3Up2fyY5fe7E=;
 b=lRVgLpKGqiOM7fYYXoPd3YIK6IlAOXPA99NxssrLjNheGmMrclNg8K1W
 jasmtB+olSmmC5sRMKAcuNATPcK/n6hRU9RN/iL+FVccAmGaC2KQQCRmG
 jCJBkqBK9t4YLOT8q32i8mXEs6JqjiNRcQqAtrW/Z9LYL5mlWwClVyh5l
 ArnkQ4vMAsZ1/Ey6ZalWV2XXmT1oIEm80V4LXxuFWthZHfWMU3fiV7YLM
 PEYI3mh+s4waVNnLs63fHM2RN7yVnl99IeBMCTRVHiyAsmDUczQ8rnO4H
 zrO3Ml+XdzKy3J1pVgcNEYcXDneY2YdIOJcDuuy/9+RnAtiJNc+66dHKW A==;
X-CSE-ConnectionGUID: TSLZk2CIRuaQmKCu0KxM0Q==
X-CSE-MsgGUID: CywGylvpSCadMJ0gn0g2/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="27756723"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="27756723"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 11:37:19 -0700
X-CSE-ConnectionGUID: l7ZzH6OCQyuhP3x7up4odQ==
X-CSE-MsgGUID: r2F4AOzKSkKv6g/kbF1OuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="50604329"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.99])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 11:37:17 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/3] drm/xe: Fix register definition order in xe_regs.h
Date: Tue,  2 Jul 2024 20:37:02 +0200
Message-Id: <20240702183704.1022-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240702183704.1022-1-michal.wajdeczko@intel.com>
References: <20240702183704.1022-1-michal.wajdeczko@intel.com>
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

Swap XEHP_CLOCK_GATE_DIS(0x101014) with GU_DEBUG(x101018).

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 23e33ec84902..23ecba38ed41 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -24,12 +24,12 @@
 #define   LMEM_INIT				REG_BIT(7)
 #define   DRIVERFLR				REG_BIT(31)
 
-#define GU_DEBUG				XE_REG(0x101018)
-#define   DRIVERFLR_STATUS			REG_BIT(31)
-
 #define XEHP_CLOCK_GATE_DIS			XE_REG(0x101014)
 #define   SGSI_SIDECLK_DIS			REG_BIT(17)
 
+#define GU_DEBUG				XE_REG(0x101018)
+#define   DRIVERFLR_STATUS			REG_BIT(31)
+
 #define XEHP_MTCFG_ADDR				XE_REG(0x101800)
 #define   TILE_COUNT				REG_GENMASK(15, 8)
 
-- 
2.43.0

