Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61878606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 11:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L7LgvPSU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21340112228;
	Thu, 29 Oct 2026 11:37:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2A0112228
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 11:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793273829; x=1824809829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WZhKxUGgyCYW36wq1V9ADxJ1edVcjpsvhRPZkFWIhAM=;
 b=L7LgvPSUmh7zoUO5kdCP6rhwXt1cKdL+rkl4TDgowsibenVD16BJMrNA
 zLb3PeG0hYxPMZbtdpm0Pnhk6CUjy5qCCmRMDw3Wc7T3AeyldqHfBykVE
 LnqlsIHif4sllphga4Zx+MY9RjLFmK4hzhvy6LQz3KrdEhTlAWY9OPYI4
 Dh4YCWeNWPl2uhZkjViG/vnDKB6y0DdnQyETkxKaBwh+sJiXXoi5iFkzZ
 DdTHqzeFWlho7G2b8q/gYo/3H8Gs+jmSp4zMslJt8oEEMoOn0hAtZSdTG
 +kn+MtlUOt1Uqorrz7JHoEmyL2EbcyvjNjFXwOG4S/xiC/uZIrNPzr3JD Q==;
X-CSE-ConnectionGUID: 9aVZWSkaTp2/+1+Ubh6mnQ==
X-CSE-MsgGUID: oDKdY2kRS0KbcNZzRGjX4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2026495"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2026495"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:37:09 -0700
X-CSE-ConnectionGUID: Q21T3bTtRm24P06PyHOtuw==
X-CSE-MsgGUID: KSuEnHvjS/W+M5uDAouUjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5659070"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:37:05 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, matthew.d.roper@intel.com
Subject: [PATCH v8 02/10] drm/xe/cper: Retrieve the error counter record for
 CPER reporting
Date: Thu, 29 Oct 2026 17:06:56 +0530
Message-ID: <20261029113653.1860286-14-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029113653.1860286-12-badal.nilawar@intel.com>
References: <20261029113653.1860286-12-badal.nilawar@intel.com>
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

Retrieve error counter record required to build a CPER record.

Assisted-by: LLM
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_cper.c | 14 ++++++++++++-
 drivers/gpu/drm/xe/xe_ras.c  | 39 ++++++++++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_ras.h  |  2 ++
 3 files changed, 46 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index ee7ca3cbae9b..484f1b025558 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -4,10 +4,13 @@
  */
 
 #include <linux/err.h>
+#include <linux/kernel.h>
 #include <linux/minmax.h>
 
 #include "xe_cper.h"
 #include "xe_device.h"
+#include "xe_printk.h"
+#include "xe_ras.h"
 #include "xe_ras_types.h"
 
 static bool is_hw_sigid(enum xe_sigid sigid)
@@ -18,7 +21,16 @@ static bool is_hw_sigid(enum xe_sigid sigid)
 static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
 			     const struct xe_ras_error_class *counter)
 {
-	/* TODO */
+	struct xe_ras_get_counter_response response = {};
+
+	/* Fetching the counter sends a sysctrl command */
+	might_sleep();
+	xe_device_assert_mem_access(xe);
+
+	if (xe_ras_get_counter_response(xe, counter, &response)) {
+		xe_err(xe, "CPER: failed to get counter, skipping record\n");
+		return;
+	}
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index db3cbc186a51..0555b86b63b2 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -679,6 +679,30 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter, u32 *value)
 {
 	struct xe_ras_get_counter_response response = {0};
+	int ret;
+
+	ret = xe_ras_get_counter_response(xe, counter, &response);
+	if (ret)
+		return ret;
+
+	*value = response.value;
+
+	return 0;
+}
+
+/**
+ * xe_ras_get_counter_response() - Get error counter record
+ * @xe: Xe device instance
+ * @counter: RAS error class
+ * @response: Counter record retrieved
+ *
+ * Retrieve the counter record of a specific error class from firmware.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_class *counter,
+				struct xe_ras_get_counter_response *response)
+{
 	struct xe_ras_get_counter_request request = {0};
 	struct xe_sysctrl_mailbox_command command = {0};
 	struct xe_ras_error_common *common;
@@ -688,7 +712,7 @@ static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
 	request.counter = *counter;
 
 	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_COUNTER,
-				  &request, sizeof(request), &response, sizeof(response));
+				  &request, sizeof(request), response, sizeof(*response));
 
 	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
 	if (ret) {
@@ -696,20 +720,19 @@ static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
 		return ret;
 	}
 
-	if (rlen != sizeof(response)) {
+	if (rlen != sizeof(*response)) {
 		xe_err(xe, "sysctrl: unexpected get counter response length %zu (expected %zu)\n",
-		       rlen, sizeof(response));
+		       rlen, sizeof(*response));
 		return -EIO;
 	}
 
-	if (!ras_counter_is_valid(xe, &response.counter))
+	if (!ras_counter_is_valid(xe, &response->counter))
 		return -EBADMSG;
 
-	common = &response.counter.common;
-	*value = response.value;
+	common = &response->counter.common;
 
-	xe_dbg(xe, "[RAS]: get counter %u for %s %s\n", *value, comp_to_str(common->component),
-	       sev_to_str(common->severity));
+	xe_dbg(xe, "[RAS]: get counter %u for %s %s\n", response->value,
+	       comp_to_str(common->component), sev_to_str(common->severity));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index 1b358c7d040f..c44fa172011f 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -23,5 +23,7 @@ int xe_ras_init(struct xe_device *xe);
 enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
 bool xe_ras_get_disable_vram_page_offline(struct xe_device *xe);
 u32 xe_ras_get_max_pages(struct xe_device *xe);
+int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_class *counter,
+				struct xe_ras_get_counter_response *response);
 
 #endif
-- 
2.56.0

