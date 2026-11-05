Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8725606A328
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 08:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MhrnXkQa
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DB2112273;
	Thu,  5 Nov 2026 08:54:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F78112273
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 08:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793868853; x=1825404853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BlTBjsUHEEhKzVlZlshwQGiFWsxOk4GnzMnbnYYHbP8=;
 b=MhrnXkQa53qC3Ks6aHnBbl6EpqF/deXJef+uZWQFRaZlsj2G40vHJ+ae
 STL91+/iENv89AP1JcIsvCxvZLR+anIOXvWbWD8R6QtbeLvlq1tmd37kg
 UX5V/X6LIVEfoK3RsuMrdif/ttWQWJTCqrll7VnqYG6rdFmAFQ7ATTDBb
 RpDI7HKgrdYEUvuYAlIlE0lDgdWUkZznTP5tiYHiy7SbWX0i6/1UfVXva
 uigVhsKFZPpn/wV65wX8yNFp231ngLd41DRV8LG/iiWf4xP1qL69OJvW5
 B7C0u3f6bu1HtgjakGvlRKlGFVT0mF0/PIe6FQ8hnYlIQBK2h2OHRaTC+ w==;
X-CSE-ConnectionGUID: FSnHW9HJRNqGUGU6ZB2drg==
X-CSE-MsgGUID: nUw+L5PmQLu5OKhoDTBBFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2641570"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2641570"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 00:54:12 -0800
X-CSE-ConnectionGUID: WKB6NlzAS8KPo9Yah2YWTw==
X-CSE-MsgGUID: ri1qKxUXR26ORGLMyutLvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="8721597"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa011.fm.intel.com with ESMTP; 05 Nov 2026 00:54:10 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com, jani.nikula@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v3 4/6] drm/xe/cper: Make software CPER emission atomic-safe
Date: Thu,  5 Nov 2026 14:23:53 +0530
Message-ID: <20261105085348.1467925-12-mallesh.koujalagi@intel.com>
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

Use GFP_ATOMIC for software CPER records, as software
SIGID logging may occur in atomic context.

Keep hardware CPER handling unchanged.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v3:
- Handle atomic context when SIGIDs are logged. (Sashiko)
---
 drivers/gpu/drm/xe/xe_cper.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index 9510dcd1754c..8c683e320194 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -173,7 +173,7 @@ static void cper_init_section_desc(struct xe_device *xe, u8 severity,
 static void cper_record_emit(struct xe_device *xe, u8 severity,
 			     const guid_t *notification_type,
 			     const struct xe_cper_intel_hdr *ihdr,
-			     const void *einfo, u32 einfo_len)
+			     const void *einfo, u32 einfo_len, gfp_t gfp)
 {
 	struct cper_section_descriptor *sdesc;
 	struct xe_cper_nonstd_record *rec;
@@ -181,7 +181,7 @@ static void cper_record_emit(struct xe_device *xe, u8 severity,
 	u32 total_len;
 
 	total_len = sizeof(struct xe_cper_nonstd_record) + einfo_len;
-	rec = kzalloc(total_len, GFP_KERNEL);
+	rec = kzalloc(total_len, gfp);
 	if (!rec)
 		return;
 
@@ -228,7 +228,8 @@ void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigi
 
 	cper_init_intel_hdr(xe, &error_class, response->timestamp,
 			    sigid, response->value, &ihdr);
-	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr, NULL, 0);
+	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr, NULL, 0,
+			 GFP_KERNEL);
 }
 
 static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
@@ -275,7 +276,8 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	msg_len = cper_format_sw_msg(vaf, msg, sizeof(msg));
 
 	cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, &ihdr);
-	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len);
+	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len,
+			 GFP_ATOMIC | __GFP_NOWARN);
 }
 
 /**
-- 
2.48.1

