Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1006DD277EB
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 02:52:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7578C10E453;
	Tue, 13 Jan 2026 02:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H3GLP9AO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F63910E307
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 02:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768272758; x=1799808758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aeAgoXgqn3rwXzUBx+1HUXSu8GidogGcacB6QH+42+g=;
 b=H3GLP9AOPdBdCGySr/py9XJBBEymeBi9IOCvTrfbeWop4kDEg+7Gxr4e
 NdPq/+6OvZ8xVA5OPNjAWSe6JVDQt+bBUB+gc8foK4p6t5xRn/bhXUvJQ
 tvFLpZVlQg4LBRHcf2VilgJMCpZWmKdaHWR1/EEepvui/XY7KrlRRqdox
 F5qH0C+8mxqQTvul/iwj35lnsD/a5ideuM1DTSYshyXYB5d0dgud9WJTb
 QfF+oUUeHG35xqYd5SsZBZGZ1BU2e9cJCSY+rQ4jxKakLSG85eN2POAkM
 cy3YLb0XoSTnhmqP8jErWPZwXf3Akd6LW52bhLOufExUnG7SS183IsPWP Q==;
X-CSE-ConnectionGUID: D6YP7xemQiK17/0PKbmJXA==
X-CSE-MsgGUID: yJ/l9Ne+TRO7zgnuvsUoNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69714527"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69714527"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 18:52:37 -0800
X-CSE-ConnectionGUID: Wfol/3OKSCe59gYUWnmawg==
X-CSE-MsgGUID: imjdtPv+TlCYluQwvtTZ7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204070317"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 18:52:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com
Subject: [PATCH v4 04/12] drm/xe: Add xe_device_asid_to_vm helper
Date: Mon, 12 Jan 2026 18:52:24 -0800
Message-Id: <20260113025232.3504648-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113025232.3504648-1-matthew.brost@intel.com>
References: <20260113025232.3504648-1-matthew.brost@intel.com>
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

v4:
 - Move forward declare after includes (Stuart)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
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
index 3740143790db..d25421e5181c 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -12,6 +12,8 @@
 #include "xe_gt_types.h"
 #include "xe_sriov.h"
 
+struct xe_vm;
+
 static inline struct xe_device *to_xe_device(const struct drm_device *dev)
 {
 	return container_of(dev, struct xe_device, drm);
@@ -204,6 +206,8 @@ int xe_is_injection_active(void);
 
 bool xe_is_xe_file(const struct file *file);
 
+struct xe_vm *xe_device_asid_to_vm(struct xe_device *xe, u32 asid);
+
 /*
  * Occasionally it is seen that the G2H worker starts running after a delay of more than
  * a second even after being queued and activated by the Linux workqueue subsystem. This
-- 
2.34.1

