Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85222CA5FA1
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 09:24:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FE310E840;
	Mon, 28 Sep 2026 09:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T+WvXCD5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1341C10E840
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 09:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790587447; x=1822123447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=naAEqlAcKTnAFYTCfkhgJSBfz30dz2NDzvrnDTyDRcQ=;
 b=T+WvXCD5oXPiKhi4CId6LxV/45UVi6hTdEHiVLt4pLmcoCwcDMjI3ysF
 soZYZUC0Q7tyIgZd4ZLW5dilBvRfjTthaLur7GbFJbV4bnAn0jRNizUQp
 klS8QoFapRPgONNm0mYRKGu0Jowt0lvY2hb1LWyH9qmhGa3u0S8q7fqDM
 jHaKXyyRwIym4HI93mmv8GDFBI6HB58MtpKTLUAJDLMJYo0FkEdHHvmI9
 2OXpejq5qAPIj+Z9VdA1+f37xiMEYhWNfl9lhrj2dUJx75ynmgnCAU5zF
 8HnZtEhx8o+29QL7ZmPEy6nDip7sdYZ2RpGV471QJUnLEgfBTlGXX+/ol Q==;
X-CSE-ConnectionGUID: rkifK8W4QwCERLUHdvC65g==
X-CSE-MsgGUID: PBVRLlYbQI2HXKL9LRC5hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="78845464"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="78845464"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 02:22:19 -0700
X-CSE-ConnectionGUID: fndRXd5SSGS2a2B701Bymw==
X-CSE-MsgGUID: nea1QLzEQ766aS7mDwijAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="283078018"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa005.fm.intel.com with ESMTP; 28 Sep 2026 02:21:22 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v4 04/12] drm/xe/mmio: Report BAR mapping errors using
 structured xe_log API
Date: Mon, 28 Sep 2026 14:51:06 +0530
Message-ID: <20260928092114.1610203-5-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
References: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
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

Replace xe_err() calls with xe_log_err() and xe_log_err_fatal() using
the REGS component tag for MMIO BAR probe failures

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 7fa18dfcb5a2..890146b8836b 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -15,6 +15,7 @@
 #include "regs/xe_bars.h"
 #include "xe_device.h"
 #include "xe_gt_sriov_vf.h"
+#include "xe_log.h"
 #include "xe_printk.h"
 #include "xe_sriov.h"
 #include "xe_tile_printk.h"
@@ -71,8 +72,8 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
 		return 0;
 
 	if (xe->mmio.size < xe->info.tile_count * tile_mmio_size) {
-		xe_err(xe, "GTTMMADR_BAR is too small for %d tiles: %zu\n",
-		       xe->info.tile_count, xe->mmio.size);
+		xe_log_err_fatal(xe, REGS, -EIO, "GTTMMADR_BAR is too small for %d tiles: %zu\n",
+				 xe->info.tile_count, xe->mmio.size);
 		return -EIO;
 	}
 
@@ -105,13 +106,16 @@ int xe_mmio_probe_early(struct xe_device *xe)
 
 	xe->mmio.regs = pcim_iomap(pdev, GTTMMADR_BAR, 0);
 	if (!xe->mmio.regs) {
-		xe_err(xe, "Failed to map GTTMMADR_BAR\n");
+		xe_log_err_fatal(xe, REGS, -EIO,
+				 "Failed to map GTTMMADR_BAR\n");
 		return -EIO;
 	}
 
 	xe->mmio.size = pci_resource_len(pdev, GTTMMADR_BAR);
 	if (xe->mmio.size < SZ_16M) {
-		xe_err(xe, "GTTMMADR_BAR is too small: %zu\n", xe->mmio.size);
+		xe_log_err_fatal(xe, REGS, -EIO,
+				 "GTTMMADR_BAR is too small: %zu\n",
+				 xe->mmio.size);
 		return -EIO;
 	}
 
-- 
2.54.0

