Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D93D43FE3
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 06:58:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E7210E330;
	Mon, 18 Nov 2024 06:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i8YLJqcq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2081710E32C;
 Mon, 18 Nov 2024 06:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731913085; x=1763449085;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=28wOef8EYE6w89xPw7TQb0f4lFX1dP8OIk62gxMCHYI=;
 b=i8YLJqcqKNeOgSiqMBTHZ3mXW36WNqsU2UOsl6Ea41gvFTuhbjpbmwQR
 D/1j4TxB4/ttCXNA5ONTkEy4VyhbwdT8tZ/2LvsiLRQnwVuq1uOp5PX79
 ZwhRVURfexBxMiS7D3iX0dgYCgeWaaf3VvXO00GH3+pZ4QXIgosvg65B5
 Ps32w+u7vYh5K212E4HA9hXkWRcdH7uPwTA4cxnQKR8bDX+BHdipWD56G
 fGkTtaYDsyJBR8wngz3Q1xoyOlzxfSgztpq3LBp+Tmj4W0RRnL86iMZUH
 KDMFy7dnK4jO5LJWT+JO9tShXbAN2cGrfb9rSQb5WApOWc3RnwyT4QHU/ g==;
X-CSE-ConnectionGUID: y8cLCJcYTTOW8BSFWYqhTg==
X-CSE-MsgGUID: fqkJq/abTB29a/H1yDSI2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="42927351"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="42927351"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2024 22:58:05 -0800
X-CSE-ConnectionGUID: 8sdcf/T5RAizvOFp3XIgtg==
X-CSE-MsgGUID: bOh83Tj5TiyIpfS3wurODA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="89543026"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2024 22:58:03 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [i-g-t V2 3/4] include/intel_drm_local.h: Add
 DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER
Date: Mon, 18 Nov 2024 12:32:10 +0530
Message-Id: <20241118070211.1474372-4-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118070211.1474372-1-tejas.upadhyay@intel.com>
References: <20241118070211.1474372-1-tejas.upadhyay@intel.com>
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

