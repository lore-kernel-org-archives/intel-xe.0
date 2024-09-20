Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95863C78850
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 13:48:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6344910E14D;
	Fri, 20 Sep 2024 13:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TSC4aYt7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A3810E14D
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 13:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726840087; x=1758376087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FI91Tg7aYuZzponRjOFC2yOGDym7ahCzMDOdHhjfaCk=;
 b=TSC4aYt7xINaClkh46r6PMiGFz752ePV3m5NRsJejf7RJcU4v9izp4I2
 nBQXEZd56cGmpqtB+Km/Y/ToIk1Ha7y6S+GLDSjGhxYiLHoOVeZiBWGgL
 89edWfUiPPGkTmklDfX5e0c2uJrJahVbW63lS1sTj2jpKA4Lv077vn0+0
 ftbG7Nd+Pa7OeK7bAWA79yb9GPeIDMF3zN3Vk0S0o3kHYxSsSrXC8Vigv
 lHPYfHxjOOnujZ9xJTyKSgmzy8xsb5DCQloQHgZGr17fNnWi92sb9PEcF
 upIIFeEf35H0oXSD2KL1jVFJgOeOvDcVX20NIqXnhidoBy62kRZZp5Qcm Q==;
X-CSE-ConnectionGUID: /8mB49LDRQ2wvcYccNXP/w==
X-CSE-MsgGUID: MjhgrLxJQLGQf/psMFSIeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25363808"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="25363808"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 06:48:07 -0700
X-CSE-ConnectionGUID: +MZuLc1ZTVKwC0Pd8tBlbA==
X-CSE-MsgGUID: l1w/XxqDQ0+Fm3TS/0WoLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="74684730"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.59])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 06:47:08 -0700
From: bnilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com,
	john.c.harrison@intel.com
Subject: [[CI] 11/12] drm/xe/guc: Add a helper function for dumping GuC log to
 dmesg
Date: Fri, 20 Sep 2024 19:36:45 +0530
Message-Id: <20240920140646.618008-12-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240920140646.618008-1-badal.nilawar@intel.com>
References: <20240920140646.618008-1-badal.nilawar@intel.com>
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

From: John Harrison <John.C.Harrison@Intel.com>

Create a helper function that can be used to dump the GuC log to dmesg
in a manner that is reliable for extraction and decode. The intention
is that calls to this can be added by developers when debugging
specific issues that require a GuC log but do not allow easy capture
of the log - e.g. failures in selftests and failues that lead to
kernel hangs.

Also note that this is really a temporary stop-gap. The aim is to
allow on demand creation and dumping of devcoredump captures (which
includes the GuC log and much more). Currently this is not possible as
much of the devcoredump code requires a 'struct xe_sched_job' and
those are not available at many places that might want to do the dump.

v2: Add kerneldoc - review feedback from Michal W.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_log.c | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_log.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 24564624e91e..d7be69f20af4 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -214,6 +214,24 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
 	}
 }
 
+/**
+ * xe_guc_log_print_dmesg - dump a copy of the GuC log to dmesg
+ * @log: GuC log structure
+ */
+void xe_guc_log_print_dmesg(struct xe_guc_log *log)
+{
+	struct xe_gt *gt = log_to_gt(log);
+	static int g_count;
+	struct drm_printer ip = xe_gt_info_printer(gt);
+	struct drm_printer lp = drm_line_printer(&ip, "Capture", ++g_count);
+
+	drm_printf(&lp, "Dumping GuC log for %ps...\n", __builtin_return_address(0));
+
+	xe_guc_log_print(log, &lp);
+
+	drm_printf(&lp, "Done.\n");
+}
+
 /**
  * xe_guc_log_print - dump a copy of the GuC log to some useful location
  * @log: GuC log structure
diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index 949d2c98343d..1fb2fae1f4e1 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -39,6 +39,7 @@ struct xe_device;
 
 int xe_guc_log_init(struct xe_guc_log *log);
 void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
+void xe_guc_log_print_dmesg(struct xe_guc_log *log);
 struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic);
 void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p);
 void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot);
-- 
2.34.1

