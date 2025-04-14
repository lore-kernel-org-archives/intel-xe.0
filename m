Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586DEC369B2
	for <intel-xe@archiver.kernel.org>; Mon, 14 Apr 2025 20:24:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B93A10E658;
	Mon, 14 Apr 2025 20:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q7Vfs2uc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BF610E658
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Apr 2025 20:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744662240; x=1776198240;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+g0WAfUHskYzd1bm5aCZv7FRzuGYBhguivac7x/ihjs=;
 b=Q7Vfs2uc9kl3IR0zMGRBky/AF3Ii1A7YmJ2hLHMcrcPdTKFKSDu6IGKa
 YTFpuqHxmwfP8dUfsLWYM32LcAf10aeucc9O5u2dAToHqat0PJjEMvgI6
 H2fJ/LDF8b77QGhJqG3dgmgA5lnkWMCb9yPvbPzhncGx2gAWGEucWe4nS
 JHpFwsMZuvpwXMJgxOfGbC+NpaHqnUHfsqaaRAr3a7063dnEbqYAEcTil
 efPuIbiMWatpNgl7x3Yzr08DhRLOhlyF3vx18sElRUMKHds6ki0GNl72c
 ahwBFC1tSpO8CrfZkzonDy1icW1CqEdEcqgHAqLcWjnEBiA9hPRUhRzsS Q==;
X-CSE-ConnectionGUID: EBfCaUJ3QKaBpjwTKJuUFA==
X-CSE-MsgGUID: 2TjRcOhsRKiok2x5klru+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="48851480"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="48851480"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 13:24:00 -0700
X-CSE-ConnectionGUID: iSD1VWsORSKaCO3QbfTcUw==
X-CSE-MsgGUID: Go/epXF0QtKkpQnGXgEoQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="134774363"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.114.177])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 13:23:58 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH 1/2] drm/xe/guc: Fix out-of-bound while enabling engine
 activity stats
Date: Mon, 14 Apr 2025 22:23:46 +0200
Message-Id: <20250414202347.1909-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

In the PF mode we allocate array of struct engine_activity_group
that holds activity data split for the PF and all potential VFs.
But while preparing data for use by VFs we ended with bad index.

 [ ] BUG: KASAN: slab-out-of-bounds in xe_guc_engine_activity_function_stats+0x41e/0x4f0 [xe]
 [ ] Call Trace:
 [ ]  <TASK>
 [ ]  dump_stack_lvl+0x91/0xf0
 [ ]  print_report+0xd1/0x680
 [ ]  ? __virt_addr_valid+0x23a/0x440
 [ ]  ? kasan_addr_to_slab+0xd/0xb0
 [ ]  kasan_report+0xe7/0x130
 [ ]  ? xe_guc_engine_activity_function_stats+0x41e/0x4f0 [xe]
 [ ]  ? xe_guc_engine_activity_function_stats+0x41e/0x4f0 [xe]
 [ ]  __asan_report_store8_noabort+0x17/0x30
 [ ]  xe_guc_engine_activity_function_stats+0x41e/0x4f0 [xe]
 [ ]  pf_engine_activity_stats+0x1b6/0x7f0 [xe]
 [ ]  ? kobject_put+0x5f/0x470
 [ ]  xe_pci_sriov_configure+0x28c9/0x3270 [xe]
 [ ]  ? __pfx_dev_attr_store+0x10/0x10
 [ ]  ? kstrtoull+0x3b/0x70
 [ ]  ? __pfx___lock_acquire+0x10/0x10
 [ ]  ? kstrtou16+0x65/0xf0
 [ ]  sriov_numvfs_store+0x20c/0x400
 [ ]  ? __pfx_sriov_numvfs_store+0x10/0x10
 [ ]  ? __pfx__copy_from_iter+0x10/0x10
 [ ]  ? __pfx_dev_attr_store+0x10/0x10
 [ ]  dev_attr_store+0x3b/0x80
 [ ]  ? sysfs_file_ops+0x135/0x190

Fixes: 2de3f38fbf89 ("drm/xe: Add support for per-function engine activity")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_engine_activity.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
index b96fea78df8b..0fb48f8f05d8 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
@@ -304,6 +304,8 @@ static void engine_activity_set_cpu_ts(struct xe_guc *guc, unsigned int index)
 	struct engine_activity_group *eag = &engine_activity->eag[index];
 	int i, j;
 
+	xe_gt_assert(guc_to_gt(guc), index < engine_activity->num_activity_group);
+
 	for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++)
 		for (j = 0; j < GUC_MAX_INSTANCES_PER_CLASS; j++)
 			eag->engine[i][j].last_cpu_ts = ktime_get();
@@ -374,8 +376,9 @@ static int engine_activity_enable_function_stats(struct xe_guc *guc, int num_vfs
 		return ret;
 	}
 
-	for (i = 0; i < engine_activity->num_functions; i++)
-		engine_activity_set_cpu_ts(guc, i + 1);
+	/* skip PF as it was already setup */
+	for (i = 1; i < engine_activity->num_functions; i++)
+		engine_activity_set_cpu_ts(guc, i);
 
 	return 0;
 }
-- 
2.47.1

