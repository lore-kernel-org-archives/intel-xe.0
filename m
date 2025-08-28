Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052C6CA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 06:47:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C6710E194;
	Thu, 28 Aug 2025 06:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bVdSARG+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236D910E194
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 06:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756363669; x=1787899669;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ThGJ9N42BTqLwHZpxWBQCDRfQwLLucZgR8x6nmFeYOM=;
 b=bVdSARG+9BZCw9l/EBrNLChBVtDVESFgDsI3lVHNuqb8SPgWRgXVtiCX
 4jRGSfKQM0nQz+7aS0PVichT/AyKvjNX+0pYjVooQJrKf+9s1nRfx5oDr
 nDsElI9zjnZuDnEgdQcD0JRgwbXtlb86XFYn9ZxN1CcTURaBS1Znb37vO
 Gh/gIo5yLyZn+z7FGpDh14ZM9AQCnUPhzxrhVcn/aMEE8P9QzeNM3aE+f
 54RWWYqBv4l7Ce5maDV7tMeb9Nx+XkK3ZOf1dqKg8d3oC/N1T3GhQjuf9
 9DpkpxLD8rThtmuLLshxrE1wwJ5u52Q4ToThFc0i9U8xdztuxGZcm3f6Q A==;
X-CSE-ConnectionGUID: th7QANa7SSuBpGoRqNuYOQ==
X-CSE-MsgGUID: L/kIxYk8Q2CG/uWkMJJJvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58688696"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58688696"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 23:47:49 -0700
X-CSE-ConnectionGUID: aZPqBBdQRpeJPgvZ+06hLQ==
X-CSE-MsgGUID: nYMWpIrRSUekIg4HsOZ0KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170426127"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by fmviesa009.fm.intel.com with ESMTP; 27 Aug 2025 23:47:47 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2] drm/xe/uapi: Fix kernel-doc formatting for madvise and
 vma_query
Date: Thu, 28 Aug 2025 12:45:16 +0530
Message-Id: <20250828071516.3838110-1-himal.prasad.ghimiray@intel.com>
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

-v2
fix formatting (Matt/Lucas)

Fixes: 418807860e94 ("drm/xe/uapi: Add UAPI for querying VMA count and memory attributes")
Fixes: 231bb0ee7aa5 ("drm/xe/uapi: Add madvise interface")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 include/uapi/drm/xe_drm.h | 45 ++++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 7dedd45ab995..8386980041f1 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1997,21 +1997,21 @@ struct drm_xe_query_eu_stall {
  * union member is used to provide additional parameters for @type.
  *
  * Supported attribute types:
- * - DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC: Set preferred memory location.
- * - DRM_XE_MEM_RANGE_ATTR_ATOMIC: Set atomic access policy.
- * - DRM_XE_MEM_RANGE_ATTR_PAT: Set page attribute table index.
+ *  - DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC: Set preferred memory location.
+ *  - DRM_XE_MEM_RANGE_ATTR_ATOMIC: Set atomic access policy.
+ *  - DRM_XE_MEM_RANGE_ATTR_PAT: Set page attribute table index.
  *
  * Example:
  *
  * .. code-block:: C
  *
- * struct drm_xe_madvise madvise = {
- *          .vm_id = vm_id,
- *          .start = 0x100000,
- *          .range = 0x2000,
- *          .type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
- *          .atomic_val = DRM_XE_ATOMIC_DEVICE,
- *         };
+ *    struct drm_xe_madvise madvise = {
+ *         .vm_id = vm_id,
+ *         .start = 0x100000,
+ *         .range = 0x2000,
+ *         .type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
+ *         .atomic_val = DRM_XE_ATOMIC_DEVICE,
+ *     };
  *
  * ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);
  *
@@ -2042,12 +2042,12 @@ struct drm_xe_madvise {
 		 * Used when @type == DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC
 		 *
 		 * Supported values for @preferred_mem_loc.devmem_fd:
-		 * - DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE: set vram of faulting tile as preferred loc
-		 * - DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM: set smem as preferred loc
+		 *  - DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE: set vram of fault tile as preferred loc
+		 *  - DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM: set smem as preferred loc
 		 *
 		 * Supported values for @preferred_mem_loc.migration_policy:
-		 * - DRM_XE_MIGRATE_ALL_PAGES
-		 * - DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES
+		 *  - DRM_XE_MIGRATE_ALL_PAGES
+		 *  - DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES
 		 */
 		struct {
 #define DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE	0
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
+		 *  - DRM_XE_ATOMIC_UNDEFINED: Undefined or default behaviour.
+		 *    Support both GPU and CPU atomic operations for system allocator.
+		 *    Support GPU atomic operations for normal(bo) allocator.
+		 *
+		 *  - DRM_XE_ATOMIC_DEVICE: Support GPU atomic operations.
+		 *
+		 *  - DRM_XE_ATOMIC_GLOBAL: Support both GPU and CPU atomic operations.
+		 *
+		 *  - DRM_XE_ATOMIC_CPU: Support CPU atomic only, no GPU atomics supported.
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

