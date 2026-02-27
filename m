Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA8AFEFB47
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 13:00:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D6010EB35;
	Fri, 27 Feb 2026 13:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gm1DCv7U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB4110EB35
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 13:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772197231; x=1803733231;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VtAZu5Co5ECM98S/I5TdxDWyfTXW5lu6x+cXCrSkd/M=;
 b=Gm1DCv7UcKi5dEiUq0SD+UQFLq0ryQKArLTdAWkH1HcZBJ7gjLL+vi+7
 bFGXpa8a6hpgFxJXPzMkeciwaH1Zejlc8NHczDgF0eH8/7xbT2FEWunsP
 lNGrmo5PSHWuA1lkdx29ZmfekCaC4ZuFc7nnQuwJU3XQKlmq5QSChULlI
 oo/jTaNDuei1EgYU0BFKzv4DT8QraaVjfdKYArBamBk8s29HrC6LAd1Vf
 DdkYmcSCeg2p0Bq+fFnQjuawg8JwJAF92CuLDAsos3eXrlSORIsHFDqFj
 QfOWm4j3CEwEg185HNK5tejGbwVihTPyRWemWOQJHc4oIcxkBvDJ8wEkK Q==;
X-CSE-ConnectionGUID: 378WUmAPSjmyNWWVNFBWuA==
X-CSE-MsgGUID: GEaDDIZUTE+7pEM9/2NUuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="77142587"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="77142587"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 05:00:31 -0800
X-CSE-ConnectionGUID: 3ZWFgD+wStWpuCAOgen1AA==
X-CSE-MsgGUID: mLrT48+kQ1CBd8Ue1tDXFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="214318407"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 05:00:30 -0800
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	tejas.upadhyay@intel.com
Subject: [PATCH] drm/xe/xe3p_lpg: Add Wa_14026578760
Date: Fri, 27 Feb 2026 18:30:20 +0530
Message-ID: <20260227130020.2846392-1-varun.gupta@intel.com>
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

Add GT workaround Wa_14026578760 for graphics version 35.10

Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 90b9017770ea..08b05f3c7510 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -103,6 +103,9 @@
 #define GAMSTLB_CTRL2				XE_REG_MCR(0x4788)
 #define   STLB_SINGLE_BANK_MODE			REG_BIT(11)
 
+#define GAMSTLB_CTRL				XE_REG_MCR(0x477c)
+#define   DIS_PEND_GPA_LINK			REG_BIT(13)
+
 #define XE2_LMEM_CFG				XE_REG(0x48b0)
 
 #define XE2_GAMWALK_CTRL			0x47e4
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 26950b8a7543..30cd47b1dc4c 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -299,6 +299,10 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)),
 	  XE_RTP_ACTIONS(SET(GAMSTLB_CTRL2, STLB_SINGLE_BANK_MODE))
 	},
+	{ XE_RTP_NAME("14026578760"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(3510)),
+	  XE_RTP_ACTIONS(SET(GAMSTLB_CTRL, DIS_PEND_GPA_LINK))
+	},
 	{ XE_RTP_NAME("16028005424"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)),
 	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
-- 
2.43.0

