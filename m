Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71198FA3748
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 12:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3620B10ECFC;
	Fri, 13 Sep 2024 12:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kt5UHgOw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD24C10ECFC
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 12:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726228836; x=1757764836;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VSREkogkTS0YL1zLDNSmjcGWshYNnY6/tpxyX7kLXv8=;
 b=Kt5UHgOweOkYkDNR118Ws/oRfUM+BVXNlwpv1p+bj2b/taH6sc+2zfNT
 3pIBywRjLfDnKIV15eFZh4hYPwtBfLM42Wm29rIYMReKK6Yr/1B4aZQvf
 3l/SAnbxQxOzq7vV9raYNOBgBMRazeKkuOFGsEsQjNmp+lGHfjH7LbzRi
 A70P7wNTBK312shWHHaF8WqK6zIbJjmjYOyoY7mRL7Xo2+DFoV6TL2pO6
 GuBM7+JtvKSD2Aik5Kp8CdzTKPUm3p/Vj15zcmLAYp6cfiORy4q5Xzz26
 T/9P1pVafO1eqEj0tIXrqx6VjtStIxi8XclVdQ/1DYKSeIHJdHGT1KakG g==;
X-CSE-ConnectionGUID: RPmsYmQ8TeW4X0Zlk1PU/Q==
X-CSE-MsgGUID: nKg5rZrZR+KdZoZyOh2Xew==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="36473333"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="36473333"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 05:00:35 -0700
X-CSE-ConnectionGUID: x9ds3quBTzSYDOok44wDsQ==
X-CSE-MsgGUID: tcvZ4fsWRqyjTQqL3eUq+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="68532648"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.158])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 05:00:34 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, stable@vger.kernel.org
Subject: [PATCH v2] drm/xe/vram: fix ccs offset calculation
Date: Fri, 13 Sep 2024 13:00:24 +0100
Message-ID: <20240913120023.310565-2-matthew.auld@intel.com>
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
aligned for the CC unit view of CCS. We are seeing the assert sometimes
pop on BMG to tell us that there is a hole between GSM and CCS, as well
as popping other asserts with having a vram size with strange alignment,
which is likely caused by misaligned offset here.

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

