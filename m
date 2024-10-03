Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13ACACF8553
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 00:46:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4B210E79E;
	Thu,  3 Oct 2024 00:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LpsIKhUa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF1B10E07D
 for <Intel-Xe@lists.freedesktop.org>; Thu,  3 Oct 2024 00:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727916374; x=1759452374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=svjqtNycWUjcFbHa53MfFoJaAUhKPxpQkMolZrtJ/WM=;
 b=LpsIKhUaX0P3gv9mLfLnPuRD3w9d7mYhIhkFYcpLsS8Rw144gJgmCw/8
 YZMAj0ghAunR8w6W8e5AJ8GUYN595bpe1vPXPavzSgCRe3nSPxJW6+NRZ
 sjzO2lPayiC95NtyPo7TJv0wsFdItKs21LIrOCAM+w5h5kNifMXpQ912K
 2oiikyLHtxwBshsdrPsjchZ0vgjiVJhUEbVIVBB4kOYSdb4dzfkycM7i1
 ymSt3PGf1yl7ogiXpM+I/NP8ov/9fYST/UwpApinW2a3ursJWbTY7NHE1
 3Be5klSCMz41kbmMA/AEgueQhq3aLgykHHk8m+E2+oe68CdRJYt0QqNfk g==;
X-CSE-ConnectionGUID: p0pCmh9jTRutwl8pED/EVQ==
X-CSE-MsgGUID: joPc66O9RS2/1DA1brCYXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="38460032"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="38460032"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 17:46:13 -0700
X-CSE-ConnectionGUID: SV8jjWC1RcqwIs299DfFPw==
X-CSE-MsgGUID: FJmfKSvhSMWZ2WoK/q2nMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="97514764"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa002.fm.intel.com with ESMTP; 02 Oct 2024 17:46:13 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v9 11/11] drm/xe/guc: Add a helper function for dumping GuC
 log to dmesg
Date: Wed,  2 Oct 2024 17:46:11 -0700
Message-ID: <20241003004611.2323493-12-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241003004611.2323493-1-John.C.Harrison@Intel.com>
References: <20241003004611.2323493-1-John.C.Harrison@Intel.com>
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
2.46.0

