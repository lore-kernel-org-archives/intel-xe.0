Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F15C87FD2
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 14:28:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E234010E888;
	Fri,  1 Aug 2025 14:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="khyTVqkc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E613510E888
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 14:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754058516; x=1785594516;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OEM72xUo2sS37EUFULhA0BoxuyfZvdKH/TtVOonaNRA=;
 b=khyTVqkcsk4CLWIXRpCtEBxtPRn+0A2q/ICb3C3qfUAYEu+xrvIf86Hn
 f7UxGIgebrk1xqZ6PVaipGCvDSSy70TayD0hohCY30EjvymlUj3gZq72H
 ppbys5nbMT759bS1HfZ9u4wBacx7g+run0JkIjAjMDT8eeVEVRFAFsqE6
 FL4+6cgX84ZzVVNr4hvFrs3NIanvUX3bIonup+/cAUajfX4Wsa8RjVIlx
 y37Zb619u2ZbbbHQwM5U25kW10Fgu4BOvqm2JYT5TuDYGDk7LrypuNWlE
 YsnXARX/07le/t7GFX09iuxLyf3NnJIfVWczQ5jweVu7iyUB2FAdKtEai A==;
X-CSE-ConnectionGUID: aMvO5CYHQp+8rodUR/qnpg==
X-CSE-MsgGUID: UjQ+QMzdRHe2SrtaOzUrRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="55466021"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="55466021"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 07:28:36 -0700
X-CSE-ConnectionGUID: 70Cwb4SqSMCnTWTJFe4C9Q==
X-CSE-MsgGUID: XP5X82V9StCsAetRzaYo+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="162858538"
Received: from mkolod1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.39])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 07:28:34 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v2 2/3] drm/xe/pf: Make sure PF is ready to configure VFs
Date: Fri,  1 Aug 2025 16:28:21 +0200
Message-ID: <20250801142822.180530-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250801142822.180530-1-michal.wajdeczko@intel.com>
References: <20250801142822.180530-1-michal.wajdeczko@intel.com>
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

The PF driver might be resumed just to configure VFs, but since
it is doing some asynchronous GuC reconfigurations after fresh
reset, we should wait until all pending works are completed.

This is especially important in case of LMEM provisioning, since
we also need to update the LMTT and send invalidation requests
to all GuCs, which are expected to be already in the VGT mode.

Fixes: 68ae022278a1 ("drm/xe/pf: Force GuC virtualization mode")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
v2: drop redundant log (offline Piotr)
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c         | 25 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h         |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c |  4 ++-
 drivers/gpu/drm/xe/xe_pci_sriov.c           |  7 +++++-
 drivers/gpu/drm/xe/xe_sriov_pf.c            | 27 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf.h            |  1 +
 6 files changed, 63 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index 2ea81d81c0ae..bdbd15f3afe3 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -16,6 +16,7 @@
 #include "xe_gt_sriov_pf_migration.h"
 #include "xe_gt_sriov_pf_service.h"
 #include "xe_gt_sriov_printk.h"
+#include "xe_guc_submit.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
 
@@ -260,3 +261,27 @@ void xe_gt_sriov_pf_restart(struct xe_gt *gt)
 {
 	pf_queue_restart(gt);
 }
+
+static void pf_flush_restart(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	flush_work(&gt->sriov.pf.workers.restart);
+}
+
+/**
+ * xe_gt_sriov_pf_wait_ready() - Wait until per-GT PF SR-IOV support is ready.
+ * @gt: the &xe_gt
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_wait_ready(struct xe_gt *gt)
+{
+	/* don't wait if there is another ongoing reset */
+	if (xe_guc_read_stopped(&gt->uc.guc))
+		return -EBUSY;
+
+	pf_flush_restart(gt);
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
index e2b2ff8132dc..e7fde3f9937a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
@@ -11,6 +11,7 @@ struct xe_gt;
 #ifdef CONFIG_PCI_IOV
 int xe_gt_sriov_pf_init_early(struct xe_gt *gt);
 int xe_gt_sriov_pf_init(struct xe_gt *gt);
+int xe_gt_sriov_pf_wait_ready(struct xe_gt *gt);
 void xe_gt_sriov_pf_init_hw(struct xe_gt *gt);
 void xe_gt_sriov_pf_sanitize_hw(struct xe_gt *gt, unsigned int vfid);
 void xe_gt_sriov_pf_stop_prepare(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index bf679b21f485..3ed245e04d0c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -22,6 +22,7 @@
 #include "xe_gt_sriov_pf_policy.h"
 #include "xe_gt_sriov_pf_service.h"
 #include "xe_pm.h"
+#include "xe_sriov_pf.h"
 
 /*
  *      /sys/kernel/debug/dri/0/
@@ -205,7 +206,8 @@ static int CONFIG##_set(void *data, u64 val)					\
 		return -EOVERFLOW;						\
 										\
 	xe_pm_runtime_get(xe);							\
-	err = xe_gt_sriov_pf_config_set_##CONFIG(gt, vfid, val);		\
+	err = xe_sriov_pf_wait_ready(xe) ?:					\
+	      xe_gt_sriov_pf_config_set_##CONFIG(gt, vfid, val);		\
 	xe_pm_runtime_put(xe);							\
 										\
 	return err;								\
diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index 27b148eab49c..af05db07162e 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -16,6 +16,7 @@
 #include "xe_pci_sriov.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
+#include "xe_sriov_pf.h"
 #include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_printk.h"
 
@@ -154,6 +155,10 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	xe_assert(xe, num_vfs <= total_vfs);
 	xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs, str_plural(num_vfs));
 
+	err = xe_sriov_pf_wait_ready(xe);
+	if (err)
+		goto out;
+
 	/*
 	 * We must hold additional reference to the runtime PM to keep PF in D0
 	 * during VFs lifetime, as our VFs do not implement the PM capability.
@@ -191,7 +196,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 failed:
 	pf_unprovision_vfs(xe, num_vfs);
 	xe_pm_runtime_put(xe);
-
+out:
 	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
 			num_vfs, str_plural(num_vfs), ERR_PTR(err));
 	return err;
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index afbdd894bd6e..27ddf3cc80e9 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -9,6 +9,7 @@
 
 #include "xe_assert.h"
 #include "xe_device.h"
+#include "xe_gt_sriov_pf.h"
 #include "xe_module.h"
 #include "xe_sriov.h"
 #include "xe_sriov_pf.h"
@@ -102,6 +103,32 @@ int xe_sriov_pf_init_early(struct xe_device *xe)
 	return 0;
 }
 
+/**
+ * xe_sriov_pf_wait_ready() - Wait until PF is ready to operate.
+ * @xe: the &xe_device to test
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_wait_ready(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int err;
+
+	if (xe_device_wedged(xe))
+		return -ECANCELED;
+
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_pf_wait_ready(gt);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 /**
  * xe_sriov_pf_print_vfs_summary - Print SR-IOV PF information.
  * @xe: the &xe_device to print info from
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.h b/drivers/gpu/drm/xe/xe_sriov_pf.h
index c392c3fcf085..e3b34f8f5e04 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.h
@@ -15,6 +15,7 @@ struct xe_device;
 #ifdef CONFIG_PCI_IOV
 bool xe_sriov_pf_readiness(struct xe_device *xe);
 int xe_sriov_pf_init_early(struct xe_device *xe);
+int xe_sriov_pf_wait_ready(struct xe_device *xe);
 void xe_sriov_pf_debugfs_register(struct xe_device *xe, struct dentry *root);
 void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p);
 #else
-- 
2.47.1

