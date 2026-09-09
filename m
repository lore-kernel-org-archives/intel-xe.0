Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B098C88E40
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:42:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BC210F104;
	Wed,  9 Sep 2026 12:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SzP3O+ND";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB2B10F104
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788957719; x=1820493719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RLOAOmr2m34+4oqxXr6tjWehEdx+GhSbeGCkBvWOV3o=;
 b=SzP3O+NDED11l8XE30P28ntkjcj10sqCusMMyVhzSoAHg7+DP+1DAoKg
 0hrqKTJhGPeZ+7IJStQu376WsfsBa6uDjoNQr5L3FaNdErs/wCk4bQGS5
 QYNf/sHYKiEJmFeX4AZ/RS8LIzieN9j2HwCBJteLShgll3qEVbXwi2CCZ
 UY5nxcTElE2MrVVzPsVCS7onQ/dczK9LAUIG+X7dwvKnH3ScKO4clUeue
 e/oRyz0Lp6vfMWqgHApbS8Fzw/UxnWAKzea5KiaheWDM/2xKEVjjnaaAt
 At68unrtbs5yecMZWePfI5rOztW2Oy+VjkhjwS86y9HJduAAX4hPsnHxt g==;
X-CSE-ConnectionGUID: vM07+nboQUKVaC8wwiTfUw==
X-CSE-MsgGUID: RCn+M586ScaGTYschk7bZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99715497"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="99715497"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 05:41:59 -0700
X-CSE-ConnectionGUID: gbwOiOfPReGDexaIEYaK5g==
X-CSE-MsgGUID: lNxwYu+5SwuU34wOo/h/FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296246555"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2026 05:41:57 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC v2 06/21] drm/xe: Move ASID to FAULT VM lookup to xe_device
Date: Wed,  9 Sep 2026 18:15:00 +0530
Message-ID: <20260909124457.1610890-29-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
References: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
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

Move xe_pagefault_asid_to_vm() to xe_device.c as
xe_device_asid_to_fault_vm() for reuse in access counter handling.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c    | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h    |  1 +
 drivers/gpu/drm/xe/xe_pagefault.c | 17 +----------------
 3 files changed, 27 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index adc1b6369512..914e62e3340b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1588,3 +1588,28 @@ struct xe_vm *xe_device_asid_to_vm(struct xe_device *xe, u32 asid)
 
 	return vm;
 }
+
+/**
+ * xe_device_asid_to_fault_vm() - Find FAULT VM from ASID
+ * @xe: the &xe_device
+ * @asid: Address space ID
+ *
+ * Find a FAULTING VM from ASID and take a reference to VM which
+ * caller must drop. Reclaim safe.
+ *
+ * Return: VM on success, ERR_PTR on failure
+ */
+struct xe_vm *xe_device_asid_to_fault_vm(struct xe_device *xe, u32 asid)
+{
+	struct xe_vm *vm;
+
+	down_read(&xe->usm.lock);
+	vm = xa_load(&xe->usm.asid_to_vm, asid);
+	if (vm && xe_vm_in_fault_mode(vm))
+		xe_vm_get(vm);
+	else
+		vm = ERR_PTR(-EINVAL);
+	up_read(&xe->usm.lock);
+
+	return vm;
+}
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 6d3d6d5eba29..42ddd4a21b48 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -273,6 +273,7 @@ int xe_is_injection_active(void);
 bool xe_is_xe_file(const struct file *file);
 
 struct xe_vm *xe_device_asid_to_vm(struct xe_device *xe, u32 asid);
+struct xe_vm *xe_device_asid_to_fault_vm(struct xe_device *xe, u32 asid);
 
 #ifdef CONFIG_PCI_IOV
 bool xe_device_is_admin_only(const struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 347cca1ec1c3..f710b5cbb509 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -198,21 +198,6 @@ xe_pagefault_access_is_atomic(enum xe_pagefault_access_type access_type)
 	return (access_type & XE_PAGEFAULT_ACCESS_TYPE_MASK) == XE_PAGEFAULT_ACCESS_TYPE_ATOMIC;
 }
 
-static struct xe_vm *xe_pagefault_asid_to_vm(struct xe_device *xe, u32 asid)
-{
-	struct xe_vm *vm;
-
-	down_read(&xe->usm.lock);
-	vm = xa_load(&xe->usm.asid_to_vm, asid);
-	if (vm && xe_vm_in_fault_mode(vm))
-		xe_vm_get(vm);
-	else
-		vm = ERR_PTR(-EINVAL);
-	up_read(&xe->usm.lock);
-
-	return vm;
-}
-
 static int xe_pagefault_service(struct xe_pagefault *pf)
 {
 	struct xe_gt *gt = pf->gt;
@@ -227,7 +212,7 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	if (pf->consumer.fault_type_level == XE_PAGEFAULT_TYPE_LEVEL_NACK)
 		return -EFAULT;
 
-	vm = xe_pagefault_asid_to_vm(xe, asid);
+	vm = xe_device_asid_to_fault_vm(xe, asid);
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
-- 
2.43.0

