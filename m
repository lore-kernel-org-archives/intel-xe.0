Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E5DC3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 06:10:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A285E10E173;
	Wed, 10 Jan 2024 06:10:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B7610E173
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 06:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704867011; x=1736403011;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fN8EXvSW/6IDHbVs4Qx+V5csw3ikFgRdrv4ITZQWL9U=;
 b=BileEfUXerpOYP4HfJqrMe7IoXAkqyhAVDslWKwQkqh9pUNdl5+347ic
 J6HqJRVI1eJAOKmaV4ElAKzNehQaftIW4bcbxSOBHCfpACDDQQJ8XW+np
 hrOuk6GtPlw6hyou5SLdan7vQxJYZHfvVP5bwOXl65qlz7d0pgZrO0TgO
 ueVy8uT5msIwZAvi3BX/JmjWps8YNw+s8CXsLpXwGDowSZANzNEm9GCof
 4BKIyVE+xnM/eV09cMyVlL6Wz887qZJxRGMMSgHs5JBQsbfhlfVGxzBfF
 OfUQLSqNktp4SH3/pWYsGjQeQv4cGsBVjvYuWNgIRU7F69Hqo3uyaYKSw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="11765566"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="11765566"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 22:10:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="852435503"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="852435503"
Received: from shekharc-desk.iind.intel.com ([10.190.239.16])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 22:10:05 -0800
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe/xe2_lpm: Introduce performance guide changes
Date: Wed, 10 Jan 2024 11:39:51 +0530
Message-Id: <20240110060951.779234-2-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110060951.779234-1-shekhar.chauhan@intel.com>
References: <20240110060951.779234-1-shekhar.chauhan@intel.com>
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
index db3743ffb049..1d4bb128617d 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -41,6 +41,10 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004)),
 	  XE_RTP_ACTIONS(SET(L3SCRUB_LBCF_GFX, 0x1006))
 	},
+	{ XE_RTP_NAME("Tuning: L3 Scrubber Parameters - media"),
+	  XE_RTP_RULES(MEDIA_VERSION(2000)),
+	  XE_RTP_ACTIONS(SET(L3SCRUB_LBCF_GFX, 0x1006))
+	},
 	{ XE_RTP_NAME("Tuning: Compression Overfetch"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004)),
 	  XE_RTP_ACTIONS(SET(CCCHKNREG1,
-- 
2.34.1

