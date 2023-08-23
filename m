Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940AEEE49AF
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 00:33:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7065310E0C7;
	Wed, 23 Aug 2023 00:33:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0092010E0A6
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Aug 2023 00:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692750805; x=1724286805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dEd0Na6AaapGEPpFoyKCgHz/HrzPU+VWdm2uIG02WK0=;
 b=Jdn7ACkJDQ6Jjohjv4G/WdS9EdIvKgv+fEQEzxrMX4meiRk4eEkTEwP/
 LY9P2sLFoGOp5UrePMWWr80s1gVN9NvAMTtvnMBXc/Ni5XLL/CVchDL4k
 Myxoi2qYYdeKrDYn/XrjQHo+JjYj60R3hogcuNBdZ8qSyV4VPYI8j65M6
 1hO0NHs3nOAZr9Ekt+neO+ECJz30qcbKvZqTHi3xAWghC6KEPywDoJw6T
 bqV/7SB7QMBafnMA4nevuAQRT0qEnC3dzihwUr6oa+75LcspOF3RmvBfz
 /RnxDSmhOL6KAvPhWrOyY/i77Jx6huvxgkn8860Ib9S5tMF18rDrH3MJm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="372915063"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="372915063"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 17:33:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="880182492"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 17:33:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 22 Aug 2023 17:33:14 -0700
Message-ID: <20230823003312.1356779-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230823003312.1356779-3-matthew.d.roper@intel.com>
References: <20230823003312.1356779-3-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/2] drm/xe: Drop xe_mmio_write64()
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
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
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c |  3 ---
 drivers/gpu/drm/xe/xe_mmio.h | 11 -----------
 2 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index c2ec52eefb2e..3ccc0af4430b 100644
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
index f72c34c7d1d0..cd9fe08ccf4a 100644
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
 static inline int xe_mmio_write32_and_verify(struct xe_gt *gt,
 					     struct xe_reg reg, u32 val,
 					     u32 mask, u32 eval)
-- 
2.41.0

