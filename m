Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A184C5DF88
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 19:14:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F72010EEAE;
	Wed, 19 Aug 2026 19:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n+V0FSY/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23CB10EEAA
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 19:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787166892; x=1818702892;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=naAEqlAcKTnAFYTCfkhgJSBfz30dz2NDzvrnDTyDRcQ=;
 b=n+V0FSY/QHkn7X5PGJ9R7ZiCCODCqeZXKA/E7LIyenRSiM7NDzsTMh12
 cV8lI8nFwUxEOEEPdpjI1A2qcrITcPSTpcS1MjOJrxs3EXPYLrF1bvN79
 gRHpdRm4fMXHXUsCVQ8qrAEfBzJlKKWeW4dqNmHyirSubkOHI3WtSAU87
 ntKc8CBi3Vgl/DXeEa6pq+yqGOpeslS+Ew9EI73mMJs7IvuKQgqWoaCAp
 FBxxMdW9HCbWLqDAPb1WW9mfq02j461E4OaR9lCl++bNVOMeIxDbrzwNm
 DaoxOC/bJYSpPpckS5KhaRvX6jmWrhSLRtCmc2JrwpnglJW6yRTnX1z9v w==;
X-CSE-ConnectionGUID: XRdPrJuvQQG7z/T6doULtA==
X-CSE-MsgGUID: 0Ki7mtvGSfm4FfSpzVTHuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="86647290"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="86647290"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 12:14:52 -0700
X-CSE-ConnectionGUID: lFwXeCc0TCCeOgo5nJhlIA==
X-CSE-MsgGUID: /aQUJSELRXWlGyOe/f19+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="295556746"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa002.jf.intel.com with ESMTP; 19 Aug 2026 12:14:51 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com, michal.wajdeczko@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 04/12] drm/xe/mmio: Report BAR mapping errors using structured
 xe_log API
Date: Thu, 20 Aug 2026 00:44:33 +0530
Message-ID: <20260819191442.1957986-5-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
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

