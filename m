Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67166E784AF
	for <intel-xe@archiver.kernel.org>; Thu, 25 Dec 2025 01:17:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05603113F73;
	Thu, 25 Dec 2025 01:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YMwxkm1f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ABA4113F6F
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Dec 2025 01:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766625463; x=1798161463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R0KF3sQwgUKqBoyGtak6XxDbE6p21RjQATFtb3IYUEk=;
 b=YMwxkm1fnyP3k4UL70foEfl6XqoKD2OpDzaOGQieeRemDJLDTwMdo7iE
 vGbk0yOiujUibaY77wwGLP1DCqMBrOWSlseSnj1BJ3X+XygZKtVbsa2ok
 AJLZYRbLhQoKJWhgcPsY+UesTzyzVZFsfWBR0LVUkXKJxVVa8onAvxA96
 dso/Fh1fzoF4HIGDEE49ovnH7AWQUD4NhVenWhv04zzBQP8Akl+4bcKWx
 gU8r0XoT7PCAci1Q4TGJ6mnL7oLxs9aFam/wYdQZoVfqSc8giswYGBwXI
 GjXrWiPDUwdoOR2HA15i1383htjwgtIfDMsd2rfPjg08VcvJ30NifdpSQ A==;
X-CSE-ConnectionGUID: oJvVuo1KTDG17vOnoCC2tQ==
X-CSE-MsgGUID: 6+LUm7HaRxGR8E10iE3Gaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="85866368"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; d="scan'208";a="85866368"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 17:17:42 -0800
X-CSE-ConnectionGUID: NqOsw7eYRA+psegf66XkNA==
X-CSE-MsgGUID: a8Fe+acySzKsBcZbEXgD0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; d="scan'208";a="204629155"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 17:17:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [RFC PATCH 13/13] drm/xe: Add exec queue deadline trace points
Date: Wed, 24 Dec 2025 17:17:34 -0800
Message-Id: <20251225011734.341683-14-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251225011734.341683-1-matthew.brost@intel.com>
References: <20251225011734.341683-1-matthew.brost@intel.com>
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

Add exec queue deadline trace points to help debug and profile the
deadline implementation.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c |  4 ++++
 drivers/gpu/drm/xe/xe_trace.h      | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 791c64d6397f..ab9450ca8559 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2068,6 +2068,8 @@ static void __guc_exec_queue_process_msg_enter_deadline(struct xe_sched_msg *msg
 	if (xe_exec_queue_is_multi_queue_secondary(q))
 		q = xe_exec_queue_multi_queue_primary(q);
 
+	trace_xe_exec_queue_enter_deadline(q);
+
 	if (guc_exec_queue_allowed_to_change_state(q))
 		deadline_policies(guc, q);
 }
@@ -2081,6 +2083,8 @@ static void __guc_exec_queue_process_msg_exit_deadline(struct xe_sched_msg *msg)
 	if (xe_exec_queue_is_multi_queue_secondary(q))
 		q = xe_exec_queue_multi_queue_primary(q);
 
+	trace_xe_exec_queue_exit_deadline(q);
+
 	if (guc_exec_queue_allowed_to_change_state(q))
 		init_policies(guc, q);
 }
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 6d12fcc13f43..d40947a8e1fe 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -233,6 +233,16 @@ DEFINE_EVENT(xe_exec_queue, xe_exec_queue_lr_cleanup,
 	     TP_ARGS(q)
 );
 
+DEFINE_EVENT(xe_exec_queue, xe_exec_queue_enter_deadline,
+	     TP_PROTO(struct xe_exec_queue *q),
+	     TP_ARGS(q)
+);
+
+DEFINE_EVENT(xe_exec_queue, xe_exec_queue_exit_deadline,
+	     TP_PROTO(struct xe_exec_queue *q),
+	     TP_ARGS(q)
+);
+
 DECLARE_EVENT_CLASS(xe_sched_job,
 		    TP_PROTO(struct xe_sched_job *job),
 		    TP_ARGS(job),
-- 
2.34.1

