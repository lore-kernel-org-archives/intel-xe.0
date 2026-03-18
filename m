Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2982EFCD0C5
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 07:10:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05DD10E6AA;
	Wed, 18 Mar 2026 07:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ispFRq4m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AABDE10E698
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 07:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773817823; x=1805353823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AtKdMGjJrVtAEHLe1GPisPF707xV22iilWRBlEqxsjo=;
 b=ispFRq4mIC683UvroylRaKx7A55uedma+rUbxO7PaQBdt4w1KGCJm9ft
 7SBWMjOFB1/+G1Ehc40FGOeRDArokWEbDMgPoenPFQDZ7S1fMpYLgMvS3
 doHygT9Vq06XHUaN3vMPx0v5Dl2uzcqjhplAAGBvfTNO7F/llrt7ZTQGr
 RLc/mP3f9k4BnvQbtlK/hr7wCQJi7RRwPZ1r0dDNXneIGoC13QS5Da1Lt
 VMrr05re/ESjrYZj+TmZFsl1I62bQVXoKEWDKtJBsZALT3uuI/38QUEZD
 cncdqTilli0jJEDhkiazRlZl6X7TkIOPovb5EZQqfzPWlBi7/nMoqYW1N A==;
X-CSE-ConnectionGUID: 9Ny75DYVS1+F6Vvvby/v2g==
X-CSE-MsgGUID: eaxXjQpJRCilmxo1gwPeCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78764264"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="78764264"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 00:10:23 -0700
X-CSE-ConnectionGUID: ItRmDI47Qw6W//Am6G8DBw==
X-CSE-MsgGUID: H8ZSoX09Qk+tBIBbGs3Tdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="260424041"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa001.jf.intel.com with ESMTP; 18 Mar 2026 00:10:21 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 stuart.summers@intel.com, arvind.yadav@intel.com, tejas.upadhyay@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 07/15] drm/xe: Move ASID to FAULT VM lookup to xe_device
Date: Wed, 18 Mar 2026 13:14:48 +0530
Message-Id: <20260318074456.2839499-8-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
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
 drivers/gpu/drm/xe/xe_pagefault.c | 16 +---------------
 3 files changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8773c2d2f69a..ba2f0e345257 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1399,3 +1399,28 @@ struct xe_vm *xe_device_asid_to_vm(struct xe_device *xe, u32 asid)
 
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
index c4d267002661..e746f5c7cce0 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -209,6 +209,7 @@ int xe_is_injection_active(void);
 bool xe_is_xe_file(const struct file *file);
 
 struct xe_vm *xe_device_asid_to_vm(struct xe_device *xe, u32 asid);
+struct xe_vm *xe_device_asid_to_fault_vm(struct xe_device *xe, u32 asid);
 
 /*
  * Occasionally it is seen that the G2H worker starts running after a delay of more than
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 8c159e3512ee..a4ee9393e4af 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -121,20 +121,6 @@ xe_pagefault_access_is_atomic(enum xe_pagefault_access_type access_type)
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
 
 static int xe_pagefault_service(struct xe_pagefault *pf)
 {
@@ -149,7 +135,7 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	if (pf->consumer.fault_type_level == XE_PAGEFAULT_TYPE_LEVEL_NACK)
 		return -EFAULT;
 
-	vm = xe_pagefault_asid_to_vm(xe, pf->consumer.asid);
+	vm = xe_device_asid_to_fault_vm(xe, pf->consumer.asid);
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
-- 
2.34.1

