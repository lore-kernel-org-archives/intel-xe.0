Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED860CA0EE8
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 06:23:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A485810E807;
	Fri, 30 Aug 2024 06:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MDuvxSiX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9701010E7FD
 for <Intel-Xe@lists.freedesktop.org>; Fri, 30 Aug 2024 06:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724998992; x=1756534992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CnTCHNgocoxDB8bLSUzY3Nw6pz2wVU9Ln175e4gejVI=;
 b=MDuvxSiXzSGE/BI69T0i7OPmn0iiB4FAPBVgPYpj8u7ooIAM0LM89na7
 49IMnb5SwzPVgjq2Qo3oxt03wRqMO5vbZ7iukJDCZ0Q0OuS6wwUz/iXsu
 Du1ajH2bs41OW8FFOBTMbLoLeomRGBKcvAB0H27a5KYyiOuFaidDZLnV2
 9C3JQ15gT2eTSHhh47D0SkGAg0STCVd9uoGNpHtC7xU4MUlooAEHEIgQi
 cpObO9NlMhvM34Vh0P5Rd8Wge7TYPy9tviEonKVlyXGCassH0xZC2hN28
 N4wBv5uffKqYoWh74EMb2E1dsUDkC9B0G6sB/ymvrReJDi5TblXrAv0RH g==;
X-CSE-ConnectionGUID: u+8gGL7nStSTVuO81EQorw==
X-CSE-MsgGUID: 1XOjXiaARnOrqHhcoXzbMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34245226"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="34245226"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 23:23:12 -0700
X-CSE-ConnectionGUID: G8hELSlCQAmtTSAA83DSLQ==
X-CSE-MsgGUID: ikpR40GeRCqiqAoiW/eB1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="87040586"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa002.fm.intel.com with ESMTP; 29 Aug 2024 23:23:12 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v6 9/9] drm/xe/guc: Add a helper function for dumping GuC log
 to dmesg
Date: Thu, 29 Aug 2024 23:23:10 -0700
Message-ID: <20240830062310.3450387-10-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830062310.3450387-1-John.C.Harrison@Intel.com>
References: <20240830062310.3450387-1-John.C.Harrison@Intel.com>
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

Also note that this is really a temporary stop-gap. The aim is to
allow on demand creation and dumping of devcoredump captures (which
includes the GuC log and much more). Currently this is not possible as
much of the devcoredump code requires a 'struct xe_sched_job' and
those are not available at many places that might want to do the dump.

v2: Add kerneldoc - review feedback from Michal W.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc_log.c | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_log.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index be8729cc0221..5e345575a65c 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -209,6 +209,24 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
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
2.46.0

