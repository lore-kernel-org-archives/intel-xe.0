Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CEA10ED67B
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 13:19:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36F110EE55;
	Fri, 27 Mar 2026 13:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bFD4z5yc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6508810EE4E
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 13:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774617552; x=1806153552;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=paAw9Ngj9KZaox+jLPAJXDl+ZvIhpn+Q4IwTwsQv3BA=;
 b=bFD4z5ycJe94dvsyLnEP+IuU3V25KEtd6IaTfF0BYMus7NT6E1mo7Kob
 uN28b+WEiJzk85iQ+lH3CuGnDSDmmQZzK3+z0be8cPNf8mnfsIPL5kd0S
 r7d6YAYQJxC/T/oesRCWzh89fE/MrfZuwtutOWWhOFAcXGnmnTmKLQOdm
 rX/OHuH3D9gLBM9V3iWBTaM7a5Tb97gYxKvmuMr0aU+3soGO8xV2O5kc6
 rE4yzAmBj4C/gNZUSJshlhzoNJfPodzBQGP8RppA1Uavwgjfa9fIfDHva
 EiLilxQTeddZRQ4Yq4E4UcvPwAmEhGvDxu4Cn+k3e5dzGFTutqby5y4wC A==;
X-CSE-ConnectionGUID: j4Q2dqBEQNOLOGoC56eeCQ==
X-CSE-MsgGUID: MBy4F3jwQRCmqE1W/+19HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75656128"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="75656128"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 06:19:08 -0700
X-CSE-ConnectionGUID: TN2EXIAKT0S+gTO6RVwn0Q==
X-CSE-MsgGUID: Knp7mvu7S1eKtBlf9cjHCg==
X-ExtLoop1: 1
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 06:19:04 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v13 6/7] drm/xe/xe_sysctrl: Add System Controller power
 management support
Date: Fri, 27 Mar 2026 06:18:43 -0700
Message-ID: <20260327131837.2192929-15-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327131837.2192929-9-anoop.c.vijay@intel.com>
References: <20260327131837.2192929-9-anoop.c.vijay@intel.com>
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
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
v10: (Riana, Umesh)
- Added sysctrl suspend/resume handling

v11: (Badal)
- Remove explicit SoC remapper disable on suspend

v12: (Badal)
- Drop empty sysctrl suspend handler

v13: (Umesh)
- Drop VF-specific checks from resume handler
- Return early when SoC remapper or sysctrl is absent
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
index 850f9dd7e9f0..2bcef304eb9a 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -77,3 +77,25 @@ int xe_sysctrl_init(struct xe_device *xe)
 
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
+	if (!xe->info.has_soc_remapper_sysctrl)
+		return;
+
+	if (!xe->info.has_sysctrl)
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

