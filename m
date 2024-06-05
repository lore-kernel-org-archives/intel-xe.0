Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072ADC25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 15:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF45310E0D3;
	Wed,  5 Jun 2024 15:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fwTJvWCY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1705B10E0D3
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 15:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717601029; x=1749137029;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/a6h90+nLtNKszKl5o9SeSo6GDyx2FdwNe4kX+an3Y0=;
 b=fwTJvWCYqLIp9GI/DB6Sau37jJ7Uem4jHB7JRQP2+daqghh+T4qEqN3+
 UjfdBazNS0YBjXZi9CfFY3V1SklC9vTq/E2OlG+xH0eR66cOIW1KaOg/G
 HZTL8U+LFHJgefWhxpkmeV/fuasE2cqfroqAE0e1U1MDTXTh2wm9oieju
 HRaY1k3q70tBnsQmm7FM2qUf6mhIzqvDuCm+q00vnIJj+CSdv8TcQ8nyf
 klf4jGQgYU4OZMu/znteN2MToQAiUt/B/f7quhmtErT3BFQfMNdkFZB/5
 iadcD3M2/4S3kGRHnc+s41qCXqBagrqXYk/552fzLpsG0sFySFtrBXKM/ Q==;
X-CSE-ConnectionGUID: 91UkGPPpT/KyacGhCcEYdQ==
X-CSE-MsgGUID: Mm3umsHHRISZldoESTIndg==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="31716688"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="31716688"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 08:23:44 -0700
X-CSE-ConnectionGUID: 9FyB3bu5QI6q2x6kOHlTAA==
X-CSE-MsgGUID: U7TLXssrQym4ImGqrMTUrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="75105169"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 08:23:43 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, john.c.harrison@intel.com,
 stuart.summers@intel.com
Subject: [PATCH] drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs
Date: Wed,  5 Jun 2024 08:08:28 -0700
Message-Id: <20240605150828.2736396-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
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

We currently have debugfs support that allows the userspace to initiate
an asynchronous gt reset on command.  However, userspace may also wish
to wait for the completion of the gt reset before performing any
additional work.  To that end, add a version of the force_reset gt
debugfs function that operates synchronously.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1068
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: John Harrison <john.c.harrison@intel.com>
CC: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 66f897a9b6ca9..5e7fd937917a1 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -116,6 +116,17 @@ static int force_reset(struct xe_gt *gt, struct drm_printer *p)
 	return 0;
 }
 
+static int force_reset_sync(struct xe_gt *gt, struct drm_printer *p)
+{
+	xe_pm_runtime_get(gt_to_xe(gt));
+	xe_gt_reset_async(gt);
+	xe_pm_runtime_put(gt_to_xe(gt));
+
+	flush_work(&gt->reset.worker);
+
+	return 0;
+}
+
 static int sa_info(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -261,6 +272,7 @@ static int vecs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
 static const struct drm_info_list debugfs_list[] = {
 	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
 	{"force_reset", .show = xe_gt_debugfs_simple_show, .data = force_reset},
+	{"force_reset_sync", .show = xe_gt_debugfs_simple_show, .data = force_reset_sync},
 	{"sa_info", .show = xe_gt_debugfs_simple_show, .data = sa_info},
 	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
 	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
-- 
2.25.1

