Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6789AC3ABCC
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 16:22:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34EDF10E456;
	Mon, 12 May 2025 16:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l5XewZ6F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBE010E461
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 16:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747066960; x=1778602960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UDUoLKd6mLzlexaS8CYuSM9PDLWZihIoTWsS3VHmeXU=;
 b=l5XewZ6F+VnHw8BY9yur5VZOLqMJNyUMNnc8aWsXrLkvST6HMfgBk6Aq
 4xdO40dY8m/amS02cHTJsCvrNitKne05DE0N00JOo0xuu9/K8zsg2hbxc
 KXbx7M1zlywP6bPXf8Ahb2lAspqtL9YdRfDa98vRowshCl/qfqRxId8dM
 hwQYk+8umMxYcG5MTyfYC4uBDZVBLt+HIWVP6X7E3zPMOfTF/R4+65PHw
 8wr4oGQ8lelkPDjfVDyECKZC/7y6RJXAPtzn2IyC3wmBrAVfyrc7KQlAc
 tnbnFtNp2H1xlK8iB8pFcEoztCoITRkQZq4is73Q6UtaJCCWNVO9R7U20 A==;
X-CSE-ConnectionGUID: Ue3ftwKhSS6czf4FDowA3Q==
X-CSE-MsgGUID: uhnlscHTTVCaOPV6BsOOog==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="59508111"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="59508111"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 09:22:40 -0700
X-CSE-ConnectionGUID: yGPac76BQ1mKsFWr2qEbow==
X-CSE-MsgGUID: FLKoVqJGQdGNWpkR/D4RGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="142532765"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa005.jf.intel.com with ESMTP; 12 May 2025 09:22:38 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v7 12/20] drm/xe/vm: Add an identifier in xe_vma_ops for svm
 prefetch
Date: Mon, 12 May 2025 22:17:32 +0530
Message-Id: <20250512164740.466852-13-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250512164740.466852-1-himal.prasad.ghimiray@intel.com>
References: <20250512164740.466852-1-himal.prasad.ghimiray@intel.com>
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

Add a flag in xe_vma_ops to determine whether it has svm prefetch ops or
not.

v2:
 - s/false/0 (Matthew Brost)

v3:
 - s/XE_VMA_OPS_HAS_SVM_PREFETCH/XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 1 +
 drivers/gpu/drm/xe/xe_vm_types.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f4382386b34c..21564ecf8765 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3240,6 +3240,7 @@ static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm *vm,
 	vops->q = q;
 	vops->syncs = syncs;
 	vops->num_syncs = num_syncs;
+	vops->flags = 0;
 }
 
 static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 0afd0296a57e..bfc145baad49 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -445,6 +445,9 @@ struct xe_vma_ops {
 	u32 num_syncs;
 	/** @pt_update_ops: page table update operations */
 	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
+	/** @flag: signify the properties within xe_vma_ops*/
+#define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
+	u32 flags;
 #ifdef TEST_VM_OPS_ERROR
 	/** @inject_error: inject error to test error handling */
 	bool inject_error;
-- 
2.34.1

