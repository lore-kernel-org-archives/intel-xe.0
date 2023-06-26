Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06EAEB64DC
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 17:14:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F6B10E0CD;
	Mon, 26 Jun 2023 17:14:59 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0836D10E0CD
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 17:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687799698; x=1719335698;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6FSsc/6P6sXOptvyrwqr+jiKrtqIr31F80qYSeALlCg=;
 b=J/H6TpPEWfHFAtaHf1P2GYKRHCDzZkPcV6yMLEq51pUdsbzc3JXz6n9S
 MD8kc8TCRxm7OrrYMCMQ5oYI/FqIYGm2WPbNjrVAkWbkrKAFlduySMAiy
 VxJs8cnVqIAIdJ9pMq5/QXzYPTJh6tWxRv1s51UH0PMxWUtxc2aA/oZNj
 /8YAdUZME6y+u5U4RqJMQgf+R0qLuL3Rg3FAinsyNKbGUBi4GhJnNTKUv
 QXZNFlmqguyIRDWd/YxxFiHvkR7e3pehe0tDL8DpZizPxvx9TPwwkGRgn
 r4Am8QvsUrmLXYQpyG8fGaVq8CGFRzyMiL3DKsBNzbrF02qxH78BoT74B g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="364782229"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="364782229"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 10:10:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="666377783"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="666377783"
Received: from cbrady5x-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.8.226])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 10:10:55 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jun 2023 18:09:06 +0100
Message-ID: <20230626170905.87112-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/mmio: update gt_count when probing
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

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/383
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index f1336803b915..4f16c255281e 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -334,6 +334,12 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
 	adj_tile_count = xe->info.tile_count =
 		REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
 
+	/*
+	 * FIXME: Needs some work for standalone media, but should be impossible
+	 * with multi-tile for now.
+	 */
+	xe->info.gt_count = xe_info.tile_count;
+
 	drm_info(&xe->drm, "tile_count: %d, adj_tile_count %d\n",
 		 xe->info.tile_count, adj_tile_count);
 
-- 
2.41.0

