Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F26EB64D9
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jul 2023 21:49:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC6810E2DD;
	Mon, 10 Jul 2023 21:49:26 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE4F10E2DD
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jul 2023 21:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689025765; x=1720561765;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XCvN8+S9PyI4YpxMLX6WZHZG24oK9IV9Phoij2bSqKg=;
 b=TQgdEFz2UmgVV7MzwE46MDg+seA2yJzZo9RT81z4bNvDbTHfOSebP1Bh
 56Q35HS5uI1u/qTXu35Km+kSjOzYhuNaQpUPVRHccWsZUicaKMkGPs919
 NOUCi8mSL0CshX0baAHvNJSSj+Tpn1kwsM+TgtMCn7Q59BX3oST+Y354/
 LEJc/SL4fcu1AdV+35AMkkp0te9nCBWKyN7hLZW9ZlfE8zYk2YtoAV5L7
 Ng5F4tZjMcMdSafIF6kTbr9oant3WWC/NtxOwJ4MLVenZVxSwaYxf5m7Y
 lConBOq9WUZ6iNn9DV5J3/CtL2p1Q6FsJJ5uUqhYZmGyeqWyQAXUqh+j4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="367961391"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="367961391"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 14:49:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="750473652"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="750473652"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 14:49:09 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 10 Jul 2023 14:49:03 -0700
Message-Id: <20230710214903.14982-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/pvc: Force even num engines to use 64B
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
 drivers/gpu/drm/xe/xe_wa.c               | 8 +++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 79873bf64e8d..af3cfc696692 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -59,6 +59,9 @@
 #define RING_BBADDR(base)			XE_REG((base) + 0x140)
 #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
 
+#define BCS_ENGINE_SWCTL(base)			XE_REG((base) + 0x200, XE_REG_OPTION_MASKED)
+#define BCS_ENGINE_SWCTL_DISABLE_256B		REG_BIT(2)
+
 /* Handling MOCS value in BLIT_CCTL like it was done CMD_CCTL */
 #define BLIT_CCTL(base)				XE_REG((base) + 0x204)
 #define   BLIT_CCTL_DST_MOCS_MASK		REG_GENMASK(14, 9)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 5eaa9bed9d12..341877acf05d 100644
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
@@ -525,7 +532,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, DIS_FIX_EOT1_FLUSH))
 	},
-
 	{}
 };
 
-- 
2.21.0.rc0.32.g243a4c7e27

