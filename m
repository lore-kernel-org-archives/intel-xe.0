Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41AEE77181
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 14:12:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C1610E746;
	Mon,  9 Dec 2024 14:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L912UKCQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510E510E740
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Dec 2024 14:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733753558; x=1765289558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hahbuMHM3KfROEylnXKS2fbG3sKa3Abho+WGnihn3T8=;
 b=L912UKCQZHnCpYBuTe7gsK5F7MEIJF6JkTRICYtwfNQFLF/3vxWgH4An
 ckoNwDNt+d21RRbyL50Ja065839kvFh8qNm1em/rk942whTFF4nz3pp4B
 5gYetTdQftjb4IYwXBVMuLggaAezW7aVOVOcpdJ8tm5+vuEU+995X6fw3
 3C0jm375QzhV/184joV6Uo63rIg05xCADNSh8wDJ2fu/z1YAxG4OTSeb6
 bQ+FvzRlXCSg6oSOtkDIm6vuOoevHPnEk/ISmWqRGlnyU4VDY76/4xHpZ
 Fpx4WfmSCliLmnAtnobVGXjagGjwpsQ2oV5FvfPLkOA/1NoQWV7VPjrt5 A==;
X-CSE-ConnectionGUID: zGC2dk2XTqSj6VvzMfLb9w==
X-CSE-MsgGUID: uywFrTlNSfCbif6JTeRXPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="33967733"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="33967733"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 06:12:38 -0800
X-CSE-ConnectionGUID: MuWaz1MQTQGNOX49NaU88A==
X-CSE-MsgGUID: xhqMft4pRtWZAVqnoW7Y4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="94768298"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO mpatelcz-mobl..)
 ([10.245.245.25])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 06:12:37 -0800
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH 2/2] drm/xe: make change ccs_mode a synchronous action
Date: Mon,  9 Dec 2024 15:12:10 +0100
Message-ID: <20241209141210.1311374-3-maciej.patelczyk@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209141210.1311374-1-maciej.patelczyk@intel.com>
References: <20241209141210.1311374-1-maciej.patelczyk@intel.com>
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

If ccs_mode is being modified via
   /sys/class/drm/cardX/device/tileY/gtY/ccs_mode
the asynchronous reset is triggered and the write returns immediately.

With that some test receive false information about number of CCS engines
or even fail if they proceed without delay after changing the ccs_mode.

Changing the ccs_mode change from async to sync to prevent failures in
tests.

Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index b6adfb9f2030..8d02ec3f7d12 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -115,7 +115,7 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 num_engines, num_slices;
-	int ret;
+	int mode_changed = 0, ret;
 
 	if (IS_SRIOV(xe)) {
 		xe_gt_dbg(gt, "Can't change compute mode when running as %s\n",
@@ -151,10 +151,14 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 		gt->ccs_mode = num_engines;
 		xe_gt_record_user_engines(gt);
 		xe_gt_reset_async(gt);
+		mode_changed = 1;
 	}
 
 	mutex_unlock(&xe->drm.filelist_mutex);
 
+	if (mode_changed)
+		xe_gt_reset_wait(gt);
+
 	return count;
 }
 
-- 
2.43.0

