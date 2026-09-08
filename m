Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66B1C79FA1
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:46:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C2810EAF9;
	Tue,  8 Sep 2026 10:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NBENk99l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6AE10EAF9
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788864366; x=1820400366;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o40OoPsH0nzWQabSIfMYV1YoSpqVlP6coDQpF/rffac=;
 b=NBENk99l5+3Eagu+t/C+P8hw0sD1yyCOSH9DPCZcFMPyZsGrzhIki0ww
 cvwWYGlF1snJrAWoinAeMKdW8yiEolwIZohgrA0pZkzpIQESqLWkD/INY
 XWAAYSyzkQCbQdHOkz3vovm0ORIuZtWFg/TKQ7YvueGfZ1+G3EA7fDg5g
 qOhuIPSBVz6/Xiq5fZWYjBwEROtAp11c7u+oTWiijkoQEuGvB0+r//c4q
 XklDU6QLNmvLK8QCzPFr1qm0j9DxLLS1UctQtlJ7ffrtsVsJWe18q48Kw
 NVThg5PuGAVUmEPofvw3PsA7jy2dZrFLosGcH5dLI1/PuvnpzP1xIXfae A==;
X-CSE-ConnectionGUID: p5RZvANRQoiE3ZIBLgiBUg==
X-CSE-MsgGUID: BDYMNxMKRYi7dyUjdQDilw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="91773088"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="91773088"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:46:06 -0700
X-CSE-ConnectionGUID: 0rFHRapqQs65icJg/c+JEQ==
X-CSE-MsgGUID: vZRqENIbRJy0AZ5lDfmaZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="264759139"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2026 03:46:05 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v3 12/13] drm/xe/vram: Report tile vs device VRAM visibility
 errors
Date: Tue,  8 Sep 2026 16:15:49 +0530
Message-ID: <20260908104550.1283933-13-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908104550.1283933-1-dnyaneshwar.bhadane@intel.com>
References: <20260908104550.1283933-1-dnyaneshwar.bhadane@intel.com>
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
index dcedd8cfd731..fa06c7ae56b1 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -244,6 +244,7 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 			    struct xe_vram_region *lmem_bar, u64 offset, u64 usable_size,
 			    u64 region_size, resource_size_t remain_io_size)
 {
+	struct xe_tile *tile = vram == xe->mem.vram ? NULL : &xe->tiles[vram->id];
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

