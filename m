Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80FA606A329
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 08:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c5A88JBU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634FE10E067;
	Thu,  5 Nov 2026 08:54:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16AD10E067
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 08:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793868846; x=1825404846;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U4VAGl17I1S7va004mK5DI4zjojACgIy2xF1PmIQOKA=;
 b=c5A88JBUKhTj6AX72AZKlXP0lJkmFAz+FMkrkHbrVc6mz85sdoR0U8Fc
 q60UsmG7bEHiNWbF+dCTr8ntqEqoqp4twwxTFxOf9cy1bHMlvQXXkHbc6
 WwHj6+A3R+kgEM0c8nCfe1RIkkivKZxZ1uW5Mky05c/iGuN7O7cKk976n
 DMwDmJiL0Vv7KffiNzBPaU9gtZ7buznv+LWJPZDEiP1/X/qwX8VIzLduq
 mkUYuALtN1KXuLE5RRNu/7vMOJ8Vjs//rwiaPl/IXdzTm1XXPSNUE02Ev
 BRF83MZvcrqTCY/bCAb/sKvOYhmdxk75lMiEs3xxMo19o+rgVEevVTgLH w==;
X-CSE-ConnectionGUID: pqc40K0fSvyA6/dzaONtQQ==
X-CSE-MsgGUID: 1sFlYDSUQzuDfwDHgMbYtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2641559"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2641559"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 00:54:05 -0800
X-CSE-ConnectionGUID: 2aITX73BR/WLcQ2oa0f3jA==
X-CSE-MsgGUID: rB69/MbWQo+tqkVehPAB0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="8721546"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa011.fm.intel.com with ESMTP; 05 Nov 2026 00:54:02 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com, jani.nikula@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v3 2/6] drm/xe/cper: Prepare CPER headers for software errors
Date: Thu,  5 Nov 2026 14:23:51 +0530
Message-ID: <20261105085348.1467925-10-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105085348.1467925-8-mallesh.koujalagi@intel.com>
References: <20261105085348.1467925-8-mallesh.koujalagi@intel.com>
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

Add software error classification support and reuse the
common CPER header initialization path.

Populate software error metadata without emitting a CPER
record yet.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2:
- Move union inside xe_cper_intel_hdr structure. (Badal)

v3:
- Introduce structure where it's used. (Badal)
- Move error-class union inside cper_init_intel_hdr. (Badal)
---
 drivers/gpu/drm/xe/xe_cper.c       | 21 +++++++++++++++++---
 drivers/gpu/drm/xe/xe_cper_types.h | 32 ++++++++++++++++++++++++++++--
 2 files changed, 48 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index db3513c59834..10aa10bbf282 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -14,6 +14,8 @@
 #include <linux/time.h>
 #include <linux/timekeeping.h>
 
+#include "abi/xe_log_abi.h"
+
 #include "xe_cper.h"
 #include "xe_cper_types.h"
 #include "xe_device.h"
@@ -92,11 +94,11 @@ static u64 cper_timestamp_now(void)
 	return ts;
 }
 
-static void cper_init_intel_hdr(struct xe_device *xe, const struct xe_ras_error_class *counter,
+static void cper_init_intel_hdr(struct xe_device *xe, const union xe_cper_error_class *error_class,
 				u64 first_timestamp, u32 sig_id, u32 error_count,
 				struct xe_cper_intel_hdr *ihdr)
 {
-	ihdr->counter = *counter;
+	ihdr->error_class = *error_class;
 	ihdr->validation_bits |= XE_CPER_VALID_LOCATION;
 	ihdr->sig_id = U32_MAX;
 
@@ -219,11 +221,12 @@ void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigi
 			  const struct xe_ras_error_class *counter,
 			  const struct xe_ras_get_counter_response *response)
 {
+	union xe_cper_error_class error_class = { .counter = *counter };
 	struct xe_cper_intel_hdr ihdr = {};
 
 	xe_assert(xe, is_hw_sigid(sigid));
 
-	cper_init_intel_hdr(xe, counter, response->timestamp,
+	cper_init_intel_hdr(xe, &error_class, response->timestamp,
 			    sigid, response->value, &ihdr);
 	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr, NULL, 0);
 }
@@ -249,6 +252,18 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 			     u32 component, u32 location, const void *data,
 			     struct va_format *vaf)
 {
+	union xe_cper_error_class error_class = {};
+	struct xe_cper_intel_hdr ihdr = {};
+	struct xe_cper_driver_error_class *driver = &error_class.driver;
+	u64 timestamp = ktime_get_boottime_ns();
+
+	driver->error_type = cper_sev;
+	driver->error_component = component;
+	driver->tile = location;
+	if (IS_ERR(data))
+		driver->cause = -PTR_ERR(data);
+
+	cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, &ihdr);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
index 68e30df0440e..d8581992dc45 100644
--- a/drivers/gpu/drm/xe/xe_cper_types.h
+++ b/drivers/gpu/drm/xe/xe_cper_types.h
@@ -45,6 +45,29 @@
 	GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
 		  0x80, 0x28, 0xb9, 0xb1, 0x3e, 0x6d, 0x58, 0xb0)
 
+/**
+ * struct xe_cper_driver_error_class - Intel GPU CPER driver-detected error classification
+ */
+struct xe_cper_driver_error_class {
+	/** @error_type: CPER severity: CPER_SEV_* */
+	u8  error_type;
+	/** @reserved0: Reserved, must be zero */
+	u8  reserved0;
+	/** @error_component: Driver component id: CLASS[7:0].TYPE[15:8] */
+	u16 error_component;
+	/** @tile: Driver location id: TYPE[7:0].ID[15:8] ('tile' and 'GT' field region) */
+	u16 tile;
+	/** @reserved1: Reserved, must be zero */
+	u16 reserved1;
+	/** @cause: errno of the failing operation, or 0 if none */
+	u32 cause;
+};
+
+/* Same size as the counter-sourced error_class */
+#define XE_CPER_ERROR_CLASS_SIZE	12
+
+static_assert(sizeof(struct xe_cper_driver_error_class) == XE_CPER_ERROR_CLASS_SIZE);
+
 /**
  * struct xe_cper_intel_hdr - Intel-specific CPER header
  *
@@ -52,8 +75,13 @@
  * All multi-byte fields are little-endian.
  */
 struct xe_cper_intel_hdr {
-	/** @counter: Error class (severity, component, location, cause) */
-	struct xe_ras_error_class counter;
+	/** @error_class: Counter-sourced or driver-detected error classification */
+	union xe_cper_error_class {
+		/** @error_class.counter: Counter-sourced error classification */
+		struct xe_ras_error_class counter;
+		/** @error_class.driver: Driver-detected error classification */
+		struct xe_cper_driver_error_class driver;
+	} error_class;
 	/** @first_timestamp: First occurrence of this error class, in ticks */
 	u64 first_timestamp;
 	/** @sig_id: Aggregated error class SIG ID; set to U32_MAX if unknown */
-- 
2.48.1

