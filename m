Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A91C282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 12:19:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B64910E41A;
	Mon, 10 Mar 2025 12:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xdfn0rd0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA29510E41A
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 12:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741609188; x=1773145188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PjIRKqQE+d0yQGsrc2u76BNqB8jjNQYXMubu/A3p4jw=;
 b=Xdfn0rd0x76g1oaa+EACFQMAH6/vsP2jE059zbRZEh1F2VdIS8cZ9wKX
 so6wrLc8XU70q0utuNFtBxtldWPo6yUgS0C2A6asWr6cadZ1ph8M9aiwM
 8P4oEGaO1q2+Bg3wZqluP2hSsIyUon0cfCPL4ftSgv+uSIHHChwLrmTVU
 9pfWpexXEJneJ6IBPVvatG3Mf7ct+svWLfC6y8fTi9pOMOwuWgmPf2+8A
 pYnkcPEeDeFR6Na5l3Wh0eeheXaXX19hi/p7B9tiAPc6Iurd8havu9NLz
 kkOVA9bjUeEG86ygjy6mbntxU+m6y56pWJPTE0tezuq2PpeX0JB4wRwiN A==;
X-CSE-ConnectionGUID: BrPmHGEvT5C7DEbi0WMtHw==
X-CSE-MsgGUID: GvvhTvdnTKqGOP0AEnBMew==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="65056431"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="65056431"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 05:19:48 -0700
X-CSE-ConnectionGUID: UmpN5I25TwWIQCoL6YEWoQ==
X-CSE-MsgGUID: ee66kSFfTQqIBlcRzFt++A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="143179096"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 10 Mar 2025 05:19:46 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 oak.zeng@intel.com, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 07/12] drm/xe/vm: Add an identifier in xe_vma_ops for svm
 prefetch
Date: Mon, 10 Mar 2025 18:13:36 +0530
Message-Id: <20250310124341.1819568-8-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310124341.1819568-1-himal.prasad.ghimiray@intel.com>
References: <20250310124341.1819568-1-himal.prasad.ghimiray@intel.com>
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

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 1 +
 drivers/gpu/drm/xe/xe_vm_types.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8c74b5f467ea..3dd08dd5e6d5 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3218,6 +3218,7 @@ static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm *vm,
 	vops->q = q;
 	vops->syncs = syncs;
 	vops->num_syncs = num_syncs;
+	vops->flags = false;
 }
 
 static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 93224a87ab03..0b02a37bd2f3 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -443,6 +443,9 @@ struct xe_vma_ops {
 	u32 num_syncs;
 	/** @pt_update_ops: page table update operations */
 	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
+	/** @flag: signify the properties within xe_vma_ops*/
+#define XE_VMA_OPS_HAS_SVM_PREFETCH BIT(0)
+	u32 flags;
 #ifdef TEST_VM_OPS_ERROR
 	/** @inject_error: inject error to test error handling */
 	bool inject_error;
-- 
2.34.1

