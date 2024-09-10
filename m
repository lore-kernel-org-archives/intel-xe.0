Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E28AEE01F2
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:47:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B4110E93A;
	Tue, 10 Sep 2024 23:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WIUM2EV0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C3D10E8F5
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 23:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726012046; x=1757548046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YCj8fcXYm5jZz8WAfa6VFIGIPqHgFuW9b0gyYkPKJ4I=;
 b=WIUM2EV0ZF3U+DgZIvyzkFDY5hIbLUIychFzhiMpaOrfMZqtNXmha+wO
 CWASW/P2B143vSHxdz58lygkb/d53N/0LKOE6+HZb2owbwD5+ffDkx2+v
 BIE2qxHyOJqjytmM92wT4eTHJJ5UcJ+8AJJbBTTRqTF97LWuJqImbQ55Y
 rhXKbdYHix08xzdNEvCvlDGBFZdz8mWt8UhjiOdFn+7Jycqc2PKsE43cg
 xeyRkGWXA1P29N6kfuAnpVc+MKwwMe9ohGgHS50tgYORBuQwOr7nlJlCK
 acKrfPOSwbkPRMhorgAJEn6o32e0O1KPFLtSxhdtxKyhY1EENJlEQmKyT Q==;
X-CSE-ConnectionGUID: VVwWFLUTTomei5vUmIDk3A==
X-CSE-MsgGUID: lgvxifr0RQeDmnL9pYYWcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36144293"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36144293"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:26 -0700
X-CSE-ConnectionGUID: fdg7PSgUStqY3qWJgvuJpQ==
X-CSE-MsgGUID: 91IVcmr8Twmg9Js5PikGbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71989528"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 02/43] drm/xe: Create dedicated xe_mmio structure
Date: Tue, 10 Sep 2024 16:47:22 -0700
Message-ID: <20240910234719.3335472-47-matthew.d.roper@intel.com>
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

Pull the 'mmio' substructure from xe_tile out into a dedicated type.
Future patches will expand this structure and then eventually move MMIO
read/write operations over to using this type.

v2:
 - Fix kerneldoc of 'size' field.  The rename/refocusing of this field
   got moved to the next patch of the series.  (Lucas)
 - Correct commit message; it's the tile, not the device, mmio that's
   been pulled out to a separate type.  (Michal)

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index ec7eb7811126..5d5b7a9199d8 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -107,6 +107,22 @@ struct xe_mem_region {
 	void __iomem *mapping;
 };
 
+/**
+ * struct xe_mmio - register mmio structure
+ *
+ * Represents an MMIO region that the CPU may use to access registers.  A
+ * region may share its IO map with other regions (e.g., all GTs within a
+ * tile share the same map with their parent tile, but represent different
+ * subregions of the overall IO space).
+ */
+struct xe_mmio {
+	/** @regs: Map used to access registers. */
+	void __iomem *regs;
+
+	/** @size: Size of the map. */
+	size_t size;
+};
+
 /**
  * struct xe_tile - hardware tile structure
  *
@@ -148,13 +164,7 @@ struct xe_tile {
 	 * * 4MB-8MB: reserved
 	 * * 8MB-16MB: global GTT
 	 */
-	struct {
-		/** @mmio.size: size of tile's MMIO space */
-		size_t size;
-
-		/** @mmio.regs: pointer to tile's MMIO space (starting with registers) */
-		void __iomem *regs;
-	} mmio;
+	struct xe_mmio mmio;
 
 	/**
 	 * @mmio_ext: MMIO-extension info for a tile.
-- 
2.45.2

