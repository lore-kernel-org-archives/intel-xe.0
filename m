Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8610606A32C
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 04:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z5rgH+Ma
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A610B10E490;
	Fri, 20 Nov 2026 04:33:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA1410E490
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 04:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795149194; x=1826685194;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yPqhQrW1uE/GI74PSAVjksQvxppdvVdfLjld7YBjf3s=;
 b=Z5rgH+MatO/OQKZiQEeIQ19sULZV+WpVaqc2fSazlSQP99AMt94q1y46
 /F67WOzYhw2GQF7MKGZZFSZ70yzPizDYXlv8nRZcVN/spWeXOx3oOUHHw
 p/J1DB2pFNsLFO0+933260AFrOb6Fh6HkxcXNNyCiJN/Jn/f7qYXKqdSt
 2Qtl1dYbq9vLgdOz4eWwDB9iTQKqivlcMNt05hBTH4cqiESZ66kOi812a
 T9xkjlRZ5e/+IVGc3QhUjUR8a300U/2JNcn1gopgtUx56VZqUSuDKw5b8
 7+tW7VxA3dbkvWEs90K130vDYYZaRBdPMKkiDmeUTDZ3VIBK2vNwEXs4m Q==;
X-CSE-ConnectionGUID: c5dtECyGSOqR1fgNr+UlGQ==
X-CSE-MsgGUID: 3+NK6qKHSsC+HBtlWoc+xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4062505"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4062505"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 20:33:13 -0800
X-CSE-ConnectionGUID: ZCp04NjGST2SnbJBO+2cFA==
X-CSE-MsgGUID: SqsCBajiRhOm0vUKWI7diw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10689431"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 20:33:10 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, matthew.d.roper@intel.com
Subject: [PATCH v8 1/3] drm/xe/cper: Drop redundant counter argument
Date: Fri, 20 Nov 2026 10:03:04 +0530
Message-ID: <20261120043303.107183-6-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120043303.107183-5-badal.nilawar@intel.com>
References: <20261120043303.107183-5-badal.nilawar@intel.com>
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

The RAS counter response already contains the queried error class.
Use it in the CPER emitter instead of passing the counter separately.

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_cper.c | 8 +++-----
 drivers/gpu/drm/xe/xe_cper.h | 3 ---
 drivers/gpu/drm/xe/xe_ras.c  | 3 +--
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index bb90030bcd2d..dda82eb4690c 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -205,20 +205,18 @@ static void cper_record_emit(struct xe_device *xe, u8 severity,
  * @xe: The &xe_device
  * @cper_sev: CPER severity
  * @sigid: Error signature identifier
- * @counter: RAS error class
- * @response: Counter response returned by firmware for @counter
+ * @response: Counter response returned by firmware
  *
  * Build and emit a CPER record from @response.
  */
 void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
-			  const struct xe_ras_error_class *counter,
 			  const struct xe_ras_get_counter_response *response)
 {
 	struct xe_cper_intel_hdr ihdr = {};
 
 	xe_assert(xe, is_hw_sigid(sigid));
 
-	cper_init_intel_hdr(xe, counter, response->timestamp,
+	cper_init_intel_hdr(xe, &response->counter, response->timestamp,
 			    sigid, response->value, &ihdr);
 	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr, NULL, 0);
 }
@@ -237,7 +235,7 @@ static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 		return;
 	}
 
-	xe_cper_emit_counter(xe, cper_sev, sigid, counter, &response);
+	xe_cper_emit_counter(xe, cper_sev, sigid, &response);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_cper.h b/drivers/gpu/drm/xe/xe_cper.h
index 89fb8432f027..b37ff39089ca 100644
--- a/drivers/gpu/drm/xe/xe_cper.h
+++ b/drivers/gpu/drm/xe/xe_cper.h
@@ -12,7 +12,6 @@
 
 struct va_format;
 struct xe_device;
-struct xe_ras_error_class;
 struct xe_ras_get_counter_response;
 
 #if IS_ENABLED(CONFIG_UEFI_CPER)
@@ -20,7 +19,6 @@ void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
 		  u32 component, u32 location, const void *data, size_t len,
 		  struct va_format *vaf);
 void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
-			  const struct xe_ras_error_class *counter,
 			  const struct xe_ras_get_counter_response *response);
 int xe_cper_sysfs_init(struct xe_device *xe);
 #else
@@ -29,7 +27,6 @@ static inline void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigi
 				struct va_format *vaf) {}
 static inline void xe_cper_emit_counter(struct xe_device *xe, int cper_sev,
 					enum xe_sigid sigid,
-					const struct xe_ras_error_class *counter,
 					const struct xe_ras_get_counter_response *response) {}
 static inline int xe_cper_sysfs_init(struct xe_device *xe) { return 0; }
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 0fb891d00b36..e8984c966876 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -763,8 +763,7 @@ static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
 	*value = response.value;
 	if (emit_cper)
 		xe_cper_emit_counter(xe, ras_sev_to_cper_sev(counter->common.severity),
-				     ras_comp_to_hw_sigid(counter->common.component),
-				     counter, &response);
+				     ras_comp_to_hw_sigid(counter->common.component), &response);
 	return 0;
 }
 
-- 
2.56.0

