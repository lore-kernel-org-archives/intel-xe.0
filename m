Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A84CAC5A8
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 07:32:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93CA210E666;
	Thu, 18 Sep 2025 07:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BlNHBY/y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF6610E664
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 07:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758180736; x=1789716736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LrfD6dSTmw39aAmBf8nFUHutVDWEkpBcpMiZMjCE+Oc=;
 b=BlNHBY/y5Gwd1Ott6/0jaEdKH10NUHv25I8/Z7WG67ur3saskrr3O7BM
 EBE0KgvYzwQKn0A6tThIa52LQxC3eYomQcul+By00ty9D1oghs7Zt80fT
 5+Tt2gNknAk3bkNY8wjhdqCedeqUk2pp4YtJs0o/KF7WqVQlxBUn1Yfwk
 c2nRWNIn1NSpO+RpMadoW/0wcNamSYrY24Y64dc+W14G1ase1cHdxZ4t1
 pTSzgLy+f3CVeq7fAQ5J8BvE/lOzyuMYmy++a0D6jGh0AAxBqDmTyyOEA
 8NbXV0HShk70Ocvqd4oEDivLxcnzYZqklDDWXz1LZqd+qTa5T2CdE8v7I A==;
X-CSE-ConnectionGUID: jGDHdzEcTwKgtPl4zEyQsQ==
X-CSE-MsgGUID: bR2PBwa9S9yanEnsNB4pSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71132720"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="71132720"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 00:32:16 -0700
X-CSE-ConnectionGUID: WvPYt6wAStW/kARbUXT0YQ==
X-CSE-MsgGUID: SZ4+4xVDR1SBlfzl+vTBfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="174587634"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by orviesa006.jf.intel.com with ESMTP; 18 Sep 2025 00:32:15 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 2/2] drm/xe/uapi: Enable madvise to pass multiple pat indeces
Date: Thu, 18 Sep 2025 13:30:03 +0530
Message-Id: <20250918080003.153906-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250918080003.153906-1-himal.prasad.ghimiray@intel.com>
References: <20250918080003.153906-1-himal.prasad.ghimiray@intel.com>
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

Allow users to pass multiple PAT indices via madvise, which can be used
to encode PTEs based on the actual memory location system memory, local
VRAM, or remote GPU memory.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c         |  7 +++--
 drivers/gpu/drm/xe/xe_vm_madvise.c | 33 ++++++++++++++++-------
 include/uapi/drm/xe_drm.h          | 42 +++++++++++++++++++++++++-----
 3 files changed, 62 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 6122061786f6..a4906ae94bd4 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2003,10 +2003,9 @@ static int get_mem_attrs(struct xe_vm *vm, u32 *num_vmas, u64 start,
 		attrs[i].start = xe_vma_start(vma);
 		attrs[i].end = xe_vma_end(vma);
 		attrs[i].atomic.val = vma->attr.atomic_access;
-
-		/* TODO: Modify drm_xe_mem_range_attr for all pats */
-		attrs[i].pat_index.val = vma->attr.pat_index.initial;
-
+		attrs[i].pat_index.smem = vma->attr.pat_index.smem;
+		attrs[i].pat_index.devmem = vma->attr.pat_index.devmem;
+		attrs[i].pat_index.remote = vma->attr.pat_index.remote;
 		attrs[i].preferred_mem_loc.devmem_fd = vma->attr.preferred_loc.devmem_fd;
 		attrs[i].preferred_mem_loc.migration_policy =
 		vma->attr.preferred_loc.migration_policy;
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index e3f0cf23a3a9..3116036e6d24 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -149,16 +149,15 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
 	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_PAT);
 
 	for (i = 0; i < num_vmas; i++) {
-		/*TODO : Pass different pat_indexes from ioctl */
-		if (vmas[i]->attr.pat_index.smem == op->pat_index.val &&
-		    vmas[i]->attr.pat_index.devmem == op->pat_index.val &&
-		    vmas[i]->attr.pat_index.remote == op->pat_index.val) {
+		if (vmas[i]->attr.pat_index.smem == op->pat_index.smem &&
+		    vmas[i]->attr.pat_index.devmem == op->pat_index.devmem &&
+		    vmas[i]->attr.pat_index.remote == op->pat_index.remote) {
 			vmas[i]->skip_invalidation = true;
 		} else {
 			vmas[i]->skip_invalidation = false;
-			vmas[i]->attr.pat_index.smem = op->pat_index.val;
-			vmas[i]->attr.pat_index.devmem = op->pat_index.val;
-			vmas[i]->attr.pat_index.remote =  op->pat_index.val;
+			vmas[i]->attr.pat_index.smem = op->pat_index.smem;
+			vmas[i]->attr.pat_index.devmem = op->pat_index.devmem;
+			vmas[i]->attr.pat_index.remote =  op->pat_index.remote;
 		}
 	}
 }
@@ -273,12 +272,26 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
 		break;
 	case DRM_XE_MEM_RANGE_ATTR_PAT:
 	{
-		u16 coh_mode = xe_pat_index_get_coh_mode(xe, args->pat_index.val);
+		u16 coh_mode_smem = xe_pat_index_get_coh_mode(xe, args->pat_index.smem);
+		u16 coh_mode_devmem = xe_pat_index_get_coh_mode(xe, args->pat_index.devmem);
+		u16 coh_mode_remote = xe_pat_index_get_coh_mode(xe, args->pat_index.remote);
 
-		if (XE_IOCTL_DBG(xe, !coh_mode))
+		if (XE_IOCTL_DBG(xe, !coh_mode_smem))
 			return false;
 
-		if (XE_WARN_ON(coh_mode > XE_COH_AT_LEAST_1WAY))
+		if (XE_IOCTL_DBG(xe, !coh_mode_devmem))
+			return false;
+
+		if (XE_IOCTL_DBG(xe, !coh_mode_remote))
+			return false;
+
+		if (XE_WARN_ON(coh_mode_smem > XE_COH_AT_LEAST_1WAY))
+			return false;
+
+		if (XE_WARN_ON(coh_mode_devmem > XE_COH_AT_LEAST_1WAY))
+			return false;
+
+		if (XE_WARN_ON(coh_mode_remote > XE_COH_AT_LEAST_1WAY))
 			return false;
 
 		if (XE_IOCTL_DBG(xe, args->pat_index.pad))
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 40ff19f52a8d..09d9a9cf02e8 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -2101,11 +2101,26 @@ struct drm_xe_madvise {
 		 * Used when @type == DRM_XE_MEM_RANGE_ATTR_PAT.
 		 */
 		struct {
-			/** @pat_index.val: PAT index value */
-			__u32 val;
+			/**
+			 * @pat_index.smem: PAT index value to be used when
+			 * location is system memory during GPU access time.
+			 */
+			__u16 smem;
+
+			/**
+			 * @pat_index.devmem: PAT index value to be used when
+			 * location is local vram during GPU access time.
+			 */
+			__u16 devmem;
+
+			/**
+			 * @pat_index.remote: PAT index value to be used when
+			 * location is remote gpu vram during GPU access time.
+			 */
+			__u16 remote;
 
 			/** @pat_index.pad: MBZ */
-			__u32 pad;
+			__u16 pad;
 
 			/** @pat_index.reserved: Reserved */
 			__u64 reserved;
@@ -2163,11 +2178,26 @@ struct drm_xe_mem_range_attr {
 
 	 /** @pat_index: Page attribute table index */
 	struct {
-		/** @pat_index.val: PAT index */
-		__u32 val;
+		/**
+		 * @pat_index.smem: PAT index value to be used when
+		 * location is system memory during GPU access time.
+		 */
+		__u16 smem;
+
+		/**
+		 * @pat_index.devmem: PAT index value to be used when
+		 * location is local vram during GPU access time.
+		 */
+		__u16 devmem;
+
+		/**
+		 * @pat_index.remote: PAT index value to be used when
+		 * location is remote gpu tiles during GPU access time.
+		 */
+		__u16 remote;
 
 		/** @pat_index.reserved: Reserved */
-		__u32 reserved;
+		__u16 reserved;
 	} pat_index;
 
 	/** @reserved: Reserved */
-- 
2.34.1

