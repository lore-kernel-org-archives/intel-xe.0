Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0023FCCD195
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 13:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C5A10E6A2;
	Tue,  7 Oct 2025 13:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B8eu1FbS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447CA10E649
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 13:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759842314; x=1791378314;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=jcxzGh7kv1Uf/QJSgRIlUOf92xo15lzFCAgBuenkdpU=;
 b=B8eu1FbSbykTsNSQ9NFujYeX/GS/85Qxz56tqoJZgID3QLYR09ORKjRu
 m3bYSWQ7ORl0yGQ/kdK61oVfDLtL3Yjhmq5Ts8/9Ru0HmEg3oTk3TgqUz
 PSFI5vOSDFKLE0Wia1b/aA6IPY6UidhMS/oJFhoDnCDZEItyoJI3wlKih
 3tcvUpEko76rviBJ8vY7oOf/lj6ZloBptVfQfbQh9KFoNn57T66Oqq1ie
 Y0cLcpstKaHCocKltwNVY6Q7oxFFVp5kU4H6zGHcggvifENBSQPq2MlHh
 aBVXZDwCqYikME4mSI6dIqGkV2Udjhr4toCEFW6DiH00I9vdsD1mXWJcq Q==;
X-CSE-ConnectionGUID: VU2hRmgMS/G+zMBznNS7uA==
X-CSE-MsgGUID: lxlJ5cs7RUqBKyoaRrG5yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="64639842"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="64639842"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:05:14 -0700
X-CSE-ConnectionGUID: FJIdNtT1TFOGafXzW0fjkg==
X-CSE-MsgGUID: GRFtXJbsRDO0b76MCCkiCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180576953"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:05:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8 22/33] drm/xe: Add CTB_H2G_BUFFER_OFFSET define
Date: Tue,  7 Oct 2025 06:04:54 -0700
Message-Id: <20251007130505.2694829-23-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007130505.2694829-1-matthew.brost@intel.com>
References: <20251007130505.2694829-1-matthew.brost@intel.com>
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

Rather than open coding the H2G buffer offset as 'CTB_DESC_SIZE * 2' add
CTB_H2G_BUFFER_OFFSET define.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index fd2385635962..503cf5cb5d33 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -167,6 +167,7 @@ ct_to_xe(struct xe_guc_ct *ct)
  */
 
 #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
+#define CTB_H2G_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
 #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
 #define CTB_G2H_BUFFER_SIZE	(SZ_128K)
 #define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 2)
@@ -190,7 +191,7 @@ long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct)
 
 static size_t guc_ct_size(void)
 {
-	return 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE +
+	return CTB_H2G_BUFFER_OFFSET + CTB_H2G_BUFFER_SIZE +
 		CTB_G2H_BUFFER_SIZE;
 }
 
@@ -331,7 +332,7 @@ static void guc_ct_ctb_h2g_init(struct xe_device *xe, struct guc_ctb *h2g,
 	h2g->desc = *map;
 	xe_map_memset(xe, &h2g->desc, 0, 0, sizeof(struct guc_ct_buffer_desc));
 
-	h2g->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE * 2);
+	h2g->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_H2G_BUFFER_OFFSET);
 }
 
 static void guc_ct_ctb_g2h_init(struct xe_device *xe, struct guc_ctb *g2h,
@@ -349,7 +350,7 @@ static void guc_ct_ctb_g2h_init(struct xe_device *xe, struct guc_ctb *g2h,
 	g2h->desc = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE);
 	xe_map_memset(xe, &g2h->desc, 0, 0, sizeof(struct guc_ct_buffer_desc));
 
-	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE * 2 +
+	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_H2G_BUFFER_OFFSET +
 					    CTB_H2G_BUFFER_SIZE);
 }
 
@@ -360,7 +361,7 @@ static int guc_ct_ctb_h2g_register(struct xe_guc_ct *ct)
 	int err;
 
 	desc_addr = xe_bo_ggtt_addr(ct->bo);
-	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE * 2;
+	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET;
 	size = ct->ctbs.h2g.info.size * sizeof(u32);
 
 	err = xe_guc_self_cfg64(guc,
@@ -387,7 +388,7 @@ static int guc_ct_ctb_g2h_register(struct xe_guc_ct *ct)
 	int err;
 
 	desc_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE;
-	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE * 2 +
+	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET +
 		CTB_H2G_BUFFER_SIZE;
 	size = ct->ctbs.g2h.info.size * sizeof(u32);
 
-- 
2.34.1

