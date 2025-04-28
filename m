Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D8BC369D8
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 02:46:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A1410E0F3;
	Mon, 28 Apr 2025 02:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HrVVleS3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA9E10E0F3
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 02:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745808396; x=1777344396;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0F+Xa2XM7zdmTtFSvNi5jNaJYVH7l3mVDdFf1miSYHg=;
 b=HrVVleS313MD+uHPJqvM5QmCCXclXqZEB1G/RkUMZ0gIaoKvyO5wxDGO
 dCs0tic5ZEu+WoGF22+2rwAf1TOHHYsWzP5mjvoVoHpHbWo6Si5EjQEll
 GTysf2jZM/14gDLHVU/q/YphfQZwJ9BoxAC5525alOeub7KcMBonMV3Ai
 Y1l9kqpAV4MwKHtfAlh0o3rJoWt0w5MuW+YInVvBgpIfMmNLMK/98rmjv
 OJdipd+J4zSPajIiFPBDgo+XhaRC5adGSHYwB9DhasqppR/s8ECl2RMAw
 N/2XdIzvaOEjHieFJJp1Px0x2dv4X/2st2F6nMLkt42m93lZ7wnuiY+ZC g==;
X-CSE-ConnectionGUID: d3Mmf0RtQvmXTJyn2G5zwQ==
X-CSE-MsgGUID: h3aClu6TTBGYC0SZP19Cgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="64801027"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="64801027"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 19:46:33 -0700
X-CSE-ConnectionGUID: 11HSQPS3RT2BLpW/LT+a9g==
X-CSE-MsgGUID: 09bYftMwRleV38/pvMXqsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="170609184"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 19:46:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/gpusvm: set has_dma_mapping inside mapping loop
Date: Sun, 27 Apr 2025 19:47:52 -0700
Message-Id: <20250428024752.881292-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Dafna Hirschfeld <dafna.hirschfeld@intel.com>

The 'has_dma_mapping' flag should be set once there is a
mapping so it could be unmapped in case of error.

v2:
- Resend for CI

Fixes: 99624bdff867 ("drm/gpusvm: Add support for GPU Shared Virtual Memory")
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 38431e8360e7..de424e670995 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1469,9 +1469,9 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 		}
 		i += 1 << order;
 		num_dma_mapped = i;
+		range->flags.has_dma_mapping = true;
 	}
 
-	range->flags.has_dma_mapping = true;
 	if (zdd) {
 		range->flags.has_devmem_pages = true;
 		range->dpagemap = dpagemap;
-- 
2.34.1

