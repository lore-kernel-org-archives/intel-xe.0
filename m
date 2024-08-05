Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6ADC3DA4A
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 05:37:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D2410E023;
	Mon,  5 Aug 2024 05:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j1PXGxN4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BE710E023
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Aug 2024 05:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722836235; x=1754372235;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2K0/PVgQiYmA31+elyB2m2c0Rlbt/godWgRZvcX7Ym0=;
 b=j1PXGxN4AiEKt+8AOWT7YmaTKg4ECr3TevBFO6RHuYNfDke1Y8RN2hMe
 Xqc4XR19zdUkkR99kW09g8KwtCW6N78wQHVXyTeYymDh28Xt2iKc1Kb6U
 P00tsJqY7XVmgS1g0wH12uZ55SJ6w/JHvhMZ4VC7SR4yTK3Qx0GvF4rvv
 XI46XUvvSIHjMj5B+PQqGDk3bXe1fkiwPzajYaANih8/g/ZC9UXdzUgiv
 qOR4OIqjg8mdb4PpA18AP7Ppt0aq1b7x3NLL+8kzYHVVqwSLaOvmekcyO
 iJQw/7crKcCaKVxJsbIz+D1TiFFbepN0+OK3+v2AmSh7TNjTM8IVh79iK g==;
X-CSE-ConnectionGUID: Dl8NzgOuQvmwLBpa/31tag==
X-CSE-MsgGUID: 2UGo/+77SQizDMKjBbowmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="32180976"
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; d="scan'208";a="32180976"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2024 22:37:14 -0700
X-CSE-ConnectionGUID: pqTz98v/RR6e0o2Xk8sW9Q==
X-CSE-MsgGUID: kxLEAQHwRXaZOYkrDK+5ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; d="scan'208";a="86994266"
Received: from shekharc-desk.iind.intel.com ([10.190.239.16])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2024 22:37:13 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com
Subject: [PATCH] drm/xe/xe2: Add performance turning changes
Date: Mon,  5 Aug 2024 11:07:10 +0530
Message-Id: <20240805053710.877119-1-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.34.1
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

Update performance tuning according to the hardware spec.

Bspec: 72161
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 4 ++++
 drivers/gpu/drm/xe/xe_tuning.c       | 8 +++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index c50643ab4c84..2c8c4d4218db 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -80,6 +80,9 @@
 #define   LE_CACHEABILITY_MASK			REG_GENMASK(1, 0)
 #define   LE_CACHEABILITY(value)		REG_FIELD_PREP(LE_CACHEABILITY_MASK, value)
 
+#define STATELESS_COMPRESSION_CTRL		XE_REG(0x4148)
+#define   UNIFIED_COMPRESSION_FORMAT		REG_GENMASK(3, 0)
+
 #define XE2_GAMREQSTRM_CTRL			XE_REG(0x4194)
 #define   CG_DIS_CNTLBUS			REG_BIT(6)
 
@@ -193,6 +196,7 @@
 #define GSCPSMI_BASE				XE_REG(0x880c)
 
 #define CCCHKNREG1				XE_REG_MCR(0x8828)
+#define   L3CMPCTRL				REG_BIT(23)
 #define   ENCOMPPERFFIX				REG_BIT(18)
 
 /* Fuse readout registers for GT */
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 3817b7743b0c..faa1bf42e50e 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -39,7 +39,8 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 	},
 	{ XE_RTP_NAME("Tuning: Compression Overfetch"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
-	  XE_RTP_ACTIONS(CLR(CCCHKNREG1, ENCOMPPERFFIX)),
+	  XE_RTP_ACTIONS(CLR(CCCHKNREG1, ENCOMPPERFFIX),
+			 SET(CCCHKNREG1, L3CMPCTRL))
 	},
 	{ XE_RTP_NAME("Tuning: Enable compressible partial write overfetch in L3"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
@@ -50,6 +51,11 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 	  XE_RTP_ACTIONS(SET(L3SQCREG2,
 			     COMPMEMRD256BOVRFETCHEN))
 	},
+	{ XE_RTP_NAME("Tuning: Stateless compression control"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_ACTIONS(FIELD_SET(STATELESS_COMPRESSION_CTRL, UNIFIED_COMPRESSION_FORMAT,
+				   REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
+	},
 	{}
 };
 
-- 
2.34.1

