Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5273FFA3748
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 11:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B3F10ECF5;
	Fri, 13 Sep 2024 11:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FwbAvmZw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039E410ECF5
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 11:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726228276; x=1757764276;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rSWCJdBAc1nq/FNK0QvoGdZgx4JTA0BQvkuYlc62Sgo=;
 b=FwbAvmZwTjm8wxArvF5gm1ju9qkRYwzEMM5MpPa4OuGNXv/zZHmEub/I
 h0wZaDezG9dOcMr2OIJVUHR6980GanCt76/oVTo4uLN0sNF7rxRmF0aF+
 hoWNaklS0tK0WA4hsyZu1ylvbn+F4EZOrDUxVL7LWq6Sv/keIj5/x2Mkz
 MCA2yJcttKpCQXVSJKRjVdIdNsRlwPZGGepLDSABfWDoVpt0Uuor64MEn
 fwktxHxk8PReS+4e+6fBxTWTLy36HNa+/zxn1ctwSO3bSoO44Y0aTLdMg
 rkX//zvDFU5/Zgse9zTJYBruBX0U0D17d2DQdSrnpgYPlehRzA2WxFBWL A==;
X-CSE-ConnectionGUID: XcPYjz7MQAGDGboCz30pNA==
X-CSE-MsgGUID: mZc67c2zQYmEbebTmrrZYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="35791402"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="35791402"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 04:51:15 -0700
X-CSE-ConnectionGUID: eJc8mSBvSnuJ+M+oRBo0VA==
X-CSE-MsgGUID: RM4PaBucSwaCtAQeTHAFLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="72797126"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.158])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 04:51:14 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, stable@vger.kernel.org
Subject: [PATCH] drm/xe/vram: fix ccs offset calculation
Date: Fri, 13 Sep 2024 12:51:03 +0100
Message-ID: <20240913115102.309587-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.0
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

Spec says SW is expected to round up to the nearest 128K, if not already
aligned. We are seeing the assert sometimes pop on BMG to tell us that
there is a hole between GSM and CCS, as well as popping other asserts
with having a vram size with strange alignment, which is likely caused
by misaligned offset here.

BSpec: 68023
Fixes: b5c2ca0372dc ("drm/xe/xe2hpg: Determine flat ccs offset for vram")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: <stable@vger.kernel.org> # v6.10+
---
 drivers/gpu/drm/xe/xe_vram.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 7e765b1499b1..8e65cb4cc477 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -181,6 +181,7 @@ static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
 
 		offset = offset_hi << 32; /* HW view bits 39:32 */
 		offset |= offset_lo << 6; /* HW view bits 31:6 */
+		offset = round_up(offset, SZ_128K); /* SW must round up to nearest 128K */
 		offset *= num_enabled; /* convert to SW view */
 
 		/* We don't expect any holes */
-- 
2.46.0

