Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BBAF30951
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 12:03:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138F110E28B;
	Thu,  5 Mar 2026 12:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NxQ5KBCO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E6410E285
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 12:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772712192; x=1804248192;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=+euxnK3uRjQGHnywTWStrW8YAvdscPk7B/NuI+POqwQ=;
 b=NxQ5KBCOPirY9K4o/Nhbq4K2A7OpClIcQ6Ts5aXefBzL71BvFR1U6y46
 zNzGOvzuVUEB1dfJ+8KtZbtQ0Jt6GK49J+YLNPMN0pRApUxrUv93BEbWH
 i53LT21VwZTq1wocJOuysL0Z7n3wrTdT3crF0hdvIGleftiAv48EdwU8Z
 M9ep/q+tG4F7cHjYI4SwxQq2+Ja83gKR4uZGzVfvIYWZM0pPF1KjY8OrK
 JubuRzS0wimwr7N8WHbXoRXVpddh90XGD7lA+WSEu7nXJ8HrOLLWv2aBr
 MiUERYJr3XOJvB42XGgYpIsX7W9wVRTOByo4JDMKOWIH6KZrtIV5gMpdf g==;
X-CSE-ConnectionGUID: 9/sT7jxzSK2LJtEK2cORFQ==
X-CSE-MsgGUID: SvpzL2j4SU+/KmRopvQRYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73702512"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="73702512"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 04:03:12 -0800
X-CSE-ConnectionGUID: kTw+FUJZR7+WvhONQ0MNmQ==
X-CSE-MsgGUID: heGAsoeGRi6UbxfcU9/wGA==
X-ExtLoop1: 1
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.218])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 04:03:11 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 05 Mar 2026 09:02:30 -0300
Subject: [PATCH 3/7] drm/xe/nvlp: Read platform-level stepping info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-extra-nvl-p-enabling-patches-v1-3-5020d5289dea@intel.com>
References: <20260305-extra-nvl-p-enabling-patches-v1-0-5020d5289dea@intel.com>
In-Reply-To: <20260305-extra-nvl-p-enabling-patches-v1-0-5020d5289dea@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

There will be a NVL-P workaround for which we will need to know the
platform-level stepping information in order to decide whether to apply
it or not.

While NVL-P has a nice mapping between the PCI revid and our symbolic
stepping enumeration, not all platforms are like that: (i) Some
platforms will have a single PCI revid used for a set platform level
steppings (ii) and some might even require specific mappings.

To make things simpler, let's include stepping information in the device
info only on demand, for those platforms where it is needed for
workaround checks.

Bspec: 74201
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c        |  2 ++
 drivers/gpu/drm/xe/xe_step.c       | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_step.h       |  2 ++
 drivers/gpu/drm/xe/xe_step_types.h |  1 +
 4 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 72d4131e9775..b9000b5d3ca7 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -904,6 +904,8 @@ static int xe_info_init(struct xe_device *xe,
 	int ret;
 	u8 id;
 
+	xe_step_platform_get(xe);
+
 	/*
 	 * If this platform supports GMD_ID, we'll detect the proper IP
 	 * descriptor to use from hardware registers.
diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
index 064b604b5b94..d0f888c31831 100644
--- a/drivers/gpu/drm/xe/xe_step.c
+++ b/drivers/gpu/drm/xe/xe_step.c
@@ -108,6 +108,28 @@ static const int pvc_basedie_subids[] = {
 
 __diag_pop();
 
+/**
+ * xe_step_platform_get - Determine platform-level stepping from PCI revid
+ * @xe: Xe device
+ *
+ * Convert the PCI revid into a platform-level stepping value and store that
+ * in the device info.
+ */
+void xe_step_platform_get(struct xe_device *xe)
+{
+	/*
+	 * Not all platforms map PCI revid directly into our symbolic stepping
+	 * enumeration. Some platforms will have a single PCI revid used for a
+	 * range platform level steppings and some might even require specific
+	 * mappings. So prefer to err on the side of caution and include only
+	 * the platforms from which we need the stepping info for workaround
+	 * checks.
+	 */
+
+	if (xe->info.platform == XE_NOVALAKE_P)
+		xe->info.step.platform = STEP_A0 + xe->info.revid;
+}
+
 /**
  * xe_step_pre_gmdid_get - Determine IP steppings from PCI revid
  * @xe: Xe device
diff --git a/drivers/gpu/drm/xe/xe_step.h b/drivers/gpu/drm/xe/xe_step.h
index 6febb7fac476..41f1c95c46e5 100644
--- a/drivers/gpu/drm/xe/xe_step.h
+++ b/drivers/gpu/drm/xe/xe_step.h
@@ -12,6 +12,8 @@
 
 struct xe_device;
 
+void xe_step_platform_get(struct xe_device *xe);
+
 void xe_step_pre_gmdid_get(struct xe_device *xe);
 void xe_step_gmdid_get(struct xe_device *xe,
 		       u32 graphics_gmdid_revid,
diff --git a/drivers/gpu/drm/xe/xe_step_types.h b/drivers/gpu/drm/xe/xe_step_types.h
index d978cc2512f2..43ca73850739 100644
--- a/drivers/gpu/drm/xe/xe_step_types.h
+++ b/drivers/gpu/drm/xe/xe_step_types.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 
 struct xe_step_info {
+	u8 platform;
 	u8 graphics;
 	u8 media;
 	u8 basedie;

-- 
2.52.0

