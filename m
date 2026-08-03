Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00B0C55843
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 20:08:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603B210E7B1;
	Mon,  3 Aug 2026 20:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bXsoT6AH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCC910E7AE
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 20:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785787730; x=1817323730;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/f5hrtoz/LJM9Jypmu/MosHfMJJwsjNtu6GLYz2mHhE=;
 b=bXsoT6AHn2QGt5eSkHS0vObcQ6WsDLFw1HOaV3yE5z2B+BfJOg1dKARP
 1dHuKOMk8EGGw33TyYeAnuuKrk6L6UW9FryEloZjrCL53ONKutSgChmvO
 j6nV99ujOUfs1msQAYKKnFZlIrQyUJbJcRYaYVM527aFMyMGUByIp3uuK
 p5PBW6CRp5BQ/324AgQRhvdYmD64Yg8SbJk4wxAb6c/vgzbVIWhtpmMlZ
 2yHlDgS2DwjbyQ0r7wnuC9NgsQkzyPckZNMz6lPX3U9JuaxCr8b29BvRp
 INMu/rW9D41+3Ja2QBBzQh8nHYJNoHsM3db3m3l+Rg1kTXRh3bTcdiM+d A==;
X-CSE-ConnectionGUID: SMQj6OOBROuXAiidlf06IQ==
X-CSE-MsgGUID: ncgVQEA0SQe8gVJSJLxmhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86188518"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="86188518"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 13:08:50 -0700
X-CSE-ConnectionGUID: OfYEwV1RRU2LJOXoBnF/Ow==
X-CSE-MsgGUID: 33pV5/XESumLielvLKDl/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="266433159"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.44])
 by fmviesa005.fm.intel.com with ESMTP; 03 Aug 2026 13:08:50 -0700
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, stable@vger.kernel.org
Subject: [PATCH v7 3/3] drm/xe/guc_ads: use uncached mapping for UM queue BO
Date: Mon,  3 Aug 2026 20:08:38 +0000
Message-ID: <20260803200838.98826-4-jia.yao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803200838.98826-1-jia.yao@intel.com>
References: <20260803200838.98826-1-jia.yao@intel.com>
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

On Pre-Xe3p platform, the GAM write the UM queue through DPA using UC.
if GuC GuC reads the queue via GGTT (WB), stale data may be observed
when the cacheline has been polluted by another agent.

To match the GAM's UC writes, configure the GuC mapping as UC as well.

Fixes: 9c57bc08652a ("drm/xe/lnl: Drop force_probe requirement")
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: <stable@vger.kernel.org> # v6.12+
Signed-off-by: Jia Yao <jia.yao@intel.com>
Reviewed by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index a69ec584cc0f..97a2dbb03558 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -459,7 +459,8 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 		u32 um_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 			       XE_BO_FLAG_GGTT |
 			       XE_BO_FLAG_GGTT_INVALIDATE |
-			       XE_BO_FLAG_PINNED_NORESTORE;
+			       XE_BO_FLAG_PINNED_NORESTORE |
+			       XE_BO_FLAG_NEEDS_UC;
 
 		bo = xe_managed_bo_create_pin_map(xe, tile, um_size, um_flags);
 		if (IS_ERR(bo))
-- 
2.43.0

