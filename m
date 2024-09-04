Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D70CD37B8
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774AD10E63E;
	Wed,  4 Sep 2024 00:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ndoeIORb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869C610E63B
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409275; x=1756945275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+/sUItA1H3sj6v5IkzzGd0Fg24OO0dBjAe58WJvJLJ8=;
 b=ndoeIORbpbOSGWUfeYMAzWMPk6PFLXJSQ0M+TH0F7hWKcLBx9CvSDCsS
 9s9qYTqobpngW7BrsL2tc57F0B+dIci9s6E+TGvFYrmF119pBIvqR7e8U
 9Is4FCxzGEyR9PjQBO/+6CbNBEouQMsmDd6aOFdQ3Pla6dslZ6bEMizmj
 UcjiDF8qctI+GyfflhAv0Qpo2ItsoyNehUwHGv2g9nlIvuNsoGNsOsjOj
 oxPLjQxnxaxnwjuFeQwz/lbPWDY8hMnFRoxqQ4RngxcMSb3Uw4IZeHt4z
 4B0yLrVF+Wn+rsFvBjLvaIfbco0BQ6FQfj4dxM7y5kPHVFIUFj0AwYjXb Q==;
X-CSE-ConnectionGUID: nf3rq1ulQ/GCBO4mEXFBwg==
X-CSE-MsgGUID: CAl/x+paRJas6YJHS5Wjsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904794"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904794"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:15 -0700
X-CSE-ConnectionGUID: XawJC6EXRqyppI8UFG6nrw==
X-CSE-MsgGUID: qzAs4dBiSXCjcuNK2LdpOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944212"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 07/43] drm/xe: Add xe_device backpointer to xe_mmio
Date: Tue,  3 Sep 2024 17:21:08 -0700
Message-ID: <20240904002100.2023834-52-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240904002100.2023834-45-matthew.d.roper@intel.com>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
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

Once MMIO operations stop being (incorrectly) tied to a GT, we'll still
need a device backpointer for feature checks, message logging, and
tracepoints.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 3 +++
 drivers/gpu/drm/xe/xe_mmio.c         | 3 +++
 drivers/gpu/drm/xe/xe_pci.c          | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 75490753feda..19c21e55e153 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -115,6 +115,9 @@ struct xe_mem_region {
  * subregions of the overall IO space).
  */
 struct xe_mmio {
+	/** @xe: Backpointer to Xe device, used for tracing */
+	struct xe_device *xe;
+
 	/** @regs: Map used to access registers. */
 	void __iomem *regs;
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 4c7215ed3954..dd2076b9003e 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -98,6 +98,7 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
 	for_each_tile(tile, xe, id) {
 		tile->mmio.regs_length = SZ_4M;
 		tile->mmio.regs = regs;
+		tile->mmio.xe = xe;
 		regs += tile_mmio_size;
 	}
 }
@@ -134,6 +135,7 @@ static void mmio_extension_setup(struct xe_device *xe, size_t tile_mmio_size,
 	for_each_tile(tile, xe, id) {
 		tile->mmio_ext.regs_length = tile_mmio_ext_size;
 		tile->mmio_ext.regs = regs;
+		tile->mmio_ext.xe = xe;
 		regs += tile_mmio_ext_size;
 	}
 }
@@ -180,6 +182,7 @@ int xe_mmio_init(struct xe_device *xe)
 	/* Setup first tile; other tiles (if present) will be setup later. */
 	root_tile->mmio.regs_length = SZ_4M;
 	root_tile->mmio.regs = xe->mmio.regs;
+	root_tile->mmio.xe = xe;
 
 	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 5b09a1cbd821..e222539022d5 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -714,6 +714,7 @@ static int xe_info_init(struct xe_device *xe,
 		gt->info.engine_mask = graphics_desc->hw_engine_mask;
 		gt->mmio.regs = tile->mmio.regs;
 		gt->mmio.regs_length = tile->mmio.regs_length;
+		gt->mmio.xe = xe;
 		if (MEDIA_VER(xe) < 13 && media_desc)
 			gt->info.engine_mask |= media_desc->hw_engine_mask;
 
@@ -736,6 +737,7 @@ static int xe_info_init(struct xe_device *xe,
 		gt->mmio.regs_length = tile->mmio.regs_length;
 		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
 		gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
+		gt->mmio.xe = xe;
 
 		/*
 		 * FIXME: At the moment multi-tile and standalone media are
-- 
2.45.2

