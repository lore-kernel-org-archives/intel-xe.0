Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB7ACAC5A7
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 16:56:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DD510E078;
	Tue, 23 Sep 2025 16:56:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VhEuEC38";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E6710E078
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 16:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758646564; x=1790182564;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IzK42O096H9QFMeOZmdWWLfktns/FKiRmCyt8eHdDkM=;
 b=VhEuEC38IJGFMRS/DJhy6zI06EMv/bFN+jcHlKwyujJXxEfb7pRp8AGP
 IB2LW3lq368/Rju25LVzL6by6JXma5soITMqxWZ6pgOtGy2KR548QDX+t
 poZlenU7jD8HIM9iIDf98rMUQZJp4VlTlPd7fKdGctB3UcEzeUpbKIL8P
 R72yKEMuzcIsl0RWZ1WjuuzMOXppXcQ5qQcfh6BvoBKeawEROkcjnpZ85
 XpLci47miVzMA3maP1KlYJjbgqrdjIBHrANJDpsuwLmgTNOAb1SyLjvEu
 LyxWf2JK5Ajpcgz1gd9e5QAFWDpZq2ZpOYyfYgcKIzIXcwsg7O8drPEJj g==;
X-CSE-ConnectionGUID: 9Q2KlUXhQYCdaQau0y8cBQ==
X-CSE-MsgGUID: DbQd7MasR+6cr/fouIHFOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60856879"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="60856879"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 09:56:03 -0700
X-CSE-ConnectionGUID: C/VsbOBuRRa5l92nO0poPQ==
X-CSE-MsgGUID: wv9sSA1WTsOY+i0bBO6H6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="181982476"
Received: from dut4412lnl.fm.intel.com ([10.105.8.90])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 09:56:03 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com,
	saurabhg.gupta@intel.com,
	alex.zuo@intel.com
Subject: [PATCH] drm/xe/xe_vm: Remove unused DRM_GPUVA_OP_MAP case
Date: Tue, 23 Sep 2025 16:56:03 +0000
Message-ID: <20250923165602.71755-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

The function xe_vm_alloc_vma uses drm_gpuvm_sm_map_ops_create to
generate an operations list when is_madvise is false.  This function is
unable to generate DRM_GPUVA_OP_MAP operations (at least with the
settings it's provided in this execution path), so the check in
drm_gpuva_for_each_op when !is_madvise cannot ever be true.  Remove it.

Since this is the only location where the variable default_pat is used,
we can also remove that unused variable.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 80b7f13ecd80..7fea3eab7062 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4202,7 +4202,6 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 	bool is_cpu_addr_mirror = false;
 	bool remap_op = false;
 	struct xe_vma_mem_attr tmp_attr;
-	u16 default_pat;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
@@ -4228,17 +4227,10 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 			if (__op->op == DRM_GPUVA_OP_UNMAP) {
 				vma = gpuva_to_vma(op->base.unmap.va);
 				XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma));
-				default_pat = vma->attr.default_pat_index;
 			}
 
 			if (__op->op == DRM_GPUVA_OP_REMAP) {
 				vma = gpuva_to_vma(op->base.remap.unmap->va);
-				default_pat = vma->attr.default_pat_index;
-			}
-
-			if (__op->op == DRM_GPUVA_OP_MAP) {
-				op->map.is_cpu_addr_mirror = true;
-				op->map.pat_index = default_pat;
 			}
 		} else {
 			if (__op->op == DRM_GPUVA_OP_REMAP) {
-- 
2.43.0

