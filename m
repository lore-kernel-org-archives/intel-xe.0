Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2430EECD999
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 20:06:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA35F10E02F;
	Thu,  5 Feb 2026 20:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MwAkia3v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB37510E02F
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 20:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770322015; x=1801858015;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=46qzRQwTPl3WMYPp3K2K9+4RcRnmaxw0vqEOtz73dGA=;
 b=MwAkia3vqR96Jon20Vc4q56YDS+1Xdw+q0qpgLJSjjDaNLmgxSS0jtza
 VwDt5jlmgebjrCDhJg8ljEJqu8Rny/fAng5+TAmY0JyqpC7b04HBwYlpD
 iuPyJKRBGG85Prs3J2sS9N00Ie5hi6GPG/Ja/T6mjznURlOT+zZWZKwLt
 0q7KAssb83Y95jn26ZwKGNDCphAlalSfs3O0IRQ21agNtHLIkMYMj1sKH
 giscYGCOkmHmt+3kjksoMU3fi8JDl9Qn8i9X+sO/E0r291yccA4GYTo7/
 C+17gzSb0x5Sq+4C9d8PDfYi039cFOSo5jvwwahrJdcO3EDbqjsp8VeuG Q==;
X-CSE-ConnectionGUID: fcehWP4yTN2WmdLptcQa9A==
X-CSE-MsgGUID: Z1QyscT9TSqePJ93SCh1OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="75380264"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="75380264"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 12:06:54 -0800
X-CSE-ConnectionGUID: G3kM0tOQT8uUMLhXpH3gVA==
X-CSE-MsgGUID: 8CSg65XnRGSbwZIBYKurQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="248263893"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa001.jf.intel.com with ESMTP; 05 Feb 2026 12:06:53 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe/uapi: Update xe_drm.h documentation
Date: Thu,  5 Feb 2026 20:03:31 +0000
Message-ID: <20260205200330.1509354-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
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

Add missing ioctl/query items in the top-level comment and fix multiple
typos in UAPI docs (mmaping/mmapping, x2/Xe2, missing "be", "the", "flag",
CLOCK_MONOTONIC, never ending, ioctls, uuid format).

Here is the detail change:
1. Add missing ioctl list entry for DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
2. Add missing query list entries: DRM_XE_DEVICE_QUERY_UC_FW_VERSION,
   DRM_XE_DEVICE_QUERY_OA_UNITS, DRM_XE_DEVICE_QUERY_EU_STALL
3. Fix "mmaping" -> "mmapping"
4. Clarify VM flag exception: "x2/xe3" -> "Xe2/Xe3"
5. Fix grammar: "should only ever used" -> "should only ever be used"
6. Fix typo: "Type of the this" -> "Type of this"
7. Remove stale DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP mention
8. Fix wait flag typo and clock name: "flat" -> "flag", "MONOTONIC_CLOCK"
   -> "CLOCK_MONOTONIC"
9. Fix "neverending" -> "never ending"
10. Fix "ioctl’s" -> "ioctls" in observation enum comments
11. Fix UUID format string escaping in comment (%08x-%04x-%04x-%04x-%012x)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 include/uapi/drm/xe_drm.h | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 077e66a682e2..c8613101b0a7 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -83,6 +83,7 @@ extern "C" {
  *  - &DRM_IOCTL_XE_OBSERVATION
  *  - &DRM_IOCTL_XE_MADVISE
  *  - &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
+ *  - &DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
  */
 
 /*
@@ -703,7 +704,10 @@ struct drm_xe_query_pxp_status {
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
@@ -886,7 +890,7 @@ struct drm_xe_gem_create {
 #define DRM_XE_GEM_CPU_CACHING_WC                      2
 	/**
 	 * @cpu_caching: The CPU caching mode to select for this object. If
-	 * mmaping the object the mode selected here will also be used. The
+	 * mmapping the object the mode selected here will also be used. The
 	 * exception is when mapping system memory (including data evicted
 	 * to system) on discrete GPUs. The caching mode selected will
 	 * then be overridden to DRM_XE_GEM_CPU_CACHING_WB, and coherency
@@ -956,8 +960,8 @@ struct drm_xe_gem_mmap_offset {
  *  - %DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE - Map the whole virtual address
  *    space of the VM to scratch page. A vm_bind would overwrite the scratch
  *    page mapping. This flag is mutually exclusive with the
- *    %DRM_XE_VM_CREATE_FLAG_FAULT_MODE flag, with an exception of on x2 and
- *    xe3 platform.
+ *    %DRM_XE_VM_CREATE_FLAG_FAULT_MODE flag, with an exception on Xe2 and
+ *    Xe3 platforms.
  *  - %DRM_XE_VM_CREATE_FLAG_LR_MODE - An LR, or Long Running VM accepts
  *    exec submissions to its exec_queues that don't have an upper time
  *    limit on the job execution time. But exec submissions to these
@@ -1094,7 +1098,7 @@ struct drm_xe_vm_bind_op {
 	 *	ppGTT WT -> COH_NONE
 	 *	ppGTT WB -> COH_AT_LEAST_1WAY
 	 *
-	 * In practice UC/WC/WT should only ever used for scanout surfaces on
+	 * In practice UC/WC/WT should only ever be used for scanout surfaces on
 	 * such platforms (or perhaps in general for dma-buf if shared with
 	 * another device) since it is only the display engine that is actually
 	 * incoherent.  Everything else should typically use WB given that we
@@ -1441,7 +1445,7 @@ struct drm_xe_sync {
 #define DRM_XE_SYNC_TYPE_SYNCOBJ		0x0
 #define DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ	0x1
 #define DRM_XE_SYNC_TYPE_USER_FENCE		0x2
-	/** @type: Type of the this sync object */
+	/** @type: Type of this sync object */
 	__u32 type;
 
 #define DRM_XE_SYNC_FLAG_SIGNAL	(1 << 0)
@@ -1546,7 +1550,6 @@ struct drm_xe_exec {
  *
  * and the @flags can be:
  *  - %DRM_XE_UFENCE_WAIT_FLAG_ABSTIME
- *  - %DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP
  *
  * The @mask values can be for example:
  *  - 0xffu for u8
@@ -1590,9 +1593,9 @@ struct drm_xe_wait_user_fence {
 	 * Without DRM_XE_UFENCE_WAIT_FLAG_ABSTIME flag set (relative timeout)
 	 * it contains timeout expressed in nanoseconds to wait (fence will
 	 * expire at now() + timeout).
-	 * When DRM_XE_UFENCE_WAIT_FLAG_ABSTIME flat is set (absolute timeout) wait
-	 * will end at timeout (uses system MONOTONIC_CLOCK).
-	 * Passing negative timeout leads to neverending wait.
+	 * When DRM_XE_UFENCE_WAIT_FLAG_ABSTIME flag is set (absolute timeout) wait
+	 * will end at timeout (uses system CLOCK_MONOTONIC).
+	 * Passing negative timeout leads to never ending wait.
 	 *
 	 * On relative timeout this value is updated with timeout left
 	 * (for restarting the call in case of signal delivery).
@@ -1655,10 +1658,10 @@ struct drm_xe_observation_param {
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
@@ -1916,7 +1919,7 @@ struct drm_xe_oa_config {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-	/** @uuid: String formatted like "%\08x-%\04x-%\04x-%\04x-%\012x" */
+	/** @uuid: String formatted like "%08x-%04x-%04x-%04x-%012x" */
 	char uuid[36];
 
 	/** @n_regs: Number of regs in @regs_ptr */
-- 
2.50.1

