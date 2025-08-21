Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF83CA0EEB
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 16:18:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B408610E39A;
	Thu, 21 Aug 2025 16:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GmaPI5aI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2297010E38D
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 16:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755793116; x=1787329116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E/6v1Lznvdi0PdgW4icl1+gFv2cuKXRjbfyg0qGN9zU=;
 b=GmaPI5aIY1qNjKnTGMtuLcP7suEuXWVLVnNIYZBJV1lFh9J8Krm5Lq94
 hHOtEJiuBUTkkdXlws0uZzN0deGn6RpQ+whevzkvUUun6I2BSN9WHIh5b
 OeLYOt/hPmxavYNUlMpWRXE/kFELcEav7nN8IdHSpNuA3jfvD1XyGeCko
 eyzNP4jmW37YCYzJBXwKxTDAMiK9wt253udVSaD2fwRRSqaEYILPwB9d6
 xhBzSU+Ofnwwb26YXQz1nu+IwAKRO8wMYm+/P+XbhVwF3eSxO5Ni5+S2p
 ZnataoGNzCfFImzOV6e9+hk8UT1ON/RcLng2h8CkNhOyxz/VXBLpMIyvQ A==;
X-CSE-ConnectionGUID: 40Z9O4xwTCawdFPP/Z8apw==
X-CSE-MsgGUID: fKMAuXRsRlijaVu419FX4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69527888"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="69527888"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 09:18:36 -0700
X-CSE-ConnectionGUID: vbaD+23mTmShb/vwiUS6pw==
X-CSE-MsgGUID: I9eckhBzRpqx7/NownyLpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="199326715"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 09:18:34 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v5 05/12] drm/xe/psmi: Add Wa_16023683509
Date: Thu, 21 Aug 2025 09:18:00 -0700
Message-ID: <20250821-psmi-v5-5-34ab7550d3d8@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821-psmi-v5-0-34ab7550d3d8@intel.com>
References: <20250821-psmi-v5-0-34ab7550d3d8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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
v3 (Matt Atwood):
- Fix wrong check for GRAPHICS_STEP() rather than MEDIA_STEP()
---
 drivers/gpu/drm/xe/xe_guc.c        | 3 +++
 drivers/gpu/drm/xe/xe_guc_fwif.h   | 1 +
 drivers/gpu/drm/xe/xe_wa_oob.rules | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 883f700e532a7..37d06c51180cb 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -219,6 +219,9 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 	if (XE_GT_WA(gt, 14018913170))
 		flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
 
+	if (XE_GT_WA(gt, 16023683509))
+		flags |= GUC_WA_SAVE_RESTORE_MCFG_REG_AT_MC6;
+
 	return flags;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 400004f1838a0..0508f1064178e 100644
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
index 303a5e05d9932..27cd19b98f8ea 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -72,6 +72,8 @@ no_media_l3	MEDIA_VERSION(3000)
 		MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
 		MEDIA_VERSION(3000), FUNC(xe_rtp_match_psmi_enabled)
 		MEDIA_VERSION(3002), FUNC(xe_rtp_match_psmi_enabled)
+16023683509	MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
+		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_psmi_enabled)
 
 # SoC workaround - currently applies to all platforms with the following
 # primary GT GMDID

-- 
2.50.1

