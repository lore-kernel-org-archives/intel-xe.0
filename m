Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714BCCA0EC1
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 17:30:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33AF510E97E;
	Fri,  8 Aug 2025 17:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n/35nbgs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59FD10E1EC
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 17:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754674211; x=1786210211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OfQfbgOtpSjoS/vJbFtCM+SDj61Fz6t+7e7KCY6Bkuo=;
 b=n/35nbgs20hA2+lIXbDwCXTnAQWMrU1cDjdvofeqeLju+l/9oG3VlY50
 i8z9LBrN68H69GCbWS8wbW5uVqs8xNB4LCp41pJ5c/b/9pRo3SCjay7cX
 Wa0snB/e3QEbXWiOUxQClHtg0Ckrwe99rXUgzkH/uiKjtz4AbtJJmo8q4
 bCsPI+ftmqhD54gQz3qV7z5UuZL0tt3SgzbYvpYNew8Qof9TE1FO6jyD0
 ZqLn8Q3QSyXgnJDFj31khg4V8fP+Dd2K/ZR8W2UkKtZnxx6wJaIFTNd2s
 g5hgRFWHslypq+kLENOUpLw8uK4EoQMsuXBRUvdLQiS0pHMvF5WP6pXOn g==;
X-CSE-ConnectionGUID: QQ6Bb1H1Qtm2p4x2i8krng==
X-CSE-MsgGUID: 0Pooh38ITLWZKWloo9FG3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68109822"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="68109822"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:30:09 -0700
X-CSE-ConnectionGUID: cVqISLgYRdiYsQXK3ByPsg==
X-CSE-MsgGUID: bRF59/EOQmuMwu7HzGlVyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="165387410"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:30:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v3 05/13] drm/xe/psmi: Add Wa_16023683509
Date: Fri,  8 Aug 2025 10:29:48 -0700
Message-ID: <20250808-psmi-v3-5-a111e9f1e4b7@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
References: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-858c0
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

From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

This WA ensures GuC will restore the media MCFG registers at C6
exit.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2:
 - Enable only when PSMI is enabled
---
 drivers/gpu/drm/xe/xe_guc.c        | 3 +++
 drivers/gpu/drm/xe/xe_guc_fwif.h   | 1 +
 drivers/gpu/drm/xe/xe_wa_oob.rules | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index cb757a53de856..f55c4a37cfed1 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -219,6 +219,9 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 	if (XE_WA(gt, 14018913170))
 		flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
 
+	if (XE_WA(gt, 16023683509))
+		flags |= GUC_WA_SAVE_RESTORE_MCFG_REG_AT_MC6;
+
 	return flags;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 4dc000c977faf..a169ad0da0d47 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -108,6 +108,7 @@ struct guc_update_exec_queue_policy {
 #define   GUC_WA_RENDER_RST_RC6_EXIT	BIT(19)
 #define   GUC_WA_RCS_REGS_IN_CCS_REGS_LIST	BIT(21)
 #define   GUC_WA_ENABLE_TSC_CHECK_ON_RC6	BIT(22)
+#define   GUC_WA_SAVE_RESTORE_MCFG_REG_AT_MC6	BIT(25)
 
 #define GUC_CTL_FEATURE			2
 #define   GUC_CTL_ENABLE_SLPC		BIT(2)
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 303a5e05d9932..fe369e8a01012 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -72,6 +72,8 @@ no_media_l3	MEDIA_VERSION(3000)
 		MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
 		MEDIA_VERSION(3000), FUNC(xe_rtp_match_psmi_enabled)
 		MEDIA_VERSION(3002), FUNC(xe_rtp_match_psmi_enabled)
+16023683509	MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
+		MEDIA_VERSION(3000), GRAPHICS_STEP(A0, B0), FUNC(xe_rtp_match_psmi_enabled)
 
 # SoC workaround - currently applies to all platforms with the following
 # primary GT GMDID

-- 
2.50.1

