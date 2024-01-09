Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46946C47077
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 23:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF0A10E53D;
	Tue,  9 Jan 2024 23:01:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C3F10E53D
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 23:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704841293; x=1736377293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ctTaEmDiYL+8hKNxWckUkkQYcOlstUXfz4gR7d6SPLg=;
 b=A2mvgxQZjdcMHKI5dHIWKuMUyClgpOI3/EeCpZFH97MNBBiaHWgp/iYK
 ndPS4nYTqif4QbEV9PGgXNypFw7IGKHFmpiDTiOyx3ZCL4EMi4muCFY1X
 +xq94BX1J7Ch9f8O3xWAnFi0/X1QDtx07eBGBcW/fUM+Olo2IUL4ZxQzV
 n8MqM3KMfMOeChhfg2VFZ2A4Mg8B/AkJ5XN99OuoWOXN2ffPzUQs4YJ+i
 NRNTqgQ6cWiXbEIyregFwUVhVLQa+U6NvhvNtfdu85drr39mA1F6n4DdY
 Zjz6kW7t/8SDkD0HfvlPn6vskyfHwZ2I75i902pkibiice5n7j8veJ8XP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5715498"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5715498"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 15:01:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="852344953"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="852344953"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 15:01:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v2 1/3] drm/xe/guc: Add more GuC CT states
Date: Tue,  9 Jan 2024 15:01:47 -0800
Message-Id: <20240109230149.1399302-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240109230149.1399302-1-matthew.brost@intel.com>
References: <20240109230149.1399302-1-matthew.brost@intel.com>
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

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c          |  4 +-
 drivers/gpu/drm/xe/xe_guc_ct.c       | 56 ++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_guc_ct.h       |  8 +++-
 drivers/gpu/drm/xe/xe_guc_ct_types.h | 18 ++++++++-
 4 files changed, 65 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 311a0364bff1..c28410958990 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -656,7 +656,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 
 	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
 
-	xe_assert(xe, !guc->ct.enabled);
+	xe_assert(xe, !xe_guc_ct_enabled(&guc->ct));
 	xe_assert(xe, len);
 	xe_assert(xe, len <= VF_SW_FLAG_COUNT);
 	xe_assert(xe, len <= MED_VF_SW_FLAG_COUNT);
@@ -838,7 +838,7 @@ int xe_guc_stop(struct xe_guc *guc)
 {
 	int ret;
 
-	xe_guc_ct_disable(&guc->ct);
+	xe_guc_ct_stop(&guc->ct);
 
 	ret = xe_guc_submit_stop(guc);
 	if (ret)
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index c29f095aa1b9..5b122a926ccf 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -164,6 +164,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	if (err)
 		return err;
 
+	ct->state = XE_GUC_CT_STATE_DISABLED;
 	return 0;
 }
 
@@ -283,12 +284,25 @@ static int guc_ct_control_toggle(struct xe_guc_ct *ct, bool enable)
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
@@ -305,12 +319,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
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
@@ -326,12 +335,12 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 
 void xe_guc_ct_disable(struct xe_guc_ct *ct)
 {
-	mutex_lock(&ct->lock); /* Serialise dequeue_one_g2h() */
-	spin_lock_irq(&ct->fast_lock); /* Serialise CT fast-path */
-	ct->enabled = false; /* Finally disable CT communication */
-	spin_unlock_irq(&ct->fast_lock);
-	mutex_unlock(&ct->lock);
+	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DISABLED);
+}
 
+void xe_guc_ct_stop(struct xe_guc_ct *ct)
+{
+	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_STOPPED);
 	xa_destroy(&ct->fence_lookup);
 }
 
@@ -507,6 +516,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 	u16 seqno;
 	int ret;
 
+	xe_assert(xe, ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED);
 	xe_assert(xe, !g2h_len || !g2h_fence);
 	xe_assert(xe, !num_g2h || !g2h_fence);
 	xe_assert(xe, !g2h_len || num_g2h);
@@ -518,11 +528,18 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
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
@@ -710,7 +727,8 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
 		return false;
 
 #define ct_alive(ct)	\
-	(ct->enabled && !ct->ctbs.h2g.info.broken && !ct->ctbs.g2h.info.broken)
+	(xe_guc_ct_enabled(ct) && !ct->ctbs.h2g.info.broken && \
+	 !ct->ctbs.g2h.info.broken)
 	if (!wait_event_interruptible_timeout(ct->wq, ct_alive(ct),  HZ * 5))
 		return false;
 #undef ct_alive
@@ -996,14 +1014,20 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	s32 avail;
 	u32 action;
 
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
@@ -1302,7 +1326,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
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
index d814d4ee3fc6..e146dbeddedb 100644
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
+ * @XE_GUC_CT_STATE_ENABLED: CT enabled, messages sent / recieved in this state
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

