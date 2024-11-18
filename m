Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 295CCD591A9
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 17:27:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDB010E53D;
	Mon, 18 Nov 2024 17:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hejLUdgd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719D610E53D;
 Mon, 18 Nov 2024 17:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731950852; x=1763486852;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IDvghJba7JjGPaVQsZq4GaUxd0zGSoYzKYUUvegtXB8=;
 b=hejLUdgdcADmWAK9WAeP3869vPVJk6EzNYdWsySZ4EFfoB3d6T5TquhA
 mcj1F5xIllxIDFoPhBdYk+Y+U32Pop28A+bDkcstmZ36aLOSCytRoZqYt
 jet9Vz25UtKDEUm1PFM/owrOYpUxSnwF6wtwy0+fod3CpPVfM7XwX0e5P
 tvKGVo2OtdxHD+UqiC9Y9Gd4xQyVdksxBl0wMul4vqTbAGnjZ7GxJEae0
 LxKkWv6+3v1/toC928dy1U0hB6WbnFCRcBqeCFFeyV2SASyNU6WS2a08e
 AS3BDrbU+TilpUBcYkG4bJx8xyAg0UHEA5LndfqXMgIcug1FfQH2kvv3v A==;
X-CSE-ConnectionGUID: j/9mGTw+Ts+P3dp9COxI+A==
X-CSE-MsgGUID: WNG+miycRE2G4NbX70HVEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31857942"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="31857942"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 09:27:32 -0800
X-CSE-ConnectionGUID: XUvKaeFyQIuldwXlct2RyQ==
X-CSE-MsgGUID: fuIxHbpiTEO3SKUXWXh1sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="94099969"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 09:27:30 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [i-g-t V4 3/4] include/intel_drm_local.h: Add
 DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER
Date: Mon, 18 Nov 2024 23:01:36 +0530
Message-Id: <20241118173137.1512581-4-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118173137.1512581-1-tejas.upadhyay@intel.com>
References: <20241118173137.1512581-1-tejas.upadhyay@intel.com>
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

For now dump into intel_drm_local.h. Once the uapi on the kernel side is
merged, and is part of drm-next, we can sync the kernel headers and
remove this.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 include/drm-uapi-experimental/intel_drm_local.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm-uapi-experimental/intel_drm_local.h b/include/drm-uapi-experimental/intel_drm_local.h
index b48c9e219..40e8dcc43 100644
--- a/include/drm-uapi-experimental/intel_drm_local.h
+++ b/include/drm-uapi-experimental/intel_drm_local.h
@@ -20,6 +20,8 @@ extern "C" {
  * clean these up when kernel uapi headers are sync'd.
  */
 
+#define DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER	(1 << 0)
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

