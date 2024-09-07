Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E5AEB64C5
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:08:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6635310EB41;
	Sat,  7 Sep 2024 00:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jc60uUbX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CE710EB29
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667678; x=1757203678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UndEgX1v1uh8eurQUgubE+xJsJOqy5d/ypWn0pFlcqA=;
 b=Jc60uUbX/eYyn8aH0DMFDPOPA82cacG999EZofm7jhMZAFtMUhvw6dBJ
 WcPbyK8stAw/ntyqu4Upw4oZRGt8VJ4uzWrqxi+JRN+YY8Zcxjmod7pqy
 HrW7NHU1XfkbGe0OKD6PoKzach5TgCrDE++SWGnkD8bcCPEutY1xUoCGQ
 gnMYlWt3Swwd4Bn5D0aTQnwdzf9ziWhJwELAKB+oCTrf5R/xTazLqntFB
 jpjtjtQjn9NeeNdWraUkURXThN86t3rwjhoP0aQwdm5DpKL7smY+fCPzj
 86b8KB4SCC+V6ojaUq98J9tqSIjA+47IsRrRfPOznYQxdouS/lQURkmKc w==;
X-CSE-ConnectionGUID: uPyWvrTATyG8VreYUZ+Fdw==
X-CSE-MsgGUID: OVrSwrPAT7ikPU+bUwCw+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855303"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855303"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: vbs8NXjOTZWDBi0tbLU5Qg==
X-CSE-MsgGUID: YP+A73kNQmi5jP2nHat0Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792654"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 13/43] drm/xe/vram: Convert register access to use xe_mmio
Date: Fri,  6 Sep 2024 17:08:02 -0700
Message-ID: <20240907000748.2614020-58-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240907000748.2614020-45-matthew.d.roper@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.  Note that MIRROR_FUSE3 is a
GT register and is accessed via gt->mmio, whereas GSMBASE is an sgunit
register so it is accessed via tile->mmio.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 5bcd59190353..7e765b1499b1 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -169,7 +169,7 @@ static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
 		u64 offset_hi, offset_lo;
 		u32 nodes, num_enabled;
 
-		reg = xe_mmio_read32(gt, MIRROR_FUSE3);
+		reg = xe_mmio_read32(&gt->mmio, MIRROR_FUSE3);
 		nodes = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, reg);
 		num_enabled = hweight32(nodes); /* Number of enabled l3 nodes */
 
@@ -184,7 +184,8 @@ static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
 		offset *= num_enabled; /* convert to SW view */
 
 		/* We don't expect any holes */
-		xe_assert_msg(xe, offset == (xe_mmio_read64_2x32(gt, GSMBASE) - ccs_size),
+		xe_assert_msg(xe, offset == (xe_mmio_read64_2x32(&gt_to_tile(gt)->mmio, GSMBASE) -
+					     ccs_size),
 			      "Hole between CCS and GSM.\n");
 	} else {
 		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
@@ -256,7 +257,7 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 	if (xe->info.has_flat_ccs) {
 		offset = get_flat_ccs_offset(gt, *tile_size);
 	} else {
-		offset = xe_mmio_read64_2x32(gt, GSMBASE);
+		offset = xe_mmio_read64_2x32(&tile->mmio, GSMBASE);
 	}
 
 	/* remove the tile offset so we have just the available size */
-- 
2.45.2

