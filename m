Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1927CD1299
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 15:56:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F579113283;
	Thu,  4 Apr 2024 15:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K9AU7kuV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573B7113287
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 15:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712246206; x=1743782206;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zDxItJvDro+KuSez4YOcAsXqrnlS7FiLhY0eWrWAP6I=;
 b=K9AU7kuVPdklT+ko4LU+JI3sMr1Lc7w5Opj8HpLH9nzxRfmERUK9PgMt
 wEeqJdCC9bNEQfqYtL0pNJxFwD/cgYin9p0Wai5H5YTaWjUckaV6Y8xDs
 8STgrMRr1Tbxd69vzayFM8xFZ1TATViPCP/aLENlWVD7LRLPDyDfCRX+Y
 7ME6qWblN1hxIKVCPNdQdYiALgn3D+5tfgw6Rqz1pyZaQV5e2IAGubG97
 sPkfH9H7gyJO/Xv1ZJGgjSt0V49lm/Cf14EkbQMR6F1Zt14s1WjnWANGK
 BCcLZRcvxFBr5b9elOityN2XccUKHVKqROvLUuXP2wYmXhwvu9OQnXr/e w==;
X-CSE-ConnectionGUID: OgheJeUsQbqP+KgQGYdNQA==
X-CSE-MsgGUID: aD/Yc+w8Q9uKe1d29rWUSw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="8119119"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="8119119"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 08:54:44 -0700
X-CSE-ConnectionGUID: zbu90IJ4SxyLRLgj2ARLKA==
X-CSE-MsgGUID: +Oi+bSo/R3KX9424g9lpDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="41992428"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.158.68])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 08:44:43 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/3] drm/xe: Add max_vfs module parameter
Date: Thu,  4 Apr 2024 17:44:29 +0200
Message-Id: <20240404154431.583-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240404154431.583-1-michal.wajdeczko@intel.com>
References: <20240404154431.583-1-michal.wajdeczko@intel.com>
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

We want to have an option to limit the number of the VFs that the
PF driver will be able to manage.  With this limit set to zero we
will also have a way to completely disable the PF functionality.

Since we currently don't support SR-IOV on any platform, we start
with this limit set to zero by default.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 7 +++++++
 drivers/gpu/drm/xe/xe_module.h | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 110b69864656..ceb8345cbca6 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -48,6 +48,13 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
 MODULE_PARM_DESC(force_probe,
 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
 
+#ifdef CONFIG_PCI_IOV
+module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
+MODULE_PARM_DESC(max_vfs,
+		 "Limit number of Virtual Functions (VFs) that could be managed. "
+		 "(0 = no VFs [default]; N = allow up to N VFs)");
+#endif
+
 struct init_funcs {
 	int (*init)(void);
 	void (*exit)(void);
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 88ef0e8b2bfd..b369984f08ec 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -18,6 +18,9 @@ struct xe_modparam {
 	char *huc_firmware_path;
 	char *gsc_firmware_path;
 	char *force_probe;
+#ifdef CONFIG_PCI_IOV
+	unsigned int max_vfs;
+#endif
 };
 
 extern struct xe_modparam xe_modparam;
-- 
2.43.0

