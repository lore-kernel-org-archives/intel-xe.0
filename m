Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7242FE6FE4F
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:08:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6303210EB2D;
	Sat,  7 Sep 2024 00:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WDJ8+dIR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBD210EB25
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667676; x=1757203676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QCL0LdfZA+gPZ/8lDbHx3V9PGwI5IHFBZuC94IvdhE8=;
 b=WDJ8+dIR6TEwAQE/scCw2cXA1F5Rvp4S8Y/K73eElXhl4BjVwabzB54m
 lGe2TV7eRycqgbcFGu/Ef0LRe0l1/p0/jwkhZaxPLxxIx2cf1f6wxxDj3
 qe2U9fNDbH0BErQ0vGANvj0QGHzbIWN7GgScxBwpsVeXY26SXitTK2T7i
 oeHKlkPAjWopamsmDbyPwiI/MyhEnrlOcWF5rTaDZvr3ci8VeRG7IxrSz
 K02oplxQv2NM+pXJ8dgCSR/t+oZVDhV8JhGkfOAkNTw38fjZN0qYDs9qM
 lpFgb0hWOg/QRMqQUKkroQt+kYvMngc5xpU3/H35PyYHuuT26g6DvB8I+ A==;
X-CSE-ConnectionGUID: rycZN4hcT6iB7eJsANxbMg==
X-CSE-MsgGUID: JdZLscgiR9aw8ofc+ELiew==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855295"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855295"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: AL1mD/uvR/SRiHpTvLiZ/Q==
X-CSE-MsgGUID: n+OX+sESQeOSYqg1vHwqPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792630"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 05/43] drm/xe: Populate GT's mmio iomap from tile during
 init
Date: Fri,  6 Sep 2024 17:07:54 -0700
Message-ID: <20240907000748.2614020-50-matthew.d.roper@intel.com>
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

Each GT should share the same register iomap as its parent tile.  Future
patches will switch to access the iomap through the GT's mmio substruct
rather than through the tile.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

