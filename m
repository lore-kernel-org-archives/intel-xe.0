Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF26FB5189
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 03:04:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC54F10E335;
	Tue,  7 Apr 2026 03:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mcr2IiOg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4579C10E335
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 03:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775531089; x=1807067089;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dph0BFmHouh8KUPAbEZZgAL3pJr37KW0eRDb2FuKUeY=;
 b=mcr2IiOgVEKIX4HZEpkSYkV/XsPAJ2I7UtidBdkoRQBSQdiVbGhfWkUJ
 6dfbCbebUzDUjstwWsYYHliNJbrZJ4CidljlAh+PwuNoD7+p4Ck07VYxM
 DPxPApFswl/Khwz9n/UMtBooGGFzPZ40DxYtufPjBLIGx/8nU+efIK1ow
 KbIAJRFor4GMNm4WhBDd8Nb5LNVs1gYFpnylhfhT07UrWISBVcMPowsp4
 8GUZVDjb8D5qDs+sCDdzE/hFrA0k1WHh/o5Wz6U9++hcKXqWK4UDOMq3O
 wD232tZuOhAwCox2ii8APdKXsb5MlSj1BF0TbV5dkgvjCQl3qaiZ6oKCt Q==;
X-CSE-ConnectionGUID: RM+uN1ksQWG3XtZzstbJqg==
X-CSE-MsgGUID: SXk1x5I/SK6PAkONuUdR6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76201147"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="76201147"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 20:04:49 -0700
X-CSE-ConnectionGUID: 7XF0Dr9lSAuFtHSgU38PKQ==
X-CSE-MsgGUID: pbp/Bz8IQMiosSCWT4d0+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="225295111"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by fmviesa008.fm.intel.com with ESMTP; 06 Apr 2026 20:04:48 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
	Xin Wang <x.wang@intel.com>
Subject: [PATCH v3 6/6] drm/xe/uapi: Fix doc formatting and completeness in
 xe_drm.h
Date: Tue,  7 Apr 2026 03:00:46 +0000
Message-ID: <20260407030046.3394004-7-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260407030046.3394004-1-shuicheng.lin@intel.com>
References: <20260407030046.3394004-1-shuicheng.lin@intel.com>
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

- Fix missing leading space before closing */ in
  comment block
- Add DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY to the
  IOCTL overview list
- Add missing query types to the device query doc list:
  DRM_XE_DEVICE_QUERY_UC_FW_VERSION,
  DRM_XE_DEVICE_QUERY_OA_UNITS,
  DRM_XE_DEVICE_QUERY_EU_STALL
- Fix ioctl's -> ioctls (not possessive, 2 occurrences)
- Remove duplicate parameter docs from
  drm_xe_mem_range_attr overview (already documented
  as inline member comments)
- Fix extra whitespace before /** on 2 lines in
  drm_xe_mem_range_attr
- Add missing blank line before DRM_XE_VM_BIND_FLAG_DECOMPRESS
  bullet to fix RST block quote warning

v3: more fix (item 4 to 7).

Assisted-by: GitHub Copilot:claude-opus-4.6
Cc: Xin Wang <x.wang@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 include/uapi/drm/xe_drm.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 58614f62d65b..48e9f1fdb78d 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -83,6 +83,7 @@ extern "C" {
  *  - &DRM_IOCTL_XE_OBSERVATION
  *  - &DRM_IOCTL_XE_MADVISE
  *  - &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
+ *  - &DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
  *  - &DRM_IOCTL_XE_VM_GET_PROPERTY
  */
 
@@ -167,7 +168,7 @@ extern "C" {
  * Typically the struct drm_xe_user_extension would be embedded in some uAPI
  * struct, and in this case we would feed it the head of the chain(i.e ext1),
  * which would then apply all of the above extensions.
-*/
+ */
 
 /**
  * struct drm_xe_user_extension - Base class for defining a chain of extensions
@@ -705,7 +706,10 @@ struct drm_xe_query_pxp_status {
  *    attributes.
  *  - %DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
  *  - %DRM_XE_DEVICE_QUERY_ENGINE_CYCLES
+ *  - %DRM_XE_DEVICE_QUERY_UC_FW_VERSION
+ *  - %DRM_XE_DEVICE_QUERY_OA_UNITS
  *  - %DRM_XE_DEVICE_QUERY_PXP_STATUS
+ *  - %DRM_XE_DEVICE_QUERY_EU_STALL
  *
  * If size is set to 0, the driver fills it with the required size for
  * the requested type of data to query. If size is equal to the required
@@ -1060,6 +1064,7 @@ struct drm_xe_vm_destroy {
  *    not invoke autoreset. Neither will stack variables going out of scope.
  *    Therefore it's recommended to always explicitly reset the madvises when
  *    freeing the memory backing a region used in a &DRM_IOCTL_XE_MADVISE call.
+ *
  *  - %DRM_XE_VM_BIND_FLAG_DECOMPRESS - Request on-device decompression for a MAP.
  *    When set on a MAP bind operation, request the driver schedule an on-device
  *    in-place decompression (via the migrate/resolve path) for the GPU mapping
@@ -1760,10 +1765,10 @@ struct drm_xe_observation_param {
 };
 
 /**
- * enum drm_xe_observation_ioctls - Observation stream fd ioctl's
+ * enum drm_xe_observation_ioctls - Observation stream fd ioctls
  *
  * Information exchanged between userspace and kernel for observation fd
- * ioctl's is stream type specific
+ * ioctls is stream type specific
  */
 enum drm_xe_observation_ioctls {
 	/** @DRM_XE_OBSERVATION_IOCTL_ENABLE: Enable data capture for an observation stream */
@@ -2379,14 +2384,9 @@ struct drm_xe_madvise {
  * page attribute table (PAT) index, and preferred memory location.
  * Userspace allocates an array of these structures and passes a pointer to the
  * ioctl to retrieve attributes for each memory range.
- *
- * @extensions: Pointer to the first extension struct, if any
- * @start: Start address of the memory range
- * @end: End address of the virtual memory range
- *
  */
 struct drm_xe_mem_range_attr {
-	 /** @extensions: Pointer to the first extension struct, if any */
+	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
 	/** @start: start of the memory range */
@@ -2413,7 +2413,7 @@ struct drm_xe_mem_range_attr {
 		__u32 reserved;
 	} atomic;
 
-	 /** @pat_index: Page attribute table index */
+	/** @pat_index: Page attribute table index */
 	struct {
 		/** @pat_index.val: PAT index */
 		__u32 val;
-- 
2.43.0

