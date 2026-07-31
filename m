Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF99C55173
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 23:27:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C89B10F431;
	Fri, 31 Jul 2026 23:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E2LGfJej";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F3C10E26D
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jul 2026 23:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785540431; x=1817076431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qtyveW9Ah4UtYY61OqP8LeF2Bz9XnjX61uG0nro4rMA=;
 b=E2LGfJej6tYKtX1sBCFftkuSytNCd9zvEHR/GhpCmQxUa8H6xPHsztnR
 Qu59Cfic6YJe5RY2qAeNFyBFq2vnzuGlwsqynOWF0c3J2ddyfNbv4EtYR
 Uej3hDaXqGKO5tV9e9zkZFaeYK58mjYQ7PHg/+SZCzIeuOxz4NZiHoUXO
 D+ZeX1MH8qJw92TqhFX4ij6joQwX0v+8yN1reHHrTbUZGPaWBxWyLLoa4
 7xn5pzVQ9JUVGkx130uCZLJy6Bv5WVp175U0M20jB0pZNRbKTATZ1b5Ln
 jCDGLmw9s8LpImrSkcdP2iXjWDckDqWnMRyMLsFOPNZMp5RV5VDaVOevu A==;
X-CSE-ConnectionGUID: 8LBFMnXFSxiIfACh+Tt0IQ==
X-CSE-MsgGUID: s+0JkL3mQL+XfiPhn+DiPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="97326557"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; d="scan'208";a="97326557"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 16:22:53 -0700
X-CSE-ConnectionGUID: ux6G/TR+TTCY5zSPDW9R8g==
X-CSE-MsgGUID: JC7mzcOhQmiHcGSVOzzFDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; d="scan'208";a="261305776"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.54])
 by orviesa009.jf.intel.com with ESMTP; 31 Jul 2026 16:22:54 -0700
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, stable@vger.kernel.org
Subject: [PATCH v6 3/3] drm/xe/guc_ads: use uncached mapping for UM queue BO
Date: Fri, 31 Jul 2026 23:22:32 +0000
Message-ID: <20260731232232.548015-4-jia.yao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731232232.548015-1-jia.yao@intel.com>
References: <20260731232232.548015-1-jia.yao@intel.com>
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

