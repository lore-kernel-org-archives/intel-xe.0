Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7608DC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 05:30:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B3610FD53;
	Mon, 29 Apr 2024 05:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gkMT+9el";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B7810FD51
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 05:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714368629; x=1745904629;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XTlIkKwJQtTf1njPv+zGl6ecXivTBQjPgQ2Kwn9lOwo=;
 b=gkMT+9elYIfzWMEy28GHwoV4JhH/dipYCk/27XEqsBGRwh2BCgx922vV
 OW3+tXFp273dR7v1IkbZuY1cjDJAIPC8knVohQTv9l4XqzMHtDT8N5YXy
 wowvKCB/mBzENFZXyOFxSSA2GObFmN1qTKOec/4tS3LwWTqGAtCsgENKA
 Hp5Y2tZGRJXzUH0imNec+ZMhM6am+szlCU/fRgZ1CF+GbD8YnXyep7FNx
 nPAw6Yw1L4ZblZdvVD0zTTxPZWH9v3Yf7tuW39Z3LKsPRrZx9Mvm3FJiI
 JjtJzlGwtJt/AzYfc0hP8d38YqJq8vW52uCkpQW4AItz5EqMy07YwZC+f A==;
X-CSE-ConnectionGUID: cCFf1EP9R46rMNS5ynrjoQ==
X-CSE-MsgGUID: RWDGjNIVRSOS8MA8LdDnlA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="13790461"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; d="scan'208";a="13790461"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2024 22:30:28 -0700
X-CSE-ConnectionGUID: qOmkI3wATY6eRTbv+vZ/4A==
X-CSE-MsgGUID: AsbFN+ZrTfaRZSzhTpOrkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; d="scan'208";a="25988183"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa009.jf.intel.com with ESMTP; 28 Apr 2024 22:30:26 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe/xe2hpg: Add wa_14021821874
Date: Mon, 29 Apr 2024 11:14:06 +0530
Message-Id: <20240429054406.2165095-1-tejas.upadhyay@intel.com>
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

wa_14021821874 applies to xe2_hpg

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 83847f2da72a..7c9d4e55a9cf 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -386,6 +386,7 @@
 
 #define TDL_TSL_CHICKEN				XE_REG_MCR(0xe4c4, XE_REG_OPTION_MASKED)
 #define   SLM_WMTP_RESTORE			REG_BIT(11)
+#define   STK_ID_RESTRICT			REG_BIT(12)
 
 #define ROW_CHICKEN				XE_REG_MCR(0xe4f0, XE_REG_OPTION_MASKED)
 #define   UGM_BACKUP_MODE			REG_BIT(13)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 9d9b7fa7a8f0..f030dbb1b89e 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -538,6 +538,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, WR_REQ_CHAINING_DIS))
 	},
+	{ XE_RTP_NAME("14021821874"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, STK_ID_RESTRICT))
+	},
 
 	/* Xe2_HPM */
 
-- 
2.25.1

