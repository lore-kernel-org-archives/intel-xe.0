Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA96CA5FFC
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 09:02:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698D710E44C;
	Mon,  5 Oct 2026 09:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="egq8nZdv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA5510EC32
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 09:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791190943; x=1822726943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XBcma8UUyeQtcn1wsyEOHz3krF9EEoJJmssv3B5FfNE=;
 b=egq8nZdvjRh5quHwNqHvoeVmi1J15NMYRtnm9uxyrvaR5rHznh+yLUCq
 TgsBTqfIEzbdotJCvebtXyldvuYV89dwHVv+vUr0KcUGkdFt7h7wJb8mt
 w0VHJHJmFeW+ZXqVG/eTkREeukq/jletuP0+UepeZOl07EkAFK4k3tiWH
 ViU4QvkNbwFKawMjC5XaKOP0jTFpMiAtgZP2UcBGKaVfe0AqsC/Xr9j/F
 oYoVAoyw699TbQg5fQrZLii6gWsXVAZPQqApsI5LTBms1rPqeWXJPU3qB
 L8fo6ydLP4u47NVsyP4OZow5Q8C0/ASigX+ilCnOfoTOWxlwbtqgI/msT A==;
X-CSE-ConnectionGUID: K5glEepkTXOm4IA8R8nplg==
X-CSE-MsgGUID: i9vaYhumR56mV6jsgfp49w==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="109346378"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="109346378"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 02:02:23 -0700
X-CSE-ConnectionGUID: aTKWK0X+Qb+pEQo+GuJhFg==
X-CSE-MsgGUID: nN+4e60aTNyte3qHCeZ/MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="280050177"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 02:02:21 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v4 4/6] drm/xe/xe_ras: Add function to get maximum pages
 firmware can store
Date: Mon,  5 Oct 2026 14:32:00 +0530
Message-ID: <20261005090156.1233748-12-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261005090156.1233748-8-riana.tauro@intel.com>
References: <20261005090156.1233748-8-riana.tauro@intel.com>
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

v3: set max entries in loop (Sashiko, Tejas)
---
 drivers/gpu/drm/xe/xe_ras.c       | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h       |  1 +
 drivers/gpu/drm/xe/xe_ras_types.h |  2 ++
 3 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 443a4beb1d3f..a792ec1f0faf 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -352,6 +352,7 @@ static void process_offline_pages(struct xe_device *xe, u32 cmd, void *req, size
 {
 	struct xe_sysctrl_mailbox_command command = {0};
 	struct xe_ras_offline_list_request *list_req;
+	struct xe_ras_state *state = &xe->ras.state;
 	u32 total_pages = 0, count = 0;
 	size_t rlen;
 	int ret, i;
@@ -381,6 +382,11 @@ static void process_offline_pages(struct xe_device *xe, u32 cmd, void *req, size
 			return;
 		}
 
+		/* Populate the maximum number of pages from offline list */
+		if (list_req && !state->max_pages)
+			state->max_pages =
+				((struct xe_ras_offline_list_response *)resp)->max_entries;
+
 		for (i = 0; i < common->pages_returned && i < XE_RAS_NUM_PAGES; i++)
 			handle_page_offline(xe, common->page_addresses[i], notify_fw);
 
@@ -1124,6 +1130,17 @@ bool xe_ras_get_disable_page_offline(struct xe_device *xe)
 	return xe->ras.state.disable_page_offline;
 }
 
+/**
+ * xe_ras_get_max_pages - Get the maximum number of pages
+ * @xe: xe device instance
+ *
+ * Return: Maximum number of pages stored by the firmware in flash
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

