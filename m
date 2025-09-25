Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499BBCCA468
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 23:46:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3816810E9D1;
	Thu, 25 Sep 2025 23:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a5v6W58D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B027210E9C6
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 23:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758844008; x=1790380008;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rlkE3YpXijdEdytHc441YL4NKKGpnmnMLr8X3zENDZc=;
 b=a5v6W58DrJ1T5L9pmpXxUhopWcz49Qt84fX33u8QPjJuHZUVr4TebM3r
 3d1Vug2e5ZVC4NczidcjwRZeAuo6xn9+i5yzIcNgdZ4AQzit9ZY3xOr5p
 EaGaxg88tlA3xapee6Lsj8KbI1Ympod2u8JWeU9GdmUUlPDw12sSBKrRq
 N4o+UZDv+rmoQorlp8Nu45eXK3MrgQ461EXWIcJIEX3A+iZDjJ78DNMQ4
 E5sapRnh5OXcFEN1whzPNApyUzoXh64AXCLP46naU+heWEta0hy4koQAB
 x7POVkwrNffUvtQ1pk4xLy8/b6JHg71C5OZf9HugwJSg13LZdR0rv51AL g==;
X-CSE-ConnectionGUID: +FMbvuNYQsGGZZQic1amiA==
X-CSE-MsgGUID: 2KapdX3XSJKw6f3kts3rbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78817684"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="78817684"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
X-CSE-ConnectionGUID: mDgjtwQCQfO3PGzzwfdtrw==
X-CSE-MsgGUID: 7mdcj2okTnqwvyu+kvxvXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="181853011"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 22/22] drm/xe/sriov: Disable SR-IOV if primary GT is
 disabled via configfs
Date: Thu, 25 Sep 2025 16:46:50 -0700
Message-ID: <20250925234628.2112163-46-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925234628.2112163-24-matthew.d.roper@intel.com>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
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

SR-IOV operation relies on the primary GT's GuC to operate (in both PF
and VF mode).  If the primary GT is disabled in VF mode, fail the probe.
If the primary GT is disabled in PF mode, force the device back to
native (non-sriov) mode.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  4 +++-
 drivers/gpu/drm/xe/xe_sriov.c  | 19 ++++++++++++++++++-
 drivers/gpu/drm/xe/xe_sriov.h  |  2 +-
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0b4fa7769f05..1ae984f1fb90 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -736,7 +736,9 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (err)
 		return err;
 
-	xe_sriov_probe_early(xe);
+	err = xe_sriov_probe_early(xe);
+	if (err)
+		return err;
 
 	sriov_update_device_info(xe);
 
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index 7d2d6de2aabf..9fa864f8c3fa 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -10,6 +10,7 @@
 #include "regs/xe_regs.h"
 
 #include "xe_assert.h"
+#include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
@@ -55,11 +56,25 @@ static bool test_is_vf(struct xe_device *xe)
  * SR-IOV PF mode detection is based on PCI @dev_is_pf() function.
  * SR-IOV VF mode detection is based on dedicated MMIO register read.
  */
-void xe_sriov_probe_early(struct xe_device *xe)
+int xe_sriov_probe_early(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	enum xe_sriov_mode mode = XE_SRIOV_MODE_NONE;
 	bool has_sriov = xe->info.has_sriov;
+	bool has_primary_gt = xe_configfs_get_gt_types_allowed(to_pci_dev(xe->drm.dev)) &
+		BIT_ULL(XE_GT_TYPE_MAIN);
+
+	/*
+	 * SR-IOV operation relies on the primary GT's GuC.  Fail VF device
+	 * probe if the primary GT is disabled, and force PF probe back to
+	 * native (non-SRIOV) mode.
+	 */
+	if (test_is_vf(xe) && !has_primary_gt) {
+		drm_err(&xe->drm, "Cannot probe device in SR-IOV VF without primary GT enabled.\n");
+		return -ENODEV;
+	} else if (!has_primary_gt) {
+		has_sriov = false;
+	}
 
 	if (has_sriov) {
 		if (test_is_vf(xe))
@@ -85,6 +100,8 @@ void xe_sriov_probe_early(struct xe_device *xe)
 	if (IS_SRIOV(xe))
 		drm_info(&xe->drm, "Running in %s mode\n",
 			 xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
+
+	return 0;
 }
 
 static void fini_sriov(struct drm_device *drm, void *arg)
diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
index 6db45df55615..9c283c028377 100644
--- a/drivers/gpu/drm/xe/xe_sriov.h
+++ b/drivers/gpu/drm/xe/xe_sriov.h
@@ -15,7 +15,7 @@ struct drm_printer;
 const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode);
 const char *xe_sriov_function_name(unsigned int n, char *buf, size_t len);
 
-void xe_sriov_probe_early(struct xe_device *xe);
+int xe_sriov_probe_early(struct xe_device *xe);
 void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
 int xe_sriov_init(struct xe_device *xe);
 int xe_sriov_init_late(struct xe_device *xe);
-- 
2.51.0

