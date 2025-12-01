Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11D1D111A8
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 05:54:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6761B10E116;
	Mon,  1 Dec 2025 05:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ihVrmsv0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3655A10E2AA
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 05:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764568443; x=1796104443;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4xcsuaYNRoNRrWINVPYCLswYK2mhYMSwfR7A21M18U8=;
 b=ihVrmsv0GYhHoF+AN4EUEPMbJcPJRm/Cfhp7lWIY3W2yhDCu4U63tFjd
 2nA0k4b0340OlUdDtmmSdc0Yrm7Y7lmI3VYCFru6lKUNCoCyFOcw4K4Le
 qNAIWZ9qdwAhKoX5njNACSttXOjG6ladell1TgrdmCkU9+pTR9V6GmkJy
 DIarHCKhF8sezh2BFTg5HViUOoAKCAINiY2UW1ecozP/PLbePgH/upvSC
 v6V+fU9CO7Iv5SAcQn7ZFdhGSmc354I+COOnCrH4O+1QIxh16cEq/foVe
 b8X0biJivXeUeQWNOWgFUzKkfRHKzo94kXH6+/bgws5qj5eKXIJDxeX5T A==;
X-CSE-ConnectionGUID: 5KGksHVTTk2jw+xXOAmwpw==
X-CSE-MsgGUID: dLJ1qcW4SmCcOnpmvYRcpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66457396"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66457396"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 21:54:03 -0800
X-CSE-ConnectionGUID: hGQ7/cavTbOKLXuli8oeDA==
X-CSE-MsgGUID: TI/hX0QfRZqkrchPD/mZRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="224950848"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 21:54:01 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [RFC v2 9/9] drm/xe: Add support for querying purgeable BO states
Date: Mon,  1 Dec 2025 11:20:19 +0530
Message-ID: <20251201055309.854074-10-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201055309.854074-1-arvind.yadav@intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
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

Add support for querying purgeable buffer object states through the
XE_VM_QUERY_MEM_RANGE_ATTRS ioctl. This allows userspace to determine
the current purgeable state of BO:
  - WILLNEED (0): BO actively needed, has backing store
  - DONTNEED (1): BO eligible for purging, still valid
  - PURGED (2): BO purged by kernel, backing store freed

v2:
  - Initialize purge_state_val for non-BO VMAs to avoid leaking kernel data.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index cc946bff9607..fd0550d901c6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2023,6 +2023,7 @@ static int get_mem_attrs(struct xe_vm *vm, u32 *num_vmas, u64 start,
 
 	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
 		struct xe_vma *vma = gpuva_to_vma(gpuva);
+		struct xe_bo *bo;
 
 		if (i == *num_vmas)
 			return -ENOSPC;
@@ -2035,6 +2036,12 @@ static int get_mem_attrs(struct xe_vm *vm, u32 *num_vmas, u64 start,
 		attrs[i].preferred_mem_loc.migration_policy =
 		vma->attr.preferred_loc.migration_policy;
 
+		bo = xe_vma_bo(vma);
+		if (bo)
+			attrs[i].purge_state_val.val = atomic_read(&bo->madv_purgeable);
+		else /* Non-BO VMAs (userptr, null) have no purgeable state */
+			attrs[i].purge_state_val.val = DRM_XE_VMA_PURGEABLE_STATE_WILLNEED;
+
 		i++;
 	}
 
-- 
2.43.0

