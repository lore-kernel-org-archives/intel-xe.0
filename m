Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926A1E6FE49
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:08:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A910B10EB2E;
	Sat,  7 Sep 2024 00:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YgIRek8+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD2410EB2A
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667676; x=1757203676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VVCpF2l1aTIcSOEaslK5mknJf9x608HqhOVsERPKDBE=;
 b=YgIRek8+Mrzo3OqsBLILhHesShsVDGiXD4Xx7lhMGD5PLZRaJX2LP3ro
 AAr/VtXPyHkMbi+FysddTUfB2BvIX7lZCJtswemd5CGGeiB1AZK3e1PUE
 copNORgkhFkS8TGLhqMCGI3k/K61AWNxhJo7bKHPEOFuiJTCqiC3NSfYC
 Z4jYIjUJyYGYtEdLjz04jEHzpCq4dwTMh1FHlXid8radI5R76xeDdSjh0
 FeOiLHJ5sOMLE//RKS8SLvecF2vnN9bpjDhDqKpPJO33g9eJvxNFIYX5q
 ec1+5tU3EmGW396rUx3Pisf9paWn4nH1pBoKMg/RLTAWl5TqRpMcuLBWY Q==;
X-CSE-ConnectionGUID: aLyRkohCTHKoK5SBKl1/7A==
X-CSE-MsgGUID: PEOCuceUTCiB+zwpbEljQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855296"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855296"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: 3XuSsgu5RPmrb8evY5zzHQ==
X-CSE-MsgGUID: xjBTz6sXQeWoGY1Hc5lQfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792633"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 06/43] drm/xe: Switch mmio_ext to use 'struct xe_mmio'
Date: Fri,  6 Sep 2024 17:07:55 -0700
Message-ID: <20240907000748.2614020-51-matthew.d.roper@intel.com>
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

The mmio_ext stuff is completely unused right now, but it isn't
providing any functionality that couldn't be treated as a regular mmio
space.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 8 +-------
 drivers/gpu/drm/xe/xe_mmio.c         | 2 +-
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 85ef36c5d040..e6675e9ba6e1 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -182,13 +182,7 @@ struct xe_tile {
 	 *
 	 * Each tile has its own additional 256MB (28-bit) MMIO-extension space.
 	 */
-	struct {
-		/** @mmio_ext.size: size of tile's additional MMIO-extension space */
-		size_t size;
-
-		/** @mmio_ext.regs: pointer to tile's additional MMIO-extension space */
-		void __iomem *regs;
-	} mmio_ext;
+	struct xe_mmio mmio_ext;
 
 	/** @mem: memory management info for tile */
 	struct {
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index f210e7470eae..2f72516e0132 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -132,7 +132,7 @@ static void mmio_extension_setup(struct xe_device *xe, size_t tile_mmio_size,
 
 	regs = xe->mmio.regs + tile_mmio_size * xe->info.tile_count;
 	for_each_tile(tile, xe, id) {
-		tile->mmio_ext.size = tile_mmio_ext_size;
+		tile->mmio_ext.regs_size = tile_mmio_ext_size;
 		tile->mmio_ext.regs = regs;
 		regs += tile_mmio_ext_size;
 	}
-- 
2.45.2

