Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643B1D35665
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 00:49:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCB310E5F4;
	Wed, 28 Jan 2026 00:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ECmu035a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCA310E5DB;
 Wed, 28 Jan 2026 00:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769561330; x=1801097330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dXgplS3Jy0P4s4byWI3P/34Aiv0qlSFAzzUgtV4wmw0=;
 b=ECmu035aF2J0z0CFvN0bkHkwVkLkowin4EmS3MQkqtCNc9dM8MGa0WgH
 svO37B2WBiIfJvVXrAoSdi/QjWq+PpPlwKFXuPCTZj3zSevrztPENiMyv
 WEB7AvbTuwMbdGxXAetymn3uORK0wvhM1qsG7z1Ihmk+EyNCC2HGfuscr
 xKDn9A2/ZKXsHXFZ+9ny5MoIPUjYQWvcY/dftWsdgMA9p4QMQ/Y1SjO2D
 QXevvLglD7yyzS5CI/kWouC5uFH0N/a1QNDcS3+KbcTIyUFi3HIxNG7Ei
 fBjwMJnyptuhzvaWDi+zMXO6D3D6mUiD0GUlYKH9zr5ci8bD0AgbtNW6e Q==;
X-CSE-ConnectionGUID: Bexx0kPkQaiQcXkuuCH7sw==
X-CSE-MsgGUID: CmxCPD5KT3aywj2uWNqHOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="93427525"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="93427525"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 16:48:48 -0800
X-CSE-ConnectionGUID: QQfRycTETnSrnjh+Bc0GiQ==
X-CSE-MsgGUID: jhnR5iXeRXWJZeSWWthE6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="238822660"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 16:48:48 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: leonro@nvidia.com, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 jgg@ziepe.ca
Subject: [RFC PATCH v3 06/11] drm/pagemap: Add IOVA interface to DRM pagemap
Date: Tue, 27 Jan 2026 16:48:36 -0800
Message-Id: <20260128004841.2436896-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260128004841.2436896-1-matthew.brost@intel.com>
References: <20260128004841.2436896-1-matthew.brost@intel.com>
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

Add an IOVA interface to the DRM pagemap layer. This provides a semantic
wrapper around the dma-map IOVA alloc/link/sync/unlink/free API while
remaining flexible enough to support future high-speed interconnects
between devices.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/drm/drm_pagemap.h | 87 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index 14e1db564c25..0b410113ef95 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -72,6 +72,93 @@ drm_pagemap_addr_encode(dma_addr_t addr,
  * struct drm_pagemap_ops: Ops for a drm-pagemap.
  */
 struct drm_pagemap_ops {
+	/**
+	 * @device_iova_alloc: Allocate a IOVA for device access (required)
+	 *
+	 * @dpagemap: The struct drm_pagemap for the IOVA.
+	 * @dev: The device mapper.
+	 * @length: Length of IOVA.
+	 * @dir: The transfer direction.
+	 *
+	 * Context: Reclaim unsafe, maybe take dma-resv locks.
+	 *
+	 * Return: Cookie to IOVA which is passed to other vfuncs, NULL if no
+	 * IOVA could be allocated or not needed, ERR_PTR if an IOVA is required
+	 * but allocation failed.
+	 */
+	void *(*device_iova_alloc)(struct drm_pagemap *dpagemap,
+				   struct device *dev, size_t length,
+				   enum dma_data_direction dir);
+
+	/**
+	 * @device_iova_free: Free a IOVA from device access (optional, required
+	 * if @device_iova_alloc returns a valid cookie)
+	 *
+	 * @dpagemap: The struct drm_pagemap for the IOVA.
+	 * @dev: The device mapper.
+	 * @length: Length of IOVA.
+	 * @cookie: Cookie for IOVA.
+	 *
+	 * Context: Reclaim unsafe, maybe take dma-resv locks.
+	 */
+	void (*device_iova_free)(struct drm_pagemap *dpagemap,
+				 struct device *dev, size_t length,
+				 void *cookie);
+
+	/**
+	 * @device_iova_link: Link IOVA in device (optional, required if
+	 * @device_iova_alloc returns a valid cookie)
+	 *
+	 * @dpagemap: The struct drm_pagemap for the IOVA.
+	 * @dev: The device mapper.
+	 * @length: Length of mapping.
+	 * @offset: Offset in IOVA of mapping.
+	 * @cookie: Cookie for IOVA.
+	 * @dir: The transfer direction.
+	 *
+	 * Context: Reclaim safe.
+	 */
+	struct drm_pagemap_addr (*device_iova_link)(struct drm_pagemap *dpagemap,
+						    struct device *dev,
+						    struct page *page,
+						    size_t length,
+						    size_t offset,
+						    void *cookie,
+						    enum dma_data_direction dir);
+
+	/**
+	 * @device_iova_sync: Sync IOVA in device (optional, required if
+	 * @device_iova_alloc returns a valid cookie)
+	 *
+	 * @dpagemap: The struct drm_pagemap for the IOVA.
+	 * @dev: The device mapper.
+	 * @length: Length of IOVA.
+	 * @cookie: Cookie for IOVA.
+	 *
+	 * Context: Reclaim safe.
+	 *
+	 * Return: Zero on success, negative error code on failure.
+	 */
+	int (*device_iova_sync)(struct drm_pagemap *dpagemap,
+				struct device *dev, size_t length,
+				void *cookie);
+
+	/**
+	 * @device_iova_unlink: Unlink IOVA from device (optional, required if
+	 * @device_iova_alloc returns a valid cookie)
+	 *
+	 * @dpagemap: The struct drm_pagemap for the IOVA.
+	 * @dev: The device mapper.
+	 * @length: Length of IOVA.
+	 * @cookie: Cookie for IOVA.
+	 * @dir: The transfer direction.
+	 *
+	 * Context: Reclaim safe.
+	 */
+	void (*device_iova_unlink)(struct drm_pagemap *dpagemap,
+				   struct device *dev, size_t length,
+				   void *cookie, enum dma_data_direction dir);
+
 	/**
 	 * @device_map: Map for device access or provide a virtual address suitable for
 	 *
-- 
2.34.1

