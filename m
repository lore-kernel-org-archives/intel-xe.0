Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C7BC3ABCB
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 03:37:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0A510E4DB;
	Tue, 13 May 2025 03:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HEYRs7Lf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B08310E4D9
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 03:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747107434; x=1778643434;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UDUoLKd6mLzlexaS8CYuSM9PDLWZihIoTWsS3VHmeXU=;
 b=HEYRs7LfpdVScJ0J+7YyhT9Qr1Jnt15Hq8LDP6JxZpsjR228lCBpmLld
 9fse8tebLoz46NlWX33Ra5JN03JWldyf6GENi065/tA9kl0ts/M9jnZ41
 y3TEudmpraB944bNS3EnajlMFN+aRdlNDQ2qZw57Zbn5AfWffwWlt0m8M
 MDfTpAuVztZmkvmCPx+Mh7V3Fj4s4D8jKPwNhqIMGpvUiHLxOQCB5uAHi
 vuzy/WMh5zJrruywaMbfQYpfOrMopqkHqKoHzzlJuw0WPe8Qt01S/wATm
 M3BmDLGEFs6DU99tOVb+UwV2yZkebjB2gw2lUJ2rakNNuxGp/8HkCdL3c g==;
X-CSE-ConnectionGUID: 8pfEBqUeTQq02IyibSOUrw==
X-CSE-MsgGUID: AFbPsKqnSBurKBuAQhIKEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48858821"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="48858821"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 20:37:13 -0700
X-CSE-ConnectionGUID: rl+R5I7fT3SSsO4biQd6Nw==
X-CSE-MsgGUID: MMreAKk9R8iKX5FRIzoMcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="142690220"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa005.jf.intel.com with ESMTP; 12 May 2025 20:37:13 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v8 07/15] drm/xe/vm: Add an identifier in xe_vma_ops for svm
 prefetch
Date: Tue, 13 May 2025 09:32:20 +0530
Message-Id: <20250513040228.470682-8-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513040228.470682-1-himal.prasad.ghimiray@intel.com>
References: <20250513040228.470682-1-himal.prasad.ghimiray@intel.com>
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

