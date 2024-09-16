Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5D4C3ABA2
	for <intel-xe@archiver.kernel.org>; Mon, 16 Sep 2024 08:49:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A0F10E30E;
	Mon, 16 Sep 2024 08:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TuN68N4V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E4C10E30E
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Sep 2024 08:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726476566; x=1758012566;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uymRN6t4HF0pj4doTRtGJuVhiLXV7AyJRx07mGHr4p4=;
 b=TuN68N4VE2+AizQbgwCwnEqzETqYJ2CTusB7SJdQalLLxZBMZqPOjZmq
 ijhEgBViTptLxU8S2/gbqoZNpzzFOlQ1YfFn2oGMPJHdu4Sl0MhgVne8z
 kLX7BJaBWRAVelm05dU3rf108HhlU866K+z7eiQ0XsO6WiLCvLn5k0qzO
 cehFO5l6LT9g0eaoG3M4ZjGPkSw0O+KYrFb1VqeosAQkxpTzYT82vkM4F
 rwfFu6GWCJYGiM0w9IjYdwumvjn5Rjml9GWdgOVF/iMeChY/iPi6enMxT
 /15SRXqIItYlKd2QjzDjS12cOZXHM0lhMH6hxsvStYdG1njWjTCOKjsQm A==;
X-CSE-ConnectionGUID: uQLx6tWuSGaDT31EBAk7xA==
X-CSE-MsgGUID: Z9r0mPjgRNOu1dPx5Rg+IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="50710915"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; d="scan'208";a="50710915"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 01:49:26 -0700
X-CSE-ConnectionGUID: 57d0GLj2SUanMsARH+ANsQ==
X-CSE-MsgGUID: fEKIKArgQR69fGaFRXXFYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; d="scan'208";a="69052874"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.77])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 01:49:24 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, stable@vger.kernel.org
Subject: [PATCH v3] drm/xe/vram: fix ccs offset calculation
Date: Mon, 16 Sep 2024 09:49:12 +0100
Message-ID: <20240916084911.13119-2-matthew.auld@intel.com>
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

v2 (Shuicheng):
 - Do the round_up() on final SW address.

BSpec: 68023
Fixes: b5c2ca0372dc ("drm/xe/xe2hpg: Determine flat ccs offset for vram")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: <stable@vger.kernel.org> # v6.10+
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Tested-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 7e765b1499b1..2a623bfcda7e 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -182,6 +182,7 @@ static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
 		offset = offset_hi << 32; /* HW view bits 39:32 */
 		offset |= offset_lo << 6; /* HW view bits 31:6 */
 		offset *= num_enabled; /* convert to SW view */
+		offset = round_up(offset, SZ_128K); /* SW must round up to nearest 128K */
 
 		/* We don't expect any holes */
 		xe_assert_msg(xe, offset == (xe_mmio_read64_2x32(&gt_to_tile(gt)->mmio, GSMBASE) -
-- 
2.46.0

