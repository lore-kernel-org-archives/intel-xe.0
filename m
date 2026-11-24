Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DED606A321
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 13:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZZtdIdgE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C16210E87F;
	Tue, 24 Nov 2026 13:43:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA7B10E87F
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 13:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795527817; x=1827063817;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yhdXt7/XlFN1XGqdpq5AsNISLo3UWN3Ne2YBcnwGTB0=;
 b=ZZtdIdgEHSpkK24lirQLcKwDOe3tWSjafuIYdQKrNYfXMH9LmSbXyz2k
 FQHBOrg9L2Y6qCboKPcJhwPNjI0Cp3S1Qfz/dpbhGly8F7M++tl+WrEKD
 ayDG8rQrOsvdhWEG9w0PhdBQQU936gGQafRkXgEKRNGgCUh9p03ITWMnn
 v9t8CiWbnCs7VP/fuF5zoigIJv7DrFb6uRPmMD9X+I0pV/7+uakQY4tQr
 NoHYHelGh3ZHo1nTRgkAli8HQHiOnWpTTzM3UnulcNhulFoWMvcchTj6l
 r93UGkSJc1yzjTOw2Zy00noVGkDUOq7oKtizJoKbq59eNOEeU47DREdfq A==;
X-CSE-ConnectionGUID: GdLS5mvHQz+3lRPwyOPP1w==
X-CSE-MsgGUID: JvGIgoI/Q/yG8/zzrTy7Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4273840"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4273840"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 05:43:37 -0800
X-CSE-ConnectionGUID: XHhL1VIIQxCuJiSfGXZi1w==
X-CSE-MsgGUID: eooZYu5kQWSRF00fxKlVdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11478216"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 05:43:34 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com
Subject: [PATCH v3] drm/xe/sysctrl: Drain page offline queue on queue-full
 event
Date: Tue, 24 Nov 2026 19:13:24 +0530
Message-ID: <20261124134323.1529876-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The firmware raises a System Controller event when its page offline
queue is full and cannot track further pages until the queue is read.
Handle it by draining the queue and offlining the returned pages, so the
firmware can resume queueing new pages.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com> (event)
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: rebase

v3: add event number in debug log
---
 drivers/gpu/drm/xe/xe_ras.c                 | 12 +++++++-----
 drivers/gpu/drm/xe/xe_ras.h                 |  1 +
 drivers/gpu/drm/xe/xe_sysctrl_event.c       | 13 ++++++++++---
 drivers/gpu/drm/xe/xe_sysctrl_event_types.h |  4 +++-
 4 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index b35c77caeaae..4014945b47ba 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -483,11 +483,13 @@ static void process_offline_pages(struct xe_device *xe, u32 cmd, void *req, size
 	} while (common->additional_data);
 }
 
-/*
- * Retrieve firmware queued pages from warm-retained SRAM during probe. Handle and soft-offline
- * each page as required.
+/**
+ * xe_ras_get_offline_queue() - Drain page offline queue
+ * @xe: xe device instance
+ *
+ * Retrieve firmware queued pages from warm-retained SRAM and process each page as required.
  */
-static void get_offline_queue(struct xe_device *xe)
+void xe_ras_get_offline_queue(struct xe_device *xe)
 {
 	struct xe_ras_offline_common response = {0};
 
@@ -1524,7 +1526,7 @@ int xe_ras_init(struct xe_device *xe)
 
 	/* Fetch the offline list before queue to avoid duplication */
 	get_offline_list(xe);
-	get_offline_queue(xe);
+	xe_ras_get_offline_queue(xe);
 
 	/*
 	 * During probe, process and log any errors detected by firmware while the driver was not
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index 5d41c4543c55..5d24390c8f56 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -23,6 +23,7 @@ int xe_ras_init(struct xe_device *xe);
 enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
 bool xe_ras_get_disable_vram_page_offline(struct xe_device *xe);
 u32 xe_ras_get_max_pages(struct xe_device *xe);
+void xe_ras_get_offline_queue(struct xe_device *xe);
 int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_class *counter,
 				struct xe_ras_get_counter_response *response);
 u32 xe_ras_get_info_queue_size(struct xe_device *xe,
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
index 3239c110a66a..fed85e4fee6d 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
@@ -37,11 +37,17 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
 			return;
 		}
 
-		if (response->event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED)
+		switch (response->event) {
+		case XE_SYSCTRL_EVENT_THRESHOLD_CROSSED:
 			xe_ras_counter_threshold_crossed(xe, response);
-		else
+			break;
+		case XE_SYSCTRL_EVENT_PAGE_OFFLINE_QUEUE_FULL:
+			xe_ras_get_offline_queue(xe);
+			break;
+		default:
 			xe_log_err_info(xe, SYSCTRL, -ENOPKG,
 					"Unexpected event %#x\n", response->event);
+		}
 
 		if (!--count) {
 			xe_log_err(xe, SYSCTRL, -EXFULL,
@@ -49,7 +55,8 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
 			return;
 		}
 
-		xe_dbg(xe, "sysctrl: %u events pending\n", response->count);
+		xe_dbg(xe, "sysctrl: %u event received, %u events pending\n", response->event,
+		       response->count);
 	} while (response->count);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
index 348768ca454a..03bb34e279f0 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
@@ -14,9 +14,11 @@
  * enum xe_sysctrl_event - Events reported by System Controller
  *
  * @XE_SYSCTRL_EVENT_THRESHOLD_CROSSED: Error counter threshold crossed
+ * @XE_SYSCTRL_EVENT_PAGE_OFFLINE_QUEUE_FULL: Page offline queue full
  */
 enum xe_sysctrl_event {
-	XE_SYSCTRL_EVENT_THRESHOLD_CROSSED	= 0x01,
+	XE_SYSCTRL_EVENT_THRESHOLD_CROSSED		= 0x01,
+	XE_SYSCTRL_EVENT_PAGE_OFFLINE_QUEUE_FULL	= 0x02,
 };
 
 /**
-- 
2.47.1

