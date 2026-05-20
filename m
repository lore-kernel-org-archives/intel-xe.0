Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE04CCD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 11:39:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8278C10F02C;
	Wed, 20 May 2026 11:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7Q9L/q7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076AF10F039
 for <intel-xe@lists.freedesktop.org>; Wed, 20 May 2026 11:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779277185; x=1810813185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aQKdJX8avmG89btejo3TkgTSOGQaj1pqfP0VzWADuF4=;
 b=G7Q9L/q7Ta72ZLzJztphpXAKUyv4JHFIe7jqWlqJZO21fxH0LvIK7YXP
 WSuk6hsQldZAST9WQ5PTxvqeha8qlf1HQiL6qYFnn02YnP29ZebDwp5xQ
 wlhd9twXEVSRQ/CmoyQJJoDgj6aLp66ClAETBU4onlJEnMMyWWbmQYgro
 ENYJoRwlagCje1xxlurXIT/pOP5Aek/5N68MZKaEZldjoAeo1QWHzm6lO
 vPErejNQiaJbjTOXWH3SKmUnBIMbx9jfpG1/6gB8jWtj2MrspYXx6+e9g
 XTSDb3qtmcsTlsw9SM0kRrwe+M0pdR88TxRnpFjXXdsLwtUFXOhTI2Ovh w==;
X-CSE-ConnectionGUID: L2pJptZYQtqrH7iSboKyZA==
X-CSE-MsgGUID: psMiizetTs+b175qA5PS3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80023171"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="80023171"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 04:39:45 -0700
X-CSE-ConnectionGUID: /5VZpaclT3qS+a4G3f+nkg==
X-CSE-MsgGUID: gOJaS9z9ROSKhW4lg8vl5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="233792254"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 20 May 2026 04:39:42 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, mallesh.koujalagi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 3/5] drm/xe/hw_error: Handle initialization failure
Date: Wed, 20 May 2026 17:04:08 +0530
Message-ID: <20260520113622.171462-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520113622.171462-1-raag.jadav@intel.com>
References: <20260520113622.171462-1-raag.jadav@intel.com>
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

We currently ignore hardware error initialization failure. Handle it for
the platforms that support it.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_error.c | 10 ++++++----
 drivers/gpu/drm/xe/xe_hw_error.h |  2 +-
 drivers/gpu/drm/xe/xe_irq.c      |  4 +++-
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 8faed870aade..c1b6d57f5388 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -555,16 +555,18 @@ static void hw_error_fini(void *arg)
  * @xe: xe device instance
  *
  * Initialize and check for errors that occurred during boot
- * prior to driver load
+ * prior to driver load.
+ *
+ * Returns: 0 on success, negative error code otherwise.
  */
-void xe_hw_error_init(struct xe_device *xe)
+int xe_hw_error_init(struct xe_device *xe)
 {
 	struct xe_tile *tile;
 	u8 id;
 	int ret;
 
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
-		return;
+		return 0;
 
 	for_each_tile(tile, xe, id)
 		INIT_WORK(&tile->hw_error_work, hw_error_work);
@@ -574,5 +576,5 @@ void xe_hw_error_init(struct xe_device *xe)
 		drm_err(&xe->drm, "Failed to initialize XE DRM RAS (%pe)\n", ERR_PTR(ret));
 
 	process_hw_errors(xe);
-	devm_add_action_or_reset(xe->drm.dev, hw_error_fini, xe);
+	return devm_add_action_or_reset(xe->drm.dev, hw_error_fini, xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
index 5e3a11424108..a9af4c947d77 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.h
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -11,5 +11,5 @@ struct xe_tile;
 struct xe_device;
 
 void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
-void xe_hw_error_init(struct xe_device *xe);
+int xe_hw_error_init(struct xe_device *xe);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 9e49e2241da4..5ea50d203db1 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -811,7 +811,9 @@ int xe_irq_install(struct xe_device *xe)
 	int nvec = 1;
 	int err;
 
-	xe_hw_error_init(xe);
+	err = xe_hw_error_init(xe);
+	if (err)
+		return err;
 
 	xe_irq_reset(xe);
 
-- 
2.43.0

