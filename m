Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93755CCF9E5
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 12:32:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4928810E46A;
	Mon, 27 Oct 2025 12:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LD3zpzNQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDA910E46A
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 12:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761568321; x=1793104321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J23BF6/RaRuG0y4mMZ2AbkgPgKWeKfylq0qhSUlq5oo=;
 b=LD3zpzNQTvim0CXGfDVMyGS4JVpLanyrYQ6WmF/VSuXMt1Xrj2dXjBIQ
 V8dN/njX1ufloqr6LbcduURFqumvJ9/5SuDIES+XeX4XUCgtrf/oJ3d+w
 4SsJpm5Jz7QoCMTxIcSBPRcU9xvEg3MWXrNjmNuivc+CBRZzs8TxG+kcb
 p3vAI9aR1xyNveyZ2W/5fWsDvJxEOuu3wNGIsCiANgksns7zJZPBkVnc5
 e+7/GA/5FwdREWQodfUVekw6msKo414yLF3sI0qQJ2iWERFl2Mzy/iZFS
 pxS4MZiyXN58oRtMB4C4SYkuYB+kBf+XN9NZVVD09o/kYBcBLqxOKVYdJ w==;
X-CSE-ConnectionGUID: U0k0RBtvTnu3ZjmTiRQfIw==
X-CSE-MsgGUID: uhNxIeP+Rnup+JJjOBKwEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63678878"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="63678878"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 05:32:01 -0700
X-CSE-ConnectionGUID: 8twtAJ/ZRcOyqFDPeVbe6w==
X-CSE-MsgGUID: u5H7ejIQRk+6qzc7MXxbiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="184729535"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 27 Oct 2025 05:31:58 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v7 2/4] drm/xe/guc_submit: Introduce pause/unpause() helpers
 for PF
Date: Mon, 27 Oct 2025 18:00:55 +0530
Message-Id: <20251027123057.3738059-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027123057.3738059-1-raag.jadav@intel.com>
References: <20251027123057.3738059-1-raag.jadav@intel.com>
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

Introduce pause/unpause() helpers which stop/start further runs of
submission tasks on given GuC and can be called from PF context. This
is in preparation of usecases where we simply need to stop/start the
scheduler without losing GuC state and don't require dealing with VF
migration.

v7: Reword commit message (Matthew Brost)

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 30 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
 2 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 0cb83e5faceb..ebaaa0b6ddfb 100644
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
  * xe_guc_submit_pause_vf - Stop further runs of submission tasks for VF.
  * @guc: the &xe_guc struct instance whose scheduler is to be disabled
@@ -2335,6 +2350,21 @@ static void guc_exec_queue_unpause(struct xe_guc *guc, struct xe_exec_queue *q)
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
  * xe_guc_submit_unpause_vf - Allow further runs of submission tasks for VF.
  * @guc: the &xe_guc struct instance whose scheduler is to be enabled
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 0e7996836131..100a7891b918 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -20,8 +20,10 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc);
 void xe_guc_submit_reset_wait(struct xe_guc *guc);
 void xe_guc_submit_stop(struct xe_guc *guc);
 int xe_guc_submit_start(struct xe_guc *guc);
+void xe_guc_submit_pause(struct xe_guc *guc);
 void xe_guc_submit_pause_abort(struct xe_guc *guc);
 void xe_guc_submit_pause_vf(struct xe_guc *guc);
+void xe_guc_submit_unpause(struct xe_guc *guc);
 void xe_guc_submit_unpause_vf(struct xe_guc *guc);
 void xe_guc_submit_unpause_prepare_vf(struct xe_guc *guc);
 void xe_guc_submit_wedge(struct xe_guc *guc);
-- 
2.34.1

