Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F62F531CC
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 20:10:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438A510E52D;
	Mon, 13 Apr 2026 20:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h9Nyb9FK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F120A10E52D
 for <Intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 20:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776111049; x=1807647049;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qgB9LK2l8GXofW55JDKCFANdtwfAtDXBGMZ/+nJkrH0=;
 b=h9Nyb9FKKCHBNQ2G4SQu/kFpLbde6fyn+RA+87jCTP6I8pWw1tSfqufw
 0rGhIEpt7A9ON7JcZoWt+DinebzSWTdbAngJ6lCWwNQHT3GT9DHd/sisI
 LJX7eo5++xlKQwNTtwIHTYqpcVwnaJeVdwK6BBax1SI2N4NDIeU9oWtRA
 pNtb+MqdFX8yNPtbJOV74sM67OhOx7bG1GQSzJ3ppRxZG9nBHo7qNcICf
 H+a5BfYCek7X7kNbMoNbfd418g3S3zNyrm0Akc8z0yVMfcoX2g8s1LeId
 rxiOSyFAkBNmExbKCXlmsnsLWO1mA+zDHTi23NaauLMUYOzXkfZN5BMxX w==;
X-CSE-ConnectionGUID: bZ9dlsVYSJmOh+QDMv9xmQ==
X-CSE-MsgGUID: guTJOW9+TS+LGR4whmiAPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="87358061"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="87358061"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 13:10:48 -0700
X-CSE-ConnectionGUID: MbtsyMEFRgagFvgURRMsdA==
X-CSE-MsgGUID: g0yGdnUZT3mjyqJNbsOtCw==
X-ExtLoop1: 1
Received: from cataylo2-desk.jf.intel.com ([10.88.27.141])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 13:10:48 -0700
From: Clint Taylor <clinton.a.taylor@intel.com>
To: Intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Apply WA_14026810691 to engine
Date: Mon, 13 Apr 2026 13:08:25 -0700
Message-Id: <20260413200825.4054940-1-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
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

Apply engine tuning WA_14026810691 starting with IP: Xe3p_LPG

v2: move to xe tunings (MattR)
Signed-off-by: Clint Taylor <clinton.a.taylor@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_tuning.c       | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index aa267c2f6162..6a16ac1aca96 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -536,6 +536,9 @@
 #define   SLM_WMTP_RESTORE			REG_BIT(11)
 #define   RES_CHK_SPR_DIS			REG_BIT(6)
 
+#define TDL_TSL_CHICKEN2			XE_REG_MCR(0xe4cc, XE_REG_OPTION_MASKED)
+#define   TILEY_LOCALID				REG_BIT(2)
+
 #define ROW_CHICKEN				XE_REG_MCR(0xe4f0, XE_REG_OPTION_MASKED)
 #define   UGM_BACKUP_MODE			REG_BIT(13)
 #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index f8de6a4bf189..39423d5fabcc 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -124,6 +124,11 @@ static const struct xe_rtp_entry_sr engine_tunings[] = {
 			     GHWSP_CSB_REPORT_DIS,
 			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 	},
+	{ XE_RTP_NAME("Tuning: TileY 2x2 Walk"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3510, XE_RTP_END_VERSION_UNDEFINED),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN2, TILEY_LOCALID))
+	},
 };
 
 static const struct xe_rtp_entry_sr lrc_tunings[] = {
-- 
2.25.1

