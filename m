Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33CDC5B552
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 23:46:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381F110E1A1;
	Mon,  2 Jun 2025 23:46:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SBpxHbCW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B217310E195
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 23:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748908011; x=1780444011;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=saCUOgnL8yTN6kQBSAwGb7xBks8G5lxlXx8/tiuc698=;
 b=SBpxHbCWMk8iFasMx/LzKtq+QjxXwht1rizQm/uXfqsNJCs9DPbZ0JEl
 50MLGkBEAHbBigXJZZipGp4//weV9zYj/0sXPy4crJlwJUB9+CiPM8nEU
 xhYX/rmIqLKrom7f6lKQxBTc7p95upx0RkcVQ6/JYiOHxKg7gXG6ZpZd6
 aKz3LCHvW14lKvaYeIi9VOYd9aQrXgiKJY+sXqUaBSqOlY5ALlADgYI4w
 3C/CZI8fA0ezOQqFCHCjQ3v37M5qMCihGG+LzLLGe06WRLeCQGwYRwAN0
 83V//L92wSwW6oOkRazZdlmRTZQW9jQq7dCy2MV9on7ZPreXqZ/1enlgw Q==;
X-CSE-ConnectionGUID: PHgYBYubSxWqHbzgShOhaQ==
X-CSE-MsgGUID: d+GkJOhCSa2kpZMrmbA9qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="68361184"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="68361184"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 16:46:50 -0700
X-CSE-ConnectionGUID: ZwRZ/2TbQz2ygDpilkG2dg==
X-CSE-MsgGUID: uuNz+NU+R2SLfk+xNRDB+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="167846169"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa002.fm.intel.com with ESMTP; 02 Jun 2025 16:46:22 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v3 4/4] drm/xe/bmg: Update Wa_16023588340
Date: Mon,  2 Jun 2025 16:44:15 -0700
Message-Id: <20250602234415.2015921-5-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250602234415.2015921-1-vinay.belgaumkar@intel.com>
References: <20250602234415.2015921-1-vinay.belgaumkar@intel.com>
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

This allows for additional L2 caching modes.

Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 858b5398c01b..9752a38c0162 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -118,7 +118,7 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
 		xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
 	}
 
-	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0x3);
+	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0xF);
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
-- 
2.38.1

