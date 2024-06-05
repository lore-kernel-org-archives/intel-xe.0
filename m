Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C8FC27C52
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 20:20:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36A910E253;
	Wed,  5 Jun 2024 20:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XVIlZhqT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38A710E087
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 20:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717618801; x=1749154801;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tckn7clbjFpplU6pngGlSYyjlWCMa36gbuXDojHL/0o=;
 b=XVIlZhqTa/ERSogLLfXjkSKH2TlTggbuU5EyvHvzP13zhiJmD6hRygly
 YjvMkTrncCLiAtvy862q/sLPxJ54FzZrAT4nLPZZKMkg4y92uSMOGsAUV
 c2MXvw7fqEz/AQw6MKOvdxYUGsdxQOR8+9TC/W1RdbQVDm+e70R/wuBql
 Xm/u5wy2wNU49g3OA3YAiLCGl5j02cUBoCy5LAytl5aXf2ygC/6AcT1/9
 yn+cFfFF6z0ND6nILHdgyL0brSiD69ElS9UyG+vJQPoIyHWvDOQYYsIJG
 FTFVcrs2dacAZpugtEXTv51C6YiVHRvy4j3XQyZEt0ela6ndLijIT2xUd w==;
X-CSE-ConnectionGUID: 50whpHVwSMS07/oAOzxdqA==
X-CSE-MsgGUID: nMRdF1P2TImUV+jgqwvvYA==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="31751842"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="31751842"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 13:20:01 -0700
X-CSE-ConnectionGUID: OZZT1Yv2TOeSAOI6uqwsSQ==
X-CSE-MsgGUID: T5p6LEI+QieknFpCpSez/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="42161877"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.25.139])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 13:20:00 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/2] drm/xe/guc: Allow CTB G2H processing without G2H IRQ
Date: Wed,  5 Jun 2024 22:19:47 +0200
Message-Id: <20240605201947.1460-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240605201947.1460-1-michal.wajdeczko@intel.com>
References: <20240605201947.1460-1-michal.wajdeczko@intel.com>
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

During early initialization, in the xe_guc_min_load_for_hwconfig()
function, we are successfully enabling CTB communication, but it
will only allow us to send non-blocking H2G messages, as due to
not yet enabled IRQs, including G2H IRQs, we will not notice any
new G2H message sent by the GuC, including replies to our blocking
H2G request messages. And those successful replies are mandatory
for the VF drivers to continue normal operations.

As attempt to workaround this driver initialization ordering issue,
introduce special safe-mode CTB worker, that will periodically
trigger G2H processing, like original IRQ handler, in case no
MSI/MSIX IRQs were enabled on the driver yet. Once we detect that
IRQ were enabled, we will stop this worker.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c       | 42 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct_types.h |  2 ++
 2 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 17f0e5019bb8..b8155edb7f07 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -127,6 +127,7 @@ static void guc_ct_fini(struct drm_device *drm, void *arg)
 }
 
 static void g2h_worker_func(struct work_struct *w);
+static void safe_mode_worker_func(struct work_struct *w);
 
 static void primelockdep(struct xe_guc_ct *ct)
 {
@@ -155,6 +156,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	spin_lock_init(&ct->fast_lock);
 	xa_init(&ct->fence_lookup);
 	INIT_WORK(&ct->g2h_worker, g2h_worker_func);
+	INIT_DELAYED_WORK(&ct->safe_mode_worker,  safe_mode_worker_func);
 	init_waitqueue_head(&ct->wq);
 	init_waitqueue_head(&ct->g2h_fence_wq);
 
@@ -321,6 +323,42 @@ static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
 	mutex_unlock(&ct->lock);
 }
 
+static bool ct_needs_safe_mode(struct xe_guc_ct *ct)
+{
+	return !pci_dev_msi_enabled(to_pci_dev(ct_to_xe(ct)->drm.dev));
+}
+
+static bool ct_restart_safe_mode_worker(struct xe_guc_ct *ct)
+{
+	if (!ct_needs_safe_mode(ct))
+		return false;
+
+	queue_delayed_work(ct->g2h_wq, &ct->safe_mode_worker, HZ / 10);
+	return true;
+}
+
+static void safe_mode_worker_func(struct work_struct *w)
+{
+	struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct, safe_mode_worker.work);
+
+	xe_guc_ct_irq_handler(ct);
+
+	if (!ct_restart_safe_mode_worker(ct))
+		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode canceled\n");
+}
+
+static void ct_enter_safe_mode(struct xe_guc_ct *ct)
+{
+	if (ct_restart_safe_mode_worker(ct))
+		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode enabled\n");
+}
+
+static void ct_exit_safe_mode(struct xe_guc_ct *ct)
+{
+	if (cancel_delayed_work_sync(&ct->safe_mode_worker))
+		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode disabled\n");
+}
+
 int xe_guc_ct_enable(struct xe_guc_ct *ct)
 {
 	struct xe_device *xe = ct_to_xe(ct);
@@ -350,6 +388,9 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	wake_up_all(&ct->wq);
 	xe_gt_dbg(gt, "GuC CT communication channel enabled\n");
 
+	if (ct_needs_safe_mode(ct))
+		ct_enter_safe_mode(ct);
+
 	return 0;
 
 err_out:
@@ -373,6 +414,7 @@ static void stop_g2h_handler(struct xe_guc_ct *ct)
 void xe_guc_ct_disable(struct xe_guc_ct *ct)
 {
 	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DISABLED);
+	ct_exit_safe_mode(ct);
 	stop_g2h_handler(ct);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index fede4c6e93cb..761cb9031298 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
@@ -110,6 +110,8 @@ struct xe_guc_ct {
 	u32 g2h_outstanding;
 	/** @g2h_worker: worker to process G2H messages */
 	struct work_struct g2h_worker;
+	/** @safe_mode_worker: worker to check G2H messages with IRQ disabled */
+	struct delayed_work safe_mode_worker;
 	/** @state: CT state */
 	enum xe_guc_ct_state state;
 	/** @fence_seqno: G2H fence seqno - 16 bits used by CT */
-- 
2.43.0

