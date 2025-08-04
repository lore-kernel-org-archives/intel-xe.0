Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEF2C87FDA
	for <intel-xe@archiver.kernel.org>; Mon,  4 Aug 2025 09:28:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442EE10E4F3;
	Mon,  4 Aug 2025 09:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GP40eg+X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F082010E428
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Aug 2025 09:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754299726; x=1785835726;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZUsoEyYF8gi8EK1AD1hgg0UjGMDJkvxX4T21fFGMEfE=;
 b=GP40eg+XDGSH1EpUvMGiIvgb6uKPxrwmNQ+VlHr6Ym7vjDcSk+p3YuEa
 AVe4WwB3HuZVlGlS/yfMFPoE9ajuDuHr7Ym21HC38UvZ4r4s8uL7xygI9
 wR9ffT64/qm5yVKYZU/BkQPjd8/VUpdJk1ZNOTXkt33WATOX0aJAQ+l4t
 VxrOJ3g/C0q66vaVjpAoGVpYL/82SmBfBx0sivZh9ustn8HTuaRpOXKO4
 tbpC+Pdfhg8sRtrofd6jbEm3pUTVEqAdM5/vXiWRGIAoiPvGUlZYHPoJx
 9Ta+2TV9uZsJLd/mdwuI0UAFumn+5a6cQ3NAD90/07b29xWimSc6E3YXX Q==;
X-CSE-ConnectionGUID: zf8BfzSfT8yIEV5GMpoVIg==
X-CSE-MsgGUID: ZOeal2xmRCSnTsXZO6uzMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="60193086"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="60193086"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 02:28:45 -0700
X-CSE-ConnectionGUID: TVFlOvcbTWKv/+4NKd2F8A==
X-CSE-MsgGUID: esqJ+9tsSWm3EVVSBuyWEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="163782197"
Received: from pgurram-desk.iind.intel.com ([10.190.238.70])
 by orviesa009.jf.intel.com with ESMTP; 04 Aug 2025 02:28:43 -0700
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH] drm/xe: Fix coverity issue, cast_overflow
Date: Mon,  4 Aug 2025 15:10:38 +0530
Message-Id: <20250804094038.3301004-1-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add bounds check for error code assignment.
Prevent integer truncation when assigning 64-bit return values
to 32-bit error codes by validating the range before casting.
Fall back to -ETIMEDOUT for out-of-range values.

Fixes: 16ba2b28df3a8 ("drm/xe/pf: Add function to sanitize VF resources")

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index f00cce81f1ff..2fa1a4fba1ca 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -2091,7 +2091,7 @@ static int pf_sanitize_lmem(struct xe_tile *tile, struct xe_bo *bo, long timeout
 	} else {
 		long ret = dma_fence_wait_timeout(fence, false, timeout);
 
-		err = ret > 0 ? 0 : ret < 0 ? ret : -ETIMEDOUT;
+		err = ret > 0 ? 0 : (ret < 0 && ret >= INT_MIN) ? (int)ret : -ETIMEDOUT;
 		dma_fence_put(fence);
 		if (!err)
 			xe_gt_sriov_dbg_verbose(tile->primary_gt, "LMEM cleared in %dms\n",
-- 
2.34.1

