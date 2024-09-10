Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C61EE0202
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:47:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2A810E956;
	Tue, 10 Sep 2024 23:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cEkc4iuZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E531510E93B
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 23:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726012047; x=1757548047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RdvQG+696NSVEz4+dud5aSVZ4LhhQlGZ+k1ZN39oI1Y=;
 b=cEkc4iuZG9W06XD00bj6s2D/Ly/0T76/dsktq5ZEhiNHk18Cxwm86nss
 sTQXsZNATKxsVU2a2AreX97BVx5d/NzaN6IiPfhI2ndaoF30oEoneHjCc
 cS45pg7wEfaoz9apipFOKEWELMuUmB/+5xSmxsaSiSRPLrJr06pjLEe5f
 yMWgAFFRT20Vuf9GerUb4/AivM2dlN44WxP7GH0veOMPONxuiFZDgSSOz
 adAbHg8IkbrO20DSaGyfNxSxuvLRAtpE3FAZzVcV7vFpBIAVLGri8c5zD
 zXI3/fJbPhPWCPM0SFwr0vWTGT6kAmQW456RpaMZBoNWjSRYoUlaFoC65 g==;
X-CSE-ConnectionGUID: StoYNGRSQGmF18kbM8PSzg==
X-CSE-MsgGUID: gJ6SBFykRn+M8wUOkxn0VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36144297"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36144297"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:26 -0700
X-CSE-ConnectionGUID: gPyIcdUZSymhqPtaTEv1EQ==
X-CSE-MsgGUID: CCrzWHXaRNOc5ozXAbg/3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71989548"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:27 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 06/43] drm/xe: Switch mmio_ext to use 'struct xe_mmio'
Date: Tue, 10 Sep 2024 16:47:26 -0700
Message-ID: <20240910234719.3335472-51-matthew.d.roper@intel.com>
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

The mmio_ext stuff is completely unused right now, but it isn't
providing any functionality that couldn't be treated as a regular mmio
space.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 8 +-------
 drivers/gpu/drm/xe/xe_mmio.c         | 2 +-
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 347fc5ec55e1..e5af3f5fe78c 100644
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
index 781555bbe449..d271ff45e90c 100644
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

