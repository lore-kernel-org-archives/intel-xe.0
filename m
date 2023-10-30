Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E336C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 30 Oct 2023 15:10:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B08E10E2F0;
	Mon, 30 Oct 2023 15:10:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808E510E2F0
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Oct 2023 15:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698678608; x=1730214608;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aOwCqNz93SQotam9W2ix2GngF7rHzOEu702JjZN/LaI=;
 b=napR9Xqy8jVSmIYzakvkqsy5/WVg8Ek0B/LbT2vvUbWtL735Ydgc9xf/
 VSzsMpYkKED7zNoU6LRpN2ZSBhTcx9psyBxnuJcWBgOKVJ3LpuNq5lRmx
 hNQ2ODGzeWS381EiWdlXdeUqXEVj0hWRzXADyJJ+9PFICHpcWL/ShGEPr
 iCldCz3LuYyhulOfA4+qW7kBVRL1jJQJC7XPxcks2RZQOVkXI440UcA2u
 IPsmeYiiaUF+YdyAjbnayi3TtdI/dA0QwBboVMWnwzm3ZwHLRfOlt2EPI
 Tnc/keg/Jh20ChmJ7ZiyKUnDpYzFKKdPWacftDKWTSod1kSmgNuosVlyn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="368299625"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="368299625"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 08:08:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="1499754"
Received: from shekharc-desk.iind.intel.com ([10.190.239.54])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 08:08:09 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 30 Oct 2023 20:37:56 +0530
Message-Id: <20231030150756.1011777-1-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/xelpmp: Extend a workaround to Xe_LPM+
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

Add Xe_LPM+ support to an existing workaround.
BSpec: 51762

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_wa.c           | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index b00fe089525a..7a6407e38265 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -152,6 +152,7 @@
 #define   POLYGON_TRIFAN_LINELOOP_DISABLE	REG_BIT(4)
 
 #define SQCNT1					XE_REG_MCR(0x8718)
+#define XELPMP_SQCNT1				XE_REG(0x8718)
 #define   ENFORCE_RAR				REG_BIT(23)
 
 #define XEHP_SQCM				XE_REG_MCR(0x8724)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index ce61609b001c..2f1782db267b 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -246,6 +246,13 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ACTIONS(SET(SQCNT1, ENFORCE_RAR))
 	},
 
+	/* Xe_LPM+ */
+
+	{ XE_RTP_NAME("22016670082"),
+	  XE_RTP_RULES(MEDIA_VERSION(1300)),
+	  XE_RTP_ACTIONS(SET(XELPMP_SQCNT1, ENFORCE_RAR))
+	},
+
 	/* Xe2_LPG */
 
 	{ XE_RTP_NAME("16020975621"),
-- 
2.34.1

