Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907AECCFA05
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 19:56:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD62D10E66A;
	Tue,  4 Nov 2025 19:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g6d69fLq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1086D10E665
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 19:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762286182; x=1793822182;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VHCKS7frk7pGSmmvINReXozRtK5sD1CbefSZt2Zoqec=;
 b=g6d69fLqjtwQVIuAD2RrLUHTIWcluysD2LmrByR9t04cUaJEPKp+tzK1
 cPevSzbBB2Ds2RaW9VcWdvpgSrosLk/q8eja2M9onHS/3mYqPst5J8/RW
 4s9oskARzKg0lOnf5psw9TeFb1nOlISm/deBTRHAvF8txIFRs2G6ASOhX
 QPZmXurumD519MLYvqm1YHihanZF5/KnldAwHXHR9M83w1EjtzhyYbMhf
 eNc4o204vrO8T/nDGIW1DU2nf0OzKtBlohX2xk1aPtWOxbprUx7UoUQYs
 7dqyImgwBi428lNDoOG6VEO7NRBWFNBplHi8QYi9ho4mHfM+RLqq56rib A==;
X-CSE-ConnectionGUID: GZ0biSBeRz+eLjqqn/USfA==
X-CSE-MsgGUID: z88nAbEwT02OQvWDb5kZ5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="74686107"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="74686107"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 11:56:21 -0800
X-CSE-ConnectionGUID: FTmI8HWWQgWHbmpC9PvVzQ==
X-CSE-MsgGUID: enhiPfx0TtqhMiNSM+f7OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="218051131"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 11:56:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, lucas.demarchi@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH v2 03/12] drm/xe: Add xe_device_asid_to_vm helper
Date: Tue,  4 Nov 2025 11:56:07 -0800
Message-Id: <20251104195616.3339137-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104195616.3339137-1-matthew.brost@intel.com>
References: <20251104195616.3339137-1-matthew.brost@intel.com>
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
---
 drivers/gpu/drm/xe/xe_device.c | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h |  4 ++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 86d5960476af..57907904c49d 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1290,3 +1290,28 @@ void xe_device_declare_wedged(struct xe_device *xe)
 		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
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
index 32cc6323b7f6..538202eebc16 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -6,6 +6,8 @@
 #ifndef _XE_DEVICE_H_
 #define _XE_DEVICE_H_
 
+struct xe_vm;
+
 #include <drm/drm_util.h>
 
 #include "xe_device_types.h"
@@ -195,6 +197,8 @@ void xe_file_put(struct xe_file *xef);
 
 int xe_is_injection_active(void);
 
+struct xe_vm *xe_device_asid_to_vm(struct xe_device *xe, u32 asid);
+
 /*
  * Occasionally it is seen that the G2H worker starts running after a delay of more than
  * a second even after being queued and activated by the Linux workqueue subsystem. This
-- 
2.34.1

