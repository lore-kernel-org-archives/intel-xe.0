Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67E0606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 13:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZZzOF4OZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 917C710E9C7;
	Thu, 26 Nov 2026 13:58:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4198C10E9AE
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 13:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795701476; x=1827237476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y+K9lJ34OGAHJp7tYq3Uvu0mzKEL1U9l5PGa+s+aZ90=;
 b=ZZzOF4OZ+77vl+UH94mzmsW2mTrGuCPcKFETylCILy1unYNX2p6dr0oN
 YMMRx60jPYkKzufSgCm67gviDdPbvIqOpKzZiRDB3Y9DSPIzvF3JK/ruC
 Y/n7XgQn5YHBZmkjdd5hcPuHO3i/nvd3RzAC8quow9Wa9gaUr3c/R/JwU
 hlizFFFqz/yMkhUIqEsOj5noT6TtZVXsemUjiOi5TyX4N2Hd9ukhuLD5y
 2ZGMRyBxSpzxQ8z/99tXvouCqkf05FGhg4NN8qT2/zaNwwbldVEdp309z
 ZXi0ruyeC9yr9iA5muuPNkUo1KHYi8PIbFcdj0UgZS0LpgFMV721zF7jP g==;
X-CSE-ConnectionGUID: ikkSGCwhSMao+yOGF3KV1g==
X-CSE-MsgGUID: f+8nE5hXQfiVjiRZr7UTkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4520599"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4520599"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:57:56 -0800
X-CSE-ConnectionGUID: SqFl9blfR5qZ5E4Z4wUGgQ==
X-CSE-MsgGUID: lRG3rfCHQd2NQguSZvTQqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12684403"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2026 05:57:52 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com, jani.nikula@linux.intel.com,
 daniele.ceraolospurio@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [RFC PATCH v1 3/6] drm/xe/cper: Add gfp argument to xe_cper_emit()
Date: Thu, 26 Nov 2026 19:27:35 +0530
Message-ID: <20261126135732.2169939-11-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126135732.2169939-8-mallesh.koujalagi@intel.com>
References: <20261126135732.2169939-8-mallesh.koujalagi@intel.com>
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

Allows sleepable callers to use GFP_KERNEL while atomic callers
use GFP_ATOMIC | __GFP_NOWARN. Accordingly, xe_log_emit()
now emits CPER records with GFP_KERNEL and xe_log_emit_atomic() uses
GFP_ATOMIC.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_log_kunit.c |  2 +-
 drivers/gpu/drm/xe/xe_cper.c            | 32 +++++++++++++------------
 drivers/gpu/drm/xe/xe_cper.h            | 10 ++++----
 drivers/gpu/drm/xe/xe_log.c             |  4 ++--
 drivers/gpu/drm/xe/xe_ras.c             |  3 ++-
 5 files changed, 28 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_log_kunit.c b/drivers/gpu/drm/xe/tests/xe_log_kunit.c
index 9d8966a3177f..bdbdec45e73d 100644
--- a/drivers/gpu/drm/xe/tests/xe_log_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_log_kunit.c
@@ -146,7 +146,7 @@ static void test_cper_null_xe(struct kunit *test)
 {
 	xe_cper_emit(NULL, CPER_SEV_FATAL, XE_SIGID_PROBE,
 		     XE_LOG_COMPONENT_PROBE, XE_LOG_LOCATION_NONE,
-		     ERR_PTR(-ENODEV), 0, NULL);
+		     ERR_PTR(-ENODEV), 0, NULL, GFP_KERNEL);
 	KUNIT_SUCCEED(test);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index d8fff57a349e..760141215e6b 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -6,6 +6,7 @@
 #include <linux/bcd.h>
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/gfp.h>
 #include <linux/kernel.h>
 #include <linux/minmax.h>
 #include <linux/pci.h>
@@ -180,10 +181,6 @@ static void cper_init_section_desc(struct xe_device *xe, u8 severity,
 	}
 }
 
-/* TODO: Handle xe_log_* helper function for atomic context */
-/* Software CPER may be emitted from atomic context */
-#define XE_CPER_SW_GFP	(GFP_NOWAIT | __GFP_NOWARN)
-
 static void cper_record_emit(struct xe_device *xe, u8 severity,
 			     const guid_t *notification_type,
 			     const struct xe_cper_intel_hdr *ihdr,
@@ -451,11 +448,12 @@ static u32 cper_prepare_info(struct xe_device *xe,
  * @cper_sev: CPER severity
  * @sigid: Error signature identifier
  * @response: Counter response returned by firmware
+ * @gfp: Allocation flags for the CPER records
  *
  * Build and emit CPER records from @response, including any info queue data.
  */
 void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
-			  const struct xe_ras_get_counter_response *response)
+			  const struct xe_ras_get_counter_response *response, gfp_t gfp)
 {
 	struct xe_cper_info_entry *info_arr = NULL, *entries;
 	struct xe_cper_info_entry single = {};
@@ -485,14 +483,14 @@ void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigi
 				    entries[i].einfo_size, &ihdr);
 
 		cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr,
-				 entries[i].einfo, entries[i].einfo_size, GFP_KERNEL);
+				 entries[i].einfo, entries[i].einfo_size, gfp);
 	}
 
 	free_info_arr(info_arr, num_entries);
 }
 
 static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
-			     const struct xe_ras_error_class *counter)
+			     const struct xe_ras_error_class *counter, gfp_t gfp)
 {
 	struct xe_ras_get_counter_response response = {};
 
@@ -505,12 +503,12 @@ static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 		return;
 	}
 
-	xe_cper_emit_counter(xe, cper_sev, sigid, &response);
+	xe_cper_emit_counter(xe, cper_sev, sigid, &response, gfp);
 }
 
 static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
 			     u32 component, u32 location, const void *data,
-			     struct va_format *vaf)
+			     struct va_format *vaf, gfp_t gfp)
 {
 	union xe_cper_error_class error_class = {};
 	struct xe_cper_intel_hdr ihdr = {};
@@ -519,7 +517,7 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	char *msg;
 	size_t msg_len;
 
-	msg = kvasprintf(XE_CPER_SW_GFP, vaf->fmt, *vaf->va);
+	msg = kvasprintf(gfp, vaf->fmt, *vaf->va);
 	if (!msg)
 		xe_warn_ratelimited(xe, "CPER: message dropped\n");
 
@@ -533,8 +531,7 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	timestamp = ktime_get_real_ns();
 
 	cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, msg_len, &ihdr);
-	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len,
-			 XE_CPER_SW_GFP);
+	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len, gfp);
 	kfree(msg);
 }
 
@@ -548,6 +545,7 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
  * @data: Pointer to the additional details, or ERR_PTR, or NULL if not applicable
  * @len: Length of the @data in bytes, or 0 if not applicable
  * @vaf: Formatted log message
+ * @gfp: Allocation flags for the CPER record
  *
  * Emit a CPER record for a SIGID log entry
  *
@@ -564,21 +562,25 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
  */
 void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
 		  u32 component, u32 location, const void *data, size_t len,
-		  struct va_format *vaf)
+		  struct va_format *vaf, gfp_t gfp)
 {
 	/* TODO: Handle using pdev instead of xe. */
 	if (!xe)
 		return;
 
 	if (is_hw_sigid(sigid) && !IS_ERR_OR_NULL(data)) {
-		cper_emit_hw_err(xe, cper_sev, sigid, data);
+		/* HW records drain the sysctrl info queue, which sleeps */
+		if (WARN_ON_ONCE(!gfpflags_allow_blocking(gfp)))
+			return;
+
+		cper_emit_hw_err(xe, cper_sev, sigid, data, gfp);
 		return;
 	}
 
 	if (xe->info.has_driver_cper) {
 		if (is_sw_sigid(sigid) &&
 		    (cper_sev == CPER_SEV_RECOVERABLE || cper_sev == CPER_SEV_FATAL))
-			cper_emit_sw_err(xe, cper_sev, sigid, component, location, data, vaf);
+			cper_emit_sw_err(xe, cper_sev, sigid, component, location, data, vaf, gfp);
 		return;
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_cper.h b/drivers/gpu/drm/xe/xe_cper.h
index b37ff39089ca..78324577bdcd 100644
--- a/drivers/gpu/drm/xe/xe_cper.h
+++ b/drivers/gpu/drm/xe/xe_cper.h
@@ -6,6 +6,7 @@
 #ifndef _XE_CPER_H_
 #define _XE_CPER_H_
 
+#include <linux/gfp_types.h>
 #include <linux/types.h>
 
 #include "abi/xe_sigid_abi.h"
@@ -17,17 +18,18 @@ struct xe_ras_get_counter_response;
 #if IS_ENABLED(CONFIG_UEFI_CPER)
 void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
 		  u32 component, u32 location, const void *data, size_t len,
-		  struct va_format *vaf);
+		  struct va_format *vaf, gfp_t gfp);
 void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
-			  const struct xe_ras_get_counter_response *response);
+			  const struct xe_ras_get_counter_response *response, gfp_t gfp);
 int xe_cper_sysfs_init(struct xe_device *xe);
 #else
 static inline void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
 				u32 component, u32 location, const void *data, size_t len,
-				struct va_format *vaf) {}
+				struct va_format *vaf, gfp_t gfp) {}
 static inline void xe_cper_emit_counter(struct xe_device *xe, int cper_sev,
 					enum xe_sigid sigid,
-					const struct xe_ras_get_counter_response *response) {}
+					const struct xe_ras_get_counter_response *response,
+					gfp_t gfp) {}
 static inline int xe_cper_sysfs_init(struct xe_device *xe) { return 0; }
 #endif
 
diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
index 78c114754daa..c5cc1de4c507 100644
--- a/drivers/gpu/drm/xe/xe_log.c
+++ b/drivers/gpu/drm/xe/xe_log.c
@@ -22,7 +22,7 @@ static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigi
 				   component, location, data, len, vaf);
 
 	xe_cper_emit(xe_any_to_xe(pdev), cper_sev, sigid,
-		     component, location, data, len, vaf);
+		     component, location, data, len, vaf, GFP_KERNEL);
 }
 
 static void log_emit_cper_atomic(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
@@ -33,7 +33,7 @@ static void log_emit_cper_atomic(struct pci_dev *pdev, int cper_sev, enum xe_sig
 				   component, location, data, len, vaf);
 
 	xe_cper_emit(xe_any_to_xe(pdev), cper_sev, sigid,
-		     component, location, data, len, vaf);
+		     component, location, data, len, vaf, GFP_ATOMIC | __GFP_NOWARN);
 }
 
 static const char *log_unknown_component_prefix(u32 component)
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 9b04be3405ca..df9dde457122 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -745,7 +745,8 @@ static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
 	*value = response.value;
 	if (emit_cper)
 		xe_cper_emit_counter(xe, ras_sev_to_cper_sev(counter->common.severity),
-				     ras_comp_to_hw_sigid(counter->common.component), &response);
+				     ras_comp_to_hw_sigid(counter->common.component), &response,
+				     GFP_KERNEL);
 	return 0;
 }
 
-- 
2.48.1

