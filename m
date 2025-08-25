Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAABCCA0FE7
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 22:32:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 956BA10E59D;
	Mon, 25 Aug 2025 22:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EHJnAbG7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148A510E59D
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 22:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756161148; x=1787697148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K8hO0hJk0O77swIVWss1NssFt0dzYiyhXbKQDWj6DwI=;
 b=EHJnAbG7TTFAED+3Pm+/BXE8sozFks+5pcOfE1KgZFsRsgkvM4DOTTgJ
 Mq99Ro5mC7YOkG2hElCpiTraRKSFBWeZdcFOQJOKn5DKOFYAII0f0cToY
 ijqVoeoWJYv32hzu8nMOlBBWXq2rLeINPUpbJo01UcDdjCjrHKm5MZp5p
 pRQ8hzicW47UZ2iXLOqA+2ew+GQVT+8njhEKOwV1D48cJMX4belcBqxG/
 FYQ8yD0OmF80089sYa298qbWithWU3KApokE225g12eN2XaAOSTKNh8qi
 eIetGhfLMIlXyylF2aHSnWgIkVZfPHfXUb/uet9Ot9EOcAMH53oJe+QaY Q==;
X-CSE-ConnectionGUID: fLCZmF+eRyGkjxBjb59brw==
X-CSE-MsgGUID: csFAx2EgQ02K2cQhE1l9Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69818300"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69818300"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 15:32:28 -0700
X-CSE-ConnectionGUID: xwdhQornSuSjxWat3RWJIA==
X-CSE-MsgGUID: UJQylqYxTfutbXBSpOMpAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="170243499"
Received: from osgc-sh-rabbit.sh.intel.com ([10.239.81.90])
 by fmviesa010.fm.intel.com with ESMTP; 25 Aug 2025 15:32:26 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, karthik.poosa@intel.com, james.xiong@intel.com,
 stuart.summers@intel.com, shuicheng.lin@intel.com,
 vinay.belgaumkar@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH 1/3] drm/xe: early-return for SR-IOV VF in C6 funcs
Date: Mon, 25 Aug 2025 15:32:17 -0700
Message-ID: <20250825223219.1351786-2-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825223219.1351786-1-x.wang@intel.com>
References: <20250825223219.1351786-1-x.wang@intel.com>
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

VF drivers can't access any of gtidle control registers. By
returning early when IS_SRIOV_VF() is true, we avoid executing
the assertions.

Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index ffb210216aa9..611c506bdad1 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -377,12 +377,12 @@ int xe_gt_idle_init(struct xe_gt_idle *gtidle)
 
 void xe_gt_idle_enable_c6(struct xe_gt *gt)
 {
-	xe_device_assert_mem_access(gt_to_xe(gt));
-	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
-
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
 		return;
 
+	xe_device_assert_mem_access(gt_to_xe(gt));
+	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
+
 	/* Units of 1280 ns for a total of 5s */
 	xe_mmio_write32(&gt->mmio, RC_IDLE_HYSTERSIS, 0x3B9ACA);
 	/* Enable RC6 */
@@ -392,12 +392,12 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt)
 
 void xe_gt_idle_disable_c6(struct xe_gt *gt)
 {
-	xe_device_assert_mem_access(gt_to_xe(gt));
-	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
-
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
 		return;
 
+	xe_device_assert_mem_access(gt_to_xe(gt));
+	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
+
 	xe_mmio_write32(&gt->mmio, RC_CONTROL, 0);
 	xe_mmio_write32(&gt->mmio, RC_STATE, 0);
 }
-- 
2.43.0

