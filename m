Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDEFCCA471
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 19:30:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE51A10E164;
	Fri,  3 Oct 2025 19:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JaBZvKCT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7AA510E164
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 19:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759519800; x=1791055800;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oZEeKlxu8gspPZmVZZgyaH85WIlVCRbx6MOmCKyslcI=;
 b=JaBZvKCT6augDixnRowgultnWqfVDlHrQR0K0NMZdHN+6/YezAE7uZNz
 62rxF/+kqpH/hA33783ZB4BReXG9ZVZY0bF/XhVHJhF4YZLi/n8gVUb/9
 YJBP+G7w6eJoETiZgR4LWhdVYwDhAtbwZC25tqj6q3p9vYnoYq0A5b3Xf
 9FvLAwPj0iuHr4YdQiydTPFtRwYHiE/K/NlH4E38qF2DAIsMhSSLTUjLa
 ENSvRRLl+xQpl0l4p93CeiQ03xH7OZSaEYkZkXVwvCu+CSTxEzTow3/fi
 qfdbOx/SlIAYRPUKCzFtg2taUe6fiIqT70CX5Xo7PaIl6RyylNSV8mGM+ A==;
X-CSE-ConnectionGUID: /zYDN+VtQ46oldHnd7tikw==
X-CSE-MsgGUID: wvSS+qeqSeCEI4BxIXsh7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61768096"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61768096"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 12:29:59 -0700
X-CSE-ConnectionGUID: ehQ2Nmp7Q7uh3n3hfLDCKA==
X-CSE-MsgGUID: wPiZVXgbQC6viWJyMI5bHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="179787601"
Received: from avteresc-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.2.177])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 12:29:58 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/pf: Make the late-initialization really late
Date: Fri,  3 Oct 2025 21:29:40 +0200
Message-ID: <20251003192940.545-1-michal.wajdeczko@intel.com>
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

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c       |  4 +---
 drivers/gpu/drm/xe/xe_sriov.c    |  2 ++
 drivers/gpu/drm/xe/xe_sriov_pf.c | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf.h |  1 +
 4 files changed, 29 insertions(+), 3 deletions(-)

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
index e6cf930ecde4..3d5437fc5b63 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.h
@@ -15,6 +15,7 @@ struct xe_device;
 #ifdef CONFIG_PCI_IOV
 bool xe_sriov_pf_readiness(struct xe_device *xe);
 int xe_sriov_pf_init_early(struct xe_device *xe);
+int xe_sriov_pf_init_late(struct xe_device *xe);
 int xe_sriov_pf_wait_ready(struct xe_device *xe);
 void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p);
 #else
-- 
2.47.1

