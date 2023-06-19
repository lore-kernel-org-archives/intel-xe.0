Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8391EB64D9
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jun 2023 11:01:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B187F10E1E9;
	Mon, 19 Jun 2023 11:01:06 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8CF10E1EB
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jun 2023 11:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687172459; x=1718708459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4wzer1juZ7k0yEs/LqGENQ9wGA05+6cWGiwupDTJL0A=;
 b=b+fFKkVGpbJN8yWLUUTG8c/3l/eVqjwlhU4dp9FaVGN0WqzKsKWr1FB+
 JSCLQlvsrP2FGCZNk6Ih1QxudDRW344x56w1q3P/N+ERE32mDpJljwh5H
 Tz1eVXEZ8o8uN1ke3hIoBZdoWSlYtLtVCieARD+Dor/O7dExVXzEbVUr1
 +0brP0kivN/xdTzdg7D2hyGXM4Ki3Em5aF5tAseIds0UwNmN4cDxHO6JT
 /TnNhpZYmA5k2vuX+zflIedhnKXlqlEFxn9ofiuPnaAKVOEL9nnpKRoJb
 Y+qwaIZ4l3nRf2PJOw1eMsi6nbijp/bLoJNwaK3SpmxHtIB3uqAD46+Sy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="339941741"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="339941741"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 04:00:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="803579335"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="803579335"
Received: from lsuareza-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.23.111])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 04:00:49 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 19 Jun 2023 12:00:25 +0100
Message-ID: <20230619110018.53538-14-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230619110018.53538-8-matthew.auld@intel.com>
References: <20230619110018.53538-8-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 6/6] drm/xe: fully turn on small-bar support
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

This allows vram_size > io_size, instead of just clamping the vram size
to the BAR size, now that the driver supports it.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index f1336803b915..54a2296abfe4 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -261,11 +261,6 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 	if (err)
 		return err;
 
-	/* small bar issues will only cover root tile sizes */
-	if (xe->mem.vram.io_size < vram_size)
-		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (0x%llx->0x%llx)\n",
-			 vram_size, (u64)xe->mem.vram.io_size);
-
 	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
 		 &xe->mem.vram.io_size);
 
@@ -286,9 +281,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 		}
 
 		tile->mem.vram.base = tile_offset;
-
-		/* small bar can limit the visible size.  size accordingly */
-		tile->mem.vram.size = min_t(u64, vram_size, io_size);
+		tile->mem.vram.size = vram_size;
 		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
 
 		drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n", id, tile->id,
@@ -303,7 +296,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 		available_size += vram_size;
 
 		if (total_size > xe->mem.vram.io_size) {
-			drm_warn(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
+			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
 				 &total_size, &xe->mem.vram.io_size);
 		}
 
-- 
2.41.0

