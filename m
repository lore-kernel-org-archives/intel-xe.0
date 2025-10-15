Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D97CCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 07:23:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D0010E6EA;
	Wed, 15 Oct 2025 07:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PTK6PtCk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E5F10E6EA
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 07:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760512988; x=1792048988;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/j0cjQPWnHxNlw+FPZzMvVeitcK4vA9fXhJzNAkZvus=;
 b=PTK6PtCk+oLLCH2VwxjsvbugXGtQge4hd4voAb+rHXxSSVwzmG7DJ8GB
 EvcIqCsDrlw7nR561FED9/J5b8bFXRoQTA1htl7j3uh8TOnC7iV4Zo7jY
 YboWhlvTiqa9qBf0C5BKndabi+e166dbMVcOM6Wpn51ns/QLSC0FfuP6/
 YoOvU1FgJHWQJwP/2a8KVLhZu6r0iZOmOadtyb7xSPx8mPzAsPbi6GfO9
 GhTofmDvrzMrt9eSqFdwDONGrf4sYR/TpgDULXfsaAgXZcHl9uEJCHbGX
 jbxXJtMW4IXDJ8ehZidC8FDRgqiC+5G0RuE8ccp18wfY4dccL2ZOGbKto g==;
X-CSE-ConnectionGUID: y1pvcoDORQehcdDlvAzkAw==
X-CSE-MsgGUID: kkggvWYNTSqZue8lNHXOWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="73282152"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="73282152"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 00:23:08 -0700
X-CSE-ConnectionGUID: oD+BtTBtRQ6yKsZHCIPt7Q==
X-CSE-MsgGUID: OQ3aK90FTA6I5bKyhNcveA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="182041747"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa006.fm.intel.com with ESMTP; 15 Oct 2025 00:23:07 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com,
	Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH] drm/xe/xe3: Add WA_14024681466 for Xe3_LPG
Date: Wed, 15 Oct 2025 13:22:53 +0530
Message-Id: <20251015075253.1036423-1-nitin.r.gote@intel.com>
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

Apply WA_14024681466 to Xe3_LPG graphics IP versions from 30.00 to 30.05.

Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 51f2a03847f9..f680c8b8f258 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -168,6 +168,7 @@
 
 #define XEHP_SLICE_COMMON_ECO_CHICKEN1		XE_REG_MCR(0x731c, XE_REG_OPTION_MASKED)
 #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE	REG_BIT(14)
+#define   FAST_CLEAR_VALIGN_FIX			REG_BIT(13)
 
 #define XE2LPM_CCCHKNREG1			XE_REG(0x82a8)
 
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index aa1b69f48f6f..1cf6b65f3be7 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -916,6 +916,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3003), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
 	},
+	{ XE_RTP_NAME("14024681466"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), GRAPHICS_STEP(A0, B0)),
+	  XE_RTP_ACTIONS(SET(XEHP_SLICE_COMMON_ECO_CHICKEN1, FAST_CLEAR_VALIGN_FIX))
+	},
 };
 
 static __maybe_unused const struct xe_rtp_entry oob_was[] = {
-- 
2.25.1

