Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B068C47DDC
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 21:01:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148C410EF9D;
	Mon, 22 Jan 2024 21:01:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF02310EF72
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 21:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705957286; x=1737493286;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4P4J8ljii8x6nM9BRO1Bf6TI14mXssosnc12mUKoWhg=;
 b=YWKvY9+6HskuuVtaYv6PeEXYXVc+Sm6gxGW1awP4oXc9VN5SXljamnEv
 jh7kmY46IYOGzQOyMvNC23x4h+hqWXEMZAeTr8rO42Dkyws6jbN7DCPZZ
 2VhoJtUXpA0lyeseCl/ypsjzH5WC/7yMWys/RwL0H9YHY6MrPqMHkdKMK
 nTsEbbQGdrv8NaXnL47Tepu37HjocbOe1Uco/8zYfbs4LlwYLidNHWQ0Y
 Yn/iBNBipMdk0ZImnSkGKAJoft3zZp1t9epu51RvU4Tq/9QcFRPceovCm
 KuTkJpGE76iu7fnX+oWJh+e6W2vWeOay3FiCHEafyCafmCoiqtL2odbJD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="8000769"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="8000769"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 13:01:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="1338109"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 13:01:18 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v5 1/3] drm/xe/guc: Add more GuC CT states
Date: Mon, 22 Jan 2024 13:01:54 -0800
Message-Id: <20240122210156.1517444-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122210156.1517444-1-matthew.brost@intel.com>
References: <20240122210156.1517444-1-matthew.brost@intel.com>
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
4 states are not initialized, disabled, stopped, and enabled. Change the
code to reflect this. These states will enable proper return codes from
functions and therefore enable proper error messages.

v2:
- s/XE_GUC_CT_STATE_DROP_MESSAGES/XE_GUC_CT_STATE_STOPPED (Michal)
- Add assert for CT being initialized (Michal)
- Fix kernel for CT state enum (Michal)

v3:
- Kernel doc (Michal)
- s/reiecved/received (Michal)
- assert CT state not initialized in xe_guc_ct_init (Michal)
- add argument xe_guc_ct_set_state to clear g2h (Michal)

v4:
- Drop clear_outstanding_g2h argument (Michal)

v5:
- Move xa_destroy outside of fast lock (CI)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c          |  4 +-
 drivers/gpu/drm/xe/xe_guc_ct.c       | 80 ++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_guc_ct.h       |  8 ++-
 drivers/gpu/drm/xe/xe_guc_ct_types.h | 18 ++++++-
 4 files changed, 88 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 576ff2c1fbb9..fcb8a9efac70 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -684,7 +684,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 
 	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
 
-	xe_assert(xe, !guc->ct.enabled);
+	xe_assert(xe, !xe_guc_ct_enabled(&guc->ct));
 	xe_assert(xe, len);
 	xe_assert(xe, len <= VF_SW_FLAG_COUNT);
 	xe_assert(xe, len <= MED_VF_SW_FLAG_COUNT);
@@ -870,7 +870,7 @@ int xe_guc_stop(struct xe_guc *guc)
 {
 	int ret;
 
-	xe_guc_ct_disable(&guc->ct);
+	xe_guc_ct_stop(&guc->ct);
 
 	ret = xe_guc_submit_stop(guc);
 	if (ret)
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index ee5d99456aeb..1c915a26bb97 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -166,6 +166,8 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	if (err)
 		return err;
 
+	xe_assert(xe, ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED);
+	ct->state = XE_GUC_CT_STATE_DISABLED;
 	return 0;
 }
 
@@ -285,12 +287,35 @@ static int guc_ct_control_toggle(struct xe_guc_ct *ct, bool enable)
 	return ret > 0 ? -EPROTO : ret;
 }
 
+static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
+				enum xe_guc_ct_state state)
+{
+	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
+	spin_lock_irq(&ct->fast_lock);	/* Serialise CT fast-path */
+
+	xe_gt_assert(ct_to_gt(ct), ct->g2h_outstanding == 0 ||
+		     state == XE_GUC_CT_STATE_STOPPED);
+
+	ct->g2h_outstanding = 0;
+	ct->state = state;
+
+	spin_unlock_irq(&ct->fast_lock);
+
+	/*
+	 * Lockdep doesn't like this under the fast lock and he destroy only
+	 * needs to be serialized with the send path which ct lock provides.
+	 */
+	xa_destroy(&ct->fence_lookup);
+
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
@@ -307,12 +332,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
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
@@ -326,15 +346,26 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	return err;
 }
 
+/**
+ * xe_guc_ct_disable - Set GuC to disabled state
+ * @ct: the &xe_guc_ct
+ *
+ * Set GuC CT to disabled state, no outstanding g2h expected in this transition
+ */
 void xe_guc_ct_disable(struct xe_guc_ct *ct)
 {
-	mutex_lock(&ct->lock); /* Serialise dequeue_one_g2h() */
-	spin_lock_irq(&ct->fast_lock); /* Serialise CT fast-path */
-	ct->enabled = false; /* Finally disable CT communication */
-	spin_unlock_irq(&ct->fast_lock);
-	mutex_unlock(&ct->lock);
+	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DISABLED);
+}
 
-	xa_destroy(&ct->fence_lookup);
+/**
+ * xe_guc_ct_stop - Set GuC to stopped state
+ * @ct: the &xe_guc_ct
+ *
+ * Set GuC CT to stopped state and clear any outstanding g2h
+ */
+void xe_guc_ct_stop(struct xe_guc_ct *ct)
+{
+	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_STOPPED);
 }
 
 static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
@@ -509,6 +540,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 	u16 seqno;
 	int ret;
 
+	xe_assert(xe, ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED);
 	xe_assert(xe, !g2h_len || !g2h_fence);
 	xe_assert(xe, !num_g2h || !g2h_fence);
 	xe_assert(xe, !g2h_len || num_g2h);
@@ -520,11 +552,18 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 		goto out;
 	}
 
-	if (unlikely(!ct->enabled)) {
+	if (ct->state == XE_GUC_CT_STATE_DISABLED) {
 		ret = -ENODEV;
 		goto out;
 	}
 
+	if (ct->state == XE_GUC_CT_STATE_STOPPED) {
+		ret = -ECANCELED;
+		goto out;
+	}
+
+	xe_assert(xe, xe_guc_ct_enabled(ct));
+
 	if (g2h_fence) {
 		g2h_len = GUC_CTB_HXG_MSG_MAX_LEN;
 		num_g2h = 1;
@@ -712,7 +751,8 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
 		return false;
 
 #define ct_alive(ct)	\
-	(ct->enabled && !ct->ctbs.h2g.info.broken && !ct->ctbs.g2h.info.broken)
+	(xe_guc_ct_enabled(ct) && !ct->ctbs.h2g.info.broken && \
+	 !ct->ctbs.g2h.info.broken)
 	if (!wait_event_interruptible_timeout(ct->wq, ct_alive(ct),  HZ * 5))
 		return false;
 #undef ct_alive
@@ -1031,14 +1071,20 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	u32 action;
 	u32 *hxg;
 
+	xe_assert(xe, ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED);
 	lockdep_assert_held(&ct->fast_lock);
 
-	if (!ct->enabled)
+	if (ct->state == XE_GUC_CT_STATE_DISABLED)
 		return -ENODEV;
 
+	if (ct->state == XE_GUC_CT_STATE_STOPPED)
+		return -ECANCELED;
+
 	if (g2h->info.broken)
 		return -EPIPE;
 
+	xe_assert(xe, xe_guc_ct_enabled(ct));
+
 	/* Calculate DW available to read */
 	tail = desc_read(xe, g2h, tail);
 	avail = tail - g2h->info.head;
@@ -1340,7 +1386,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
 		return NULL;
 	}
 
-	if (ct->enabled) {
+	if (xe_guc_ct_enabled(ct)) {
 		snapshot->ct_enabled = true;
 		snapshot->g2h_outstanding = READ_ONCE(ct->g2h_outstanding);
 		guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g,
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 9ecb67db8ec4..5083e099064f 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -13,6 +13,7 @@ struct drm_printer;
 int xe_guc_ct_init(struct xe_guc_ct *ct);
 int xe_guc_ct_enable(struct xe_guc_ct *ct);
 void xe_guc_ct_disable(struct xe_guc_ct *ct);
+void xe_guc_ct_stop(struct xe_guc_ct *ct);
 void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
 
 struct xe_guc_ct_snapshot *
@@ -22,9 +23,14 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
 void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
 void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic);
 
+static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
+{
+	return ct->state == XE_GUC_CT_STATE_ENABLED;
+}
+
 static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
 {
-	if (!ct->enabled)
+	if (!xe_guc_ct_enabled(ct))
 		return;
 
 	wake_up_all(&ct->wq);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index d814d4ee3fc6..b966506cae09 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
@@ -72,6 +72,20 @@ struct xe_guc_ct_snapshot {
 	struct guc_ctb_snapshot h2g;
 };
 
+/**
+ * enum xe_guc_ct_state - CT state
+ * @XE_GUC_CT_STATE_NOT_INITIALIZED: CT not initialized, messages not expected in this state
+ * @XE_GUC_CT_STATE_DISABLED: CT disabled, messages not expected in this state
+ * @XE_GUC_CT_STATE_STOPPED: CT stopped, drop messages without errors
+ * @XE_GUC_CT_STATE_ENABLED: CT enabled, messages sent / received in this state
+ */
+enum xe_guc_ct_state {
+	XE_GUC_CT_STATE_NOT_INITIALIZED = 0,
+	XE_GUC_CT_STATE_DISABLED,
+	XE_GUC_CT_STATE_STOPPED,
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
+	enum xe_guc_ct_state state;
 	/** @fence_seqno: G2H fence seqno - 16 bits used by CT */
 	u32 fence_seqno;
 	/** @fence_lookup: G2H fence lookup */
-- 
2.34.1

