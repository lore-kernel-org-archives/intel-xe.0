Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F39C10F1A
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 23:25:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C4B11294D;
	Thu, 25 Apr 2024 23:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ib7S8EIt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20A410F201
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 23:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714087531; x=1745623531;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tm0mqThWpk5DRwaU0rqzRZZLYIJO519LR6+J/5DEso4=;
 b=Ib7S8EItvmNToJhB1xD3JTydhFPTGTZmb/wL1cOvUIK+LLlF89dxv3fH
 sMVBngi7c78+eed5vgS3FE68e3soOqwKnaH4PcA1FtwXNlUDpm6zPlf69
 MD3bbLFZwuodZcWXn+cr/JxigX5zQLyqEfitDhFm8tA6gh+uQPs2U6fki
 0pWYNDvGRUhCDCHoxBwsYt6kSDD9c0cIChPncRmk5baHxUmqPvfm5BnkX
 MtUyY8hqv+gn1JfxnFOVVLZxSe1qTw4HYkCGS0DbJNQ/+QwAsa8JZONEX
 E2aCptR7+h7UasrF1wKUP7S/UOEiJmuWB0dOoOoDnufMqjoQmx/tYZko5 g==;
X-CSE-ConnectionGUID: 3ke1ymsEQSWVb4davTJVxg==
X-CSE-MsgGUID: XO2HSk3hRvyTOkcfIDWhsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9970881"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9970881"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 16:25:16 -0700
X-CSE-ConnectionGUID: /BgTazjBRbSyVZq23B+ZJw==
X-CSE-MsgGUID: MGloJ+pOSQySxM2v6TQU2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="56411995"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 16:25:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v3 5/5] drm/xe: Replace engine references with exec queue in
 xe_guc_submit.c
Date: Thu, 25 Apr 2024 16:25:44 -0700
Message-Id: <20240425232544.1935578-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425232544.1935578-1-matthew.brost@intel.com>
References: <20240425232544.1935578-1-matthew.brost@intel.com>
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

Exec queue has replaced engine nomenclature.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 1945bc5ffc21..cd082b8523fa 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -449,9 +449,9 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue
 	xe_map_wr_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
 			field_, val_)
 
-static void __register_mlrc_engine(struct xe_guc *guc,
-				   struct xe_exec_queue *q,
-				   struct guc_ctxt_registration_info *info)
+static void __register_mlrc_exec_queue(struct xe_guc *guc,
+				       struct xe_exec_queue *q,
+				       struct guc_ctxt_registration_info *info)
 {
 #define MAX_MLRC_REG_SIZE      (13 + XE_HW_ENGINE_MAX_INSTANCE * 2)
 	struct xe_device *xe = guc_to_xe(guc);
@@ -488,8 +488,8 @@ static void __register_mlrc_engine(struct xe_guc *guc,
 	xe_guc_ct_send(&guc->ct, action, len, 0, 0);
 }
 
-static void __register_engine(struct xe_guc *guc,
-			      struct guc_ctxt_registration_info *info)
+static void __register_exec_queue(struct xe_guc *guc,
+				  struct guc_ctxt_registration_info *info)
 {
 	u32 action[] = {
 		XE_GUC_ACTION_REGISTER_CONTEXT,
@@ -509,7 +509,7 @@ static void __register_engine(struct xe_guc *guc,
 	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
 }
 
-static void register_engine(struct xe_exec_queue *q)
+static void register_exec_queue(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
@@ -557,9 +557,9 @@ static void register_engine(struct xe_exec_queue *q)
 	set_exec_queue_registered(q);
 	trace_xe_exec_queue_register(q);
 	if (xe_exec_queue_is_parallel(q))
-		__register_mlrc_engine(guc, q, &info);
+		__register_mlrc_exec_queue(guc, q, &info);
 	else
-		__register_engine(guc, &info);
+		__register_exec_queue(guc, &info);
 	init_policies(guc, q);
 }
 
@@ -729,7 +729,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 
 	if (!exec_queue_killed_or_banned_or_wedged(q) && !xe_sched_job_is_error(job)) {
 		if (!exec_queue_registered(q))
-			register_engine(q);
+			register_exec_queue(q);
 		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
 			q->ring_ops->emit_job(job);
 		submit_exec_queue(q);
-- 
2.34.1

