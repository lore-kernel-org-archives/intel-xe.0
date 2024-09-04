Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9F9CD37BC
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E07A710E638;
	Wed,  4 Sep 2024 00:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mwqo+7GQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7830210E63C
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409275; x=1756945275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3aLR6dGHI7oe0xytilLyHRE59QYfAZ1IGoVcxxZhpKM=;
 b=mwqo+7GQlrW7RwaFpSs+jlYuj4ii8CQNj7Zb9EoqrXYe7mErsHbPgxEP
 N0grh4GtfeY7yz1VGOsB3LtM86pNcQd1CH+chOv9R+qtOZryv1KJqP+Aw
 MOPUgYj1HsJWImfLlVHvCGBsp9IUkxiSQdLbWLwGMDuazMfU/GVj9Oy81
 uvtx4KHN1kqGwr7ImBwAKe66l2NxnnaniDal9N9otXH/gdxQXGyNHkATC
 Td5JM8kxEGxcpxxY41NX07Ioo3vFnPKDTruSuMu8yDcr0fyirxU/yU6yN
 9duDDKJBvj1Z4CjsqJQg9uo0BVXQCyPkfxOs/1XQn/uuzsGl/35Mi61jS g==;
X-CSE-ConnectionGUID: VhfBK2BKSoqeQVi8oifbzQ==
X-CSE-MsgGUID: Rt+xLfrpQNaFuEjChTR00w==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904792"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904792"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:14 -0700
X-CSE-ConnectionGUID: 1D9TX73DQrWVCinGFEGQ7g==
X-CSE-MsgGUID: 6dKL6e8CSSOIWLl6IPRJHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944205"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 05/43] drm/xe: Populate GT's mmio iomap from tile during init
Date: Tue,  3 Sep 2024 17:21:06 -0700
Message-ID: <20240904002100.2023834-50-matthew.d.roper@intel.com>
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

Each GT should share the same register iomap as its parent tile.  Future
patches will switch to access the iomap through the GT's mmio substruct
rather than through the tile.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index c05ca61787be..5b09a1cbd821 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -712,6 +712,8 @@ static int xe_info_init(struct xe_device *xe,
 		gt->info.type = XE_GT_TYPE_MAIN;
 		gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
 		gt->info.engine_mask = graphics_desc->hw_engine_mask;
+		gt->mmio.regs = tile->mmio.regs;
+		gt->mmio.regs_length = tile->mmio.regs_length;
 		if (MEDIA_VER(xe) < 13 && media_desc)
 			gt->info.engine_mask |= media_desc->hw_engine_mask;
 
@@ -730,6 +732,8 @@ static int xe_info_init(struct xe_device *xe,
 		gt->info.type = XE_GT_TYPE_MEDIA;
 		gt->info.has_indirect_ring_state = media_desc->has_indirect_ring_state;
 		gt->info.engine_mask = media_desc->hw_engine_mask;
+		gt->mmio.regs = tile->mmio.regs;
+		gt->mmio.regs_length = tile->mmio.regs_length;
 		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
 		gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
 
-- 
2.45.2

