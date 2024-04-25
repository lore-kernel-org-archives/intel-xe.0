Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20ADC25B4F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 05:54:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A354211A169;
	Thu, 25 Apr 2024 05:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bCT9n7vQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24AF511A165
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 05:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714024493; x=1745560493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D6jYzgOJRfo7A8U1U97Uh8ojiPBhe1YuD/sfinVtjVQ=;
 b=bCT9n7vQxQqLWG4w2jsRa7zKUXJHZFnHk5Ru8Kdwd0/h4A5WrOIuXK10
 R7Cf1dGkHN0LVj/+eANPf2C8f1NSMYCR9Vswk+jb/jxxA/6VIxn46tFI4
 mqn9GpMxrILPXe7lMZkIkOvez3UrHnMzHhY+0x7y2K3NUdgLHE2dRO9MV
 FujoEevu1Shol3+Ut2hYk6l1sKb4gTVXyTpALGX49b2ZVgLg2aC9kFI6R
 VtIxMSpZhxpcp1juqzIlRqQyOlO+g3euOYqRYq3R5WDdVTrpL6EQwLGzf
 jR3gQkSzYJwKSG8N/hSTIQecs7lPncwi+nQ3ReoeuPke/f4PGXL3uO84h Q==;
X-CSE-ConnectionGUID: F6egFoj4S+iUa3B4U/YQ+g==
X-CSE-MsgGUID: Xz5H1MDPT2OMOUshHgWMBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9554288"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="9554288"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 22:54:52 -0700
X-CSE-ConnectionGUID: DESj0KQBR2yg5fUxor7wxw==
X-CSE-MsgGUID: pn+tqxkIT5SMXpROJMEv3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="55894786"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 22:54:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 5/5] drm/xe: Replace engine references with exec queue in
 xe_guc_submit.c
Date: Wed, 24 Apr 2024 22:55:22 -0700
Message-Id: <20240425055522.1919005-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425055522.1919005-1-matthew.brost@intel.com>
References: <20240425055522.1919005-1-matthew.brost@intel.com>
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
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 28c1b9b46251..5aa6ad540ef5 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -426,9 +426,9 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue
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
@@ -465,8 +465,8 @@ static void __register_mlrc_engine(struct xe_guc *guc,
 	xe_guc_ct_send(&guc->ct, action, len, 0, 0);
 }
 
-static void __register_engine(struct xe_guc *guc,
-			      struct guc_ctxt_registration_info *info)
+static void __register_exec_queue(struct xe_guc *guc,
+				  struct guc_ctxt_registration_info *info)
 {
 	u32 action[] = {
 		XE_GUC_ACTION_REGISTER_CONTEXT,
@@ -486,7 +486,7 @@ static void __register_engine(struct xe_guc *guc,
 	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
 }
 
-static void register_engine(struct xe_exec_queue *q)
+static void register_exec_queue(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
@@ -534,9 +534,9 @@ static void register_engine(struct xe_exec_queue *q)
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
 
@@ -706,7 +706,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 
 	if (!exec_queue_killed_or_banned(q) && !xe_sched_job_is_error(job)) {
 		if (!exec_queue_registered(q))
-			register_engine(q);
+			register_exec_queue(q);
 		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
 			q->ring_ops->emit_job(job);
 		submit_exec_queue(q);
-- 
2.34.1

