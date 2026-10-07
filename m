Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDFCCA600A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 21:14:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C495010F7D0;
	Wed,  7 Oct 2026 21:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NzdubTvJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AA510F7DC
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Oct 2026 21:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791407677; x=1822943677;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8go/DppMJgtQ7sDR0KtLLcvll9qkY4AatM+rXFOqXuw=;
 b=NzdubTvJ+Rmi5VHBLNntPFB/VrKQgNHW0++s42IQcIvaDWWLD90eAvyr
 62bM2btnGfsPVXcVJOocopKZvPEUbnTfO7CG5t7EibkJbd8hb/dgc5+97
 n1jlbCeyFH8RPMvnm2KndncqwVwfSuSDbWog1FDX6XeGN7fyuYkc3JFVe
 4EtfGtpcw8tyc3lrWWQwuJM9p/gEB7LE42yWCIEMEqFo2CFQEaKjIer7P
 cC/bd5E3F/2iFZvT8Vhp6CgCnIhx5/71fl3f5jZ2XTDzcxytdvmj/l/FD
 nQ/7WQ/RcaFP8DjSDDN+nvPczP36ssYT5x/UTKQNWYyHFjLr7DFdCOLyu g==;
X-CSE-ConnectionGUID: c/mALshhRQ6r6zDyqiljFw==
X-CSE-MsgGUID: CZ03azsxS3qGNojKDuH3gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="77187"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="77187"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 14:14:36 -0700
X-CSE-ConnectionGUID: vnG/lqXSRwK+WdzPW0ALFg==
X-CSE-MsgGUID: QFCyj1a5Sg2pNacOPrTlpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; d="scan'208";a="305526918"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa001.fm.intel.com with ESMTP; 07 Oct 2026 14:14:34 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v5 11/12] drm/xe/vram: Report tile vs device VRAM visibility
 errors
Date: Thu,  8 Oct 2026 02:44:16 +0530
Message-ID: <20261007211417.2093611-12-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261007211417.2093611-1-dnyaneshwar.bhadane@intel.com>
References: <20261007211417.2093611-1-dnyaneshwar.bhadane@intel.com>
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

Derive the owning tile of a struct xe_vram_region inside
vram_region_init() from vram->id, so the "no CPU visible VRAM"
error can distinguish a per-tile region from the device-wide
region without changing the function's signature.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index dcedd8cfd731..2441ffe77edb 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -244,6 +244,7 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 			    struct xe_vram_region *lmem_bar, u64 offset, u64 usable_size,
 			    u64 region_size, resource_size_t remain_io_size)
 {
+	struct xe_tile *tile = vram != xe->mem.vram ? &xe->tiles[vram->id] : NULL;
 	/* Check if VRAM region is already initialized */
 	if (vram->mapping)
 		return 0;
@@ -253,7 +254,8 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 	vram->io_size = min_t(u64, usable_size, remain_io_size);
 
 	if (!vram->io_size) {
-		drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
+		drm_err(&xe->drm, "%s without any CPU visible VRAM. Aborting.\n",
+			tile ? "Tile" : "Device");
 		return -ENODEV;
 	}
 
-- 
2.54.0

