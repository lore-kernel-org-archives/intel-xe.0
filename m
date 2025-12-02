Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E481DCFD376
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 08:34:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A988610E5C3;
	Tue,  2 Dec 2025 08:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W12o81yU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706DC10E5C3
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 08:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764664497; x=1796200497;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZDjWQcmkPDlhuxjBKNf+CGEnijZCwdRZCvd7uNTBQXA=;
 b=W12o81yU3JnjxRryKBeoDsVt5Fg29InO3PNRdgPqyl632bdorNLlYMfi
 HkQRr4LDi4iLRuc+gTKRCM0g6G5eOUYfSCjzOtvj3q/VxA6kFIbUQYTy7
 dTgJmPlVsbkTeg5PC3512+Mjxox/hKcpHt3KKaUeWt4G8WKXEUuqRC2ww
 VlCATTk5Au/4AhT0Lkr6MrJ+6VM3Io/HZYnhq0CSiEfx//uKqVDMwkgBH
 0PYAI0/O/huieWFlURyARJQdButIOxoLQdl1WGEBdmWRrhog2ZQiKzP2t
 KKnOBSC8f+eo6afcpw2oedbgY98M5DviuuEuC16uMrlwNztqi2IPmyiX9 g==;
X-CSE-ConnectionGUID: KGMgKgY/RdWsM3hmnOC4yA==
X-CSE-MsgGUID: zVHsK3spTcG5P2zNlGFKGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="54173889"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="54173889"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 00:34:56 -0800
X-CSE-ConnectionGUID: ubYD2DuVRJ6jgIOY2Qcf4A==
X-CSE-MsgGUID: VOw0VOmrTRiGOtHqyAW+Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="194198025"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa006.fm.intel.com with ESMTP; 02 Dec 2025 00:34:54 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/guc_ct: Assert on credits mismatch during runtime
 suspend
Date: Tue,  2 Dec 2025 14:03:34 +0530
Message-ID: <20251202083334.554045-1-raag.jadav@intel.com>
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

G2H credits should be in fully idle state when runtime suspending GuC CT.
Assert on mismatch.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 2a24d3fb6881..648f0f523abb 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -253,8 +253,11 @@ static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
 #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
 #define CTB_H2G_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
 #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
+#define CTB_H2G_BUFFER_DWORDS	(CTB_H2G_BUFFER_SIZE / sizeof(u32))
 #define CTB_G2H_BUFFER_SIZE	(SZ_128K)
+#define CTB_G2H_BUFFER_DWORDS	(CTB_G2H_BUFFER_SIZE / sizeof(u32))
 #define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 2)
+#define G2H_ROOM_BUFFER_DWORDS	(CTB_G2H_BUFFER_DWORDS / 2)
 
 /**
  * xe_guc_ct_queue_proc_time_jiffies - Return maximum time to process a full
@@ -403,7 +406,7 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct)
 static void guc_ct_ctb_h2g_init(struct xe_device *xe, struct guc_ctb *h2g,
 				struct iosys_map *map)
 {
-	h2g->info.size = CTB_H2G_BUFFER_SIZE / sizeof(u32);
+	h2g->info.size = CTB_H2G_BUFFER_DWORDS;
 	h2g->info.resv_space = 0;
 	h2g->info.tail = 0;
 	h2g->info.head = 0;
@@ -421,8 +424,8 @@ static void guc_ct_ctb_h2g_init(struct xe_device *xe, struct guc_ctb *h2g,
 static void guc_ct_ctb_g2h_init(struct xe_device *xe, struct guc_ctb *g2h,
 				struct iosys_map *map)
 {
-	g2h->info.size = CTB_G2H_BUFFER_SIZE / sizeof(u32);
-	g2h->info.resv_space = G2H_ROOM_BUFFER_SIZE / sizeof(u32);
+	g2h->info.size = CTB_G2H_BUFFER_DWORDS;
+	g2h->info.resv_space = G2H_ROOM_BUFFER_DWORDS;
 	g2h->info.head = 0;
 	g2h->info.tail = 0;
 	g2h->info.space = CIRC_SPACE(g2h->info.tail, g2h->info.head,
@@ -725,6 +728,12 @@ void xe_guc_ct_stop(struct xe_guc_ct *ct)
  */
 void xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct)
 {
+	struct guc_ctb *g2h = &ct->ctbs.g2h;
+	u32 credits = CIRC_SPACE(0, 0, CTB_G2H_BUFFER_DWORDS) - G2H_ROOM_BUFFER_DWORDS;
+
+	/* We should be back to guc_ct_ctb_g2h_init() values */
+	xe_gt_assert(ct_to_gt(ct), g2h->info.space == credits);
+
 	/*
 	 * Since we're already in runtime suspend path, we shouldn't have pending
 	 * messages. But if there happen to be any, we'd probably want them to be
-- 
2.43.0

