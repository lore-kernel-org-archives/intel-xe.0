Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0336DC001B0
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 19:32:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29ED10E6EB;
	Fri, 11 Aug 2023 19:32:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D5110E6EB
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 19:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691782378; x=1723318378;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fmpbxVhH295KrACk9qY35q+ukRobn24O2uTPD8OnIuk=;
 b=Z8ybZOHcnpRrzetv57ONiJfjotJYcid6KO6RijG4aDqK+QOJUTRbpYbJ
 z3p+CCMSAjdfYafkvsvpji1kjSRXaKrPH6oaa0Ow5oSR1P06t+XNrKzxu
 mlAKYJuAsUBVn2x7144OL08vZDkVlgtVJvs0qUNXg29XDuwab+u8X+Xd7
 uf/ynhOo7nlYw2NKQPasYWLAb6Ggz7gn3i1TZURt9vwIIpdF3Fju2sm0b
 445h3nPsIbd80Bz5eimA+lqexPgFPqeSZptm/ttM/9pO5AW1M9h6+cUqs
 6NirlRkqM17v6WWACV9auAUEhwXxQOoUTlbKeL9YqHq9kl7KnimDHCET5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="374515724"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="374515724"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 12:32:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="682641032"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="682641032"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 12:32:57 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 11 Aug 2023 15:39:23 -0400
Message-Id: <20230811193923.132091-2-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20230811193923.132091-1-oak.zeng@intel.com>
References: <20230811193923.132091-1-oak.zeng@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Print both device physical address range and CPU io range
of vram. Also print vram's actual size, usable size excluding
stolen memory, and CPU io accessible size.
V1:
  - Add back small BAR device info (Matt)

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 41ee89247ddb..bb6823db14d4 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -286,12 +286,13 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 		tile->mem.vram.usable_size = vram_size;
 		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
 
-		drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n", id, tile->id,
-			 &tile->mem.vram.io_start, &tile->mem.vram.usable_size);
-
 		if (tile->mem.vram.io_size < tile->mem.vram.usable_size)
-			drm_info(&xe->drm, "VRAM[%u, %u]: CPU access limited to %pa\n", id,
-				 tile->id, &tile->mem.vram.io_size);
+			drm_info(&xe->drm, "Small BAR device\n");
+		drm_info(&xe->drm, "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n", id,
+			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.usable_size, &tile->mem.vram.io_size);
+		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n", id, tile->id,
+			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + tile->mem.vram.actual_physical_size,
+			 &tile->mem.vram.io_start, tile->mem.vram.io_start + tile->mem.vram.io_size);
 
 		/* calculate total size using tile size to get the correct HW sizing */
 		total_size += tile_size;
-- 
2.26.3

