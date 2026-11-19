Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A326D606A325
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 17:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HtHteEhV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5613F10F028;
	Thu, 19 Nov 2026 17:51:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384EE10F03D
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 17:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795110673; x=1826646673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r9LShMxnR96CG099ESyh01VzD++iM2tyq1tuuuzHLfA=;
 b=HtHteEhV96SmJkCl+htOPjf8ufBKdhdNnadFQYqzaqFTwU6/mzJyNBFQ
 z+HO9LBVfnW8B4/ZewvkOx5eVx7toe3XeQ6bEZfI2b6AaXKLZfpQT4eTa
 myQ6oAcI5rtd6K2zh6p8xVRnzSdsYLIqkvzGsTXiS3rsgUUrcyz+dqVCE
 /mR7CPG1yW3cPFRhTi7IPmVX1aVhKNhcuNUbsrXiAarKRvjisYGv2ok6W
 W8cuKdRFx4AkLozCl3Gu0OptpERPxew3NG8QR3HcTtuqXB2h6ORoc5cT3
 nno0trmMm9jUs/0nTTgt0WD08JtOwGc5a22F+12N6Jr1FO1eXEvmMpf6U A==;
X-CSE-ConnectionGUID: AskZoAAqS7qM6PptIGR48g==
X-CSE-MsgGUID: Bb5Cv1dpSqasJqR7yaAd/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3866155"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3866155"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 09:51:11 -0800
X-CSE-ConnectionGUID: FBs1DZQRT6ycNDZA1SWDUQ==
X-CSE-MsgGUID: qy53JoxkRX6XbF73B/pyXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10582818"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by fmviesa005.fm.intel.com with ESMTP; 19 Nov 2026 09:51:11 -0800
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: x.wang@intel.com, jia.yao@intel.com, matthew.brost@intel.com,
 jonathan.cavitt@intel.com, stable <stable@kernel.org>
Subject: [PATCH v6 1/4] drm/xe: Read scheduler message opcode under lock
Date: Thu, 19 Nov 2026 09:46:18 -0800
Message-ID: <20261119174621.1311154-2-daniel.charles@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119174621.1311154-1-daniel.charles@intel.com>
References: <20261119174621.1311154-1-daniel.charles@intel.com>
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

v5: No code changes.

Fixes: ff796870f5dd ("drm/xe/guc: rework exec queue teardown PM/unplug handling")
Cc: stable <stable@kernel.org>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.c       | 13 +++++++++----
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c          |  7 ++++---
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index 0ef77cdec51d..0acee928cb70 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -26,15 +26,19 @@ static void xe_sched_process_msg_queue_if_ready(struct xe_gpu_scheduler *sched)
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
@@ -45,13 +49,14 @@ static void xe_sched_process_msg_work(struct work_struct *w)
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
index f40764aa78e0..37948406cb7d 100644
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
index b5c916a764db..1f24e248acb9 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2073,16 +2073,17 @@ static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg,
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

