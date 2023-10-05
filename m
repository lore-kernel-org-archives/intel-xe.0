Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82D4E92711
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 15:31:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE9810E425;
	Thu,  5 Oct 2023 15:31:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D660F10E02B;
 Thu,  5 Oct 2023 15:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696519895; x=1728055895;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YLRazdrAuqDhfpJNorh5Yr4gy7uwPnRe3zC7uE6yvOg=;
 b=JlvLU5cQPlOMyhgRLxTga8jODuPRabjHXuDX5miEunGDz0+smtOza6WY
 7B9wCOc5sL5ytd3nv6EiKOUZtAnuaiiSrBCsnRu2Kf5xD4oi1pp6UR4BT
 mW1iO2jSuBncg1XBKucKF4Yo44SZQx3GtDgCiO6Li4awgI9n59GTVQ2T8
 aD+Io9srjjNOFePWSOZ4e7vRLIQ9tmWv3kbiosZsfnzmOVvXcPn2Rk2nm
 tu704NCBcHi2erTvp3tMO/hdJFYD5CRogMou0sm4P0u4eGRxuY1pzsHxg
 geMIC5amRewqYVLAhaiz6Zh0wlKZwCbWY1d5lECi8ijxnS4TjxSMKQIB/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363810904"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="363810904"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:31:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="925631278"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="925631278"
Received: from ssshahap-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.30.107])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:31:34 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  5 Oct 2023 16:31:05 +0100
Message-ID: <20231005153116.452319-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005153116.452319-1-matthew.auld@intel.com>
References: <20231005153116.452319-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t 01/12] drm-uapi/xe_drm: sync to get pat and
 coherency bits
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Grab the PAT & coherency uapi additions.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
---
 include/drm-uapi/xe_drm.h | 93 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 90 insertions(+), 3 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 804c02270..0a665f67f 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -456,8 +456,54 @@ struct drm_xe_gem_create {
 	 */
 	__u32 handle;
 
-	/** @pad: MBZ */
-	__u32 pad;
+	/**
+	 * @coh_mode: The coherency mode for this object. This will limit the
+	 * possible @cpu_caching values.
+	 *
+	 * Supported values:
+	 *
+	 * DRM_XE_GEM_COH_NONE: GPU access is assumed to be not coherent with
+	 * CPU. CPU caches are not snooped.
+	 *
+	 * DRM_XE_GEM_COH_AT_LEAST_1WAY:
+	 *
+	 * CPU-GPU coherency must be at least 1WAY.
+	 *
+	 * If 1WAY then GPU access is coherent with CPU (CPU caches are snooped)
+	 * until GPU acquires. The acquire by the GPU is not tracked by CPU
+	 * caches.
+	 *
+	 * If 2WAY then should be fully coherent between GPU and CPU.  Fully
+	 * tracked by CPU caches. Both CPU and GPU caches are snooped.
+	 *
+	 * Note: On dgpu the GPU device never caches system memory. The device
+	 * should be thought of as always 1WAY coherent, with the addition that
+	 * the GPU never caches system memory. At least on current dgpu HW there
+	 * is no way to turn off snooping so likely the different coherency
+	 * modes of the pat_index make no difference for system memory.
+	 */
+#define DRM_XE_GEM_COH_NONE		1
+#define DRM_XE_GEM_COH_AT_LEAST_1WAY	2
+	__u16 coh_mode;
+
+	/**
+	 * @cpu_caching: The CPU caching mode to select for this object. If
+	 * mmaping the object the mode selected here will also be used.
+	 *
+	 * Supported values:
+	 *
+	 * DRM_XE_GEM_CPU_CACHING_WB: Allocate the pages with write-back caching.
+	 * On iGPU this can't be used for scanout surfaces. The @coh_mode must
+	 * be DRM_XE_GEM_COH_AT_LEAST_1WAY. Currently not allowed for objects placed
+	 * in VRAM.
+	 *
+	 * DRM_XE_GEM_CPU_CACHING_WC: Allocate the pages as write-combined. This is
+	 * uncached. Any @coh_mode is permitted. Scanout surfaces should likely
+	 * use this. All objects that can be placed in VRAM must use this.
+	 */
+#define DRM_XE_GEM_CPU_CACHING_WB                      1
+#define DRM_XE_GEM_CPU_CACHING_WC                      2
+	__u16 cpu_caching;
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
@@ -552,8 +598,49 @@ struct drm_xe_vm_bind_op {
 	 */
 	__u32 obj;
 
+	/**
+	 * @pat_index: The platform defined @pat_index to use for this mapping.
+	 * The index basically maps to some predefined memory attributes,
+	 * including things like caching, coherency, compression etc.  The exact
+	 * meaning of the pat_index is platform specific and defined in the
+	 * Bspec and PRMs.  When the KMD sets up the binding the index here is
+	 * encoded into the ppGTT PTE.
+	 *
+	 * For coherency the @pat_index needs to be least as coherent as
+	 * drm_xe_gem_create.coh_mode. i.e coh_mode(pat_index) >=
+	 * drm_xe_gem_create.coh_mode. The KMD will extract the coherency mode
+	 * from the @pat_index and reject if there is a mismatch (see note below
+	 * for pre-MTL platforms).
+	 *
+	 * Note: On pre-MTL platforms there is only a caching mode and no
+	 * explicit coherency mode, but on such hardware there is always a
+	 * shared-LLC (or is dgpu) so all GT memory accesses are coherent with
+	 * CPU caches even with the caching mode set as uncached.  It's only the
+	 * display engine that is incoherent (on dgpu it must be in VRAM which
+	 * is always mapped as WC on the CPU). However to keep the uapi somewhat
+	 * consistent with newer platforms the KMD groups the different cache
+	 * levels into the following coherency buckets on all pre-MTL platforms:
+	 *
+	 *	ppGTT UC -> DRM_XE_GEM_COH_NONE
+	 *	ppGTT WC -> DRM_XE_GEM_COH_NONE
+	 *	ppGTT WT -> DRM_XE_GEM_COH_NONE
+	 *	ppGTT WB -> DRM_XE_GEM_COH_AT_LEAST_1WAY
+	 *
+	 * In practice UC/WC/WT should only ever used for scanout surfaces on
+	 * such platforms (or perhaps in general for dma-buf if shared with
+	 * another device) since it is only the display engine that is actually
+	 * incoherent.  Everything else should typically use WB given that we
+	 * have a shared-LLC.  On MTL+ this completely changes and the HW
+	 * defines the coherency mode as part of the @pat_index, where
+	 * incoherent GT access is possible.
+	 *
+	 * Note: For userptr and externally imported dma-buf the kernel expects
+	 * either 1WAY or 2WAY for the @pat_index.
+	 */
+	__u16 pat_index;
+
 	/** @pad: MBZ */
-	__u32 pad;
+	__u16 pad;
 
 	union {
 		/**
-- 
2.41.0

