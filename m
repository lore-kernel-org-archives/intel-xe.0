Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549CEC27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 22:56:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7F510E33D;
	Mon, 10 Jun 2024 22:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W3XwybbS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C750910E3AA
 for <Intel-Xe@lists.freedesktop.org>; Mon, 10 Jun 2024 22:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718060204; x=1749596204;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fXSt5lCT6UzHR/SLX8vGjizyS0x3GYqyxwS0AIDNIjA=;
 b=W3XwybbSGC5sZEXs737PRS/U8TylAbJoOvRVOuvQAH09AhIXCP4N2HRE
 +8oMA9fq+4bCrgRF/LWmO3jlDKHN64mACyraFgnajIoGXPAP/mW0+gtO9
 z15temMyCzMFcT7SJPu7gBc8B35ZrDYbs8ljlnwQywNeiFIHECuOLIVB4
 v+E1gDE6fNHsTLR0ZRhh7HgFotSZSWRUCYrx1kSkSi5psodggJhHyNuhT
 5n9vZRy5Nk7XMhPF1ixn4GY+DI1uk4X43Eum3zRbDJVdECIEPuASAeYGv
 iuMcwj7vcs8fWzrZVZjPIJrvitvnIGbCGLGrYqx+XJNBGMzGuNXmbTLpQ g==;
X-CSE-ConnectionGUID: MQ8e3CtFTFy0zlZjZF43NQ==
X-CSE-MsgGUID: zhXrMqFLRRmy+aZi+XCPEQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="25409024"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="25409024"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 15:56:41 -0700
X-CSE-ConnectionGUID: uo5kIvDUQgSxyI2iDDTKjQ==
X-CSE-MsgGUID: 7hdEWSnKSoifTHuK30c7vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="39784072"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa008.jf.intel.com with ESMTP; 10 Jun 2024 15:56:41 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v4 5/7] drm/xe/guc: Add a helper function for dumping GuC log
 to dmesg
Date: Mon, 10 Jun 2024 15:56:38 -0700
Message-ID: <20240610225640.2100465-6-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240610225640.2100465-1-John.C.Harrison@Intel.com>
References: <20240610225640.2100465-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc_log.c | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_guc_log.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index a35d3cc0c369..9714ee6f99e0 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -245,6 +245,20 @@ void xe_guc_log_snapshot_print(struct xe_device *xe, struct xe_guc_log_snapshot
 	}
 }
 
+void xe_guc_log_print_dmesg(struct xe_guc_log *log, bool atomic)
+{
+	struct xe_gt *gt = log_to_gt(log);
+	static int g_count;
+	struct drm_printer ip = xe_gt_info_printer(gt);
+	struct drm_printer lp = drm_line_printer(&ip, "Capture", ++g_count);
+
+	drm_printf(&lp, "Dumping GuC log for %ps...\n", __builtin_return_address(0));
+
+	xe_guc_log_print(log, &lp, atomic);
+
+	drm_printf(&lp, "Done.\n");
+}
+
 void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p, bool atomic)
 {
 	struct xe_guc_log_snapshot *snapshot;
diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index 6e4d0b369c19..29154ab507ff 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -39,6 +39,7 @@ struct xe_device;
 
 int xe_guc_log_init(struct xe_guc_log *log);
 void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p, bool atomic);
+void xe_guc_log_print_dmesg(struct xe_guc_log *log, bool atomic);
 struct xe_guc_log_snapshot *xe_guc_log_snapshot_alloc(struct xe_guc_log *log, bool atomic);
 struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic);
 void xe_guc_log_snapshot_print(struct xe_device *xe, struct xe_guc_log_snapshot *snapshot,
-- 
2.43.2

