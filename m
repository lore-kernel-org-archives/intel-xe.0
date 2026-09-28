Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955A9C98328
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 06:19:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A0210E79F;
	Mon, 28 Sep 2026 06:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KBtjcd92";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E980510E79F
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 06:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790576343; x=1822112343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7PTf8yZlASKZAXOLc5FUvIjtI8s43G2p4d1a9DwcXbM=;
 b=KBtjcd92s4JSYLFRv8MMmoV0naknEEoyAWVeGfj98dONdcNSMdzUqTRX
 r/Rj/Box0hBPLL74G+W/QWXOTCM7SFBvzxcgc4zpv4jemywlFLGQduWWJ
 pSirt/JW/QzSWxOCWi6Bgs4TiASDM8UjRsorfFd63wGGrShlpSy6rAK0B
 XBOJY5/ciTf/b9E/Ns7sH/G59d566B5q7mAMH3sYgqpB2FQ8mOOkimq6K
 5vG00asqm94YeEPx/W894iAJOytutY0/55xH7xbFqRqLFLoGRqz/CtnY1
 3BYGhHoOADG57VQAG6kKnBhEN0SDfO5EBcUaoMpKQgzkirJR2uqZ8t5TH Q==;
X-CSE-ConnectionGUID: 5cNRYn6eQWCb5aWlbd5zvw==
X-CSE-MsgGUID: vIOaeqncSNaMB4WG+rvQcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="100598628"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="100598628"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 23:19:03 -0700
X-CSE-ConnectionGUID: bCBQu3VbTiGbMo1hVi5/fA==
X-CSE-MsgGUID: IpH1RvwrSNmWGpFvjG3k+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="302901226"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 23:18:59 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v3 4/6] drm/xe/xe_ras: Add function to get maximum pages
 firmware can store
Date: Mon, 28 Sep 2026 11:48:34 +0530
Message-ID: <20260928061830.417395-12-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260928061830.417395-8-riana.tauro@intel.com>
References: <20260928061830.417395-8-riana.tauro@intel.com>
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

Add function to get maximum number of pages that firmware can store for
offline tracking. This will be used to report max pages to userspace.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
v2: fix commit message (Himal)
---
 drivers/gpu/drm/xe/xe_ras.c       | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h       |  1 +
 drivers/gpu/drm/xe/xe_ras_types.h |  2 ++
 3 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 9a1a8190578b..cfc7f07e9ced 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -401,9 +401,13 @@ static void get_offlined_list(struct xe_device *xe)
 {
 	struct xe_ras_offline_list_response response = {0};
 	struct xe_ras_offline_list_request request = {0};
+	struct xe_ras_state *state = &xe->ras.state;
 
 	get_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_LIST, &request, sizeof(request),
 			  &response, sizeof(response), &response.common, false);
+
+	if (response.max_entries)
+		state->max_pages = response.max_entries;
 }
 
 static struct pci_dev *find_usp_dev(struct pci_dev *pdev)
@@ -1105,6 +1109,17 @@ bool xe_ras_get_disable_page_offline(struct xe_device *xe)
 	return xe->ras.state.disable_page_offline;
 }
 
+/**
+ * xe_ras_get_max_pages - Get the maximum number of pages
+ * @xe: xe device instance
+ *
+ * Return: Maximum number of pages that can be stored in flash
+ */
+u32 xe_ras_get_max_pages(struct xe_device *xe)
+{
+	return xe->ras.state.max_pages;
+}
+
 /**
  * xe_ras_init - Initialize Xe RAS
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index ac1253d6ead9..561c656e2ad3 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -22,5 +22,6 @@ int xe_ras_set_threshold(struct xe_device *xe, u8 severity, u8 component, u32 th
 void xe_ras_init(struct xe_device *xe);
 enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
 bool xe_ras_get_disable_page_offline(struct xe_device *xe);
+u32 xe_ras_get_max_pages(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 40224db38906..e09b50a6f77b 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -415,5 +415,7 @@ struct xe_ras_set_health_response {
 struct xe_ras_state {
 	/** @disable_page_offline: cached configfs policy, immutable after init */
 	bool disable_page_offline;
+	/** @max_pages: Total number of pages that can be stored by firmware */
+	u32 max_pages;
 };
 #endif
-- 
2.47.1

