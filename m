Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE44C52D1E
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 23:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0724510E48C;
	Mon, 29 Jul 2024 23:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hGBwLvdg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3EA10E3CE
 for <Intel-Xe@lists.freedesktop.org>; Mon, 29 Jul 2024 23:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722295075; x=1753831075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aJVZPdV+3J0Tu3HI5KugEAMnS5+on4KotztJJPjfWdQ=;
 b=hGBwLvdg97kx1g9HGl9ERQV54Di6uDpUgDf149YmVe2CiuEc14T02GPH
 Inp1H2JFVzpcFdC3Y4Aum2/CJnHi82XMGntn4j/6BFK7U7b5fapUZNXXd
 G1p7dXN68vsiOpjqaGnoazR8cPWgdVDI+5MpsmOp6Sm93JxYfQmQZpTKR
 9PT/Mzds1hfDkOmX7SZ05o2jS7LPEj88q0mVnrXqb11OdGE+tZ7cRJW6y
 TYGdpzM36+6xj/qIlZaKtFmjdBxMJzx8IqFxdDpgsOOhAI8UhevahNvg1
 NoidVRbme/E7i7+ausTGdA41TADzrhu4yVuxaZPZhnwxopMhMRCmY7R26 A==;
X-CSE-ConnectionGUID: tonuvB2kT6KWC2WI58E1xw==
X-CSE-MsgGUID: E5A3k4uKRv6YClNxuGCk0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="19966924"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="19966924"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 16:17:54 -0700
X-CSE-ConnectionGUID: 9PWyL3FHREOdiP7NCwC5qA==
X-CSE-MsgGUID: R2Pc1uUdQf+LO/Hv023E9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="54103545"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa009.jf.intel.com with ESMTP; 29 Jul 2024 16:17:54 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v5 5/8] drm/xe/guc: Add a helper function for dumping GuC log
 to dmesg
Date: Mon, 29 Jul 2024 16:17:49 -0700
Message-ID: <20240729231753.3101070-6-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240729231753.3101070-1-John.C.Harrison@Intel.com>
References: <20240729231753.3101070-1-John.C.Harrison@Intel.com>
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

v2: Add kerneldoc - review feedback from Michal W.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc_log.c | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_log.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index b6ee019cd886..2f0a7607941d 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -268,6 +268,25 @@ void xe_guc_log_snapshot_print(struct xe_device *xe, struct xe_guc_log_snapshot
 	}
 }
 
+/**
+ * xe_guc_log_print_dmesg - dump a copy of the GuC log to dmesg
+ * @log: GuC log structure
+ * @atomic: is the call inside an atomic section of some kind?
+ */
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
 /**
  * xe_guc_log_print - dump a copy of the GuC log to some useful location
  * @log: GuC log structure
diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index 88e47e9907ff..959a33af23f5 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -39,6 +39,7 @@ struct xe_device;
 
 int xe_guc_log_init(struct xe_guc_log *log);
 void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p, bool atomic);
+void xe_guc_log_print_dmesg(struct xe_guc_log *log, bool atomic);
 struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic);
 void xe_guc_log_snapshot_print(struct xe_device *xe, struct xe_guc_log_snapshot *snapshot,
 			       struct drm_printer *p, bool atomic);
-- 
2.43.2

