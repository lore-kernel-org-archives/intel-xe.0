Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18237C369A1
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 09:52:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC2C10E3F1;
	Mon,  7 Apr 2025 09:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B8NuU4wv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D8F10E3F1
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 09:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744019576; x=1775555576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XyP2xbthtlWarLZaINqN735EEcF8h6eXvyXYqi/jwbk=;
 b=B8NuU4wv18pu7+qt1LgLxEBFj+mmG3g9fmOK40u7IFo7uKpwaR+Z17Cy
 2I+zmH0A1pu1msDulWVbJ7OW11Q5FcwfTwfRr7Hf5fLbDQkyJo533Guov
 IVU5rSkV71m5gB3zBGkU/fycbx1/eo131kdPN6qy1aj0M7wIVK6mFVbHI
 LJRnA/kw00tBXk4m8lNdWZ0ErbB+UqQZBB/3RwzMQJ9CF+1HOE1J5Omg1
 CHEpJHZf8rjOWBIRDh0iC7KGEFAckqfKhvEWSHZ2uUuPNCXOQCDwb/eyD
 daSAb0r9VMUk1ybfEYRHTKjlTedAKoAYLnsOWk8AHw3zJROrIsP6rsuC5 w==;
X-CSE-ConnectionGUID: KwGZlgvhTBmE3zMJa9VszA==
X-CSE-MsgGUID: 3BVGfRLkT+G+UZ1F4i+1mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56029383"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56029383"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 02:52:56 -0700
X-CSE-ConnectionGUID: V5gfJVJ7QRqyhkrlBlAFpQ==
X-CSE-MsgGUID: KWCTV5tLTMq+OY2uai3puQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128778606"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 02:52:54 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 07/32] drm/xe/vm: Add an identifier in xe_vma_ops for svm
 prefetch
Date: Mon,  7 Apr 2025 15:46:54 +0530
Message-Id: <20250407101719.3350996-8-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
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

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 1 +
 drivers/gpu/drm/xe/xe_vm_types.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 4d215c55a778..b1f1e85d26f7 100644
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
index ae0bcefdbfcd..d3c1209348e9 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -445,6 +445,9 @@ struct xe_vma_ops {
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

