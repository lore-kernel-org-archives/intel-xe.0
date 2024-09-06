Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07946E6FE4B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 21:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC71510EB07;
	Fri,  6 Sep 2024 21:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SW2VwxZV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE27C10EB02
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 21:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725659525; x=1757195525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ld9pZrDTb3J3PXtWTlmK9/e7KDKMRyQDqdOz0utvqZw=;
 b=SW2VwxZV7vNERlR877KKTJKyGs+gsBKeaFq1VPZ9XF7rFMQkZ854movM
 IsgJ5IHOR3eWDpleROhDxU8TBepC44zuqtgqblIPm9/0aE9UukefK6Khk
 gqWx/BaqEYUG0QBxCN7L11dzYBYRntlBTU3nOSGhwLAg8bKnmsDLCtre2
 PujXaJZj+EiPL+AzGNJgrxwkmKNPyeTLA0oSaWHxww6iZ3VBok8ChJM/r
 6nxaFS61gQwY4gE/HWBQXmilfo+wZ7BXVfHvf5K6XtMlrqQozhQWH9qhZ
 HwELJ2TFwheSo3tiDu74kRP8lGLNx+04z2vihpvLjc80W82R88q4Qd3+o Q==;
X-CSE-ConnectionGUID: /dSmES+jQkidFW3nyAkw9Q==
X-CSE-MsgGUID: eVmdoGv3T6mDxel26G2ITw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24580585"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="24580585"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:52:05 -0700
X-CSE-ConnectionGUID: K8fkH83vQP+a38qXIULpRQ==
X-CSE-MsgGUID: QYJRURPQSOmmIyqm5gdeYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="70656334"
Received: from msatwood-mobl.amr.corp.intel.com (HELO
 msatwood-mobl.hsd1.or.comcast.net) ([10.125.110.176])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:52:04 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH 5/9] drm/xe/xe3: Extend wa_15015404425 for xe3
Date: Fri,  6 Sep 2024 14:51:49 -0700
Message-ID: <20240906215153.31210-6-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240906215153.31210-1-matthew.s.atwood@intel.com>
References: <20240906215153.31210-1-matthew.s.atwood@intel.com>
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

V2:
  - make condition check simple(guludo)

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 3fd462fda625..4c3f07d89622 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -184,12 +184,12 @@ static void mmio_flush_pending_writes(struct xe_gt *gt)
 	struct xe_tile *tile = gt_to_tile(gt);
 	int i;
 
-	if (tile->xe->info.platform != XE_LUNARLAKE)
-		return;
-
-	/* 4 dummy writes */
-	for (i = 0; i < 4; i++)
-		writel(0, tile->mmio.regs + DUMMY_REG_OFFSET);
+	if (tile->xe->info.platform == XE_LUNARLAKE ||
+	    (tile->xe->info.platform == XE_PANTHERLAKE &&
+	     tile->xe->info.step.graphics == STEP_A0))
+		/* 4 dummy writes */
+		for (i = 0; i < 4; i++)
+			writel(0, tile->mmio.regs + DUMMY_REG_OFFSET);
 }
 
 u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
-- 
2.44.0

