Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9493BC61DA3
	for <intel-xe@archiver.kernel.org>; Wed, 22 Feb 2023 00:27:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096CE10E1A4;
	Wed, 22 Feb 2023 00:27:20 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D21C10E1A4
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Feb 2023 00:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677025638; x=1708561638;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0+Z5oGdlr4pORqPFoujYKi1+wVkPfZIUSkKnnnywMT0=;
 b=E6fFlCwjfc3a6RAFrmhc+c80rPY9h64mf6OsAZXjFBAXae5CoMjNM/3d
 k2o5lEMyJ6k14OdHACW+2ajF9XglSsaOQbWYv7jOiAjDTVnEOWBrngevM
 YMhxsrO9gPP2IDornSUM5FRg5n/wDrd9NLwrVoI+07m+d06k2WIEilFZC
 pD+40yhZlrQeelqySHy04MQFUrWhCr/HW2ykE6xLPzzvCKMuGYt9dmL2i
 q1a518ShFLiebTuHPQbgUtXJqXg0UcuWD8bMmdW7byT0r+D8GeCz8W0gY
 NXn8mivggOjVHT91E0MHlQ5SVECw+JkDsjfnHdK6eWPftJ9B0b62gvuTy w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="395279730"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="395279730"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 16:27:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="1000800667"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="1000800667"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 16:27:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Feb 2023 16:27:05 -0800
Message-Id: <20230222002705.927386-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Remove duplicate media_ver
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

media_verx100 supersedes the info from media_ver. Leave media_ver in the
struct xe_device_desc, used in xe_pci.c since it's easier to define
common parts of the platforms like that. However all the rest of the
driver should be using media_verx100 that is more future proof.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/216
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 --
 drivers/gpu/drm/xe/xe_mmio.c         | 2 +-
 drivers/gpu/drm/xe/xe_pci.c          | 1 -
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6c71e1b2dbf4..d3bfe5ed4dd9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -82,8 +82,6 @@ struct xe_device {
 		u8 tile_count;
 		/** @vm_max_level: Max VM level */
 		u8 vm_max_level;
-		/** @media_ver: Media version */
-		u8 media_ver;
 		/** @supports_usm: Supports unified shared memory */
 		bool supports_usm;
 		/** @has_asid: Has address space ID */
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index ba327b1e8dea..c414ece6dfe3 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -287,7 +287,7 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
 	mtcfg = xe_mmio_read64(gt, XEHP_MTCFG_ADDR.reg);
 	adj_tile_count = xe->info.tile_count =
 		REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
-	if (xe->info.media_ver >= 13)
+	if (xe->info.media_verx100 >= 1300)
 		xe->info.tile_count *= 2;
 
 	drm_info(&xe->drm, "tile_count: %d, adj_tile_count %d\n",
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 25598de3a1fc..53fcfed5de5e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -485,7 +485,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	xe->info.vram_flags = desc->vram_flags;
 	xe->info.tile_count = desc->max_tiles;
 	xe->info.vm_max_level = desc->vm_max_level;
-	xe->info.media_ver = desc->media_ver;
 	xe->info.supports_usm = desc->supports_usm;
 	xe->info.has_asid = desc->has_asid;
 	xe->info.has_flat_ccs = desc->has_flat_ccs;
-- 
2.39.0

