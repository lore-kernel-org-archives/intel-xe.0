Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA530CAC5B0
	for <intel-xe@archiver.kernel.org>; Sat,  4 Oct 2025 16:20:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E79610E234;
	Sat,  4 Oct 2025 16:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D6keDa5n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCAB110E234
 for <intel-xe@lists.freedesktop.org>; Sat,  4 Oct 2025 16:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759594822; x=1791130822;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZAScubyeg89ZJkv6t0lCmlMU8esolYboT7o7cS4t0R4=;
 b=D6keDa5nhKJmBfzk0adpdJfB2WTagrPTX2BnNQCjdr4q/KOGKkq41n4v
 oquPO1tOR+WYZvCcyuo90HetqLlqynhIPq/vyKHY3EszRtjkM+XqwFPyc
 Z4TNV0QCRX3e6ens03ZLgbhrAec4+Enw3CqnU46cpYdZwVvv454rCoGqz
 yc/H9+/cm3YJbloQn7F5W0ppgNZTMWOQt09ikyRAUj9br11eKnoeOmszN
 3mjJQMTf/atk+/+V69IfiGSkumJYUd5o+t5rSgtKFsHaRqLnIKK0rJWTT
 38he/zwjEQPBa08lbEExE8rjlxxUMBAVD9Yax0SJKCG0MW3fbsdClsm+8 g==;
X-CSE-ConnectionGUID: rfelpz2kQ02MWSISRqSZtA==
X-CSE-MsgGUID: ZYZpHifDTDC+IivCqWDRag==
X-IronPort-AV: E=McAfee;i="6800,10657,11572"; a="84465952"
X-IronPort-AV: E=Sophos;i="6.18,315,1751266800"; d="scan'208";a="84465952"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2025 09:20:22 -0700
X-CSE-ConnectionGUID: RcqHnk1ATXe4qWjnTdgqJg==
X-CSE-MsgGUID: Fj1lPMYVRaaM7/LLrKeO4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,315,1751266800"; d="scan'208";a="178809120"
Received: from smanmadh-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.173])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2025 09:20:20 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v2] drm/xe/pf: Make the late-initialization really late
Date: Sat,  4 Oct 2025 18:20:08 +0200
Message-ID: <20251004162008.1782-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

While the late PF per-GT initialization is done quite late in the
single GT initialization flow, in case of multi-GT platforms, it
may still be done before other GT early initialization. That leads
to some issues during unwind, when there are cross-GT dependencies,
like resource cleanup that is shared by both GTs, but the other GT
may already be sanitized or disabled.

The following errors could be observed when trying to unload the PF
driver with some LMEM/VRAM already provisioned for few VFs:

 [ ] xe 0000:03:00.0: DEVRES REL ffff88814708f240 fini_config (16 bytes)
 [ ] xe 0000:03:00.0: [drm:lmtt_write_pte [xe]] PF: LMTT: WRITE level=2 index=1 pte=0x0
 [ ] xe 0000:03:00.0: [drm:lmtt_invalidate_hw [xe]] PF: LMTT: num_fences=2 err=-19
 [ ] xe 0000:03:00.0: [drm:lmtt_pt_free [xe]] PF: LMTT: level=0 addr=53a470000
 [ ] xe 0000:03:00.0: [drm:lmtt_pt_free [xe]] PF: LMTT: level=1 addr=53a4b0000
 [ ] xe 0000:03:00.0: [drm:lmtt_invalidate_hw [xe]] PF: LMTT: num_fences=2 err=-19
 [ ] xe 0000:03:00.0: [drm] PF: LMTT0 invalidation failed (-ENODEV)
 [ ] xe 0000:03:00.0: [drm:lmtt_write_pte [xe]] PF: LMTT: WRITE level=2 index=2 pte=0x0
 [ ] xe 0000:03:00.0: [drm:lmtt_invalidate_hw [xe]] PF: LMTT: num_fences=2 err=-19
 [ ] xe 0000:03:00.0: [drm:lmtt_pt_free [xe]] PF: LMTT: level=0 addr=539b70000
 [ ] xe 0000:03:00.0: [drm:lmtt_pt_free [xe]] PF: LMTT: level=1 addr=539bf0000
 [ ] xe 0000:03:00.0: [drm:lmtt_invalidate_hw [xe]] PF: LMTT: num_fences=2 err=-19
 [ ] xe 0000:03:00.0: [drm] PF: LMTT0 invalidation failed (-ENODEV)

Move all PF per-GT late initialization to the already defined late
SR-IOV initialization function to allow proper order of the cleanup
actions.

While around, format all PF function stubs as one-liners, like many
other stubs are defined in the Xe driver.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
v2: add stub for builds without CONFIG_PCI_IOV (CI)
---
 drivers/gpu/drm/xe/xe_gt.c       |  4 +---
 drivers/gpu/drm/xe/xe_sriov.c    |  2 ++
 drivers/gpu/drm/xe/xe_sriov_pf.c | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf.h | 13 ++++---------
 4 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index b77572a19548..8fc3a6929d6c 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -573,10 +573,8 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
 	if (IS_SRIOV_PF(gt_to_xe(gt)) && xe_gt_is_main_type(gt))
 		xe_lmtt_init_hw(&gt_to_tile(gt)->sriov.pf.lmtt);
 
-	if (IS_SRIOV_PF(gt_to_xe(gt))) {
-		xe_gt_sriov_pf_init(gt);
+	if (IS_SRIOV_PF(gt_to_xe(gt)))
 		xe_gt_sriov_pf_init_hw(gt);
-	}
 
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index 7d2d6de2aabf..ea411944609b 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -167,6 +167,8 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t size)
  */
 int xe_sriov_init_late(struct xe_device *xe)
 {
+	if (IS_SRIOV_PF(xe))
+		return xe_sriov_pf_init_late(xe);
 	if (IS_SRIOV_VF(xe))
 		return xe_sriov_vf_init_late(xe);
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index 4698348c010a..2814f29f1093 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -103,6 +103,31 @@ int xe_sriov_pf_init_early(struct xe_device *xe)
 	return 0;
 }
 
+/**
+ * xe_sriov_pf_init_late() - Late initialization of the SR-IOV PF.
+ * @xe: the &xe_device to initialize
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_init_late(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int err;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_pf_init(gt);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 /**
  * xe_sriov_pf_wait_ready() - Wait until PF is ready to operate.
  * @xe: the &xe_device to test
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.h b/drivers/gpu/drm/xe/xe_sriov_pf.h
index e6cf930ecde4..cba3fde9581f 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.h
@@ -15,18 +15,13 @@ struct xe_device;
 #ifdef CONFIG_PCI_IOV
 bool xe_sriov_pf_readiness(struct xe_device *xe);
 int xe_sriov_pf_init_early(struct xe_device *xe);
+int xe_sriov_pf_init_late(struct xe_device *xe);
 int xe_sriov_pf_wait_ready(struct xe_device *xe);
 void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p);
 #else
-static inline bool xe_sriov_pf_readiness(struct xe_device *xe)
-{
-	return false;
-}
-
-static inline int xe_sriov_pf_init_early(struct xe_device *xe)
-{
-	return 0;
-}
+static inline bool xe_sriov_pf_readiness(struct xe_device *xe) { return false; }
+static inline int xe_sriov_pf_init_early(struct xe_device *xe) { return 0; }
+static inline int xe_sriov_pf_init_late(struct xe_device *xe) { return 0; }
 #endif
 
 #endif
-- 
2.47.1

