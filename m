Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C61C61DBD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 09:58:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524F310E487;
	Fri, 28 Aug 2026 09:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="REqC8XTi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F4D10E487
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 09:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787911099; x=1819447099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bAscJEJsXkUIqjr5UyLWj61YWreFv3sJmvK8ilV9qbg=;
 b=REqC8XTi2nMO0p3fBxqJkyZGjyHSrYZhUuHsWaKEyPidnge/e3wITc6c
 MWJ2eOK95FLTyhBL7FVTMI7rgQp69T4UmuHxrQkPDfLXHEP06L4AQsjy3
 714nsqk00oGH24bbKjOSei6tvkWKEkfF9UxUu2zvydin+01LyjfzQIgLa
 Gc9arNW8w5lm0YXBrzdYfdS1pa7nYKZMffWto65eCiM50KAYTWlK1fSq8
 n/HDyqQBF24vyIUaLWyhpwAnrlKCc5rkX1OLA+KaXiBIYMPZjrzwSI5cO
 dSkeugonQEryiguLOBV6h7RThQbovsQkbNohabCwsUesiFiqmZDMYSI55 g==;
X-CSE-ConnectionGUID: TWeRQcftT0yXq+4GZ2SvJg==
X-CSE-MsgGUID: fhPLN5/8Sr+SlUycwDKhRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="99084937"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="99084937"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 02:58:19 -0700
X-CSE-ConnectionGUID: GMB5bed2Tty3EILhd+TQIw==
X-CSE-MsgGUID: twESAQXdTyibWfaubeNX/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="272338898"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 02:58:17 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, badal.nilawar@intel.com,
 michal.wajdeczko@intel.com, himal.prasad.ghimiray@intel.com,
 dnyaneshwar.bhadane@intel.com, mallesh.koujalagi@intel.com,
 matthew.brost@intel.com
Subject: [PATCH v4 2/4] drm/xe/guc: Report CGP protocol errors using SIGID
Date: Fri, 28 Aug 2026 15:28:01 +0530
Message-ID: <20260828095803.2130312-3-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828095803.2130312-1-arvind.yadav@intel.com>
References: <20260828095803.2130312-1-arvind.yadav@intel.com>
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

Route selected GuC CGP protocol error logs through the structured SIGID
logging helper.

These paths were already reported as errors and return -EPROTO. Use the
GUC component, which maps to XE_SIGID_RUNTIME_FW, and pass -EPROTO as the
errno value.

Keep this conversion separate from the reset-request failure path because
it reports GuC protocol/message validation errors, not GT_TDR recovery.

Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Suggested-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index c1d469624215..0bd84360f38b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3508,12 +3508,11 @@ int xe_guc_exec_queue_cgp_context_error_handler(struct xe_guc *guc, u32 *msg,
 						u32 len)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
-	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_exec_queue *q;
 	u32 guc_id = msg[2];
 
 	if (unlikely(len != XE_GUC_EXEC_QUEUE_CGP_CONTEXT_ERROR_LEN)) {
-		drm_err(&xe->drm, "Invalid length %u", len);
+		xe_log_err(gt, GUC, -EPROTO, "Invalid CGP_CONTEXT_ERROR length %u\n", len);
 		return -EPROTO;
 	}
 
@@ -3546,13 +3545,13 @@ int xe_guc_exec_queue_cgp_context_error_handler(struct xe_guc *guc, u32 *msg,
  */
 int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
-	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_exec_queue_group *group;
 	struct xe_exec_queue *q, *upd_q;
 	u32 guc_id = msg[0];
 
 	if (unlikely(len < 1)) {
-		drm_err(&xe->drm, "Invalid CGP_SYNC_DONE length %u", len);
+		xe_log_err(gt, GUC, -EPROTO, "Invalid CGP_SYNC_DONE length %u\n", len);
 		return -EPROTO;
 	}
 
@@ -3561,7 +3560,7 @@ int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 le
 		return -EPROTO;
 
 	if (!xe_exec_queue_is_multi_queue_primary(q)) {
-		drm_err(&xe->drm, "Unexpected CGP_SYNC_DONE response");
+		xe_log_err(gt, GUC, -EPROTO, "Unexpected CGP_SYNC_DONE response\n");
 		return -EPROTO;
 	}
 
-- 
2.43.0

