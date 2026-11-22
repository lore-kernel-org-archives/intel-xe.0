Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64445606A320
	for <intel-xe@archiver.kernel.org>; Sun, 22 Nov 2026 08:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FsS0dD+l
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0B210E467;
	Sun, 22 Nov 2026 08:08:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E05B10E44F
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Nov 2026 08:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795334929; x=1826870929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yPqhQrW1uE/GI74PSAVjksQvxppdvVdfLjld7YBjf3s=;
 b=FsS0dD+lVicRLtLpIDENP9KJMkncEo+E+PgqBhMwzeEoOJ1ruZ7GSKQK
 Lb7d4GiyHBQLZbFjoZeD4JIWrou8guzYxJ+LxM/Mwbd5rGH1ff/6bLGbK
 Agk3SDCzQ8xYggB7Yop9KaRbh6qrRvSNMgMqu+r+lImrCvLc2i4Oh+Rcu
 yFBZdTREyDOFlgBeqGnVZ9iIfVdtRbv7JV8WF1ay+b6NX7iiPK/Omcjbp
 LI076x4U9gardiVd+66B22f9f42oZONdlY5K380Eojt1rYIm+RBl/KmPD
 3mY4IJatTmRrIZZO1dSzfijdlo0Lhqej2Bo6O9CF31IsLVrZEA6sp+wjY w==;
X-CSE-ConnectionGUID: xZuMsuHqQESh4ygNzj4sdQ==
X-CSE-MsgGUID: 8z/b/xjBTLWXLZLRheSX1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4194776"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4194776"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 00:08:49 -0800
X-CSE-ConnectionGUID: uQNmMuHvSL6ycJ112hysTw==
X-CSE-MsgGUID: bS3PZcEGSzq0kYROjSwYSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; d="scan'208";a="11117138"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 00:08:45 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, matthew.d.roper@intel.com
Subject: [PATCH v10 1/3] drm/xe/cper: Drop redundant counter argument
Date: Sun, 22 Nov 2026 13:38:40 +0530
Message-ID: <20261122080838.196649-6-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261122080838.196649-5-badal.nilawar@intel.com>
References: <20261122080838.196649-5-badal.nilawar@intel.com>
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

