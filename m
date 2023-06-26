Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFB8EB64D7
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 17:22:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F91E10E0FD;
	Mon, 26 Jun 2023 17:22:03 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF4410E0FD
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 17:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687800121; x=1719336121;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XepUNcRxA4aE+P3ozpCj29Iq1UuZSX4MyYzaRCf6Erc=;
 b=gwnEInybGlqcbaWqzKRBDHhDojSg5O9+XKUfhI3ipUVs6qVFdfNzPKar
 mWXG4SY+MKCs0GeOsJB4z6E++BbGgXUEm4aPYadpPQ09sEMeVhoN4i/pV
 bLWo0tXOitCykPKjl/1k22ynj+mfSdjr1RE0InyOS9kyk8MoCVXyHvxr0
 EIJjLWHpAwX5u1tNziABjsx6UZsbK4t3MD70opFqn0+LWWbLM+ABtn6tS
 z98Or6qBfyJiNsLjUqLPGz92jQuZmzf8bigf8eO7YeUfUCOgqXjeLZ61N
 Q1cQ5xFk5FekYqbqYTrxBpNrMX8KR2le36JcIDoXrIe00Kt2xapnmusQh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="351113333"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="351113333"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 10:21:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="781525202"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="781525202"
Received: from cbrady5x-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.8.226])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 10:20:58 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jun 2023 18:20:40 +0100
Message-ID: <20230626172039.88635-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe/mmio: update gt_count when probing
 multi-tile
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

It looks like the single-tile PVC in CI dies during module load when doing
the pcode init. From the logs we try to access the address
0000000000138124 which doesn't map to anything, however 0x138124 also
looks to be the PCODE_MAILBOX register. So looks like the per-tile
mmio register mapping is NULL.

During probe the tile count is potentially trimmed, since we don't know
the real count until we actually probe the device. This seems to be
the case for single-tile PVC or similar devices.  However it looks like
the gt_count is never adjusted to respect this updated tile count. As a
result when later doing some for_each_gt() loop, like we do for the
pcode, we can get back some GT that maps to some non-existent tile
which hasn't been properly set up, leading to crashes.

Try to fix this by adjusting the gt_count after probing the tiles for
real.

v2: Fix typo so it actually builds

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/383
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index f1336803b915..8150bf6f3578 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -334,6 +334,12 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
 	adj_tile_count = xe->info.tile_count =
 		REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
 
+	/*
+	 * FIXME: Needs some work for standalone media, but should be impossible
+	 * with multi-tile for now.
+	 */
+	xe->info.gt_count = xe->info.tile_count;
+
 	drm_info(&xe->drm, "tile_count: %d, adj_tile_count %d\n",
 		 xe->info.tile_count, adj_tile_count);
 
-- 
2.41.0

