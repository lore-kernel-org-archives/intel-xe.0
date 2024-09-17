Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECE8CAC58F
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 16:54:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F7B10E4C6;
	Tue, 17 Sep 2024 16:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GaQcdmbx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D896910E4C6
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 16:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726592057; x=1758128057;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nCd47jKx0nlLlVNVs7XJCD34T9wSQmJB0Y48PV3Rvvo=;
 b=GaQcdmbxbfM4EXUXvB7oySyGLxChWzv7Yhggenc9uHSphtgJxEfPfUGE
 TPxipf+sFm6EWR4KFnsBkmKP8cHi4KIHhFSHEi07/7VNSzlkVKWXx8aGz
 sjYcI2fTNxHugR3ObJ3xcsPYyNzg2d9wnPeOtA6b8w5XE+on7S69gnEZ2
 erdP+x8YVnW0IPl/jbEDcZKU1I91c5OcvCYOH7W7Bg0dkJwqBLHSXlCj4
 lXrkssi/1mTVT4cxr5wjMicbqM4vIuzVbBIZ+qPgxfopnOCrXjRb/qWIK
 lJafsleyXl3gkfhPQ4kNzaLbT5+m7HIcI7ShCHcQ9Ac6oaBSdz9TW5/4P g==;
X-CSE-ConnectionGUID: 4swBWYJ3RKeeLVvxjHL1Cw==
X-CSE-MsgGUID: RPHfAaAwSsevSfILP43cYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="36132490"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="36132490"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 09:54:16 -0700
X-CSE-ConnectionGUID: s2KVXINkRnCsXryJR+07Qw==
X-CSE-MsgGUID: wYdR6AmoRn6lQWIM+hl++w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="68878208"
Received: from ldmartin-desk2.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.125.109.76])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 09:54:15 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/xe2: Extend performance tuning to media GT
Date: Tue, 17 Sep 2024 13:53:54 -0300
Message-ID: <20240917165400.40592-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.46.1
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

With exception of "Tuning: L3 cache - media", we are currently applying
recommended performance tuning settings only for the primary GT. Let's
also apply them to the media GT when applicable.

According to our spec, media GT registers CCCHKNREG1 and L3SQCREG* exist
only in Xe2_LPM and their offsets do not match their primary GT
counterparts. As such, we need to have Xe2_LPM-specific definitions for
them and apply the setting only for that specific IP.

Both Xe2_HPM and Xe2_LPM contain STATELESS_COMPRESSION_CTRL and the
offset on the media GT matches the one on the primary one, so we can use
the common definition and apply the setting to both IPs.

Bspec: 72161
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  6 ++++++
 drivers/gpu/drm/xe/xe_tuning.c       | 19 +++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index cf21de3adca6..2e655291a84a 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -169,6 +169,8 @@
 #define XEHP_SLICE_COMMON_ECO_CHICKEN1		XE_REG_MCR(0x731c, XE_REG_OPTION_MASKED)
 #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE	REG_BIT(14)
 
+#define XE2LPM_CCCHKNREG1			XE_REG_MCR(0x82a8)
+
 #define VF_PREEMPTION				XE_REG(0x83a4, XE_REG_OPTION_MASKED)
 #define   PREEMPTION_VERTEX_COUNT		REG_GENMASK(15, 0)
 
@@ -399,6 +401,10 @@
 #define SCRATCH1LPFC				XE_REG(0xb474)
 #define   EN_L3_RW_CCS_CACHE_FLUSH		REG_BIT(0)
 
+#define XE2LPM_L3SQCREG2			XE_REG_MCR(0xb604)
+
+#define XE2LPM_L3SQCREG3			XE_REG_MCR(0xb608)
+
 #define XE2LPM_L3SQCREG5			XE_REG_MCR(0xb658)
 
 #define XE2_TDF_CTRL				XE_REG(0xb418)
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index faa1bf42e50e..ea1444358b4f 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -42,20 +42,39 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 	  XE_RTP_ACTIONS(CLR(CCCHKNREG1, ENCOMPPERFFIX),
 			 SET(CCCHKNREG1, L3CMPCTRL))
 	},
+	{ XE_RTP_NAME("Tuning: Compression Overfetch - media"),
+	  XE_RTP_RULES(MEDIA_VERSION(2000)),
+	  XE_RTP_ACTIONS(CLR(XE2LPM_CCCHKNREG1, ENCOMPPERFFIX),
+			 SET(CCCHKNREG1, L3CMPCTRL))
+	},
 	{ XE_RTP_NAME("Tuning: Enable compressible partial write overfetch in L3"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
 	  XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
 	},
+	{ XE_RTP_NAME("Tuning: Enable compressible partial write overfetch in L3 - media"),
+	  XE_RTP_RULES(MEDIA_VERSION(2000)),
+	  XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG3, COMPPWOVERFETCHEN))
+	},
 	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
 	  XE_RTP_ACTIONS(SET(L3SQCREG2,
 			     COMPMEMRD256BOVRFETCHEN))
 	},
+	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only - media"),
+	  XE_RTP_RULES(MEDIA_VERSION(2000)),
+	  XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG2,
+			     COMPMEMRD256BOVRFETCHEN))
+	},
 	{ XE_RTP_NAME("Tuning: Stateless compression control"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
 	  XE_RTP_ACTIONS(FIELD_SET(STATELESS_COMPRESSION_CTRL, UNIFIED_COMPRESSION_FORMAT,
 				   REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
 	},
+	{ XE_RTP_NAME("Tuning: Stateless compression control - media"),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 2000)),
+	  XE_RTP_ACTIONS(FIELD_SET(STATELESS_COMPRESSION_CTRL, UNIFIED_COMPRESSION_FORMAT,
+				   REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
+	},
 	{}
 };
 
-- 
2.46.1

