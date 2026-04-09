Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1C1F364C3
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 21:59:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A9E10E035;
	Thu,  9 Apr 2026 21:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iXeGIe2Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28AB10E035
 for <Intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 21:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775771969; x=1807307969;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p6NJgxJkrcMFpY43OVlM/bvRyyjTc6PpXy4uIis/x7s=;
 b=iXeGIe2QtKi1o+kR0lCCMc4IpAdnsbp/5kKSFI8SXVpRrCByGu3wzFiu
 q/sjWc5Px5FF+TNcQkY7dsYRB30gwZlEtjIff7AlfIpuNILBFnxIDU5Xo
 zPAPNq2PLqE61GZPmWbClHiWqzc42boIs0GAB+/T7l0pbejkwChRypoBl
 sCEmcIP8Sp73sX9JL+zysl3ef+Zu7Abl414D1S4Y4AoAwpPycmSTPwdUU
 bsgUy9ImOR68tsXCSNkCf5IWmZnOQBsDLZOGw5BAB2eydFiT63wYZJNbY
 P0lVy+Lox/FYIFrPg1izTRUdxMUhimZj8OeeFRew7PLFGBS87HdyLCqiM w==;
X-CSE-ConnectionGUID: X03hgoC/SRusGOUOpx+bsw==
X-CSE-MsgGUID: gtQJjMzdRHiQmQDvxTR6eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87077559"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="87077559"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 14:59:28 -0700
X-CSE-ConnectionGUID: uvGhQkPnR7GFaKW3wYktzA==
X-CSE-MsgGUID: Zeod8sGzScaukYZe1A2Csg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="225752194"
Received: from cataylo2-desk.jf.intel.com ([10.88.27.141])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 14:59:28 -0700
From: Clint Taylor <clinton.a.taylor@intel.com>
To: Intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Apply WA_14026810691 to engine
Date: Thu,  9 Apr 2026 14:57:05 -0700
Message-Id: <20260409215705.1456888-1-clinton.a.taylor@intel.com>
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

Apply WA_14026810691 to following IPs:
Xe3p_LPG
Xe3p_XPC

Signed-off-by: Clint Taylor <clinton.a.taylor@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_wa.c           | 6 ++++++
 2 files changed, 9 insertions(+)

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
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 2ec70be78bf9..30dd1687cc8d 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -609,6 +609,12 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, DIS_EU_GRF_POISON_TO_LSC))
 	},
+	{ XE_RTP_NAME("14026810691"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3510, 3511),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN2, TILEY_LOCALID))
+	},
+
 };
 
 static const struct xe_rtp_entry_sr lrc_was[] = {
-- 
2.25.1

