Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C31CA9ED5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 05:41:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D17810E416;
	Mon, 12 Oct 2026 05:41:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B5010E416
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 05:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791783686; x=1823319686;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lPrA7bwbdsA+aw/TiwIbd80bz8C6T0zYrFPcmr5tKfI=;
 b=SsAL3si2vbj5F3CgjyLPaNLjC+k3i09ei9jCytSh7Jbw04KyA9hN8//w
 LWI3YESvU2y6IYHU+BoqW6pyVGvqGhhbEahMkxkO9wTuYJuLDge1udL5D
 vQXLvwDgkeTy/Kehi/h+A6xBVXMtuBVYRR3sJNQjFbzY/dre2AFo/N5o0
 ugDjYK4242fdzp92zk92xO6bi53umdV9owATe1YnbYZjg74+VNe+Nacj3
 aMjYsGV4A15a9TdPXDWQmZPRvP5vYnAZ68yEMTU+nD17IP/Af7IiRXA4b
 VO2VdqroyJu3i2eAF6HELyFRMTs3i2qQjCLos9Pezn6ig8eW3GyLzLeRY w==;
X-CSE-ConnectionGUID: m+15zbnoRiixOpAJgKOW6w==
X-CSE-MsgGUID: jRuVODp4RQKW4cUTuGzGgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="367839"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="367839"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:41:25 -0700
X-CSE-ConnectionGUID: fCmIx5UfSQiG7FkKbI1pGw==
X-CSE-MsgGUID: ec8YMBk1ThKzhyqoP0QQGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="787132"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:41:22 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v5 4/6] drm/xe/xe_ras: Add function to get maximum pages
 firmware can store
Date: Mon, 12 Oct 2026 11:11:00 +0530
Message-ID: <20261012054056.2272869-12-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261012054056.2272869-8-riana.tauro@intel.com>
References: <20261012054056.2272869-8-riana.tauro@intel.com>
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
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
v2: fix commit message (Himal)

v3: set max entries in loop (Sashiko, Tejas)
---
 drivers/gpu/drm/xe/xe_ras.c       | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h       |  1 +
 drivers/gpu/drm/xe/xe_ras_types.h |  2 ++
 3 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index de97e5341f94..389789c95a6f 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -353,6 +353,7 @@ static void process_offline_pages(struct xe_device *xe, u32 cmd, void *req, size
 {
 	struct xe_sysctrl_mailbox_command command = {0};
 	struct xe_ras_offline_list_request *list_req;
+	struct xe_ras_state *state = &xe->ras.state;
 	u32 total_pages = 0, count = 0;
 	size_t rlen;
 	int ret, i;
@@ -382,6 +383,11 @@ static void process_offline_pages(struct xe_device *xe, u32 cmd, void *req, size
 			return;
 		}
 
+		/* Populate the maximum number of pages from offline list */
+		if (list_req && !state->max_pages)
+			state->max_pages =
+				((struct xe_ras_offline_list_response *)resp)->max_entries;
+
 		for (i = 0; i < common->pages_returned && i < XE_RAS_NUM_PAGES; i++)
 			handle_page_offline(xe, common->page_addresses[i], notify_fw);
 
@@ -1125,6 +1131,17 @@ bool xe_ras_get_disable_vram_page_offline(struct xe_device *xe)
 	return xe->ras.state.disable_vram_page_offline;
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
index 1a2545f962c4..268c2afa10b6 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -22,5 +22,6 @@ int xe_ras_set_threshold(struct xe_device *xe, u8 severity, u8 component, u32 th
 void xe_ras_init(struct xe_device *xe);
 enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
 bool xe_ras_get_disable_vram_page_offline(struct xe_device *xe);
+u32 xe_ras_get_max_pages(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index b6f4cfbadede..1283c83510b2 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -415,5 +415,7 @@ struct xe_ras_set_health_response {
 struct xe_ras_state {
 	/** @disable_vram_page_offline: cached configfs policy, immutable after init */
 	bool disable_vram_page_offline;
+	/** @max_pages: Total number of pages that can be stored by firmware */
+	u32 max_pages;
 };
 #endif
-- 
2.47.1

