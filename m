Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F629D3176E
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 17:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC9A10E418;
	Tue,  5 Nov 2024 17:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ifObphE+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD8C10E418
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 17:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730827848; x=1762363848;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uaUHuOrqqYEQdbC3hvnbnLbL1E48Hwz6Pp5HeFPcRdc=;
 b=ifObphE+um9n5DUEH8U+7OHezlLf95Hf/lju4Z8UKT1COaeixryr2Ejt
 RuKXBPDtqXqniY2TFrR0mHXdhn3dPGQZ0Dw/YcSOvSm6N69VXcS8HzIPv
 PD5VHDgop1gacftpHNRJMjAvxR7T53XbmixU47Au10U/er49YebNcJ2aA
 1v/dThosQzO+k9XgSqo5gZAqJDSvEzF9dngKKmOwVmK8v0jUEpiz7bU8I
 0dr2iHrIrBNzWJ2xiNixEyAQqmmdtnQP+QlFR0eRXyyxk/GtA9qdNbNXZ
 i6VCZd3n2bgvwuzoJkKsRgR+NEua/WHWehrjdE7Y1gowJHLGkSNQUaFmy A==;
X-CSE-ConnectionGUID: DTigJn2CRCOrWvPES/Frgg==
X-CSE-MsgGUID: l4RK1i7bS/2HxVs8VahWNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="48094150"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="48094150"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 09:30:48 -0800
X-CSE-ConnectionGUID: DfTsj4hhRee8O4mxDAyKQA==
X-CSE-MsgGUID: 30E5rsWbR0OYSoHUsHITnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="114906267"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.120.199])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 09:30:47 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/4] drm/xe/guc: Drop redundant logs about invalid G2H length
Date: Tue,  5 Nov 2024 18:30:30 +0100
Message-Id: <20241105173032.1947-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241105173032.1947-1-michal.wajdeczko@intel.com>
References: <20241105173032.1947-1-michal.wajdeczko@intel.com>
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

We are now logging details of the failed G2H message (including
its length) at the GuC CT component. Drop now redundant log from
the GuC submit code.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 28 ++++++----------------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7afcc243037c..4481890be941 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1884,15 +1884,12 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
 
 int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
-	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_exec_queue *q;
 	u32 guc_id = msg[0];
 	u32 runnable_state = msg[1];
 
-	if (unlikely(len < 2)) {
-		drm_err(&xe->drm, "Invalid length %u", len);
+	if (unlikely(len < 2))
 		return -EPROTO;
-	}
 
 	q = g2h_exec_queue_lookup(guc, guc_id);
 	if (unlikely(!q))
@@ -1926,14 +1923,11 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
 
 int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
-	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_exec_queue *q;
 	u32 guc_id = msg[0];
 
-	if (unlikely(len < 1)) {
-		drm_err(&xe->drm, "Invalid length %u", len);
+	if (unlikely(len < 1))
 		return -EPROTO;
-	}
 
 	q = g2h_exec_queue_lookup(guc, guc_id);
 	if (unlikely(!q))
@@ -1955,14 +1949,11 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
-	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_exec_queue *q;
 	u32 guc_id = msg[0];
 
-	if (unlikely(len < 1)) {
-		drm_err(&xe->drm, "Invalid length %u", len);
+	if (unlikely(len < 1))
 		return -EPROTO;
-	}
 
 	q = g2h_exec_queue_lookup(guc, guc_id);
 	if (unlikely(!q))
@@ -2002,10 +1993,8 @@ int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
 	u32 status;
 
-	if (unlikely(len != XE_GUC_ACTION_STATE_CAPTURE_NOTIFICATION_DATA_LEN)) {
-		xe_gt_dbg(guc_to_gt(guc), "Invalid length %u", len);
+	if (unlikely(len != XE_GUC_ACTION_STATE_CAPTURE_NOTIFICATION_DATA_LEN))
 		return -EPROTO;
-	}
 
 	status = msg[0] & XE_GUC_STATE_CAPTURE_EVENT_STATUS_MASK;
 	if (status == XE_GUC_STATE_CAPTURE_EVENT_STATUS_NOSPACE)
@@ -2020,14 +2009,11 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 					       u32 len)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
-	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_exec_queue *q;
 	u32 guc_id = msg[0];
 
-	if (unlikely(len < 1)) {
-		drm_err(&xe->drm, "Invalid length %u", len);
+	if (unlikely(len < 1))
 		return -EPROTO;
-	}
 
 	q = g2h_exec_queue_lookup(guc, guc_id);
 	if (unlikely(!q))
@@ -2052,10 +2038,8 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
 	u8 guc_class, instance;
 	u32 reason;
 
-	if (unlikely(len != 3)) {
-		drm_err(&xe->drm, "Invalid length %u", len);
+	if (unlikely(len != 3))
 		return -EPROTO;
-	}
 
 	guc_class = msg[0];
 	instance = msg[1];
-- 
2.43.0

