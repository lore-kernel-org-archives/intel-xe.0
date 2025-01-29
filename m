Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98FFC02194
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 00:55:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B59F210E08D;
	Wed, 29 Jan 2025 00:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XhY22NaF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF2F10E08D
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 00:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738112155; x=1769648155;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0GrzDHRy2MDbBefflxfEE/gbQG6YvvS+gBduLs2jZn8=;
 b=XhY22NaFQIBPK/18PsivgG7vdzzJ1Xc8ZY4en2RzEJ328EndLQ41cVsq
 /52TFdju3u9TzN9fJkQFo5HWWJvGwvpKCgiZnD78xb45pXzO1dx/2EuMa
 BLcKbpqWIW9P2fHmBxS6BB/cJKes2RIGkURMC8t/TQuAaJZREi7I2BUfo
 Bgi9yZPEmuEl68lYOoRx6v5GSgXHKhsPKtj7K4EBeZFaput0dm5oKJ4KY
 GZE+Xz3HIa8EHpHzQqMHPXEhI/LkZ4BIL1OZ40o9ik42l918WNYcHxifF
 fBGdl85EszYQd3D36vQ8U70OSItw5EN3SJWrwwV8fnUWGYrhVOwUyk0T0 w==;
X-CSE-ConnectionGUID: CZL58BdgQhqtR2AEKyUnRg==
X-CSE-MsgGUID: bjZm43srR4e+hhKljyi7CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38501079"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="38501079"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 16:55:54 -0800
X-CSE-ConnectionGUID: C2Ab6SYeR/ebkgKtQ+irpQ==
X-CSE-MsgGUID: lUfuOeB4Tt+0TDY02orKtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114018597"
Received: from msatwood-mobl.amr.corp.intel.com (HELO msatwood-mobl.intel.com)
 ([10.125.108.49])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 16:55:54 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH] drm/xe/xe3: Extend wa_15015404425 for xe3
Date: Tue, 28 Jan 2025 16:55:51 -0800
Message-ID: <20250129005551.106214-1-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.45.0
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

From: Tejas Upadhyay <tejas.upadhyay@intel.com>

wa_15015404425 applies to xe3 A0 step as well.

v2: query based off SOC stepping

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 13 +++++++------
 drivers/gpu/drm/xe/xe_step.h |  2 ++
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index d321a21aacf0..98d068ad33bb 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -150,14 +150,15 @@ int xe_mmio_init(struct xe_device *xe)
 static void mmio_flush_pending_writes(struct xe_mmio *mmio)
 {
 #define DUMMY_REG_OFFSET	0x130030
+	struct xe_device *xe = tile_to_xe(mmio->tile);
 	int i;
 
-	if (mmio->tile->xe->info.platform != XE_LUNARLAKE)
-		return;
-
-	/* 4 dummy writes */
-	for (i = 0; i < 4; i++)
-		writel(0, mmio->regs + DUMMY_REG_OFFSET);
+	if (xe->info.platform == XE_LUNARLAKE ||
+	    (xe->info.platform == XE_PANTHERLAKE &&
+	     xe->info.revid == PTL_SOC_STEP_A0))
+		/* 4 dummy writes */
+		for (i = 0; i < 4; i++)
+			writel(0, mmio->regs + DUMMY_REG_OFFSET);
 }
 
 u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
diff --git a/drivers/gpu/drm/xe/xe_step.h b/drivers/gpu/drm/xe/xe_step.h
index 686cb59200c2..879486a818e9 100644
--- a/drivers/gpu/drm/xe/xe_step.h
+++ b/drivers/gpu/drm/xe/xe_step.h
@@ -20,4 +20,6 @@ static inline u32 xe_step_to_gmdid(enum xe_step step) { return step - STEP_A0; }
 
 const char *xe_step_name(enum xe_step step);
 
+#define PTL_SOC_STEP_A0  0x0
+
 #endif
-- 
2.45.0

