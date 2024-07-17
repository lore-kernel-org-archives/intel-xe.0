Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46F5C3DA4B
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 05:44:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F95B10E942;
	Wed, 17 Jul 2024 05:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aUE4xS+1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294AC10E950
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 05:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721194983; x=1752730983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tpPZjX1dFYHG1eS1K84qR9CaRXwPb1i37NL2nEEqLNM=;
 b=aUE4xS+19HkBlAvq5hbZWKkLk5KlrsQLKkKAuRRro+MMOhNgwNMPDgJz
 WEpxN+E10Y0eBK7KLVYc6D+Jxvua13Nrk/uOdcZWmVuRXVXbMopqx9BzP
 brxEx/Og+GBMEzKLXmCAsAR7DF72epFOct9Z91pSAdVcPn0qnz3kPx369
 VvpshMol6+Wc2U9H4+B+QyDeyz8zc2t8G4R28GdH6qiwpvBtIk+TaOkbq
 EyCATv6H/4Co7xkxS8bhiFbQhh20Supv+WMEVUIYbes/DcPIQSyrRk8fS
 icsb0VQzCGhoC10ZaIz1oDo/4OOvs7z00tdF8E1wUOYsMKWWny3iDpzru g==;
X-CSE-ConnectionGUID: QXh+UNrKTWuUXlCq8MRIRA==
X-CSE-MsgGUID: MClcHdSvScOFDS/32xG3LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="22534452"
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; d="scan'208";a="22534452"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 22:43:03 -0700
X-CSE-ConnectionGUID: FeICuhWOQcGTKfyfzvCxQw==
X-CSE-MsgGUID: 6eGkpSpfQlCDjlBE5Su3Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; d="scan'208";a="54589638"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 22:43:00 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, karthik.poosa@intel.com
Subject: [PATCH v4 1/2] drm/xe: modify GuC CTB enable communication
Date: Wed, 17 Jul 2024 11:25:57 +0530
Message-Id: <20240717055558.4169407-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240717055558.4169407-1-riana.tauro@intel.com>
References: <20240717055558.4169407-1-riana.tauro@intel.com>
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

Modify GuC CTB enable communication function to only set the
CTB state if registration is not required.
This will be used while resuming from D3Hot where
registration of CTB is not necessary.

Also move xe_guc_ct_set_state to header file.

v2: split patches (Rodrigo)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c    | 25 +++++++++++++++++++------
 drivers/gpu/drm/xe/xe_guc.h    |  2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c |  3 +--
 drivers/gpu/drm/xe/xe_guc_ct.h |  2 ++
 drivers/gpu/drm/xe/xe_uc.c     |  4 ++--
 5 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index eb655cee19f7..8131c290a4f4 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -755,7 +755,7 @@ static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
-	ret = xe_guc_enable_communication(guc);
+	ret = xe_guc_enable_communication(guc, true);
 	if (ret)
 		return ret;
 
@@ -800,7 +800,7 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
-	ret = xe_guc_enable_communication(guc);
+	ret = xe_guc_enable_communication(guc, true);
 	if (ret)
 		return ret;
 
@@ -854,7 +854,16 @@ static void guc_enable_irq(struct xe_guc *guc)
 	xe_mmio_rmw32(gt, GUC_SG_INTR_MASK, events, 0);
 }
 
-int xe_guc_enable_communication(struct xe_guc *guc)
+/**
+ * xe_guc_enable_communication - Enable GuC CTB communication
+ * @guc: GuC object
+ * @register_ctb: true to register CTB, false otherwise
+ *
+ * Enables GuC CTB Communication and IRQ
+ *
+ * Return: 0 on success, negative error code otherwise
+ */
+int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 	int err;
@@ -870,9 +879,13 @@ int xe_guc_enable_communication(struct xe_guc *guc)
 		guc_enable_irq(guc);
 	}
 
-	err = xe_guc_ct_enable(&guc->ct);
-	if (err)
-		return err;
+	if (register_ctb) {
+		err = xe_guc_ct_enable(&guc->ct);
+		if (err)
+			return err;
+	} else {
+		xe_guc_ct_set_state(&guc->ct, XE_GUC_CT_STATE_ENABLED);
+	}
 
 	guc_handle_mmio_msg(guc);
 
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index af59c9545753..b49444297eb0 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -20,7 +20,7 @@ int xe_guc_post_load_init(struct xe_guc *guc);
 int xe_guc_reset(struct xe_guc *guc);
 int xe_guc_upload(struct xe_guc *guc);
 int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
-int xe_guc_enable_communication(struct xe_guc *guc);
+int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb);
 int xe_guc_suspend(struct xe_guc *guc);
 void xe_guc_notify(struct xe_guc *guc);
 int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 7d2e937da1d8..44c44e086a98 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -318,8 +318,7 @@ static int guc_ct_control_toggle(struct xe_guc_ct *ct, bool enable)
 	return ret > 0 ? -EPROTO : ret;
 }
 
-static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
-				enum xe_guc_ct_state state)
+void xe_guc_ct_set_state(struct xe_guc_ct *ct, enum xe_guc_ct_state state)
 {
 	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
 	spin_lock_irq(&ct->fast_lock);	/* Serialise CT fast-path */
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 190202fce2d0..60d46739548c 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -15,6 +15,8 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct);
 void xe_guc_ct_disable(struct xe_guc_ct *ct);
 void xe_guc_ct_stop(struct xe_guc_ct *ct);
 void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
+void xe_guc_ct_set_state(struct xe_guc_ct *ct,
+			 enum xe_guc_ct_state state);
 
 struct xe_guc_ct_snapshot *
 xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 0f240534fb72..eb9c1443c849 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -154,7 +154,7 @@ static int vf_uc_init_hw(struct xe_uc *uc)
 	if (err)
 		return err;
 
-	err = xe_guc_enable_communication(&uc->guc);
+	err = xe_guc_enable_communication(&uc->guc, true);
 	if (err)
 		return err;
 
@@ -194,7 +194,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
 	if (ret)
 		return ret;
 
-	ret = xe_guc_enable_communication(&uc->guc);
+	ret = xe_guc_enable_communication(&uc->guc, true);
 	if (ret)
 		return ret;
 
-- 
2.40.0

