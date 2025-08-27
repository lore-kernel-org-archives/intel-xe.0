Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C186CA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 18:34:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F411210E0A0;
	Wed, 27 Aug 2025 18:34:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RRuazO8y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037BE10E0A0
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 18:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756319653; x=1787855653;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CcpqX/nJPoK0mVsMbXTIyqvt4qIcDAaAeCvYGai4TdU=;
 b=RRuazO8ylox5cTVYEjjwfv1LkBiXYihg9ibEBBlEGphnfwnvIxedfPA+
 aiAWxa0yEienDvwIv7wXAPDqFXoi5BUnS3vWWBAEzgwir3dMaRxZQgJmA
 aDWirqnWSZ6qPbQSk+niPdJUO7O/h6wuzyIAQyOlxAt+ykhWGpZE3ydcR
 QZJV4Tw02TOf0ATxgjaMKsSjGKRP2QzZ1ObyXoqIu/HzoDhZtyu32vWUp
 VmrP3i2F5bD5KNpQL5Pj4EOCuj9IITlBQlRSGt2mTx/39/lxdU4B1A9cm
 eJKWxxfX5KjzVXGTu3nQab5ZvEvkUIaGDhgVtjs9c1uLmpS7N5X+a9DzT A==;
X-CSE-ConnectionGUID: rNFcigkVToSgJExL1zv/6Q==
X-CSE-MsgGUID: orGabg11SK+SBPTcRe35BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58502371"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58502371"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 11:34:12 -0700
X-CSE-ConnectionGUID: IRB922UXQYGpUCZTi5R6QQ==
X-CSE-MsgGUID: n0KOouo6R5qL8vLjMa+FuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="200810066"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 27 Aug 2025 11:34:10 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe/uapi: Fix kernel-doc formatting for madvise and
 vma_query
Date: Thu, 28 Aug 2025 00:31:35 +0530
Message-Id: <20250827190136.3810508-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
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

Correct kernel-doc formatting issues in the UAPI definitions for
madvise and VMA query interfaces to resolve docutils warnings during
documentation build.

Fixes: 418807860e94 ("drm/xe/uapi: Add UAPI for querying VMA count and memory attributes")
Fixes: 231bb0ee7aa5 ("drm/xe/uapi: Add madvise interface")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 include/uapi/drm/xe_drm.h | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 7dedd45ab995..a164deedae33 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -2006,12 +2006,12 @@ struct drm_xe_query_eu_stall {
  * .. code-block:: C
  *
  * struct drm_xe_madvise madvise = {
- *          .vm_id = vm_id,
- *          .start = 0x100000,
- *          .range = 0x2000,
- *          .type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
- *          .atomic_val = DRM_XE_ATOMIC_DEVICE,
- *         };
+ *     .vm_id = vm_id,
+ *     .start = 0x100000,
+ *     .range = 0x2000,
+ *     .type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
+ *     .atomic_val = DRM_XE_ATOMIC_DEVICE,
+ *     };
  *
  * ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);
  *
@@ -2073,12 +2073,16 @@ struct drm_xe_madvise {
 		 * Used when @type == DRM_XE_MEM_RANGE_ATTR_ATOMIC.
 		 *
 		 * Supported values for @atomic.val:
-		 * - DRM_XE_ATOMIC_UNDEFINED: Undefined or default behaviour
-		 *   Support both GPU and CPU atomic operations for system allocator
-		 *   Support GPU atomic operations for normal(bo) allocator
-		 * - DRM_XE_ATOMIC_DEVICE: Support GPU atomic operations
-		 * - DRM_XE_ATOMIC_GLOBAL: Support both GPU and CPU atomic operations
-		 * - DRM_XE_ATOMIC_CPU: Support CPU atomic
+		 * - DRM_XE_ATOMIC_UNDEFINED: Undefined or default behaviour.
+		     Support both GPU and CPU atomic operations for system allocator.
+		     Support GPU atomic operations for normal(bo) allocator.
+		 *
+		 * - DRM_XE_ATOMIC_DEVICE: Support GPU atomic operations.
+		 *
+		 * - DRM_XE_ATOMIC_GLOBAL: Support both GPU and CPU atomic operations.
+		 *
+		 * - DRM_XE_ATOMIC_CPU: Support CPU atomic only, no GPU atomics supported.
+		 *
 		 */
 		struct {
 #define DRM_XE_ATOMIC_UNDEFINED	0
@@ -2196,6 +2200,7 @@ struct drm_xe_mem_range_attr {
  * Example:
  *
  * .. code-block:: C
+ *
  *    struct drm_xe_vm_query_mem_range_attr query = {
  *         .vm_id = vm_id,
  *         .start = 0x100000,
-- 
2.34.1

