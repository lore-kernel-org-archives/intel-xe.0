Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC60CCFA02
	for <intel-xe@archiver.kernel.org>; Sat,  1 Nov 2025 01:02:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0013910E110;
	Sat,  1 Nov 2025 01:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MLd/WOjr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81AF10E110
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Nov 2025 01:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761958953; x=1793494953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VHCKS7frk7pGSmmvINReXozRtK5sD1CbefSZt2Zoqec=;
 b=MLd/WOjrwXVvAnKvsqZMvI7pp1RXeKPBPqHrKaM8XR8hS3eTsiNq5Ouu
 vkYZAvADePd/NM5kgK2oV8ujO+zI81dkr7S6gewkIQF2LvUtaOPXG19UO
 nsU0AIUxiF4C/giTiySsJ6078P/KWmSOxXUsy3U6foWwMtV37j35NJRT2
 /37F5a0Emwr625vt8Bsp5tSjrEZInefWDH2OlaY6jehu2cpGvWeNoeJBP
 M6L/ncfpKHEKhLwIoErMVrMR7ba9RS8GkP9vNs6fKV3YzmyUopi+8jT39
 mmOVYR16QriFamgygNym6RDoSwQz3VaBmZ9CEOtJwvZgFXfm0cyO+GIg7 w==;
X-CSE-ConnectionGUID: nq2r0WmBTUa+JpflO1HmDw==
X-CSE-MsgGUID: k+VkxhmXTIqYq0/Px9I/Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="75575689"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="75575689"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 18:02:32 -0700
X-CSE-ConnectionGUID: 7nUW1w9pQ8iASTKhMu5BzQ==
X-CSE-MsgGUID: fLrNALmBTfe8dgtVtmXUXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="217020167"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 18:02:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, lucas.demarchi@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH 03/12] drm/xe: Add xe_device_asid_to_vm helper
Date: Fri, 31 Oct 2025 18:02:16 -0700
Message-Id: <20251101010225.3095457-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251101010225.3095457-1-matthew.brost@intel.com>
References: <20251101010225.3095457-1-matthew.brost@intel.com>
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

