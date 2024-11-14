Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E28D41C3A
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 04:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5479910E7A3;
	Thu, 14 Nov 2024 04:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mTTZwCD0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B4510E79D;
 Thu, 14 Nov 2024 04:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731560332; x=1763096332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xpFEKBSFsurNNKPAK5JROYVQ5NHMMqF7k73OqIDmEmI=;
 b=mTTZwCD0MiBDUTPX0s6srzrOpdlNkO7NJhyRkV69UCFMnjiVHybijKKO
 UYy7katZ5dt2U8KQk/HqVwqk14Q3P9I8fJl6S7wasUzR9P8svOjUBRRSL
 mHAEBvtsEeDPbrEJETJsgqXjSxZVQ5PyNbnSfUaiAk4bBBr90iIBgbqQI
 11Wbw9VvFOaeT7QDIP6tqxGxacakkUcm7o6b5btgfb+Q9LXIK8PnAHaVU
 8Kg4sVFMEXpjDwmzTKxJZu/0prBrIUhnjIyzg6Zm1mduSZPQhTbdF5Rkk
 JUORVxsopPMPvDKX5qJjO/d8+G+5CVjXhaCB7e5aQ0DBxyrlPWh9ITMew w==;
X-CSE-ConnectionGUID: CqVS31oPQ/K4FVwMG3YPbA==
X-CSE-MsgGUID: 6SOOiymFS0ixk0nrGBrrUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="35409532"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="35409532"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 20:58:52 -0800
X-CSE-ConnectionGUID: jwmwDrZBTXu8Hxrsqrpz7A==
X-CSE-MsgGUID: 45xoOxi9QcGS1r7Jp3IPeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="92139114"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 20:58:50 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [i-g-t 3/4] include/intel_drm_local.h: Add
 DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER
Date: Thu, 14 Nov 2024 10:31:28 +0530
Message-Id: <20241114050129.1381711-4-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114050129.1381711-1-tejas.upadhyay@intel.com>
References: <20241114050129.1381711-1-tejas.upadhyay@intel.com>
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

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 include/drm-uapi-experimental/intel_drm_local.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm-uapi-experimental/intel_drm_local.h b/include/drm-uapi-experimental/intel_drm_local.h
index 1773c649b..4afe588ec 100644
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

