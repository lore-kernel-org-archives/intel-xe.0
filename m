Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C4B106B506
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 12:01:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62A010E8A8;
	Wed, 25 Mar 2026 12:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uwf9azy/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCAF610E8B2
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Mar 2026 12:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774440059; x=1805976059;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jOYpMfVR2SB7Tj17iN7oVmCrI7x41pvnPpIZhXpvrd4=;
 b=Uwf9azy/j8VDIBakknAEo+r/m6U4u9yzRpobBa9BxiTu3IQHbog3eUqT
 FSjKE+FN2xWFh+q94paAAGqmjYBVf1QObxX+6UwsPSAv1iob3bSTNgx/G
 asCwavhXEDvHumDoBJkziYJ5jzXnai7Y7K7ZEVjr2cqTa7lDfKhh0M/K+
 8Li/oz5JiR1hZVndhS9ToObg5AKgKVlRErUGr+I3Sc/IO1yZ3r1/f7aQp
 uBSQ9opGgpnqLg2DHF33THrX1ho4T/6Y7aHxGNRdDbueerEm5hzkCe4nq
 Hq4+XMXUfTku71hSwRvfDn1uYfqPdo4sP4e03y5wmjyKJyyQNxRhAPYOB A==;
X-CSE-ConnectionGUID: g2uqyS76QCiXVQySrrKSJg==
X-CSE-MsgGUID: 0An34VwYS12vk0EiADhQvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="98094675"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="98094675"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 05:00:59 -0700
X-CSE-ConnectionGUID: 2j9DAhMQQqWM3yYAzWa9oA==
X-CSE-MsgGUID: bhURwIcRTFWz8cHDkUiw2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="218087331"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 05:00:56 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v12 6/7] drm/xe/xe_sysctrl: Add System Controller power
 management support
Date: Wed, 25 Mar 2026 05:00:33 -0700
Message-ID: <20260325120030.510480-15-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325120030.510480-9-anoop.c.vijay@intel.com>
References: <20260325120030.510480-9-anoop.c.vijay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Anoop Vijay <anoop.c.vijay@intel.com>

Add resume handling for System Controller to support system (S3/S4) and
runtime power management transitions.

On resume, restore SoC remapper configuration and mailbox interface to
re‑establish communication with firmware.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v10: (Riana, Umesh)
- Added sysctrl suspend/resume handling

v11: (Badal)
- Remove explicit SoC remapper disable on suspend

v12: (Badal)
- Drop empty sysctrl suspend handler
---
 drivers/gpu/drm/xe/xe_pm.c      |  6 ++++++
 drivers/gpu/drm/xe/xe_sysctrl.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl.h |  1 +
 3 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 01185f10a883..d4672eb07476 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -26,6 +26,7 @@
 #include "xe_pcode.h"
 #include "xe_pxp.h"
 #include "xe_sriov_vf_ccs.h"
+#include "xe_sysctrl.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
 #include "xe_wa.h"
@@ -259,6 +260,8 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_i2c_pm_resume(xe, true);
 
+	xe_sysctrl_pm_resume(xe);
+
 	xe_irq_resume(xe);
 
 	for_each_gt(gt, xe, id) {
@@ -670,6 +673,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
 
+	if (xe->d3cold.allowed)
+		xe_sysctrl_pm_resume(xe);
+
 	xe_irq_resume(xe);
 
 	for_each_gt(gt, xe, id) {
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
index 84e3b70043a1..96a961d470ef 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -82,3 +82,25 @@ int xe_sysctrl_init(struct xe_device *xe)
 
 	return 0;
 }
+
+/**
+ * xe_sysctrl_pm_resume() - System Controller resume handler
+ * @xe: xe device instance
+ *
+ * Invoked during system resume (S3/S4 to S0) and runtime resume from D3cold.
+ * Restores SoC remapper configuration and reinitializes mailbox interface.
+ */
+void xe_sysctrl_pm_resume(struct xe_device *xe)
+{
+	struct xe_sysctrl *sc = &xe->sc;
+
+	if (!xe->info.has_sysctrl)
+		return;
+
+	if (IS_SRIOV_VF(xe))
+		return;
+
+	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
+
+	xe_sysctrl_mailbox_init(sc);
+}
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
index d5d8735038ae..f3b0f3716b2f 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
@@ -17,5 +17,6 @@ static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
 }
 
 int xe_sysctrl_init(struct xe_device *xe);
+void xe_sysctrl_pm_resume(struct xe_device *xe);
 
 #endif
-- 
2.43.0

