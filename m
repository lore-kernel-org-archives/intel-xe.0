Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBDAC98309
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 22:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F4B10E264;
	Fri, 16 Jan 2026 22:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C17xB06T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2CE10E1FD
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 22:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768601866; x=1800137866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZQf5eSbldfYDkkhHsgUC+nNGBMlYcYGjHI5BnZ4RNdk=;
 b=C17xB06T0qbOhfeprLSe0izxg7HJ4I1Nq98bomwZIcv0tDZV8UEXbpPM
 ME7hAMoUaA8J/qvQWHVc476SFOMA07VQ6n8dQQoNp/82kOmApgcvnQF5H
 g2PPjf9FESHEV0V/hHPqx2BlnYrygfu3Ipgd4XW3yya9afVU1m5UzcvPs
 vReW0KYHW1Qt5PexMorO1GbqaYii1TtLvFoExw3rCBP3+u1HoL/LW3RJM
 gUDKyeljMpP79DaSUR+it0V6yHcDFc7ADfFImecqFjcFpq4yvLADQNiQd
 5ZvxQB2N/iMVUEpQZDlFoRflyEebK8nSsWh+5U4omfFVL8DbkjU3S91u+ w==;
X-CSE-ConnectionGUID: oG2eVjq8RV6d7sA8uldJTQ==
X-CSE-MsgGUID: e/BZQ8K9RUiuuKO0sWBXXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69123347"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="69123347"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:17:46 -0800
X-CSE-ConnectionGUID: 0IdmDK2JSkaTUooL20zZdg==
X-CSE-MsgGUID: 3o3NRJ2RQFGwyxmO56g+sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204962702"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:17:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Atwood <matthew.s.atwood@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v5 04/11] drm/xe: Add xe_device_asid_to_vm helper
Date: Fri, 16 Jan 2026 14:17:24 -0800
Message-Id: <20260116221731.868657-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116221731.868657-1-matthew.brost@intel.com>
References: <20260116221731.868657-1-matthew.brost@intel.com>
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
Tested-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h |  4 ++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 495310a624b5..aad4aa53a51f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1375,3 +1375,28 @@ const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode)
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

