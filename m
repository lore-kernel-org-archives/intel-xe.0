Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA009C0218F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 22:32:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F83F10E2CC;
	Fri, 31 Jan 2025 22:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JlsO44F/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0EAE10E226
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 22:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738362718; x=1769898718;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lYO+qufL8b+5sIRffcDzARI+OgtPRXmYKQkYZeVqd2c=;
 b=JlsO44F/kqn58i7e1UwZiE4j2UoLAsUpySNjMWXOExcDU3Siab/4lBuK
 N12L20i3/kdXMoHG14xSCRqSJpzBrCSJMXXMYQZgJs1Dp7RltfRC7KjJ5
 RVgCiTe1d+HJqaN0J5bS4lqiQgXOyUemTImS7qh2dPCDMZZqOLeAGxUPH
 /ts5LK+XlSbgNT3CVhJ+rqSuDGcdpikAUrcpm3tgRD4sZ9ONu4O94l1PO
 YsNNU8BItdgZTMgW6es3cxGEYDPD9ZYPJkTvfRXNgKjU5tgy/QsUrBosw
 r2j0o5UbCwS1NC4KyOgCfpdDZRoLDWeYh/zfVZmHwGKCeJ+Ux91nkSlDI Q==;
X-CSE-ConnectionGUID: G+7X4CAZTkaokkWFr5KYeA==
X-CSE-MsgGUID: y3BgezYpQ4iH6BlxlG9pXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38149072"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="38149072"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 14:31:57 -0800
X-CSE-ConnectionGUID: GgEEsRGGROymflSoidID9w==
X-CSE-MsgGUID: 6QrADVRbSAOm+5A30V3m+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110622328"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 14:31:56 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 7/7] drm/xe: Move oa fini to xe_oa
Date: Fri, 31 Jan 2025 14:31:40 -0800
Message-ID: <20250131223140.4144292-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250131223140.4144292-1-lucas.demarchi@intel.com>
References: <20250131223140.4144292-1-lucas.demarchi@intel.com>
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

Like done with other functions, cleanup the error handling in
xe_device_probe() by moving the OA fini to be handled by xe_oa.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  7 +----
 drivers/gpu/drm/xe/xe_oa.c     | 48 +++++++++++++++++-----------------
 drivers/gpu/drm/xe/xe_oa.h     |  1 -
 3 files changed, 25 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index bea626f6b4cbf..aa6632cc22305 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -863,7 +863,7 @@ int xe_device_probe(struct xe_device *xe)
 
 	err = xe_display_init(xe);
 	if (err)
-		goto err_fini_oa;
+		return err;
 
 	err = drm_dev_register(&xe->drm, 0);
 	if (err)
@@ -889,9 +889,6 @@ int xe_device_probe(struct xe_device *xe)
 err_fini_display:
 	xe_display_driver_remove(xe);
 
-err_fini_oa:
-	xe_oa_fini(xe);
-
 	return err;
 }
 
@@ -909,8 +906,6 @@ void xe_device_remove(struct xe_device *xe)
 
 	xe_device_remove_display(xe);
 
-	xe_oa_fini(xe);
-
 	xe_heci_gsc_fini(xe);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index fa873f3d0a9d1..2c640185bdeca 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2641,6 +2641,27 @@ static void xe_oa_init_supported_formats(struct xe_oa *oa)
 	}
 }
 
+static int destroy_config(int id, void *p, void *data)
+{
+	xe_oa_config_put(p);
+
+	return 0;
+}
+
+static void xe_oa_fini(void *arg)
+{
+	struct xe_device *xe = arg;
+	struct xe_oa *oa = &xe->oa;
+
+	if (!oa->xe)
+		return;
+
+	idr_for_each(&oa->metrics_idr, destroy_config, oa);
+	idr_destroy(&oa->metrics_idr);
+
+	oa->xe = NULL;
+}
+
 /**
  * xe_oa_init - OA initialization during device probe
  * @xe: @xe_device
@@ -2672,31 +2693,10 @@ int xe_oa_init(struct xe_device *xe)
 	}
 
 	xe_oa_init_supported_formats(oa);
-	return 0;
-exit:
-	oa->xe = NULL;
-	return ret;
-}
 
-static int destroy_config(int id, void *p, void *data)
-{
-	xe_oa_config_put(p);
-	return 0;
-}
-
-/**
- * xe_oa_fini - OA de-initialization during device remove
- * @xe: @xe_device
- */
-void xe_oa_fini(struct xe_device *xe)
-{
-	struct xe_oa *oa = &xe->oa;
-
-	if (!oa->xe)
-		return;
-
-	idr_for_each(&oa->metrics_idr, destroy_config, oa);
-	idr_destroy(&oa->metrics_idr);
+	return devm_add_action_or_reset(xe->drm.dev, xe_oa_fini, xe);
 
+exit:
 	oa->xe = NULL;
+	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
index 87a38820c317d..eb36ce250c615 100644
--- a/drivers/gpu/drm/xe/xe_oa.h
+++ b/drivers/gpu/drm/xe/xe_oa.h
@@ -15,7 +15,6 @@ struct xe_gt;
 struct xe_hw_engine;
 
 int xe_oa_init(struct xe_device *xe);
-void xe_oa_fini(struct xe_device *xe);
 void xe_oa_register(struct xe_device *xe);
 void xe_oa_unregister(struct xe_device *xe);
 int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *file);
-- 
2.48.0

