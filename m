Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C841AFB5188
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 03:04:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83ECB10E337;
	Tue,  7 Apr 2026 03:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jJESW+qa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EBE10E337
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 03:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775531077; x=1807067077;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XgO6o3ds6FVGzGA00HrMYzR8YKbHrsADiAfeaAuVyk4=;
 b=jJESW+qadYGE35vTxT1DLcxF1m9YNSwcJnoPWUEnu8mpCgYm8QWEDhIa
 bLDUX5qsrYi3MkTjvQ3j5DA0ZlzTpvQEe+YOQOhEIDOELCRQ8c/8ahv+y
 V71aZ76WQDUp/S1DdsINqimnzNcdfdLDlGTlcop98EndG/vW7NXwyySi5
 hl61JiW813Sn6CMtw84dJjg/vglbQbCgbJtsFDt5DcWj1vOhtwGdY0ces
 f2OPUIS4ZJiAZu3CvKJ0aCEgGUEPJ8BsA055YfTR4kmpd/nPb1VQm+jKa
 O3muqsgAN9m84Otd1C1WaSgiB3GbP6Um0+fKZENw8zeQE6K8NzO2zjnPY w==;
X-CSE-ConnectionGUID: 2QHnIxQcTGKCeqHnHGQljg==
X-CSE-MsgGUID: +0d2lgIrSxqVL9ifAQdtnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76201132"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="76201132"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 20:04:37 -0700
X-CSE-ConnectionGUID: 2QRPBtjsSaihPCSo+/JAIg==
X-CSE-MsgGUID: 2SsRJIHYRaa2db7hx7MOxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="225295069"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by fmviesa008.fm.intel.com with ESMTP; 06 Apr 2026 20:04:36 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
	Xin Wang <x.wang@intel.com>
Subject: [PATCH v3 1/6] drm/xe/uapi: Fix typos and spelling errors in xe_drm.h
 documentation
Date: Tue,  7 Apr 2026 03:00:41 +0000
Message-ID: <20260407030046.3394004-2-shuicheng.lin@intel.com>
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

Fix the following typos and spelling errors in doc comments:
- creaed -> created (drm_xe_query_config)
- mmaping -> mmapping (drm_xe_gem_create)
- 0xdeadbeaf -> 0xdeadbeef (drm_xe_gem_mmap_offset)
- x2 and xe3 platform -> Xe2 and Xe3 platforms
- flat -> flag (drm_xe_wait_user_fence)
- MONOTONIC_CLOCK -> CLOCK_MONOTONIC (correct POSIX name)
- neverending -> never ending (drm_xe_wait_user_fence)

Assisted-by: GitHub Copilot:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
Reviewed-by: Xin Wang <x.wang@intel.com>
---
 include/uapi/drm/xe_drm.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index ae2fda23ce7c..f17355684083 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -410,7 +410,7 @@ struct drm_xe_query_mem_regions {
  *      device supports the userspace hint %DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION.
  *      This is exposed only on Xe2+.
  *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_STATE_CACHE_PERF_FIX - Flag is set
- *      if a queue can be creaed with
+ *      if a queue can be created with
  *      %DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX
  *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
  *    required by this device, typically SZ_4K or SZ_64K
@@ -888,7 +888,7 @@ struct drm_xe_gem_create {
 #define DRM_XE_GEM_CPU_CACHING_WC                      2
 	/**
 	 * @cpu_caching: The CPU caching mode to select for this object. If
-	 * mmaping the object the mode selected here will also be used. The
+	 * mmapping the object the mode selected here will also be used. The
 	 * exception is when mapping system memory (including data evicted
 	 * to system) on discrete GPUs. The caching mode selected will
 	 * then be overridden to DRM_XE_GEM_CPU_CACHING_WB, and coherency
@@ -931,7 +931,7 @@ struct drm_xe_gem_create {
  *
  *     err = ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
  *     map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo.offset);
- *     map[i] = 0xdeadbeaf; // issue barrier
+ *     map[i] = 0xdeadbeef; // issue barrier
  */
 struct drm_xe_gem_mmap_offset {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -958,8 +958,8 @@ struct drm_xe_gem_mmap_offset {
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
@@ -1695,9 +1695,9 @@ struct drm_xe_wait_user_fence {
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
-- 
2.43.0

