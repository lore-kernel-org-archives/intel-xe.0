Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1611606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 08:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=glNEyEk7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CEC911215A;
	Thu, 26 Nov 2026 08:35:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE3C112157
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 08:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795682148; x=1827218148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c/MSomQ/vU73Fd7KNtMsAXSKqHmbSQXuXEoHUVVTAb4=;
 b=glNEyEk7/iz3F9nofv0Rjn9uek3noHiIRnWLJa3VchcSBsyX9ckYkGeb
 PpGeqC8c+pGl4OE2DhNrDVXtcqsLMj8Q+J5PC+tEXErj5W75+4vRLOiq4
 Xe21k8zHx1wUCSbMOlqCrzmblNSUKkBBa+2b98ZzV7latuyDnvRdll8/4
 NYKTySGpBlIozx+ZRzzdeugYaLKb//7mPZIFqtBVWoOCYwbgJFtmiLUHe
 vOyfh7/HmAsjWzu/mKyd0qD1iQCDjwsJ0uHcEDtN+m+4SCf9piJscgnFM
 kwB6AXkC4EN07sBkdlW4/8WgrVNlRYLIxJkDtPgmHNXucVEubPEQMSf51 Q==;
X-CSE-ConnectionGUID: yMFLwu9kS0G+104crSOFiQ==
X-CSE-MsgGUID: iD9KKsW+RpWGt/+IBSJ4/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4581232"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4581232"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 00:35:41 -0800
X-CSE-ConnectionGUID: 45aCM1VJSWiBx2sswz4+hw==
X-CSE-MsgGUID: YADiG9ubTl6vIz3zwkoogQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12147440"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 00:35:38 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com
Subject: [PATCH v4 2/3] drm/xe/sysctrl: Drain page offline queue on queue-full
 event
Date: Thu, 26 Nov 2026 14:05:19 +0530
Message-ID: <20261126083516.1932195-7-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261126083516.1932195-5-riana.tauro@intel.com>
References: <20261126083516.1932195-5-riana.tauro@intel.com>
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

Reviewed-by: Raag Jadav <raag.jadav@intel.com> #event
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: rebase

v3: add event number in debug log

v4: add locking
    modify log (Raag)
---
 drivers/gpu/drm/xe/xe_ras.c                 | 19 ++++++++++++++-----
 drivers/gpu/drm/xe/xe_ras.h                 |  1 +
 drivers/gpu/drm/xe/xe_ras_types.h           |  3 +++
 drivers/gpu/drm/xe/xe_sysctrl_event.c       | 13 ++++++++++---
 drivers/gpu/drm/xe/xe_sysctrl_event_types.h |  4 +++-
 5 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index c30cea4901cb..e080cbebbdbe 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -321,6 +321,9 @@ static int handle_page_offline(struct xe_device *xe, u64 page_address, bool noti
 		return -EINVAL;
 	}
 
+	/* Orders fault handling and firmware commands across workers */
+	guard(mutex)(&state->lock);
+
 	/* User policy set to disable page offlining */
 	if (xe_ras_get_disable_vram_page_offline(xe)) {
 		action = XE_RAS_PAGE_ACTION_REMOVE;
@@ -474,11 +477,13 @@ static void process_offline_pages(struct xe_device *xe, u32 cmd, void *req, size
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
 
@@ -1503,13 +1508,17 @@ int xe_ras_init(struct xe_device *xe)
 
 	xa_init(&state->offlined_pages);
 
+	ret = devm_mutex_init(xe->drm.dev, &state->lock);
+	if (ret)
+		return ret;
+
 	ret = devm_add_action_or_reset(xe->drm.dev, ras_fini, xe);
 	if (ret)
 		return ret;
 
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
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 80f5d46d2dc2..195196a32fd5 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -6,6 +6,7 @@
 #ifndef _XE_RAS_TYPES_H_
 #define _XE_RAS_TYPES_H_
 
+#include <linux/mutex.h>
 #include <linux/types.h>
 #include <linux/xarray.h>
 
@@ -534,6 +535,8 @@ struct xe_ras_state {
 	bool disable_vram_page_offline;
 	/** @max_pages: Total number of pages that can be stored by firmware */
 	u32 max_pages;
+	/** @lock: Serializes page offline handling across workers */
+	struct mutex lock;
 	/** @offlined_pages: XArray of pages offlined by firmware */
 	struct xarray offlined_pages;
 };
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
index 3239c110a66a..b6a414bb3df7 100644
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
+		xe_dbg(xe, "sysctrl: event code #%x received, %u events pending\n", response->event,
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

