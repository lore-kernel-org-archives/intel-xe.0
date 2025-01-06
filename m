Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65048E77198
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 15:09:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3055710E6A8;
	Mon,  6 Jan 2025 15:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ByI2yybC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9931410E6A8;
 Mon,  6 Jan 2025 15:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736176177; x=1767712177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IDvghJba7JjGPaVQsZq4GaUxd0zGSoYzKYUUvegtXB8=;
 b=ByI2yybCYqZaQdzdbHw/323d+/UG6J3ma2zecypYzfb1KejIgqkxwK7p
 1YrgYRh6hf6lPN5W9S2sRoh7ij38UFmJNUl+/RvYCOC3ZFG5MTgsAiWyW
 6opplzWfr5wIUT6doXO3UiVoUGhl4CX/KrKQBom6R9UcanGcnLkWhQ2mN
 0//HwQk+TRV9d3aresiMnPvLWV9EVefsn9pXmiN9tXkp4qh83NcYci86n
 0znUBk8B4Od9aJMMFeDk/Db5ZaJjjo5163+2dVqTVAGESP29X1IgI5c2E
 Gp8oongtYa5qjTxJlo9uTUt+ysybrEtXyd7JMJhBOvP7F/dD3n7LDvrxl g==;
X-CSE-ConnectionGUID: COJ5SikHQbibGkjk9VNpYA==
X-CSE-MsgGUID: PZ9uVD/PQgaCWZiIqL76cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="40266400"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="40266400"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 07:09:36 -0800
X-CSE-ConnectionGUID: XNFSww9GR0ym40TfWiZ3Ww==
X-CSE-MsgGUID: CN9D9osLQRyU/wXNgqpfKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="107424715"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 07:09:35 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Auld@freedesktop.org, Matthew <matthew.auld@intel.com>,
	Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V7 3/4] include/intel_drm_local.h: Add
 DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER
Date: Mon,  6 Jan 2025 20:44:40 +0530
Message-Id: <20250106151441.2598949-4-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250106151441.2598949-1-tejas.upadhyay@intel.com>
References: <20250106151441.2598949-1-tejas.upadhyay@intel.com>
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

