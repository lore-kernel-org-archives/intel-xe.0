Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87700606A330
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 00:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X9pTjugi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D4710E2DD;
	Thu, 19 Nov 2026 00:09:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F344B10F71D
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 00:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795046987; x=1826582987;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q1S+Ch2CT85dUksceAjKbm77Pd36qloZyqCFPgFPA/g=;
 b=X9pTjugiRqEB53v8p0tVlmowJ0bp0e4CyHS8F96OOTX7tGeberdQfo50
 FiWO560GzyNECUuY8Vz6Ja3aQGLzLmGFceaHtc/rswMD/jGsZ5kHvF3NK
 WRAcgVUhqiVBWIrSC4inuCHAbKjCy+irzft344rClJDMb2UWkY0xJARnN
 Npi0jIv+FvDDe4ctt8rXnhr0HqGXaBm9ETGnpWp0mx+oz/I4KRGKtfFz9
 qoGQ8pBkkxbwnqF82beIgzLym2CqN4okeWLN3gKO5GgOTXv/NnFf/Wz1S
 C3ikDvo8teJr5y1c2aZff1OydxKWRECag4faTeAhIIYMmYj8JN8Ep/OJS Q==;
X-CSE-ConnectionGUID: jL7X1tk7STWxCNRNDdDdXA==
X-CSE-MsgGUID: 1Pq9lUbwTVmvyo4LqhNVug==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3768594"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3768594"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 16:09:41 -0800
X-CSE-ConnectionGUID: YEtISROIRqSUOR/sV0s2Qg==
X-CSE-MsgGUID: RY6syVspRh2biUyHvuee+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10641161"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by fmviesa009.fm.intel.com with ESMTP; 18 Nov 2026 16:09:41 -0800
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: x.wang@intel.com, jia.yao@intel.com, matthew.brost@intel.com,
 jonathan.cavitt@intel.com, stable@kernel.org
Subject: [PATCH v5 1/4] drm/xe: Read scheduler message opcode under lock
Date: Wed, 18 Nov 2026 16:04:43 -0800
Message-ID: <20261119000446.696147-2-daniel.charles@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119000446.696147-1-daniel.charles@intel.com>
References: <20261119000446.696147-1-daniel.charles@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Matthew Brost <matthew.brost@intel.com>

For static scheduler messages, the opcode is only guaranteed to remain
stable while the message is on the pending message list. Read the opcode
under the message lock before removing the message from the pending list,
and pass it through the processing pipeline.

Fixes: ff796870f5dd ("drm/xe/guc: rework exec queue teardown PM/unplug handling")
Cc: stable@kernel.org
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.c       | 13 +++++++++----
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c          |  7 ++++---
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index 9c8004d5dd915..d656db758cb3c 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -23,15 +23,19 @@ static void xe_sched_process_msg_queue_if_ready(struct xe_gpu_scheduler *sched)
 }
 
 static struct xe_sched_msg *
-xe_sched_get_msg(struct xe_gpu_scheduler *sched)
+xe_sched_get_msg(struct xe_gpu_scheduler *sched, unsigned int *opcode)
 {
 	struct xe_sched_msg *msg;
 
 	xe_sched_msg_lock(sched);
 	msg = list_first_entry_or_null(&sched->msgs,
 				       struct xe_sched_msg, link);
-	if (msg)
+	if (msg) {
+		/* The opcode is only stable under lock for static messages */
+		*opcode = msg->opcode;
+
 		list_del_init(&msg->link);
+	}
 	xe_sched_msg_unlock(sched);
 
 	return msg;
@@ -42,13 +46,14 @@ static void xe_sched_process_msg_work(struct work_struct *w)
 	struct xe_gpu_scheduler *sched =
 		container_of(w, struct xe_gpu_scheduler, work_process_msg);
 	struct xe_sched_msg *msg;
+	unsigned int opcode;
 
 	if (drm_sched_is_stopped(&sched->base))
 		return;
 
-	msg = xe_sched_get_msg(sched);
+	msg = xe_sched_get_msg(sched, &opcode);
 	if (msg) {
-		sched->ops->process_msg(msg);
+		sched->ops->process_msg(msg, opcode);
 
 		xe_sched_process_msg_queue_if_ready(sched);
 	}
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
index 78ef2e8ded4f3..163a0d85e3cb9 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
@@ -34,7 +34,7 @@ struct xe_sched_backend_ops {
 	 * @process_msg: Process a message. Allowed to block, it is this
 	 * function's responsibility to free message if dynamically allocated.
 	 */
-	void (*process_msg)(struct xe_sched_msg *msg);
+	void (*process_msg)(struct xe_sched_msg *msg, unsigned int opcode);
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7ce73489c35fc..c4ef3e9bf7a18 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2056,16 +2056,17 @@ static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg,
 #define MSG_HEAD	BIT(9)
 #define MSG_PM_REF	BIT(10)
 
-static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
+static void guc_exec_queue_process_msg(struct xe_sched_msg *msg,
+				       unsigned int opcode)
 {
 	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(msg->private_data));
 	int idx;
-	bool pm_ref = !!(msg->opcode & MSG_PM_REF);
+	bool pm_ref = !!(opcode & MSG_PM_REF);
 	bool bound = drm_dev_enter(&xe->drm, &idx);
 
 	trace_xe_sched_msg_recv(msg);
 
-	switch (msg->opcode & OPCODE_MASK) {
+	switch (opcode & OPCODE_MASK) {
 	case CLEANUP:
 		__guc_exec_queue_process_msg_cleanup(msg, bound);
 		break;
-- 
2.43.0

