Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA684EB64D7
	for <intel-xe@archiver.kernel.org>; Sat, 24 Jun 2023 01:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB7510E0FF;
	Sat, 24 Jun 2023 01:41:47 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F9D10E0FF
 for <intel-xe@lists.freedesktop.org>; Sat, 24 Jun 2023 01:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687570904; x=1719106904;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XCvN8+S9PyI4YpxMLX6WZHZG24oK9IV9Phoij2bSqKg=;
 b=nn1hgFjkL+G1mr8vvi/Z92f4gkuxUD5tyqQhe1zWlLwZ00NQxRU9iWhK
 oYDsB+QBfOHbjwIHtjWcRYVRxMEoQFrxQTRdmufdrjzNiNfckhK5C0VR9
 02nXdWCxWpB8UAWRmMuXJIH/5we78kCYtf2gld/fVogKRS/8gMNQkxV7M
 q49LKiwRVD0v45sgM5lSlNta/I4ndM4bPlmsBMR0tbH8HfhubXmPwVBRP
 1bKDkSjs+aLWrDbOsWP0nfN+swLsvIqt0Nby123kuuSGC2j1XOGqG9hMo
 gYa0ufCRZ5FHFyR5u120h8hAdownQvtYdXJ8QKVvJrD5c2SU8BzzAxucJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="359766505"
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; d="scan'208";a="359766505"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2023 18:41:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="709630168"
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; d="scan'208";a="709630168"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2023 18:41:42 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 23 Jun 2023 18:41:37 -0700
Message-Id: <20230624014137.11358-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC] drm/xe/pvc: Force even num engines to use 64B
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

