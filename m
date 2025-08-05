Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE5BC87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 22:07:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6B410E3A2;
	Tue,  5 Aug 2025 22:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rsc1pTe7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF7D10E6E4
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 22:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754431619; x=1785967619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DJmnKfivdqV7REQs2zAy3ml9qooW7TBrHI1K0i0Bitc=;
 b=Rsc1pTe7CoKHjIwXmz1MLEe8Jy8/ugepkzcY5f/dm/DJTvijfOyulqVL
 LAFUItU9sZunmqmVTc4RHHd8SmcRdxcV71H87TOq8X/izPoprcN4z1ZMd
 u1VcPVvSprbtNCFNUD9j5ZW770D40FI+Uo+cl4MixgVLFwjjHb2Mvv8Kl
 QvcIKOl+oVzmGBlOF5xwteiAWvpMRGtS80fkYmjjxlWTA+bsWoota57tp
 YkNi175fCQa0cXkepWRMYjHad5CbgJN41b7KqRU5guWItxHFZ4Banw/4n
 AAe/nPM84gAJqn8GCP/QRL9aZRSzQ5q0WMhUqm/L4aoN3oRt0BXnNakxw A==;
X-CSE-ConnectionGUID: p1iMSstqS16nS+A3ymWxUQ==
X-CSE-MsgGUID: k37z/gFYRoKF7tyQMpmH3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56885227"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="56885227"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 15:06:58 -0700
X-CSE-ConnectionGUID: VvJNIGcDRte7vdnoz1XTHg==
X-CSE-MsgGUID: iXLzeWu0TBG94tEDGnx4Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164622551"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 15:06:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	himal.prasad.ghimiray@intel.com
Subject: [PATCH v2 1/1] drm/xe: Disable compression on SVM
Date: Tue,  5 Aug 2025 15:06:53 -0700
Message-Id: <20250805220653.745400-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805220653.745400-1-matthew.brost@intel.com>
References: <20250805220653.745400-1-matthew.brost@intel.com>
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

This is not yet supported, forcefully disable by setting pat_index to
zero for CPU address mirror VMAs.

v2:
 - Use XE_CACHE_WB (Auld)
 - Only modify pat_index if compressed (Himal)

Cc: stable@vger.kernel.org
Fixes: b43e864af0d4 ("drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 10 ++++++++++
 drivers/gpu/drm/xe/xe_pat.h | 10 ++++++++++
 drivers/gpu/drm/xe/xe_vm.c  |  7 ++++++-
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 2e7cb99ae87a..ac1767c812aa 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -154,6 +154,16 @@ static const struct xe_pat_table_entry xe2_pat_table[] = {
 static const struct xe_pat_table_entry xe2_pat_ats = XE2_PAT( 0, 0, 0, 0, 3, 3 );
 static const struct xe_pat_table_entry xe2_pat_pta = XE2_PAT( 0, 0, 0, 0, 3, 0 );
 
+bool xe_pat_index_get_comp_mode(struct xe_device *xe, u16 pat_index)
+{
+	WARN_ON(pat_index >= xe->pat.n_entries);
+
+	if (xe->pat.table != xe2_pat_table)
+		return false;
+
+	return xe->pat.table[pat_index].value & XE2_COMP_EN;
+}
+
 u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
 {
 	WARN_ON(pat_index >= xe->pat.n_entries);
diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
index fa0dfbe525cd..8be2856a73af 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -58,4 +58,14 @@ void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
  */
 u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
 
+/**
+ * xe_pat_index_get_comp_mode() = Extract the compression mode for the given
+ * pat_index.
+ * @xe: xe device
+ * @pat_index: The pat_index to query
+ *
+ * Return: True if pat_index is compressed, False otherwise
+ */
+bool xe_pat_index_get_comp_mode(struct xe_device *xe, u16 pat_index);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 432ea325677d..83f507ea7f30 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2362,7 +2362,12 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			op->map.is_cpu_addr_mirror = flags &
 				DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
 			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
-			op->map.pat_index = pat_index;
+			/* XXX: We don't support SVM + compression yet */
+			if (op->map.is_cpu_addr_mirror &&
+			    xe_pat_index_get_comp_mode(vm->xe, pat_index))
+				op->map.pat_index = vm->xe->pat.idx[XE_CACHE_WB];
+			else
+				op->map.pat_index = pat_index;
 			op->map.invalidate_on_bind =
 				__xe_vm_needs_clear_scratch_pages(vm, flags);
 		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
-- 
2.34.1

