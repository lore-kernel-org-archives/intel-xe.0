Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B73CCD195
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 09:43:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBABD10E725;
	Wed, 22 Oct 2025 09:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h0YgtPNE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC0A10E725
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 09:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761126192; x=1792662192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BiioHYQcUoQfzah2Oljum1JFAyY/wj69OKTk6irAE+s=;
 b=h0YgtPNE4YA7fFB3jczljIxOSxBnR0s2mZLOx0hYddFfL4ljVRdKC76Y
 XAzDQKKt1BkWiWlD01K0is3gbh8vRpN3WO5zDgwtVbLH2f6sDA1hDhVT7
 fz3PsGkUv5VnnfQT8HIOgDjay1d7cHXkeJ8knXqkAbntCA4OvXcGcNfEt
 f4EgoStI+0v5bt5diNj56rVXHXtu4gBXXW25G9BPnhK+OHLA8D7lxjKFQ
 WXjCboM8V6bET3EKQcb9AyxjMlD92YvQnGoMoa26gOGYgjW77eTEO3Cz4
 mbxzgIs0tgr/KKy9hw+2UGtxPz9xBJKealdUGoJJ9lH+c9zN92FRXfzRj w==;
X-CSE-ConnectionGUID: bX8vrO8ORm6Pn5LEgS4yQw==
X-CSE-MsgGUID: vRUKSlhIS3G2qjnqF+OzQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63363955"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="63363955"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 02:43:12 -0700
X-CSE-ConnectionGUID: DV9svZBRT++svndEMDEMdA==
X-CSE-MsgGUID: JehNR9DzTcOd3KPlJBu+ww==
X-ExtLoop1: 1
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 22 Oct 2025 02:43:09 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v6 2/4] drm/xe/guc_submit: Bring back pause/unpause() helpers
Date: Wed, 22 Oct 2025 15:12:44 +0530
Message-Id: <20251022094246.3584785-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251022094246.3584785-1-raag.jadav@intel.com>
References: <20251022094246.3584785-1-raag.jadav@intel.com>
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

In preparation of non-VF usecases which require stopping/starting
submission on GuC, bring back original pause/unpause() helpers.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 30 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
 2 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 8fbb6b27095d..62771d5c1d91 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2161,6 +2161,21 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
 	}
 }
 
+/**
+ * xe_guc_submit_pause - Stop further runs of submission tasks on given GuC.
+ * @guc: the &xe_guc struct instance whose scheduler is to be disabled
+ */
+void xe_guc_submit_pause(struct xe_guc *guc)
+{
+	struct xe_exec_queue *q;
+	unsigned long index;
+
+	mutex_lock(&guc->submission_state.lock);
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
+		xe_sched_submission_stop(&q->guc->sched);
+	mutex_unlock(&guc->submission_state.lock);
+}
+
 /**
  * xe_guc_submit_vf_pause - Stop further runs of submission tasks for VF.
  * @guc: the &xe_guc struct instance whose scheduler is to be disabled
@@ -2333,6 +2348,21 @@ static void guc_exec_queue_unpause(struct xe_guc *guc, struct xe_exec_queue *q)
 	xe_sched_submission_resume_tdr(sched);
 }
 
+/**
+ * xe_guc_submit_unpause - Allow further runs of submission tasks on given GuC.
+ * @guc: the &xe_guc struct instance whose scheduler is to be enabled
+ */
+void xe_guc_submit_unpause(struct xe_guc *guc)
+{
+	struct xe_exec_queue *q;
+	unsigned long index;
+
+	mutex_lock(&guc->submission_state.lock);
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
+		xe_sched_submission_start(&q->guc->sched);
+	mutex_unlock(&guc->submission_state.lock);
+}
+
 /**
  * xe_guc_submit_vf_unpause - Allow further runs of submission tasks for VF.
  * @guc: the &xe_guc struct instance whose scheduler is to be enabled
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index cb5cc2cc9497..8057a4b71ff3 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -20,7 +20,9 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc);
 void xe_guc_submit_reset_wait(struct xe_guc *guc);
 void xe_guc_submit_stop(struct xe_guc *guc);
 int xe_guc_submit_start(struct xe_guc *guc);
+void xe_guc_submit_pause(struct xe_guc *guc);
 void xe_guc_submit_pause_abort(struct xe_guc *guc);
+void xe_guc_submit_unpause(struct xe_guc *guc);
 void xe_guc_submit_vf_pause(struct xe_guc *guc);
 void xe_guc_submit_vf_unpause(struct xe_guc *guc);
 void xe_guc_submit_vf_unpause_prepare(struct xe_guc *guc);
-- 
2.34.1

