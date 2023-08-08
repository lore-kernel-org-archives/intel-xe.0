Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C89EB64DD
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 02:37:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA5D10E1BE;
	Tue,  8 Aug 2023 02:37:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A5910E1BE
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 02:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691462235; x=1722998235;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a1CUaQgmhv77BHcn2ZqQlygRbforb5gTJ3qb1QXZ3MY=;
 b=jXSzAbhhyYLmjIGl+fV8cHskx0Q0sXCE1MF87zBOrWBpBkH/FSJsgnco
 uj4oQmUqvvnmK4xf0WKPxCRs5hD4kOBswBB++Jb6eB4fc9jnHiqkDG9Ux
 32e9TKJqiqUPU55RG8M/hjFKJKHA6prA5yQ7cy4ZC5NjHO2GTWZooxrnh
 v5Meo9CyNWv8+dvE0Xgw7ocQyvMNgJ6XNBA+hUIA+oVpcuKpO3Dn0lnep
 PRZ7ZbWOfFJv2+AFwW3n15AidHoCf7Eiec6okzkd2d2Ok9AbOYA3hj6sN
 y32KFoDEkotbYbrFkYBdClAiDzree7rj0enBaruYswkFnKmhzX94t1bdk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="369597001"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="369597001"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 19:37:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="845272138"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="845272138"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 19:37:14 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  7 Aug 2023 22:43:34 -0400
Message-Id: <20230808024334.11619-3-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20230808024334.11619-1-oak.zeng@intel.com>
References: <20230808024334.11619-1-oak.zeng@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Improve vram info debug printing
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
Cc: --cc=michael.j.ruhl@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Print both device physical address range and CPU io range
of vram. Also print vram's actual size, usable size excluding
stolen memory, and CPU io accessible size.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 0d0966691eaa..9f249c61ff8e 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -286,12 +286,12 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 		tile->mem.vram.usable_size = vram_size;
 		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
 
-		drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n", id, tile->id,
-			 &tile->mem.vram.io_start, &tile->mem.vram.usable_size);
+		drm_info(&xe->drm, "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n", id,
+			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.usable_size, &tile->mem.vram.io_size);
 
-		if (tile->mem.vram.io_size < tile->mem.vram.usable_size)
-			drm_info(&xe->drm, "VRAM[%u, %u]: CPU access limited to %pa\n", id,
-				 tile->id, &tile->mem.vram.io_size);
+		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n", id, tile->id,
+			 &tile->mem.vram.base, tile->mem.vram.base + tile->mem.vram.actual_physical_size,
+			 &tile->mem.vram.io_start, tile->mem.vram.io_start + tile->mem.vram.io_size);
 
 		/* calculate total size using tile size to get the correct HW sizing */
 		total_size += tile_size;
-- 
2.26.3

