Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2277C04A6A
	for <intel-xe@archiver.kernel.org>; Thu, 10 Aug 2023 16:03:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A0F010E564;
	Thu, 10 Aug 2023 16:03:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B91F10E563
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Aug 2023 16:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691683393; x=1723219393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uA/RgIGCLiqBd1us+iZNsTGXDwxZcJOK79XnX1Eifsw=;
 b=kJLq5QR8lc+11B9v3AKws9Y5pYCETkehPuova0twz1IuFYTyiL2qCAPO
 U2lSj8Sqm+Q/ceS3yZclxKt/Id06eEFWhwVjYSoS5txzu6FQDJ2yuMb5j
 fm7S+luxRkkdh4LyF4zR7YhW8Mpmq2QD6jo89ELBGbgwBAZw4gr53FHZM
 NrR8oGWRKgJyBU3rugdvMpcyKimd7ulPPpbq9zJROMcppbB9EQUpqSPOm
 1IXCzyHfdFIN+SBxqw0OZh450pcbfciHmvlqahKNLV0pBNJbDwXEqVDRr
 BvPvOV5UNG4Kb1zj8uI1ulwxcSLl3U1E7tnduq3dth0g7Qgv0jQwcg0gp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="368920691"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="368920691"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 09:02:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="761836607"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="761836607"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 09:01:52 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 10 Aug 2023 12:08:15 -0400
Message-Id: <20230810160815.41423-2-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20230810160815.41423-1-oak.zeng@intel.com>
References: <20230810160815.41423-1-oak.zeng@intel.com>
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

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 41ee89247ddb..971978598668 100644
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
+			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + tile->mem.vram.actual_physical_size,
+			 &tile->mem.vram.io_start, tile->mem.vram.io_start + tile->mem.vram.io_size);
 
 		/* calculate total size using tile size to get the correct HW sizing */
 		total_size += tile_size;
-- 
2.26.3

