Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68200CCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 12:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2951D10E267;
	Thu, 30 Oct 2025 12:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CPx788gf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BAFF10E267
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 12:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761827075; x=1793363075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fYkkKQSJuXUB8y1H6TqKi7w9hov/cEd32/aXJc4in04=;
 b=CPx788gfhAcP92PkpqKGDZKNEEHO0EOiOrj6QDSa+SJ3nyjP1CQhCsM6
 s0O2Qswab5Paodm47YlSPZZD4ISMqa5sAX9dM/GW/NCOGNSiVQ1+SjszL
 iRvmOpWvZyZT5/m+27LRRhF6YIp6WUtt0JqppjpCOBEgwN3i80Vq+hcSw
 ggIXwaE6SE8/9ZPbha7U8XvI3DSC9XzPCA1GrQWw0osHiw6FCgE+LYJ0e
 NaGnZykXK0wI8JeZvPckCKOIk+EsaYCeQab6LQMomGhIuU1d7y+RXWZGe
 VjiBDegcwovDLqCRnyCmARIL/S0kn42nkRmAslYFyUOqLrGT/mDx7ahTX w==;
X-CSE-ConnectionGUID: NhXTczpPQGaL+s0f2ngEYA==
X-CSE-MsgGUID: wUJjZxqVQc2HTSrq+mNBFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="64062631"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="64062631"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 05:24:35 -0700
X-CSE-ConnectionGUID: OXZg6pdoQL+mB3cnX24sXw==
X-CSE-MsgGUID: JIRIl/ziRYKxQMz3Skoh2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="191103682"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa004.fm.intel.com with ESMTP; 30 Oct 2025 05:24:32 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v8 2/4] drm/xe/guc_submit: Introduce pause/unpause() helpers
 for PF
Date: Thu, 30 Oct 2025 17:53:55 +0530
Message-Id: <20251030122357.128825-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251030122357.128825-1-raag.jadav@intel.com>
References: <20251030122357.128825-1-raag.jadav@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 30 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
 2 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d9073dde9467..3147d691e29e 100644
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

