Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B75606A338
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 06:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CASW/d7f
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CC710E1FF;
	Sat, 21 Nov 2026 06:46:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1F610E18E
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 06:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795243557; x=1826779557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yPqhQrW1uE/GI74PSAVjksQvxppdvVdfLjld7YBjf3s=;
 b=CASW/d7fMHHaM9ERjP8nG7xUB+nTE2hVN+dAImCG7k6SZRwutdPqRXQN
 wnryqYM8VDyZDsIavUfg7hCHdWxfw3lC+1VJifIESrXc/lbUHnC7qdcZa
 BI48L3Js4gwuuPqYq9F2m1ZI4sqHJoJob3MP3BTHSDXapo/Av4C2+DUQo
 qie1qXfaj4Ii/YcRxL1ok3E/WFlCrZcrrZ8AAlx8WaBOaWvaAN0o+RwCK
 WnWuc+KuER8nHTELEk0fRcSfh7lSOq8DN9zg/svozPCb5i5U2645GnmoV
 kCe1mCBvU2DzM5m/PiRH6yFM3jP/zRu62Xl15P5IPxmHMEz9KknKJn6OS Q==;
X-CSE-ConnectionGUID: eUWGOJ3wRDCfFdUjV+XhvA==
X-CSE-MsgGUID: /1F4hXdyQO+BNpqAFgCSiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4008541"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4008541"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 22:45:57 -0800
X-CSE-ConnectionGUID: UTr6TN8QTfW2o067bXgcfQ==
X-CSE-MsgGUID: wscE0rELSsSPkKYVUYwGdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; d="scan'208";a="12869383"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 22:45:53 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, matthew.d.roper@intel.com
Subject: [PATCH v9 1/3] drm/xe/cper: Drop redundant counter argument
Date: Sat, 21 Nov 2026 12:15:47 +0530
Message-ID: <20261121064545.168470-6-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261121064545.168470-5-badal.nilawar@intel.com>
References: <20261121064545.168470-5-badal.nilawar@intel.com>
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

