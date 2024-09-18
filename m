Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E169CCDD55D
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 20:48:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEBFD10E63C;
	Wed, 18 Sep 2024 20:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MP7eNb8D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B3510E63A
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 20:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726692526; x=1758228526;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DfH2LRcapnjp30ngau/CmC83iEVBMqa71u0zifkvbl0=;
 b=MP7eNb8DpMXHeP10Mdx0P+6/aOGVX0bGuNNbWQWuGiZjGckKgQubytRJ
 eCSag8wZfyoj6kogLhWE0VzVbtpkEjeK9lIdjZtl4zGMCWebcFikXWviw
 EjHt2lT37QLxXD12VVk4nfq8GNaNOjtJeNk6xAaT/jY6Wp2WrSoEd/wqa
 lPfjuyTwvpySXFqnrD07JGnTASb1Fh5tBK2doLxh/cEjPQf+sTPGJh9HE
 FdwYGB0O/hGEVk29uc5VBNHmFKR7OnFShKMIXaqqExnHrE/GMmTrxTduQ
 LNSk3z7UmnIhzwCKjTWsP/dU5nS32d2mkc9UNNY3QWRm7o9hcfrxwgQrI A==;
X-CSE-ConnectionGUID: ddz3bgeUThiMZxEIxtYOxQ==
X-CSE-MsgGUID: AVW3P4p8RvOARtoDueGu9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25509489"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="25509489"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 13:48:46 -0700
X-CSE-ConnectionGUID: CU71s8g+QWSUq/+D+SbCBg==
X-CSE-MsgGUID: +w6pOXRCT6SVy11nDioQlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="74246635"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.125.109.171])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 13:48:45 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 3/3] drm/xe/xe2: Add performance tuning for L3 cache flushing
Date: Wed, 18 Sep 2024 17:47:31 -0300
Message-ID: <20240918204830.49880-4-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240918204830.49880-1-gustavo.sousa@intel.com>
References: <20240918204830.49880-1-gustavo.sousa@intel.com>
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

A recommended performance tuning for LNL related to L3 cache flushing
was recently introduced in Bspec. Implement it.

Bspec: 70821
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 5 +++++
 drivers/gpu/drm/xe/xe_tuning.c       | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 6ec2d2c11d77..ccd18cdd5b50 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -389,6 +389,9 @@
 #define L3SQCREG3				XE_REG_MCR(0xb108)
 #define   COMPPWOVERFETCHEN			REG_BIT(28)
 
+#define SCRATCH3LBCF				XE_REG_MCR(0xb154)
+#define   RWFLUSHALLEN				REG_BIT(17)
+
 #define XEHP_L3SQCREG5				XE_REG_MCR(0xb158)
 #define   L3_PWM_TIMER_INIT_VAL_MASK		REG_GENMASK(9, 0)
 
@@ -406,6 +409,8 @@
 
 #define XE2LPM_L3SQCREG3			XE_REG_MCR(0xb608)
 
+#define XE2LPM_SCRATCH3LBCF			XE_REG_MCR(0xb654)
+
 #define XE2LPM_L3SQCREG5			XE_REG_MCR(0xb658)
 
 #define XE2_TDF_CTRL				XE_REG(0xb418)
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index f62622f0be85..4dd77b44ac82 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -80,6 +80,14 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 	  XE_RTP_ACTIONS(FIELD_SET(XELPMP_STATELESS_COMPRESSION_CTRL, UNIFIED_COMPRESSION_FORMAT,
 				   REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
 	},
+	{ XE_RTP_NAME("Tuning: L3 RW flush all Cache"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_ACTIONS(SET(SCRATCH3, RWFLUSHALLEN))
+	},
+	{ XE_RTP_NAME("Tuning: L3 RW flush all cache - media"),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_ACTIONS(SET(XE2LPM_SCRATCH3LBCF, RWFLUSHALLEN))
+	},
 	{}
 };
 
-- 
2.46.1

