Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE835C7EE33
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 15:25:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DE610E377;
	Tue,  6 Jun 2023 15:25:09 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46B310E376
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 15:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686065107; x=1717601107;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lq72t/R8aeR8hc/eKOb9xjIz6EaxJa0sNWJPhHZ9Sfs=;
 b=aV/JELHtl8W/OGsO4cYu2M1wkgTOmX/JKg0dQ8dS8T0G8zM4Qj6O1vGe
 s0PwHdR06ahq0PdwMEwQwxmtYfD/RiCD5SvVOjRS5n3rt65+D6OF+VNO4
 UIo7TUMnlfDxs9gWxbO+Jt6DrygKWM0JSvnNshWfwYMU3v2HRS0xUglsH
 vo0UnpCDtjUZtHhqEXPAQQK9Y6vlUPiBwBEW0TBkixh0COnKSp5IX9Kr9
 xdwRODTJytZELfYHN2Vjai96YD7KGtu9uikBK/AGG302A2pwNwDcHxTLJ
 RBepF24az1njnW/nPZ+4QZc05lRg0c0R4fhEOmR4oSasPv+ObHwQAVVtT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="354205350"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="354205350"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 08:25:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="686582184"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="686582184"
Received: from akurkina-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.4.184])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 08:25:05 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  6 Jun 2023 16:24:20 +0100
Message-Id: <20230606152420.172591-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606152420.172591-1-matthew.auld@intel.com>
References: <20230606152420.172591-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 5/5] drm/xe: fully turn on small-bar support
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
index 475b14fe4356..c60f77533150 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -267,11 +267,6 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 	if (err)
 		return err;
 
-	/* small bar issues will only cover root tile sizes */
-	if (xe->mem.vram.io_size < vram_size)
-		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (0x%llx->0x%llx)\n",
-			 vram_size, (u64)xe->mem.vram.io_size);
-
 	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
 		 &xe->mem.vram.io_size);
 
@@ -292,9 +287,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 		}
 
 		tile->mem.vram.base = tile_offset;
-
-		/* small bar can limit the visible size.  size accordingly */
-		tile->mem.vram.size = min_t(u64, vram_size, io_size);
+		tile->mem.vram.size = vram_size;
 		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
 
 		drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n", id, tile->id,
@@ -309,7 +302,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 		available_size += vram_size;
 
 		if (total_size > xe->mem.vram.io_size) {
-			drm_warn(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
+			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
 				 &total_size, &xe->mem.vram.io_size);
 		}
 
-- 
2.40.1

