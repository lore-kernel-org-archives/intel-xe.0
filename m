Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C117BCA1002
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 09:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5F610E9CA;
	Thu,  4 Sep 2025 09:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LWHiANyO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B39510E9CA
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 09:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756977329; x=1788513329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uIq/RDgLGKsucxM9WFNpTJfQRNBnGHjY0BX8OJ75FiQ=;
 b=LWHiANyOFVJAD2tAqhPgogimAF5IHQJfDjKo+HZCAfD/WKxfboBw/1qN
 fFVpbug/BaibkDgffK3Bmz6rF9o1fcfEztIU56eUGKRI6f5OVLmrfuf9A
 bUH3tDl+XyjP6NHg6+prePP246sCbrBOtfIwm3a41c5O1b6rAtLi4eUzi
 WbyPhC9XPHXA2bFIHQ3ObW0gaWFY4IxLYw9rlGB5DZQnspXSVTVKFz5go
 TE9LSToRl2nMKxMw3pulj5ZSPKeiCK8cRwz0KJS0WN8QrmLDrwlXU7jA0
 6ewBonL9WUwKtVljZbkyAfiZICg7jATxaeACK9+pL7ghSg5Tq+sYGyXVu Q==;
X-CSE-ConnectionGUID: dksyjSZMQ8axa95P9opcFg==
X-CSE-MsgGUID: 5I2jrgaiSsOIVwbOQHLbMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="84739384"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="84739384"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 02:15:29 -0700
X-CSE-ConnectionGUID: sPVnLPVGRbmtMaMn1KGKGA==
X-CSE-MsgGUID: PVWPc3CVTmmlp4KmRQgsnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="177101573"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 04 Sep 2025 02:15:26 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v4 1/2] drm/xe/guc: Split xe_guc_ct_enable()
Date: Thu,  4 Sep 2025 14:44:38 +0530
Message-Id: <20250904091439.2279352-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904091439.2279352-1-raag.jadav@intel.com>
References: <20250904091439.2279352-1-raag.jadav@intel.com>
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

In preparation of usecases which require dynamically enabling GuC CT state,
split xe_guc_ct_enable().

Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c    |  2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c | 34 ++++++++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_guc_ct.h |  3 ++-
 3 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index b3a6408a5760..fd82eef8f372 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1355,7 +1355,7 @@ int xe_guc_enable_communication(struct xe_guc *guc)
 		guc_enable_irq(guc);
 	}
 
-	err = xe_guc_ct_enable(&guc->ct);
+	err = xe_guc_ct_register(&guc->ct);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index e431ff73227c..f2b2db780e53 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -504,7 +504,31 @@ static void ct_exit_safe_mode(struct xe_guc_ct *ct)
 		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode disabled\n");
 }
 
-int xe_guc_ct_enable(struct xe_guc_ct *ct)
+/**
+ * xe_guc_ct_enable() - Enable GuC CT
+ * @ct: the &xe_guc_ct
+ *
+ * Set GuC CT to enabled state and ready to send/received new messages.
+ */
+void xe_guc_ct_enable(struct xe_guc_ct *ct)
+{
+	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
+
+	smp_mb();
+	wake_up_all(&ct->wq);
+
+	ct_enter_safe_mode(ct);
+}
+
+/**
+ * xe_guc_ct_register() - Register GuC CT
+ * @ct: the &xe_guc_ct
+ *
+ * Initialize and register H2G and G2H CTBs and enable GuC CT.
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+int xe_guc_ct_register(struct xe_guc_ct *ct)
 {
 	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_gt *gt = ct_to_gt(ct);
@@ -528,13 +552,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	if (err)
 		goto err_out;
 
-	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
-
-	smp_mb();
-	wake_up_all(&ct->wq);
-
-	if (ct_needs_safe_mode(ct))
-		ct_enter_safe_mode(ct);
+	xe_guc_ct_enable(ct);
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 	/*
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index cf41210ab30a..c821517e87d0 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -14,8 +14,9 @@ struct xe_device;
 int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
 int xe_guc_ct_init(struct xe_guc_ct *ct);
 int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
-int xe_guc_ct_enable(struct xe_guc_ct *ct);
+void xe_guc_ct_enable(struct xe_guc_ct *ct);
 void xe_guc_ct_disable(struct xe_guc_ct *ct);
+int xe_guc_ct_register(struct xe_guc_ct *ct);
 void xe_guc_ct_stop(struct xe_guc_ct *ct);
 void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
 
-- 
2.34.1

