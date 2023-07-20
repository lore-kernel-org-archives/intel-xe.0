Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D874EB64DC
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 08:10:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64BA10E034;
	Thu, 20 Jul 2023 08:10:45 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350BE10E577
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 08:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689840644; x=1721376644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=va5tU1ZNKa9Vkv52494CZc4skydXcUxMjHv7qstnYBs=;
 b=YSdmsx/AYl9xPrYBTTdUuerSG8bGxpD5zBaIRDNh3u11aGgQiOAuVuEX
 m11u3Knb3BbHMpw62/iBcmiixZMoKltPDipO1ZW00JnXMRFSuPrVLc/l4
 JWDOLCOIkoeNiwtr8tt2/TrXc/bWNuVob0ysrduA/WuwOUfhx/RMEh6fF
 gxiF9lt4hLVgomHNXV3GgPf6BYSixdC7mzJeuvbQldDOwCFpfBgr3Rz3e
 mEz+4YpQrWgOlkCRJPcbBmchkaMqIPgT2B/6xaNyHHEETUXdUYi8agGZp
 gj+PJiN2uLQ+Q+rFkwhAn2HCVEWvpCrp6Tb1FOJIvKP4yf3jyFET4SHq8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="430436355"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="430436355"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 01:10:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="789700122"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="789700122"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 01:10:43 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 20 Jul 2023 01:10:37 -0700
Message-Id: <20230720081038.24822-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230720081038.24822-1-niranjana.vishwanathapura@intel.com>
References: <20230720081038.24822-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe/pvc: Force even num engines to use 64B
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

Wa_16017236439 requires that we update BCS_SWCTRL
(via indirect context batch buffer) to set 64B
transfers when running on an even-numbered BCS
engine and 256B on an odd-numbered BCS engine.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_wa.c               | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 79873bf64e8d..8e488cbe332b 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -59,6 +59,9 @@
 #define RING_BBADDR(base)			XE_REG((base) + 0x140)
 #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
 
+#define BCS_ENGINE_SWCTL(base)                 XE_REG((base) + 0x200, XE_REG_OPTION_MASKED)
+#define BCS_ENGINE_SWCTL_DISABLE_256B          REG_BIT(2)
+
 /* Handling MOCS value in BLIT_CCTL like it was done CMD_CCTL */
 #define BLIT_CCTL(base)				XE_REG((base) + 0x204)
 #define   BLIT_CCTL_DST_MOCS_MASK		REG_GENMASK(14, 9)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 21087f7a4609..b90f64ad301c 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -518,6 +518,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       GRAPHICS_STEP(B0, C0)),
 	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, DISABLE_ECC))
 	},
+	{ XE_RTP_NAME("16017236439"),
+	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COPY),
+		       FUNC(xe_rtp_match_even_instance)),
+	  XE_RTP_ACTIONS(SET(BCS_ENGINE_SWCTL(0),
+			     BCS_ENGINE_SWCTL_DISABLE_256B,
+			     XE_RTP_ACTION_FLAG(ENGINE_BASE))),
+	},
 
 	/* Xe_LPG */
 	{ XE_RTP_NAME("14017856879"),
-- 
2.21.0.rc0.32.g243a4c7e27

