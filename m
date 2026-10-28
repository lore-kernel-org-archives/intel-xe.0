Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB727606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 09:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JYx5L69M
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E9E10FB0C;
	Wed, 28 Oct 2026 09:57:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A9110E5BB
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 09:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793181458; x=1824717458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=887FpvTH8e85uJA4zegBBimXo91pUd/DduLy3//Omxs=;
 b=JYx5L69MDi9CWBGrisV4ogiYfKKD7JV0vrBM3w8RjjFaoVEJXG8T6RYC
 2CdZUWHTJSXSdyoelM9gddRUiaEgZHxbNRjnA36pKVZfV5YmtMMeLiS1J
 tfORTtURJab3ZV6LZNQOroeNQo/FNZllnnLOzwqscungQ5RRXMJfpOmSs
 q8H82LIL1wqym+BWo9mCn30DIV+ZRc4/hdVC1Y3vjXW9Yl4rSdZPhygM9
 dHLK9syQFAWWFnrGcTDibyLzSSLE1AAkyPd1KV5/FAJ1OrWXdCg7LJWsC
 HMjvpVA8ao4Hv+ziicgdfVZKY/4ndTFR3XlDfYOlhPJwzwUeF0NDQDuPB w==;
X-CSE-ConnectionGUID: k6bCWpwQRImPd04YZEiCwg==
X-CSE-MsgGUID: ytanMV/STLKLGEjk1R92Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1913952"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1913952"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 02:57:37 -0700
X-CSE-ConnectionGUID: 1D8DJegXQxW+3HBsAbfTsw==
X-CSE-MsgGUID: nDdzLKPST06SwoDkXdA3Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4782735"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 02:57:34 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: [PATCH v6 02/10] drm/xe/cper: Retrieve the error counter record for
 CPER reporting
Date: Wed, 28 Oct 2026 15:27:26 +0530
Message-ID: <20261028095723.734387-14-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028095723.734387-12-badal.nilawar@intel.com>
References: <20261028095723.734387-12-badal.nilawar@intel.com>
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
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
v6:
  - v5 review comments
v5:
  - Retain get_counter() (Raag)
v4:
  - Drop redundant xe_ras_counter_is_valid() check (Raag)
  - Add might_sleep() to assert that the caller is in a sleepable
    context (sashiko)
  - Add xe_device_assert_mem_access() to assert the outer runtime PM
    wake reference requirement (sashiko)
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

