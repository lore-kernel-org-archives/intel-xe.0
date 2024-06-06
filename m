Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71544C27C54
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 13:07:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141A510E94C;
	Thu,  6 Jun 2024 13:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FhuKuXFn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037B010E94C
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 13:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717679223; x=1749215223;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IhyC0MqXbqYsIzlaZ5p70lKNTG/UfGI4KplaLMJsMeY=;
 b=FhuKuXFnJQJDV0j8cMOOWL8wERSGo/i+wL7N2oxVn66fiNHaXo3Pxmlb
 zBpqJgHIPKhUECkd21qlp3HZRuEDEmUsX6Q8iU5VeF5se2JLeY/iNu+th
 9/LLEGQ6o4UBpcxKIj6Q9/rjoWZqwCnWzRVtFFV5BS8Lk1jnqTfFQW27A
 vLmH+OOUQlcqUfLzapmBd25V2qi+dNxy4+YDvc/ybM+1bKQv8L0JilVV+
 1M1i5EZtjpU2D5pbuAnJSBNDE22JhAotIZUUpvru8Ly+RUgCo4HpSeypy
 kQR1lgEhWg9gyM0dWortIyLuTPxog5hmrq5sIPleMapcBX3jg+FV3pzjd A==;
X-CSE-ConnectionGUID: /yKr3cA8QN6GYGiBNSqLAg==
X-CSE-MsgGUID: KdreX2p8Q7a5Q2zVe7enpg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14464255"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="14464255"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 06:07:03 -0700
X-CSE-ConnectionGUID: JMyzwHLUSMemTz1R7zJdfA==
X-CSE-MsgGUID: 99jIqh6DQuKU5QZXySl5Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="38519347"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.165])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 06:07:02 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 2/2] drm/xe/guc: Allow CTB G2H processing without G2H IRQ
Date: Thu,  6 Jun 2024 15:06:39 +0200
Message-Id: <20240606130639.1504-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240606130639.1504-1-michal.wajdeczko@intel.com>
References: <20240606130639.1504-1-michal.wajdeczko@intel.com>
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
v2: use code from g2h worker instead of g2h irq handler (Matt)
---
 drivers/gpu/drm/xe/xe_guc_ct.c       | 43 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct_types.h |  2 ++
 2 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 08cf355e2e56..936b63483e96 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -126,7 +126,9 @@ static void guc_ct_fini(struct drm_device *drm, void *arg)
 	xa_destroy(&ct->fence_lookup);
 }
 
+static void receive_g2h(struct xe_guc_ct *ct);
 static void g2h_worker_func(struct work_struct *w);
+static void safe_mode_worker_func(struct work_struct *w);
 
 static void primelockdep(struct xe_guc_ct *ct)
 {
@@ -155,6 +157,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	spin_lock_init(&ct->fast_lock);
 	xa_init(&ct->fence_lookup);
 	INIT_WORK(&ct->g2h_worker, g2h_worker_func);
+	INIT_DELAYED_WORK(&ct->safe_mode_worker,  safe_mode_worker_func);
 	init_waitqueue_head(&ct->wq);
 	init_waitqueue_head(&ct->g2h_fence_wq);
 
@@ -321,6 +324,42 @@ static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
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
+	receive_g2h(ct);
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
@@ -350,6 +389,9 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	wake_up_all(&ct->wq);
 	xe_gt_dbg(gt, "GuC CT communication channel enabled\n");
 
+	if (ct_needs_safe_mode(ct))
+		ct_enter_safe_mode(ct);
+
 	return 0;
 
 err_out:
@@ -373,6 +415,7 @@ static void stop_g2h_handler(struct xe_guc_ct *ct)
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

