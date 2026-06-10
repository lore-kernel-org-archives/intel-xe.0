Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACBDCD8CB2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 13:35:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEC810E06B;
	Wed, 10 Jun 2026 13:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="maBV4ucP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A5689F35
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 13:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781098526; x=1812634526;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rovOE6ZlHkILxYp8p6BMF1ESlZyGUX3cWZWYFYRohjU=;
 b=maBV4ucPURhuQBhrWmupovgA54fEGluiuj2m+exXuYI/YOOG9jpaIeDu
 gMM2CXjlCYpirgIhK1eM+WBn98oWLKDrAtluG0Glx2X937l6bfocDQ24E
 zl9U4ARML/C6nULKMVa5P5Z6rZaETYatSSXHLr43HQ4HecpKMs21xWsBp
 8Ovsax06fuwgfv89irgO7/gHByQk4vfbOf6okAeAKgK7f+szg6rJa8rYE
 gmiOZVovfBM5H0NG+/abQ9oBbrQRSi2UVG5oF44//9WW789Nm9ji7ivCW
 tLzhhtQO0eZ8xfTL7HjVNG+BulyjeYAyAFTu5/9CydhUlcr8h1bDAFH/w w==;
X-CSE-ConnectionGUID: 9jrBBhmhTlCSDmYPOBlvdg==
X-CSE-MsgGUID: 0VbOjcwUTxCiYzx8BCM3Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="82000104"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="82000104"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 06:35:26 -0700
X-CSE-ConnectionGUID: 4dPihA+2Q4uEOMYJzzFaGg==
X-CSE-MsgGUID: XGNp2b2iT9e1UQTp3YMN2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="245326417"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.27])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 06:35:25 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [RFC PATCH 1/2] drm/gpusvm: Add a DMA-mapping accounting callback
Date: Wed, 10 Jun 2026 15:34:50 +0200
Message-ID: <20260610133451.8930-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Drivers that use the GPU SVM core to DMA-map system memory for GPU
access may want to keep track of how many pages they have mapped, for
example to expose statistics or to detect leaks. Doing this accounting
in the driver around drm_gpusvm_get_pages() / drm_gpusvm_unmap_pages()
is error prone: the number, order and kind of the dma_addr[] entries can
change between map and unmap (migration, partial unmaps, the iova vs
non-iova paths), which makes symmetric accounting hard to get right.

Add an optional @dma_map_account callback to struct drm_gpusvm_ops and
invoke it once per &drm_pagemap_addr entry at the exact points where the
entry is DMA-mapped (sign == +1) in drm_gpusvm_get_pages() and unmapped
(sign == -1) in __drm_gpusvm_unmap_pages(). Since the map error path and
every unmap/free path funnel through __drm_gpusvm_unmap_pages() for the
entries that were actually mapped, the accounting is symmetric by
construction. The callback receives the full &drm_pagemap_addr so the
driver can use the order and the proto field to distinguish system
memory mappings from device interconnect mappings.

The callback must also be usable by the core drm_gpusvm_pages-only API
(mm == NULL), as used e.g. for userptr-style mappings. Relax
drm_gpusvm_init() to allow such users to pass a restricted @ops that
only implements the page-level hooks; the full-SVM hooks (@invalidate)
and the chunk configuration must still be unset in that mode.

Assisted-by: GitHub_Copilot:claude-opus-4.8
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 17 +++++++++++++++--
 include/drm/drm_gpusvm.h     | 19 +++++++++++++++++++
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 958cb605aedd..c18f15c77e94 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -393,8 +393,15 @@ int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
 			return -EINVAL;
 		mmgrab(mm);
 	} else {
-		/* No full SVM mode, only core drm_gpusvm_pages API. */
-		if (ops || num_chunks || mm_range || notifier_size)
+		/*
+		 * No full SVM mode, only core drm_gpusvm_pages API. A
+		 * restricted @ops that only implements the page-level hooks
+		 * (e.g. @dma_map_account) is allowed; the full-SVM hooks must
+		 * not be set.
+		 */
+		if (num_chunks || mm_range || notifier_size)
+			return -EINVAL;
+		if (ops && ops->invalidate)
 			return -EINVAL;
 	}
 
@@ -1162,6 +1169,8 @@ static void __drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
 			else if (dpagemap && dpagemap->ops->device_unmap)
 				dpagemap->ops->device_unmap(dpagemap,
 							    dev, addr);
+			if (gpusvm->ops && gpusvm->ops->dma_map_account)
+				gpusvm->ops->dma_map_account(gpusvm, addr, -1);
 			i += 1 << addr->order;
 		}
 
@@ -1584,6 +1593,10 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 				(addr, DRM_INTERCONNECT_SYSTEM, order,
 				 dma_dir);
 		}
+		if (gpusvm->ops && gpusvm->ops->dma_map_account)
+			gpusvm->ops->dma_map_account(gpusvm,
+						     &svm_pages->dma_addr[j],
+						     1);
 		i += 1 << order;
 		num_dma_mapped = i;
 		flags.has_dma_mapping = true;
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 8a4d7134a9a7..87ad2dcaa7c4 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -75,6 +75,25 @@ struct drm_gpusvm_ops {
 	void (*invalidate)(struct drm_gpusvm *gpusvm,
 			   struct drm_gpusvm_notifier *notifier,
 			   const struct mmu_notifier_range *mmu_range);
+
+	/**
+	 * @dma_map_account: Account a DMA-mapping change (optional)
+	 * @gpusvm: Pointer to the GPU SVM
+	 * @addr: The address descriptor of the chunk being (un)mapped
+	 * @sign: +1 when @addr has just been DMA-mapped, -1 when it is being
+	 *        unmapped
+	 *
+	 * Called once per &drm_pagemap_addr entry, when the entry is
+	 * DMA-mapped by drm_gpusvm_get_pages() (@sign == +1) and when it is
+	 * unmapped (@sign == -1), so the driver can keep symmetric accounting
+	 * of the pages it has mapped for GPU access. The @addr->proto field
+	 * can be used to distinguish system-memory mappings from device
+	 * interconnect mappings. May be provided in both full SVM mode and the
+	 * core drm_gpusvm_pages-only mode.
+	 */
+	void (*dma_map_account)(struct drm_gpusvm *gpusvm,
+				const struct drm_pagemap_addr *addr,
+				int sign);
 };
 
 /**
-- 
2.54.0

