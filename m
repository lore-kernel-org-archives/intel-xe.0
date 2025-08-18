Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260A7CA0EE9
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 17:38:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E112210E4BE;
	Mon, 18 Aug 2025 17:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Urazc3Z0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9429410E4B5
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 17:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755538704; x=1787074704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BQk9NIhb0FOX6dq9UL8xdRAcPLJZjFI5VyYgZRGo9ts=;
 b=Urazc3Z0PTgwXT/xDg6RCPZFEw7TV0cynY1grHZQSXtZ9D/s5YAXqA/N
 jl45zm+Nn49MGhdl+wb+KdGZOZpDPxIWcU/gSPIB2PhX0t/vbZAYb7bwy
 qfpVYi0Ln1J0gtQ8K89NAUmOTYHZsqyvFFtPPcBzuhCvMEuHl7ResXjSV
 yegF2DEqx6C2I0HqtyJzZpvVHRZUPiV2vvXUXG7Ayk5u1Y2GLqZEqObzH
 Co2onCj9/Kr3CPTSiqDcP0+ZfgX2Qqu6aLXUTULd9KCo2QRie3jA9tGbX
 XG05AO1sTPlchTdLRqRxFCTlKwMHT1/jqKh3q+t6njJXB3MzjGP8Wb3vT g==;
X-CSE-ConnectionGUID: hiq+tCOKSguvdAf8yuwbDw==
X-CSE-MsgGUID: ExZ/XxUDR0aCjGmVr+nizQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57918651"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57918651"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 10:38:24 -0700
X-CSE-ConnectionGUID: Wzn9yANNROqzFavulPVWhQ==
X-CSE-MsgGUID: 7RrIkjeUSUOV68onfvW8jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="172838872"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 10:38:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v4 05/13] drm/xe/psmi: Add Wa_16023683509
Date: Mon, 18 Aug 2025 10:37:30 -0700
Message-ID: <20250818-psmi-v4-5-a330783ce1c0@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818-psmi-v4-0-a330783ce1c0@intel.com>
References: <20250818-psmi-v4-0-a330783ce1c0@intel.com>
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

