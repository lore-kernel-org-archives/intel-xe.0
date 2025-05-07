Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F669C3ABBF
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 10:11:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079A610E781;
	Wed,  7 May 2025 10:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rolh0jew";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B2F010E781
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 10:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746612679; x=1778148679;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ckoa6ORJFS7y4B8wn/0GM6ivgjoocETZyBgERRpRLFk=;
 b=Rolh0jew1T92CvnL+cMhIY21JTruokl76iTCZj/5SnyATGK2wqBtGy3E
 OBQIDDsU5fokP+Ux6ms5w00E7uVEKcII0E5CGS5ZceyaOTfiwJB9k/i41
 p2+rSU++WsKgMarp9JRXSDik9C89UPi/kCbuGvzwzc2lZCDkiWTKxw5hX
 qB82zBi9bgUshKUxjT0jkteY7NZDPBTq3rC6aoHtJ/df0szvZE33LyjLW
 F4SNHNgu40Y8sGwVqKSrbU8K/UJOyJDlLZVlbfZf0A4Rft6FLzxZ7TRe/
 TV33P5jMd5nu2X+RqNtbnJxNnyVyOgCICPlsIfBf/Fi5SWKPQpSMs4s0X Q==;
X-CSE-ConnectionGUID: /4533VKpRGefb7AkFlt+iw==
X-CSE-MsgGUID: 1UKiFylISe+k6LbUjfGwuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="47433912"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="47433912"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 03:11:19 -0700
X-CSE-ConnectionGUID: N3bhboZTTByjq2AjIpgfzA==
X-CSE-MsgGUID: 9ruJXFiDRJSMqmXGTKBLmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="166960896"
Received: from dut2050adlp.iind.intel.com (HELO DUT2050ADLP..)
 ([10.190.239.12])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 03:11:16 -0700
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Intel XE List <intel-xe@lists.freedesktop.org>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Aradhya Bhatia <aradhya.bhatia@intel.com>
Subject: [PATCH v2] drm/xe/xe2hpg: Add Wa_22021007897
Date: Wed,  7 May 2025 10:11:12 +0000
Message-ID: <20250507101112.4678-1-aradhya.bhatia@intel.com>
X-Mailer: git-send-email 2.45.2
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

Add Wa_22021007897 for the Xe2_HPG (graphics version: 20.01) platform.
It is a permanent workaround, and applicable on all the steppings.

Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
---
Changes in v2:
  - Fix typo in the SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE macro.

 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index cbb9f7cbcfc0..5cd5ab8529c5 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -156,6 +156,7 @@
 #define XEHPG_SC_INSTDONE_EXTRA2		XE_REG_MCR(0x7108)
 
 #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
+#define   SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE	REG_BIT(12)
 #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
 
 #define COMMON_SLICE_CHICKEN3				XE_REG(0x7304, XE_REG_OPTION_MASKED)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 6f6563cc7430..67196baa4249 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -827,6 +827,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
 	},
+	{ XE_RTP_NAME("22021007897"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
+	},
 
 	/* Xe3_LPG */
 	{ XE_RTP_NAME("14021490052"),

base-commit: a127cd437da1f18b6ecc9e03226d8e2b2aa79dab
-- 
2.43.0

