Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABA6EB64D0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 18:04:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F47910E3CA;
	Tue, 13 Jun 2023 18:04:16 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F67C10E3CA
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 18:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686679454; x=1718215454;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nJUfsDp9aumTcrqL0s7IZRFrcdVlvzHtE2JnYA5ZtoQ=;
 b=CslNvi+LqBDQJxPMMy5S1P7uL0jWcLv5B9rcR/QQQvCWp6OO/9kAZCmr
 JSntr7LcjnKlUv9KM5U9zrMNFfEZZZcieCUnp43JAeMKaDEW8HFdH8btY
 WWa8tgxhQ96umDfg4hen/np7SAufp0wu/2G4GulNNmJN8Q5ebZv92Ln6T
 1acVRhaXZkE8trfua6NSNTVdwQuI8qW5kmdtYzAItt2nfwGwd3SY9vSfV
 Yw9HCrosH0doeordLyeyItLCPonizE8zNXEBVu/CqepBKJ2OnR90dUy9j
 LR23G8+JVnVgxvwp86Zb2sWdve98oWm7J6o9QiNRw/bA5xfoSUS04pgiB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="422009679"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="422009679"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 11:04:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="744775624"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="744775624"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 11:04:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 13 Jun 2023 11:03:55 -0700
Message-Id: <20230613180356.2906441-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/2] drm/xe: Skip applying copy engine fuses
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Like commit 69a3738ba57f ("drm/i915: Skip applying copy engine fuses"),
do not apply copy engine fuses for platforms where MEML3_EN is not
relevant for determining the presence of the copy engines.

Acked-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 68cd793cdfb5..b7b02c96e998 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -492,6 +492,9 @@ static void read_copy_fuses(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 bcs_mask;
 
+	if (GRAPHICS_VERx100(xe) < 1260 || GRAPHICS_VERx100(xe) >= 1270)
+		return;
+
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
 
 	bcs_mask = xe_mmio_read32(gt, MIRROR_FUSE3);
-- 
2.40.1

