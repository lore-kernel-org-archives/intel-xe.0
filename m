Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE44CD37A7
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC41510E63A;
	Wed,  4 Sep 2024 00:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GH26Ssha";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A82510E63B
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409275; x=1756945275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MJE1GDy8sOfA2nt99andgZsvy/YrZet6usDZ+eut5xQ=;
 b=GH26Sshaop9lrk2hjPb+shFxa1Ue7s9swPL/WxNSCGlwuRbC/TJu+qpa
 Cn88gQyZ2EVm+U0l1tzbyvi/UQnaUJwuldk1PPUwVIAY4aCBN6afEyLLG
 dnVnB6Uaqx66jRuW2w/RF1TyEiZGpaUL+s3gXEL0LHOQ6AjkPSzE1p34m
 y5a4+XGSwiBPWPhGlqqEUHTrieE9JSSnB9gMDgy5umYzshU4OiurnoVDu
 y4DzfR8ZXVfuBzIgWCtCODTBFhYIbRzujPM0Mzwu1M+WpxIfePssQ+Lac
 D6xdakduVQkXaWrOQd0/6lOrO7NhfBSLsmtvqPtWglSNhdCXlXDPWViVE g==;
X-CSE-ConnectionGUID: Z7HgFJsDQzS9IaF+FXp6Fg==
X-CSE-MsgGUID: tMGbAq8aSIeY26dfJLl0EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904789"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904789"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:14 -0700
X-CSE-ConnectionGUID: O4xnyRg+TdeWwSsfPeDA4w==
X-CSE-MsgGUID: zIoAbmQFT460IwEztNmVIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944193"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 02/43] drm/xe: Create dedicated xe_mmio structure
Date: Tue,  3 Sep 2024 17:21:03 -0700
Message-ID: <20240904002100.2023834-47-matthew.d.roper@intel.com>
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

Pull the 'mmio' substructure from xe_device out into a dedicated type.
Future patches will expand this structure and then eventually move MMIO
read/write operations over to using this type.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index ec7eb7811126..a02e5dfcc6a7 100644
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
+	/** @map_size: Size of the map. */
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

