Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0E4606A32A
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 13:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f1coKdF8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826CF10F2A6;
	Thu, 12 Nov 2026 13:47:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32FA10E602
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 13:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794491245; x=1826027245;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tCuCUOvl7vXViEiwAk1lXT+qzs79RoEH104fwY5c8uM=;
 b=f1coKdF8IfobNPWEsYxPssRp18NUUOc67nYbZYfRzZt2EQ5l22J7/kps
 5i+c17LKZ3LHQ+qvVD3ix+LlxIJcsKYzZ4tMASJjMOaunZntTCNvNLXbF
 W2U2tebZJZzkkFzYmX8HE/go4xTQ14wx6p7sJIlFu2pPhL3Mn5WnYmF1W
 mXvA0iRpEJDYpwUKQ71YfZXWbiE1dXNQRgReE+EQ5SJ9/nI+YzzscWYDp
 1KMQ5/7gIf/5Rzwsq3XTAauGQ8QExVFI6PLl/+iN3OMwad2H1pith+D68
 LQ/vX1MiQ0E9k+bnI8wUknuTtU6E3tI7M+Cset1QkVVru29IDZUmNKqAF g==;
X-CSE-ConnectionGUID: RUV/1/MsQeaEKtRA/oak1w==
X-CSE-MsgGUID: H7HdpHkdRqizAbAUAR+QgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3306691"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3306691"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 05:47:08 -0800
X-CSE-ConnectionGUID: Rc2Xw3lNRea/8BGYbnDYig==
X-CSE-MsgGUID: Wpfdmc2FQbCVpGkl3Iypkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8527913"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 12 Nov 2026 05:47:04 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com, jani.nikula@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v4 4/6] drm/xe/cper: Make software CPER emission atomic-safe
Date: Thu, 12 Nov 2026 19:16:41 +0530
Message-ID: <20261112134636.1860446-12-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112134636.1860446-8-mallesh.koujalagi@intel.com>
References: <20261112134636.1860446-8-mallesh.koujalagi@intel.com>
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

Use GFP_ATOMIC for software CPER records, as software
SIGID logging may occur in atomic context.

Keep hardware CPER handling unchanged.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v3:
- Handle atomic context when SIGIDs are logged. (Sashiko)

v4:
- Add can_sleep bool parameter in per_record_emit. (Badal)
---
 drivers/gpu/drm/xe/xe_cper.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index 5a776aa571d0..61095007b5c2 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -176,15 +176,16 @@ static void cper_init_section_desc(struct xe_device *xe, u8 severity,
 static void cper_record_emit(struct xe_device *xe, u8 severity,
 			     const guid_t *notification_type,
 			     const struct xe_cper_intel_hdr *ihdr,
-			     const void *einfo, u32 einfo_len)
+			     const void *einfo, u32 einfo_len, bool can_sleep)
 {
 	struct cper_section_descriptor *sdesc;
 	struct xe_cper_nonstd_record *rec;
 	struct cper_record_header *rhdr;
+	gfp_t gfp = can_sleep ? GFP_KERNEL : (GFP_ATOMIC | __GFP_NOWARN);
 	u32 total_len;
 
 	total_len = sizeof(struct xe_cper_nonstd_record) + einfo_len;
-	rec = kzalloc(total_len, GFP_KERNEL);
+	rec = kzalloc(total_len, gfp);
 	if (!rec)
 		return;
 
@@ -231,7 +232,8 @@ void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigi
 
 	cper_init_intel_hdr(xe, &error_class, response->timestamp,
 			    sigid, response->value, &ihdr);
-	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr, NULL, 0);
+	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr, NULL, 0,
+			 true);
 }
 
 static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
@@ -258,7 +260,7 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	union xe_cper_error_class error_class = {};
 	struct xe_cper_intel_hdr ihdr = {};
 	struct xe_cper_driver_error_class *driver = &error_class.driver;
-	char *msg = kvasprintf(GFP_KERNEL, vaf->fmt, *vaf->va);
+	char *msg = kvasprintf(GFP_ATOMIC, vaf->fmt, *vaf->va);
 	u64 timestamp = ktime_get_real_ns();
 	size_t msg_len;
 
@@ -274,7 +276,8 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	msg_len = strlen(msg) + 1;
 
 	cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, &ihdr);
-	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len);
+	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len,
+			 false);
 	kfree(msg);
 }
 
-- 
2.48.1

