Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A8FC46CA2
	for <intel-xe@archiver.kernel.org>; Tue, 19 Dec 2023 17:28:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E37510E50E;
	Tue, 19 Dec 2023 17:28:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7AAE10E515
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Dec 2023 17:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703006887; x=1734542887;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QlNO+oXzQudQ1ynp3gJ7zkRI1a/l0nfoHlb0FqTK7gc=;
 b=bW8RRfearWYqKXtxOunv0nJ5KblB98PeK+rDdJFU9mDkT2Y1RVRgKL1/
 mVV/47TnIyWFBpq7ORAD047cDxx5jCp/GYN+Kpb7mpw4hXURrKdAwB4+c
 OX+Q2oQXVj4vGMOsx/ry3aHGKN48j+F65C4vRY4Qe4OOD2YoI0ECqxn1G
 +tibkLb+PLfNbCTdJXkTe5xHGODAgg05hIo88NBxgKp097H4hvbbsOzYw
 5PoL8HgkZV8aeutmyKQCwf22/RJS22MWi0Jcd7V21TkYHG7g9A6YHU9ZC
 OCYNZHsFLGIqWj1yXtgdvMY2Rx52lzsZ3dVwCiR2fXAiYfhHAh50oWGbW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="2521308"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="2521308"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 09:28:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769303114"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; d="scan'208";a="769303114"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 09:28:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH] drm/xe/guc: Add more GuC CT states
Date: Tue, 19 Dec 2023 09:28:24 -0800
Message-Id: <20231219172824.832873-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

The Guc CT has more than enabled / disables states rather it has 4. The
4 states are not initialized, disabled, drop messages, and enabled.
Change the code to reflect this. These states will enable proper return
codes from functions and therefore enable proper error messages.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c          |  4 +-
 drivers/gpu/drm/xe/xe_guc_ct.c       | 55 ++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_guc_ct.h       |  8 +++-
 drivers/gpu/drm/xe/xe_guc_ct_types.h | 18 ++++++++-
 4 files changed, 64 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 482cb0df9f15..9b0fa8b1eb48 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -645,7 +645,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 
 	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
 
-	xe_assert(xe, !guc->ct.enabled);
+	xe_assert(xe, !xe_guc_ct_enabled(&guc->ct));
 	xe_assert(xe, len);
 	xe_assert(xe, len <= VF_SW_FLAG_COUNT);
 	xe_assert(xe, len <= MED_VF_SW_FLAG_COUNT);
@@ -827,7 +827,7 @@ int xe_guc_stop(struct xe_guc *guc)
 {
 	int ret;
 
-	xe_guc_ct_disable(&guc->ct);
+	xe_guc_ct_drop_messages(&guc->ct);
 
 	ret = xe_guc_submit_stop(guc);
 	if (ret)
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 24a33fa36496..22d655a8bf9a 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -278,12 +278,25 @@ static int guc_ct_control_toggle(struct xe_guc_ct *ct, bool enable)
 	return ret > 0 ? -EPROTO : ret;
 }
 
+static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
+				enum xe_guc_ct_state state)
+{
+	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
+	spin_lock_irq(&ct->fast_lock);	/* Serialise CT fast-path */
+
+	ct->g2h_outstanding = 0;
+	ct->state = state;
+
+	spin_unlock_irq(&ct->fast_lock);
+	mutex_unlock(&ct->lock);
+}
+
 int xe_guc_ct_enable(struct xe_guc_ct *ct)
 {
 	struct xe_device *xe = ct_to_xe(ct);
 	int err;
 
-	xe_assert(xe, !ct->enabled);
+	xe_assert(xe, !xe_guc_ct_enabled(ct));
 
 	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
 	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
@@ -300,12 +313,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	if (err)
 		goto err_out;
 
-	mutex_lock(&ct->lock);
-	spin_lock_irq(&ct->fast_lock);
-	ct->g2h_outstanding = 0;
-	ct->enabled = true;
-	spin_unlock_irq(&ct->fast_lock);
-	mutex_unlock(&ct->lock);
+	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
 
 	smp_mb();
 	wake_up_all(&ct->wq);
@@ -321,12 +329,12 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 
 void xe_guc_ct_disable(struct xe_guc_ct *ct)
 {
-	mutex_lock(&ct->lock); /* Serialise dequeue_one_g2h() */
-	spin_lock_irq(&ct->fast_lock); /* Serialise CT fast-path */
-	ct->enabled = false; /* Finally disable CT communication */
-	spin_unlock_irq(&ct->fast_lock);
-	mutex_unlock(&ct->lock);
+	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DISABLED);
+}
 
+void xe_guc_ct_drop_messages(struct xe_guc_ct *ct)
+{
+	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DROP_MESSAGES);
 	xa_destroy(&ct->fence_lookup);
 }
 
@@ -493,11 +501,19 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 		goto out;
 	}
 
-	if (unlikely(!ct->enabled)) {
+	if (ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED ||
+	    ct->state == XE_GUC_CT_STATE_DISABLED) {
 		ret = -ENODEV;
 		goto out;
 	}
 
+	if (ct->state == XE_GUC_CT_STATE_DROP_MESSAGES) {
+		ret = -ECANCELED;
+		goto out;
+	}
+
+	xe_assert(xe, xe_guc_ct_enabled(ct));
+
 	if (g2h_fence) {
 		g2h_len = GUC_CTB_HXG_MSG_MAX_LEN;
 		num_g2h = 1;
@@ -682,7 +698,8 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
 		return false;
 
 #define ct_alive(ct)	\
-	(ct->enabled && !ct->ctbs.h2g.info.broken && !ct->ctbs.g2h.info.broken)
+	(xe_guc_ct_enabled(ct) && !ct->ctbs.h2g.info.broken && \
+	 !ct->ctbs.g2h.info.broken)
 	if (!wait_event_interruptible_timeout(ct->wq, ct_alive(ct),  HZ * 5))
 		return false;
 #undef ct_alive
@@ -941,12 +958,18 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 
 	lockdep_assert_held(&ct->fast_lock);
 
-	if (!ct->enabled)
+	if (ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED ||
+	    ct->state == XE_GUC_CT_STATE_DISABLED)
 		return -ENODEV;
 
+	if (ct->state == XE_GUC_CT_STATE_DROP_MESSAGES)
+		return -ECANCELED;
+
 	if (g2h->info.broken)
 		return -EPIPE;
 
+	xe_assert(xe, xe_guc_ct_enabled(ct));
+
 	/* Calculate DW available to read */
 	tail = desc_read(xe, g2h, tail);
 	avail = tail - g2h->info.head;
@@ -1245,7 +1268,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
 		return NULL;
 	}
 
-	if (ct->enabled) {
+	if (xe_guc_ct_enabled(ct)) {
 		snapshot->ct_enabled = true;
 		snapshot->g2h_outstanding = READ_ONCE(ct->g2h_outstanding);
 		guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g,
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index f15f8a4857e0..214a6a357519 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -13,6 +13,7 @@ struct drm_printer;
 int xe_guc_ct_init(struct xe_guc_ct *ct);
 int xe_guc_ct_enable(struct xe_guc_ct *ct);
 void xe_guc_ct_disable(struct xe_guc_ct *ct);
+void xe_guc_ct_drop_messages(struct xe_guc_ct *ct);
 void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
 
 struct xe_guc_ct_snapshot *
@@ -22,10 +23,15 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
 void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
 void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic);
 
+static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
+{
+	return ct->state == XE_GUC_CT_STATE_ENABLED;
+}
+
 static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
 {
 	wake_up_all(&ct->wq);
-	if (ct->enabled)
+	if (xe_guc_ct_enabled(ct))
 		queue_work(system_unbound_wq, &ct->g2h_worker);
 	xe_guc_ct_fast_path(ct);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index d814d4ee3fc6..e36c7029dffe 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
@@ -72,6 +72,20 @@ struct xe_guc_ct_snapshot {
 	struct guc_ctb_snapshot h2g;
 };
 
+/**
+ * enum xe_guc_ct_state - CT state
+ * @XE_GUC_CT_STATE_NOT_INITIALIZED: CT suspended, messages not expected in this state
+ * @XE_GUC_CT_STATE_DISABLED: CT disabled, messages not expected in this state
+ * @XE_GUC_CT_STATE_DROP_MESSAGES: CT drops messages without errors
+ * @XE_GUC_CT_STATE_ENABLED: CT enabled, messages sent / recieved in this state
+ */
+enum xe_guc_ct_state {
+	XE_GUC_CT_STATE_NOT_INITIALIZED = 0,
+	XE_GUC_CT_STATE_DISABLED,
+	XE_GUC_CT_STATE_DROP_MESSAGES,
+	XE_GUC_CT_STATE_ENABLED,
+};
+
 /**
  * struct xe_guc_ct - GuC command transport (CT) layer
  *
@@ -96,8 +110,8 @@ struct xe_guc_ct {
 	u32 g2h_outstanding;
 	/** @g2h_worker: worker to process G2H messages */
 	struct work_struct g2h_worker;
-	/** @enabled: CT enabled */
-	bool enabled;
+	/** @state: CT state */
+	enum xe_guc_ct_state state;;
 	/** @fence_seqno: G2H fence seqno - 16 bits used by CT */
 	u32 fence_seqno;
 	/** @fence_lookup: G2H fence lookup */
-- 
2.34.1

