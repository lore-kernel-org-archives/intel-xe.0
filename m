Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012401125855
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 16:54:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8F510E908;
	Wed, 11 Mar 2026 16:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CN8Db9Is";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0052110E91C
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Mar 2026 16:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773248065; x=1804784065;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4gDcSOCDCJRNZKFsw/ARflgqfkrBvU/0WcQ2EL4qSks=;
 b=CN8Db9IsbQoXbTUnjKOU3KRjdBNOtYUrEQxxhd4OsokoVday/M+gqRHx
 iU/84vW/vT1GuFzCdNg8QRIwCHxAG1hDSeIR3KSki1pVTsLANYEdzNdkO
 lQzGOrkB3warIdhmhncmsFhKoeqf5B38rkDCGo5FkY6jGrjVxmzuSWYrp
 koLu6s+Qld8j2GkobMRQs8WURWPhH3gsuyJ2J7sswX1GHGe+SXtLB5C2E
 IMA0nHNRUTxSdVeV96LOX/LWq3o4Wgde2m/4+fOqUnfJQHxosP3jgiXzH
 Fogme7jJVLzR6gEZP9MkXxYJX1EvtHZTu/be4F/yqwxfYLdUzLYzFXYgu w==;
X-CSE-ConnectionGUID: FgFwzEhaSOypH2uMfv49pA==
X-CSE-MsgGUID: 5L1wy6RdSxWGQ6UKL8ce2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="91897237"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="91897237"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 09:54:24 -0700
X-CSE-ConnectionGUID: EO37A7oRQiS7kC7PEBid+w==
X-CSE-MsgGUID: 3o7+umt2TJaPcl9R3uCaww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="251035218"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 09:54:22 -0700
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, stable@vger.kernel.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe: Fix missing runtime PM reference in ccs_mode_store
Date: Wed, 11 Mar 2026 22:22:41 +0530
Message-ID: <20260311165242.2355683-2-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
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

ccs_mode_store() calls xe_gt_reset() which internally invokes
xe_pm_runtime_get_noresume(). That function requires the caller
to already hold an outer runtime PM reference and warns if none
is held:

  [46.891177] xe 0000:03:00.0: [drm] Missing outer runtime PM protection
  [46.891178] WARNING: drivers/gpu/drm/xe/xe_pm.c:885 at
  xe_pm_runtime_get_noresume+0x8b/0xc0

Fix this by wrapping xe_gt_reset() with xe_pm_runtime_get/put().

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7593
Fixes: 480b358e7d8e ("drm/xe: Do not wake device during a GT reset")
Cc: <stable@vger.kernel.org> # v6.19+
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index b35be36b0eaa..f3b834a09a6d 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -12,6 +12,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_sysfs.h"
 #include "xe_mmio.h"
+#include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_sriov_pf.h"
 
@@ -163,7 +164,9 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
 	gt->ccs_mode = num_engines;
 	xe_gt_record_user_engines(gt);
+	xe_pm_runtime_get(xe);
 	xe_gt_reset(gt);
+	xe_pm_runtime_put(xe);
 
 	/* We may end PF lockdown once CCS mode is default again */
 	if (gt_ccs_mode_default(gt) && IS_SRIOV_PF(xe))
-- 
2.52.0

