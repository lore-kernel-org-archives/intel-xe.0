Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33416C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 06:15:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E412610E16A;
	Wed, 10 Jan 2024 06:15:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B6010E16A
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 06:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704867343; x=1736403343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mSTpt+jbU72irpST3CzCWkdnucc2cbl64wrTmEXkLRI=;
 b=I/kDykOJ5YdJpBezGLW/qIbpHG4bC3I+ct1bS5EibiAlqgQyhjHLl0i4
 /beiBvFzPKKj70dgbbx/Dd5eVwCfA4UWOjPTFBYXU7FxLy+pFcMM38+Ak
 CpcKvt063b1dFnsgt04M0XlYQChMoujGayks17ohcnwG2o8smrklmD9yt
 3WqPBisNJ3dfa3xMBNl6mRTB3MSOIoc/cbN6izh4+Tos8p29FnS5DHbUN
 L/aCvtM6tBiGEeRQ6sm+mJWGIDFCLvrPx2NAftlhtPsGo+3Ke2y1zjxL7
 xsgHcP9XIw8Fqsej72bGBReekCQ23B20ojRh8cOOY9S7sXmEiNHL7GMVV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5790358"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5790358"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 22:15:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="1113330240"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="1113330240"
Received: from shekharc-desk.iind.intel.com ([10.190.239.16])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 22:15:42 -0800
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/xe/xe2_lpm: Introduce performance guide changes
Date: Wed, 10 Jan 2024 11:45:31 +0530
Message-Id: <20240110061531.780038-2-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110061531.780038-1-shekhar.chauhan@intel.com>
References: <20240110061531.780038-1-shekhar.chauhan@intel.com>
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add performance guide changes to Xe2_LPM

BSpec: 72161
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_tuning.c       | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 77dd11be9816..e55186f4c19d 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -303,6 +303,7 @@
 #define   BLEND_FILL_CACHING_OPT_DIS		REG_BIT(3)
 
 #define L3SCRUB_LBCF_GFX			XE_REG_MCR(0xb18c)
+#define L3SCRUB_LBCF_MEDIA			XE_REG_MCR(0xb68c)
 
 #define XEHPC_L3CLOS_MASK(i)			XE_REG_MCR(0xb194 + (i) * 8)
 
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index c0bc86f131a7..744d145a418d 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -41,6 +41,10 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004, XE_RTP_END_VERSION_UNDEFINED)),
 	  XE_RTP_ACTIONS(SET(L3SCRUB_LBCF_GFX, 0x1006))
 	},
+	{ XE_RTP_NAME("Tuning: L3 Scrubber Parameters - media"),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_ACTIONS(SET(L3SCRUB_LBCF_GFX, 0x1006))
+	},
 	{ XE_RTP_NAME("Tuning: Compression Overfetch"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004, XE_RTP_END_VERSION_UNDEFINED)),
 	  XE_RTP_ACTIONS(SET(CCCHKNREG1,
-- 
2.34.1

