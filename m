Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902FF10ED651
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 10:27:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0DC10ED38;
	Fri, 27 Mar 2026 10:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SrcGNH7B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00EF10ED38
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 10:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774607224; x=1806143224;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N69c2IqedRx7ytjE4mgGBS0ImPLF/nczbUQK9mtejK4=;
 b=SrcGNH7BIANAMqxvY4vnV/6kv+B5EC/KDl4i8+T8Ty0RDV3zCpAO2coC
 /1D0v0ujs89Z10pnoZ8xWgAKF66utzy00K+Vv129jNYmlgOjun35UJJFH
 04qwb1G9MjeXZi6DoelpfFxWSOzdRwHsT3EFHWEWqvXVL9ANv1GOQfhHF
 5eGDOWUOkwb1NhhVgTq1o3F6z8aclt7fEsaSN7IgA7sClNUhIJCkmvDY5
 fO1sN3pLrTuSiO+HcMnKDRuwjCpqMvagdrWBqJGYUUil2pWPKAJOSjwYo
 WzywK+foZHYQURCqWiFh6aUhdPWyxKfZSUdpBFOQf2rRetzi8CaMBWxv/ w==;
X-CSE-ConnectionGUID: 0pX7tAmERNSUS07WJNCzQQ==
X-CSE-MsgGUID: fHOiTkwtQhCfljkjTWMl8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="93259192"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="93259192"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 03:27:03 -0700
X-CSE-ConnectionGUID: 6ER/gV5cTM6n6+7QffwH+w==
X-CSE-MsgGUID: agosanAJQf+rjKs4XbSBiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="224320573"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa006.jf.intel.com with ESMTP; 27 Mar 2026 03:27:00 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.d.roper@intel.com,
 rodrigo.vivi@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v2] drm/xe: Apply WA_14026999295 to engine
Date: Fri, 27 Mar 2026 15:54:15 +0530
Message-ID: <20260327102414.780515-2-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Apply WA_14026999295 to following IPs:
Xe3p_XPC

v2:
- Move WA to "Xe3p_XPC" section at bottom of table. (Matt)

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_wa.c           | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 4ebaa0888a43..aa267c2f6162 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -528,6 +528,7 @@
 
 #define ROW_CHICKEN3				XE_REG_MCR(0xe49c, XE_REG_OPTION_MASKED)
 #define   XE2_EUPEND_CHK_FLUSH_DIS		REG_BIT(14)
+#define   DIS_EU_GRF_POISON_TO_LSC		REG_BIT(13)
 #define   DIS_FIX_EOT1_FLUSH			REG_BIT(9)
 
 #define TDL_TSL_CHICKEN				XE_REG_MCR(0xe4c4, XE_REG_OPTION_MASKED)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 546296f0220b..c3fef8fd73f7 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -601,6 +601,14 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN5, CPSS_AWARE_DIS))
 	},
+
+	/* Xe3p_XPC */
+
+	{ XE_RTP_NAME("14026999295"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(3511),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, DIS_EU_GRF_POISON_TO_LSC))
+	},
 };
 
 static const struct xe_rtp_entry_sr lrc_was[] = {
-- 
2.34.1

