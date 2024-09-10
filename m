Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247BBEE0209
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7125E10E95A;
	Tue, 10 Sep 2024 23:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PPDKDd5f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C7110E8F5
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 23:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726012046; x=1757548046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jk8h6tvFaBOdpWZlSpL0ojNREtZg1IKwhONQn0Jbee4=;
 b=PPDKDd5fLju0LKhNNvujb6lINeqMBjLGAGJWtxTWlb+6a/UvNIJL0mw9
 vV/mjYHMMbnlsTxFYpe7SiIMsU0UxMnl+u3H1mB6fgPzj6lTiV/+w9B+/
 iB7TZQcbwMOdUAjoY4AQkNPAdDI4cC5XaYxZMMV0WhOTIALn63AMa6tmx
 +h/VzuDZw/bEnxp2VDID/dawxhbqGi/2HXgVjrju5npqM0uIdbdPyCrHr
 VlIZl11JL6Ic+xeixpAD5Cg05XHKwUNAdBtiHshIgm5bAxmVHGADNiCGN
 yAMAXBxN9G4yyE5fESZ+I2ZMao+a+35qnKkkaScCfCG7mxiru4uv5N8P9 w==;
X-CSE-ConnectionGUID: chDUVNqFR12bmHo9y/nyzA==
X-CSE-MsgGUID: Zlqjv4UVRqeG61EMCm6MOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36144296"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36144296"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:26 -0700
X-CSE-ConnectionGUID: vYP1HGwRRq6NX+WafoehhA==
X-CSE-MsgGUID: 0+BJNppsTdeVAVscJdR+sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71989542"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:27 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 05/43] drm/xe: Populate GT's mmio iomap from tile during
 init
Date: Tue, 10 Sep 2024 16:47:25 -0700
Message-ID: <20240910234719.3335472-50-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910234719.3335472-45-matthew.d.roper@intel.com>
References: <20240910234719.3335472-45-matthew.d.roper@intel.com>
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

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 3bce0e550a63..5a6833bf9f56 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -716,6 +716,8 @@ static int xe_info_init(struct xe_device *xe,
 		gt->info.type = XE_GT_TYPE_MAIN;
 		gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
 		gt->info.engine_mask = graphics_desc->hw_engine_mask;
+		gt->mmio.regs = tile->mmio.regs;
+		gt->mmio.regs_size = tile->mmio.regs_size;
 		if (MEDIA_VER(xe) < 13 && media_desc)
 			gt->info.engine_mask |= media_desc->hw_engine_mask;
 
@@ -734,6 +736,8 @@ static int xe_info_init(struct xe_device *xe,
 		gt->info.type = XE_GT_TYPE_MEDIA;
 		gt->info.has_indirect_ring_state = media_desc->has_indirect_ring_state;
 		gt->info.engine_mask = media_desc->hw_engine_mask;
+		gt->mmio.regs = tile->mmio.regs;
+		gt->mmio.regs_size = tile->mmio.regs_size;
 		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
 		gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
 
-- 
2.45.2

