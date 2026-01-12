Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4082CF45DA
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 23:27:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A63E10E43A;
	Mon, 12 Jan 2026 23:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JDYjc3wT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF2610E2BA
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 23:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768260456; x=1799796456;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hgXLEKoidS+KlfQ47dSjHPZ1cwqDzMmGmyzDGtLww9Q=;
 b=JDYjc3wTArJ7/xyjDD7p3vdSG+qZq6PcljA/Wo0GC1KSHk3vdaiQJcls
 eUZo1/C4kylo4/Xjl0wIOaNuhT2jaBcD/BjEvZ+R4yK9VzD/Ek/vZeySC
 ZU3Fb1ldKjHQXUaXJUbNXasvo7IV4dxlBt3z901/jKVSs5U8qK2EBnxI8
 zpqCzE7I0JkO9kEupDdjkeIbD0r3AWRiKIcRP7wV3ISl1wm3HNa7lU/DU
 4pax4QKBcp8p18Z0LFT3byMOGxCJyIvmaaubwSaZXAAx69jbtMiA8lx89
 gILTXfMqUoeDj3ZferLLWKOQ5GCARWjxz3ke74zHX9+qNPiR/+KcPAm+C g==;
X-CSE-ConnectionGUID: k3Ox+oGFQ6uhOZ1IprMleg==
X-CSE-MsgGUID: wLcGDEe9T4SB9krwd8pwEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69594766"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69594766"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 15:27:36 -0800
X-CSE-ConnectionGUID: d1zimEroQmemHqERe04KOQ==
X-CSE-MsgGUID: 5NfHpwhgS7S+tXuDquZJxQ==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 15:27:36 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com
Subject: [PATCH v3 03/11] drm/xe: Add xe_device_asid_to_vm helper
Date: Mon, 12 Jan 2026 15:27:22 -0800
Message-Id: <20260112232730.3347414-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112232730.3347414-1-matthew.brost@intel.com>
References: <20260112232730.3347414-1-matthew.brost@intel.com>
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

Introduce the xe_device_asid_to_vm helper, which can be used throughout
the driver to resolve the VM from a given ASID.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h |  4 ++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index e400ad5c9f9e..445cf6da9dc7 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1417,3 +1417,28 @@ const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode)
 		return "<invalid>";
 	}
 }
+
+/**
+ * xe_device_asid_to_vm() - Find VM from ASID
+ * @xe: the &xe_device
+ * @asid: Address space ID
+ *
+ * Find a VM from ASID and take a reference to VM which caller must drop.
+ * Reclaim safe.
+ *
+ * Return: VM on success, ERR_PTR on failure
+ */
+struct xe_vm *xe_device_asid_to_vm(struct xe_device *xe, u32 asid)
+{
+	struct xe_vm *vm;
+
+	down_read(&xe->usm.lock);
+	vm = xa_load(&xe->usm.asid_to_vm, asid);
+	if (vm)
+		xe_vm_get(vm);
+	else
+		vm = ERR_PTR(-EINVAL);
+	up_read(&xe->usm.lock);
+
+	return vm;
+}
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 3740143790db..10d04c324257 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -6,6 +6,8 @@
 #ifndef _XE_DEVICE_H_
 #define _XE_DEVICE_H_
 
+struct xe_vm;
+
 #include <drm/drm_util.h>
 
 #include "xe_device_types.h"
@@ -204,6 +206,8 @@ int xe_is_injection_active(void);
 
 bool xe_is_xe_file(const struct file *file);
 
+struct xe_vm *xe_device_asid_to_vm(struct xe_device *xe, u32 asid);
+
 /*
  * Occasionally it is seen that the G2H worker starts running after a delay of more than
  * a second even after being queued and activated by the Linux workqueue subsystem. This
-- 
2.34.1

