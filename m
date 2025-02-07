Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311B6C0219E
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 22:24:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC6D810EBBB;
	Fri,  7 Feb 2025 22:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O73P8W1l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C4B10EBB7
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 22:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738966803; x=1770502803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nicItbnFnMjIsXC+OGYWMnEskpWckvBetwbVW2eXV84=;
 b=O73P8W1lrkfZVJTt/oCBtNM+qqE2PJxWG0kpyt1Spjum0CM1EDUgVep9
 NExruRasmuydu2EwRFvAnBIlrgwePEEgvma9JRY06oaGqqfCB52Cq0okb
 wIgjyD6PpQ2xjoD1LPZWnMNW45Z8HYtpL/NlI2fmAP6ayxRm7NEX96rTG
 6hSZMXzcxyujgdcUq5QA0AbfZ63tHIAlexZp/EAikcGfnJa3vL4MxpDaT
 BAYaulZmR9Ytk4iATnYIjhn05sWvGU5gys8JlNW0fR5HqZEYiWjlxB5Xd
 SV3Dvd2yKxxyTudaXdsjvpAyfCNyQQR1JkJ7U0D1SKqR+TF3IFGyAtb6C A==;
X-CSE-ConnectionGUID: Kkw8JXCtS32uB0IfQiUviA==
X-CSE-MsgGUID: AiKqa8emQOyc4gcBkYwFaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51050690"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51050690"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 14:20:03 -0800
X-CSE-ConnectionGUID: tUFtWP5bScaDAXTRGjJoQA==
X-CSE-MsgGUID: Tv7IjFuxSV2brt9cOc+Rqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="112158426"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 14:20:02 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH v3 09/13] drm/xe/oa: Move fini to xe_oa
Date: Fri,  7 Feb 2025 14:19:41 -0800
Message-ID: <20250207221945.2878241-10-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207221945.2878241-1-lucas.demarchi@intel.com>
References: <20250207221945.2878241-1-lucas.demarchi@intel.com>
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
xe_device_probe() by moving the OA fini to be handled by xe_oa
itself, which relies on devm to call the cleanup function.

Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  7 +----
 drivers/gpu/drm/xe/xe_oa.c     | 48 +++++++++++++++++-----------------
 drivers/gpu/drm/xe/xe_oa.h     |  1 -
 3 files changed, 25 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 09288558e4e44..944a40a1e0174 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -867,7 +867,7 @@ int xe_device_probe(struct xe_device *xe)
 
 	err = xe_display_init(xe);
 	if (err)
-		goto err_fini_oa;
+		return err;
 
 	err = xe_pxp_init(xe);
 	if (err)
@@ -899,9 +899,6 @@ int xe_device_probe(struct xe_device *xe)
 err_fini_display:
 	xe_display_driver_remove(xe);
 
-err_fini_oa:
-	xe_oa_fini(xe);
-
 	return err;
 }
 
@@ -971,8 +968,6 @@ void xe_device_remove(struct xe_device *xe)
 
 	xe_device_remove_display(xe);
 
-	xe_oa_fini(xe);
-
 	xe_heci_gsc_fini(xe);
 
 	xe_device_call_remove_actions(xe);
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
2.48.1

