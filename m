Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEBDC47DD7
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 00:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36C410E939;
	Fri, 19 Jan 2024 00:16:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8C010E93B
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 00:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705623368; x=1737159368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uQEYkTVc6CQxpjbHMt3JFdgM+yjdX+2h+do/S+p+Kuk=;
 b=jB3TTGm2G4qcSHDJYzJUZ/jjdnITYn5Y+EbxNhQhsYp80V8xiYjLhJem
 LXucRpBf78n8rABCA9IRc/bXt3gD9ybyULdhSsjzUZWat//PPzk+BVwZq
 p6nLrED+/Q5qihPyBB/o1ss7ycpGtgNS3et6LKTGlra54JBiXvY32tlYT
 B5Fm+YpJDVCzOtCb8cGO47EVkQC85gwTvD9o9A+nDdnKKY6YgX3pB3ty+
 t80EtF6Wb9Jb3rDEv46IjrBkb3y/zC+rkpT7z3u5fDRlUXazfoRGi94sW
 kREgnAc/fH8AcWpjNHLrzW7OJKQaKqGHJnp8mtBi+RTIcWiEuqAdzkxMs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="404373183"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="404373183"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 16:16:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="818923991"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="818923991"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 16:16:05 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 2/5] drm/xe/mmio: Cast to u64 when printing
Date: Thu, 18 Jan 2024 16:16:09 -0800
Message-Id: <20240119001612.2991381-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240119001612.2991381-1-lucas.demarchi@intel.com>
References: <20240119001612.2991381-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

resource_size_t uses %pa format in printk since the size varies
depending on build options. However to keep the io_size/physical_size
addition in the same call we can't pass the address without adding yet
another variable in these function. Simply cast it to u64 and keep using
%llx.

Fixes: 286089ce6929 ("drm/xe: Improve vram info debug printing")
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index c8c5d74b6e90..5f6b53ea5528 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -272,8 +272,8 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 		drm_info(&xe->drm, "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n", id,
 			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.usable_size, &tile->mem.vram.io_size);
 		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n", id, tile->id,
-			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + tile->mem.vram.actual_physical_size,
-			 &tile->mem.vram.io_start, tile->mem.vram.io_start + tile->mem.vram.io_size);
+			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + (u64)tile->mem.vram.actual_physical_size,
+			 &tile->mem.vram.io_start, tile->mem.vram.io_start + (u64)tile->mem.vram.io_size);
 
 		/* calculate total size using tile size to get the correct HW sizing */
 		total_size += tile_size;
-- 
2.40.1

