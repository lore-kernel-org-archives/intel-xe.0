Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FEAC71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 22:15:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1729D10E1C2;
	Thu, 12 Jun 2025 22:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X+JuRe6O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E349D10E1C2
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 22:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749766503; x=1781302503;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kWoTnOx6wC+YUG6sd3T0BM74MyVEqOKLoBscpuPxDjA=;
 b=X+JuRe6OAe3TQELPbXETx5S1zwPCGsh5AsohX1+LdbC35pupe+LmU1sS
 bvYnTIxlkXfmMBq/g20+92Qgg+QK9J0Y+RsWx73/Ml12S/22zvnn4UIEt
 Wywr0GQicHYMGO0AVnnya39SuL0U5qZE6M5UoY1m+UQ61hr/OPvEBp0Or
 G4en5D+6x5eIxEGv9Ci6dvVksyZCDJqtZcJkMMDfekzgE1krkYsqERzDD
 tBw5hQHUApOWH4aKrkOM3jAL983Kzlovtpse+1K9N0uvSugDVDkoF6MOz
 6eX7TdHxa3H42LOy63pzlo3olJ0UIB1ETWC2s2SbUR/8z43uURcD3L5/B A==;
X-CSE-ConnectionGUID: MEgf9NKCRgi5oqEdsUWyqg==
X-CSE-MsgGUID: watXf5AJRGCbuJSDaym6oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="55641812"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="55641812"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 15:15:03 -0700
X-CSE-ConnectionGUID: 7/2zJnDXQsqROxBzwBWRyg==
X-CSE-MsgGUID: TlWunpA5R5KckmL4PDSryA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="152555144"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 15:15:02 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/xe: Fix memset on iomem
Date: Thu, 12 Jun 2025 15:14:12 -0700
Message-ID: <20250612-vmap-vaddr-v1-1-26238ed443eb@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250612-vmap-vaddr-cba93a33b947
X-Mailer: b4 0.15-dev-a7f9c
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

It should rather use xe_map_memset() as the BO is created with
XE_BO_FLAG_VRAM_IF_DGFX in xe_guc_pc_init().

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: stable@vger.kernel.org
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 18c6239920355..3beaaa7b25c1b 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -1068,7 +1068,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 		goto out;
 	}
 
-	memset(pc->bo->vmap.vaddr, 0, size);
+	xe_map_memset(xe, &pc->bo->vmap, 0, 0, size);
 	slpc_shared_data_write(pc, header.size, size);
 
 	earlier = ktime_get();



