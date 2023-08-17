Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB19EC2FC0E
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 11:04:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5DF10E44B;
	Thu, 17 Aug 2023 11:04:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59F810E449
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 11:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692270238; x=1723806238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7PET3FYCTwN2nFHNk9vnsBGMXtGkkzQJGXQYdkq+jWU=;
 b=B8RvpBian6oGB3MyLIV0dJaCW34oX6ENXDIy020hHaHHYDy06FKMiWNb
 esN+BKwdqqp7RYLSkyt2etPBWX24yMoWYTHxD68GY62wpquGMW3Ku41HD
 eo7MtQ39kWzXz4kvTPfLiERo1t/mJ3FD3l8KKIqrJXz0zJbzbCDnh55ih
 W04lklcOYeNLjO89kHaJwgy+RkwNICge3G0pF+U8BpBVoNFrxpx/0Dq+j
 9QRX1zuc3o+L11aKYJdtoDabUGViDOJfrW8/nViqLXEKKxXxKN5LRtnqi
 ZWzXye2qvC55LDffpT4lTtMeFaWdDFw3mCoq8WS6JJjwtn3uTHg2ileUQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="376516678"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="376516678"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 04:03:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="728099950"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="728099950"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 04:03:56 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 17 Aug 2023 04:03:51 -0700
Message-Id: <20230817110352.7601-3-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230817110352.7601-1-niranjana.vishwanathapura@intel.com>
References: <20230817110352.7601-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/3] drm/xe/pvc: Force even num engines to use
 64B
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
Cc: matthew.d.roper@intel.com
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
index e2b6e17d7ec4..e7b8cbbaf002 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -515,6 +515,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
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

