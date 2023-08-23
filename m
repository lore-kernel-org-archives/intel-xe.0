Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D5CEE49A0
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 11:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D8210E080;
	Wed, 23 Aug 2023 11:40:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D47010E080
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Aug 2023 11:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692790847; x=1724326847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9RGnxiBzu9GwmBV64yO6CjWY3wvtAxGVb4saNfpQ0Z8=;
 b=XJt49STky8RBaaLX2464N7VUQX8lzpCrwQBVKgERYGk9L1lfdlU9gxCY
 Tiu0SZFHZ30xhR59Qs+uIqWeDWCTEN/u8iXAdTQPGkb0aWAqTaJhIPQ7g
 s/xRFBHOHYpu4xoL/VFHBvilxpvqLcXyA+EnWMnFs22mdCTeaGaAGd343
 iYc7BACDE5524b4UKoxrVBKof9Itl+PEcaeMS6BkI2Jj5BO2i64t8G2LN
 S9wSrjqxIthFOxJovHnlnmHeoFGorKXBihwotNUE7B+gPxQo/tvMb0Jxz
 9x3a+zCbuAli9BdCccwKz/ZzKrfcUXbJombgr6HriMyQcym4KWCjNyaYT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="460506110"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="460506110"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 04:40:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="910481346"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="910481346"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 04:40:44 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 23 Aug 2023 04:40:39 -0700
Message-Id: <20230823114040.31769-3-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230823114040.31769-1-niranjana.vishwanathapura@intel.com>
References: <20230823114040.31769-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 2/3] drm/xe/pvc: Force even num engines to use
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
Cc: lucas.demarchi@intel.com, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Wa_16017236439 requires that we update BCS_SWCTRL
(via indirect context batch buffer) to set 64B
transfers when running on an even-numbered BCS
engine and 256B on an odd-numbered BCS engine.

v2: Move WA from engine_was[] to lrc_was[]

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
 drivers/gpu/drm/xe/xe_wa.c               | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 1a366d8070f3..806755f31241 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -64,6 +64,7 @@
 #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
 
 #define BCS_SWCTRL(base)			XE_REG((base) + 0x200, XE_REG_OPTION_MASKED)
+#define BCS_SWCTRL_DISABLE_256B			REG_BIT(2)
 
 /* Handling MOCS value in BLIT_CCTL like it was done CMD_CCTL */
 #define BLIT_CCTL(base)				XE_REG((base) + 0x204)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index e2b6e17d7ec4..f45e9452ba0e 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -604,6 +604,16 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
 	},
 
+	/* PVC */
+
+	{ XE_RTP_NAME("16017236439"),
+	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COPY),
+		       FUNC(xe_rtp_match_even_instance)),
+	  XE_RTP_ACTIONS(SET(BCS_SWCTRL(0),
+			     BCS_SWCTRL_DISABLE_256B,
+			     XE_RTP_ACTION_FLAG(ENGINE_BASE))),
+	},
+
 	/* Xe_LPG */
 	{ XE_RTP_NAME("18019271663"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271)),
-- 
2.21.0.rc0.32.g243a4c7e27

