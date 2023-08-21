Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497C3EE49AA
	for <intel-xe@archiver.kernel.org>; Mon, 21 Aug 2023 23:43:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4977D10E2BA;
	Mon, 21 Aug 2023 23:43:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C289910E122
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Aug 2023 23:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692661411; x=1724197411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yp6o2Bkae0cvXlHWvkjPdl1fAKeXviPmPsmIDd/flbI=;
 b=SGce4Ilco6LbaCepH/JTgm3TMiQyvnTOa4MyR/GToP66F5F2WVIPykWW
 OXd8Oh2UDX8qBlgamGR+0KtmCiznAB5tUpayqF3eIHHE8mzGXrxJkKhhI
 3JO9rcUq/7gpV//dH3rPLiGO9CwREnSc8mpPcxL0/0o1hJ01XsU4DmE+q
 QWg0cTJUnLuFyZYXiJ/1k/g8bT1t4DPZDG7QvlqiTM3FuWKRYGJ3zuIuy
 H6J30eHrJN2Y+UlwTmsZt6ssym9w+93eBhdn0ZLfk87SRZoheufLj9AV/
 8b/Fy5kQYGrZxRRrYyxQ+YK1KyUmxx64EUnDp4+MK2cDXBO6W9tvY/8yi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="376467011"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; d="scan'208";a="376467011"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 16:43:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="826118346"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; d="scan'208";a="826118346"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 16:43:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 21 Aug 2023 16:43:24 -0700
Message-ID: <20230821234322.758689-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821234322.758689-3-matthew.d.roper@intel.com>
References: <20230821234322.758689-3-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Drop xe_mmio_write64()
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The only possible 64-bit register writes in the driver come from the
highly questionable MMIO ioctl.  That ioctl's register write support
only operates for userspace running as root and cannot be used by any
real userspace; it exists solely to support the "xe_reg" debug tool in
IGT.  Since the spec indicates that hardware does not officially support
64-bit register accesses, there's no reason to allow such 64-bit writes,
even for debugging.

Bspec: 60027
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c |  3 ---
 drivers/gpu/drm/xe/xe_mmio.h | 11 -----------
 2 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 932aa4ca59c8..568cd106d0ec 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -490,9 +490,6 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 			}
 			xe_mmio_write32(gt, reg, args->value);
 			break;
-		case DRM_XE_MMIO_64BIT:
-			xe_mmio_write64(gt, reg, args->value);
-			break;
 		default:
 			drm_dbg(&xe->drm, "Invalid MMIO bit size");
 			fallthrough;
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 892e96e50463..7c525d27cafb 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -75,17 +75,6 @@ static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
 	return old;
 }
 
-static inline void xe_mmio_write64(struct xe_gt *gt,
-				   struct xe_reg reg, u64 val)
-{
-	struct xe_tile *tile = gt_to_tile(gt);
-
-	if (reg.addr < gt->mmio.adj_limit)
-		reg.addr += gt->mmio.adj_offset;
-
-	writeq(val, tile->mmio.regs + reg.addr);
-}
-
 /*
  * Intel hardware officially only supports GTTMMADR register reads of 32 bits
  * or smaller.  Although we often seem to get reasonable values back from a
-- 
2.41.0

