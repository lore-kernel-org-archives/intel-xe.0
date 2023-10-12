Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF20CDB47E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 06:25:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A0910E415;
	Thu, 12 Oct 2023 06:25:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B7310E415
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 06:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697091956; x=1728627956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YABFwj/3WpRLMTaHMHkNDR7WOeUqmw17FL8NAoFKRhc=;
 b=Cqc8+nHae6cn1QI2RWyX1YUz6PuiqhfxwIHNwcghObkbJGSLDHs+BxpU
 cBdwHGjgDsozXBrYEByaglYBEktnU0owYWYaI96o74utW73Srhij6WF2B
 Eulv1VG1PdOGVG4mnp1DDqnjvspzJE/jEbMcgHt0PsZLMjKyI8b1tmrAC
 vKNtw+S5oU7m/ltsxNg4aSB5cfZqhxqTaTawRoz2lb1pctyPs24xrNCIP
 tmDm+LPDFPerFGlUDPXHEHQLbR/pIK1zOloKJ13mXxxV2f1+bQjHG94uR
 KvXol1uinK1KANOs9lly8t9d5gOWaTAkyVVEYbXis7XeSQ/lH8W7+x5wp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="387681212"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="387681212"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 23:25:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="754126943"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="754126943"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 23:25:52 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 12 Oct 2023 12:02:08 +0530
Message-Id: <20231012063209.56824-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231012063209.56824-1-riana.tauro@intel.com>
References: <20231012063209.56824-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/2] drm/xe: Add helper functions to toggle CT
 communication
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

During Runtime suspend/resume, GuC is reloaded for both
D3hot/D3Cold-> D0 transistions. It is not necessary for GuC to be
loaded everytime for D3hot->D0, only enable/disable ctb communication.

Add helper functions to toggle CT communication. Modify existing
guc communication function

v2: do not register/unregister ctb, toggle the enabled variable
    instead.
    enable irqs while toggling CT (Daniele)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c    | 36 ++++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc.h    |  3 ++-
 drivers/gpu/drm/xe/xe_guc_ct.c | 15 ++++++++++++--
 drivers/gpu/drm/xe/xe_guc_ct.h |  1 +
 drivers/gpu/drm/xe/xe_uc.c     |  2 +-
 5 files changed, 49 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 84f0b5488783..40c7bf0c50c5 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -507,7 +507,7 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
-	ret = xe_guc_enable_communication(guc);
+	ret = xe_guc_enable_communication(guc, true);
 	if (ret)
 		return ret;
 
@@ -560,16 +560,31 @@ static void guc_enable_irq(struct xe_guc *guc)
 	xe_mmio_rmw32(gt, GUC_SG_INTR_MASK, events, 0);
 }
 
-int xe_guc_enable_communication(struct xe_guc *guc)
+/**
+ * xe_guc_enable_communication - Enable GuC communication
+ * @guc: The GuC object
+ * @ctb_register: boolean to indicate if ctb registration needs to be done
+ *		  or toggling of the value.
+ *
+ * This function enables guc interrupts, toggles or registers CT communication
+ * and handles mmio messages.
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_guc_enable_communication(struct xe_guc *guc, bool ctb_register)
 {
-	int err;
+	int err = 0;
 
 	guc_enable_irq(guc);
 
 	xe_mmio_rmw32(guc_to_gt(guc), PMINTRMSK,
 		      ARAT_EXPIRED_INTRMSK, 0);
 
-	err = xe_guc_ct_enable(&guc->ct);
+	if (ctb_register)
+		err = xe_guc_ct_enable(&guc->ct);
+	else
+		xe_guc_ct_toggle(&guc->ct, true);
+
 	if (err)
 		return err;
 
@@ -578,6 +593,19 @@ int xe_guc_enable_communication(struct xe_guc *guc)
 	return 0;
 }
 
+/**
+ * xe_guc_disable_communication - disables GuC communication
+ * @guc: The GuC object
+ *
+ * This function disables CT communication
+ */
+void xe_guc_disable_communication(struct xe_guc *guc)
+{
+	xe_guc_ct_toggle(&guc->ct, false);
+
+	guc_handle_mmio_msg(guc);
+}
+
 int xe_guc_suspend(struct xe_guc *guc)
 {
 	int ret;
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 3addd8fc674a..71dac0673e61 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -18,7 +18,8 @@ int xe_guc_post_load_init(struct xe_guc *guc);
 int xe_guc_reset(struct xe_guc *guc);
 int xe_guc_upload(struct xe_guc *guc);
 int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
-int xe_guc_enable_communication(struct xe_guc *guc);
+void xe_guc_disable_communication(struct xe_guc *guc);
+int xe_guc_enable_communication(struct xe_guc *guc, bool ctb_register);
 int xe_guc_suspend(struct xe_guc *guc);
 void xe_guc_notify(struct xe_guc *guc);
 int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 8b686c8b3339..ff89a1a09f1f 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -319,14 +319,25 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	return err;
 }
 
-void xe_guc_ct_disable(struct xe_guc_ct *ct)
+/**
+ * xe_guc_ct_toggle - Toggle GuC CT
+ * @ct: GuC CT
+ * @toggle: 0-disable, 1-enable
+ *
+ * This function enables or disables CT communication
+ */
+void xe_guc_ct_toggle(struct xe_guc_ct *ct, bool toggle)
 {
 	mutex_lock(&ct->lock); /* Serialise dequeue_one_g2h() */
 	spin_lock_irq(&ct->fast_lock); /* Serialise CT fast-path */
-	ct->enabled = false; /* Finally disable CT communication */
+	ct->enabled = toggle; /* Toggle CT communication */
 	spin_unlock_irq(&ct->fast_lock);
 	mutex_unlock(&ct->lock);
+}
 
+void xe_guc_ct_disable(struct xe_guc_ct *ct)
+{
+	xe_guc_ct_toggle(ct, false);
 	xa_destroy(&ct->fence_lookup);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index f15f8a4857e0..11166a7ce958 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -14,6 +14,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct);
 int xe_guc_ct_enable(struct xe_guc_ct *ct);
 void xe_guc_ct_disable(struct xe_guc_ct *ct);
 void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
+void xe_guc_ct_toggle(struct xe_guc_ct *ct, bool toggle);
 
 struct xe_guc_ct_snapshot *
 xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 784f53c5f282..bf75c39d929d 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -148,7 +148,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
 	if (ret)
 		return ret;
 
-	ret = xe_guc_enable_communication(&uc->guc);
+	ret = xe_guc_enable_communication(&uc->guc, true);
 	if (ret)
 		return ret;
 
-- 
2.40.0

