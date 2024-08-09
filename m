Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0627C531DA
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 19:18:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97AAB10E9E2;
	Fri,  9 Aug 2024 19:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VnJ4h6sU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671F010E9E2
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 19:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723231119; x=1754767119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R5VCW+pRNaLDD4mclJfE6GgRpPLXg/MiAgaO/U7uFas=;
 b=VnJ4h6sUJVeTof7IJH8FjzN1Q6jHr/URJs1r3d7SG7T0PfB7fa8ULb2E
 UM024l4atTbWKMMlaxwWtJjLni7vHG5jTU5KXZ7umLhvaUz/WNCQjK+lf
 BZWFNzs8WxmsaHdSVl0Uzg2FgilQLkbzmB8xGazTpGdR3vDdJys/9JkjZ
 1/7+tULCH6EC3ffdDO65h7TLr0qYn/FW60V/l6folVdD+ZxaUJSMoocAl
 gkN8gpEwSycMo4eSK8qkA4eKRO+roWB41tuDoYNYCE6Lv09xwopUzeRQM
 ezXwXscRbGOW1FjEanhGLBapCdCRawxZOPepJuVmAOt8fQQhmJt41giaA w==;
X-CSE-ConnectionGUID: AImZyo3lQEG7fnjAPkb4Yw==
X-CSE-MsgGUID: Tivwdy2zTJ6EAQD+98p29w==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="32566811"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="32566811"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 12:18:38 -0700
X-CSE-ConnectionGUID: idKn5wreQPSVXI9oy1fqzw==
X-CSE-MsgGUID: Ht30bcduTyeJVaCA7SfYRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="88294750"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 12:18:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com
Subject: [PATCH 3/5] drm/xe: Add xe_sched_add_msg_locked helper
Date: Fri,  9 Aug 2024 12:19:27 -0700
Message-Id: <20240809191929.3138956-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240809191929.3138956-1-matthew.brost@intel.com>
References: <20240809191929.3138956-1-matthew.brost@intel.com>
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

Will help by allowing callers to own message locking.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.c | 9 ++++++++-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h | 2 ++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index 1c703e8423de..c518d1d16d82 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -94,8 +94,15 @@ void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
 		      struct xe_sched_msg *msg)
 {
 	xe_sched_msg_lock(sched);
-	list_add_tail(&msg->link, &sched->msgs);
+	xe_sched_add_msg_locked(sched, msg);
 	xe_sched_msg_unlock(sched);
+}
 
+void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
+			     struct xe_sched_msg *msg)
+{
+	lockdep_assert_held(&sched->base.job_list_lock);
+
+	list_add_tail(&msg->link, &sched->msgs);
 	xe_sched_process_msg_queue(sched);
 }
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index a54038fb3094..cee9c6809fc0 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -24,6 +24,8 @@ void xe_sched_submission_stop(struct xe_gpu_scheduler *sched);
 
 void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
 		      struct xe_sched_msg *msg);
+void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
+			     struct xe_sched_msg *msg);
 
 static inline void xe_sched_msg_lock(struct xe_gpu_scheduler *sched)
 {
-- 
2.34.1

