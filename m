Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7D5FB5189
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 03:04:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CBD10E33D;
	Tue,  7 Apr 2026 03:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bnzgGG1f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDD010E33D
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 03:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775531080; x=1807067080;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MzpOSv3JsE4T2nrY9oJSdoA8WMiPedAo8CcpHE3Po30=;
 b=bnzgGG1f7sEfyvnWKN0Eo2RYkxdFmxg+zu/ChR29ladp0yxaspYS8tdJ
 1ipNAA4D6jc3x08hBtYJFfFLnk1iiYVmmSvvXVeo2rBHPi4oYK/D0p4Mw
 v6NnjfJ49PgVL+6ytyEtlxgP5a1eQ8Kcc90IdFwh5GXG/6iCN6aLKpbrP
 GeSF587LlF1IICa7I1HKhPfPkNP7oTtHfFivxzT6iIw59n70hXpoG+Khu
 VNoNLeTG6vh5gxSsYaRkK0KUvnSAKCPUoDu5pCk2yZNWBnWJV0MNSAApu
 nZz0+haubeHVX8wC+yyeVU3IIjhYUOKKBnrx1y+gVQGT+CS0DB4HTy9ff A==;
X-CSE-ConnectionGUID: uyGSLIscQI6JOUjzayx1vA==
X-CSE-MsgGUID: N7Goa2NBRxSjL9Xz1lkx0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76201135"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="76201135"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 20:04:40 -0700
X-CSE-ConnectionGUID: Qs/44pMeTOKpa3vDcwKMhA==
X-CSE-MsgGUID: 6K28WhrCTcujapVfa2aLYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="225295078"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by fmviesa008.fm.intel.com with ESMTP; 06 Apr 2026 20:04:39 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
	Xin Wang <x.wang@intel.com>
Subject: [PATCH v3 2/6] drm/xe/uapi: Fix grammar errors in xe_drm.h
 documentation
Date: Tue,  7 Apr 2026 03:00:42 +0000
Message-ID: <20260407030046.3394004-3-shuicheng.lin@intel.com>
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

Fix various grammar issues in doc comments:
- flag are only valid -> flag is only valid
- should only ever used -> should only ever be used
- if isn't already -> if it isn't already
- Type of the this -> Type of this
- When sync passed in -> When sync is passed in
- the users responsibility -> the user's responsibility
- must qword aligned -> must be qword aligned
- for a observation -> for an observation
- a memory ranges -> memory ranges
- for each memory ranges -> for each memory range.
- Second ioctl call -> second ioctl call

Assisted-by: GitHub Copilot:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
Reviewed-by: Xin Wang <x.wang@intel.com>
---
 include/uapi/drm/xe_drm.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index f17355684083..1d3406416d8c 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1045,7 +1045,7 @@ struct drm_xe_vm_destroy {
  *    set, no mappings are created rather the range is reserved for CPU address
  *    mirroring which will be populated on GPU page faults or prefetches. Only
  *    valid on VMs with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The CPU address
- *    mirror flag are only valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
+ *    mirror flag is only valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
  *    handle MBZ, and the BO offset MBZ.
  *  - %DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET - Can be used in combination with
  *    %DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR to reset madvises when the underlying
@@ -1109,7 +1109,7 @@ struct drm_xe_vm_bind_op {
 	 *	ppGTT WT -> COH_NONE
 	 *	ppGTT WB -> COH_AT_LEAST_1WAY
 	 *
-	 * In practice UC/WC/WT should only ever used for scanout surfaces on
+	 * In practice UC/WC/WT should only ever be used for scanout surfaces on
 	 * such platforms (or perhaps in general for dma-buf if shared with
 	 * another device) since it is only the display engine that is actually
 	 * incoherent.  Everything else should typically use WB given that we
@@ -1366,7 +1366,7 @@ struct drm_xe_vm_get_property {
  *    drm_xe_pxp_session_type. %DRM_XE_PXP_TYPE_NONE is the default behavior, so
  *    there is no need to explicitly set that. When a queue of type
  *    %DRM_XE_PXP_TYPE_HWDRM is created, the PXP default HWDRM session
- *    (%XE_PXP_HWDRM_DEFAULT_SESSION) will be started, if isn't already running.
+ *    (%XE_PXP_HWDRM_DEFAULT_SESSION) will be started, if it isn't already running.
  *    The user is expected to query the PXP status via the query ioctl (see
  *    %DRM_XE_DEVICE_QUERY_PXP_STATUS) and to wait for PXP to be ready before
  *    attempting to create a queue with this property. When a queue is created
@@ -1546,7 +1546,7 @@ struct drm_xe_sync {
 #define DRM_XE_SYNC_TYPE_SYNCOBJ		0x0
 #define DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ	0x1
 #define DRM_XE_SYNC_TYPE_USER_FENCE		0x2
-	/** @type: Type of the this sync object */
+	/** @type: Type of this sync object */
 	__u32 type;
 
 #define DRM_XE_SYNC_FLAG_SIGNAL	(1 << 0)
@@ -1559,9 +1559,9 @@ struct drm_xe_sync {
 
 		/**
 		 * @addr: Address of user fence. When sync is passed in via exec
-		 * IOCTL this is a GPU address in the VM. When sync passed in via
+		 * IOCTL this is a GPU address in the VM. When sync is passed in via
 		 * VM bind IOCTL this is a user pointer. In either case, it is
-		 * the users responsibility that this address is present and
+		 * the user's responsibility that this address is present and
 		 * mapped when the user fence is signalled. Must be qword
 		 * aligned.
 		 */
@@ -1664,7 +1664,7 @@ struct drm_xe_wait_user_fence {
 	__u64 extensions;
 
 	/**
-	 * @addr: user pointer address to wait on, must qword aligned
+	 * @addr: user pointer address to wait on, must be qword aligned
 	 */
 	__u64 addr;
 
@@ -1769,7 +1769,7 @@ enum drm_xe_observation_ioctls {
 	/** @DRM_XE_OBSERVATION_IOCTL_ENABLE: Enable data capture for an observation stream */
 	DRM_XE_OBSERVATION_IOCTL_ENABLE = _IO('i', 0x0),
 
-	/** @DRM_XE_OBSERVATION_IOCTL_DISABLE: Disable data capture for a observation stream */
+	/** @DRM_XE_OBSERVATION_IOCTL_DISABLE: Disable data capture for an observation stream */
 	DRM_XE_OBSERVATION_IOCTL_DISABLE = _IO('i', 0x1),
 
 	/** @DRM_XE_OBSERVATION_IOCTL_CONFIG: Change observation stream configuration */
@@ -2373,12 +2373,12 @@ struct drm_xe_madvise {
  *
  * This structure is provided by userspace and filled by KMD in response to the
  * DRM_IOCTL_XE_VM_QUERY_MEM_RANGES_ATTRS ioctl. It describes memory attributes of
- * a memory ranges within a user specified address range in a VM.
+ * memory ranges within a user specified address range in a VM.
  *
  * The structure includes information such as atomic access policy,
  * page attribute table (PAT) index, and preferred memory location.
  * Userspace allocates an array of these structures and passes a pointer to the
- * ioctl to retrieve attributes for each memory ranges
+ * ioctl to retrieve attributes for each memory range.
  *
  * @extensions: Pointer to the first extension struct, if any
  * @start: Start address of the memory range
@@ -2443,7 +2443,7 @@ struct drm_xe_mem_range_attr {
  * If second call fails with -ENOSPC, it means memory ranges changed between
  * first call and now, retry IOCTL again with @num_mem_ranges = 0,
  * @sizeof_mem_ranges_attr = 0 and @vector_of_vma_mem_attr = NULL followed by
- * Second ioctl call.
+ * second ioctl call.
  *
  * Example:
  *
-- 
2.43.0

