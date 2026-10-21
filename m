Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132C7606A31B
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 16:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oKw6hyN7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D781710FEDA;
	Wed, 21 Oct 2026 16:25:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653C110FEDA
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 16:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792599940; x=1824135940;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4B3NmcpXbunvUJ9Re1KPt3o/FLVKVCMv64c2WPZsBwA=;
 b=oKw6hyN7KUYQidCd4e27IhHR+dmq2viQKez5Qsyb+Qn0V2FNj3D1Ch32
 hjEhN+yJISjUeP8PSVYh9ftJGfbda2UUXodaqxlHeai/ksqNExJwDcbUw
 jECLd+InhXyFQ6opx76la3+1ioLfW3AuZbcbcxUrMO2aCBjA4Kmyzme/s
 accxO46ILo3vLvqI72F9LBV2LZVnqTN9bFON0ebyVJmlv1Nuv8LS57KGJ
 CdO53/KpgGBNhBy1TWcwqQImcSzhRoKfh4gBSFtkV8Z010/aB/Esk/qhp
 Bngw8vusDUO8CnRRxqFj8FyaIfmJ637HLTEVQvdiY1dIiBUm+OqZwRrRi g==;
X-CSE-ConnectionGUID: Be7KlCJ4SQe/X94Yd3ZTIw==
X-CSE-MsgGUID: vy+g79xgQki1lXrCFUg4VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1428294"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1428294"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 09:25:40 -0700
X-CSE-ConnectionGUID: XiPhSOCVRviG/xz306OAyw==
X-CSE-MsgGUID: EEqlmxYyRtGt2U5YNST1fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3468937"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 21 Oct 2026 09:25:36 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH 3/5] drm/xe/cper: Let caller initialize error_class
Date: Wed, 21 Oct 2026 21:55:11 +0530
Message-ID: <20261021162508.265700-10-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021162508.265700-7-mallesh.koujalagi@intel.com>
References: <20261021162508.265700-7-mallesh.koujalagi@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Move error_class population from
xe_cper_init_intel_err_hdr() to its caller.

This decouples the helper from the RAS-specific error_class format
and allows future paths to provide their own encoding.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_cper.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index 0fedef06e138..1dab6ea93fea 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -91,12 +91,9 @@ static void fill_cper_error_class(struct xe_cper_error_class *dst,
 	dst->cause = src->product.cause.cause;
 }
 
-static void xe_cper_init_intel_err_hdr(struct xe_device *xe,
-				       const struct xe_ras_error_class *error_class,
-				       u64 first_timestamp, u32 sig_id, u32 error_count,
-				       struct xe_cper_sec_intel_err_hdr *ihdr)
+static void xe_cper_init_intel_err_hdr(struct xe_device *xe, u64 first_timestamp, u32 sig_id,
+				       u32 error_count, struct xe_cper_sec_intel_err_hdr *ihdr)
 {
-	fill_cper_error_class(&ihdr->error_class, error_class);
 	ihdr->validation_bits |= XE_CPER_VALID_LOCATION;
 
 	if (first_timestamp) {
@@ -428,8 +425,9 @@ void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigi
 	for (i = 0; i < count; i++) {
 		struct xe_cper_sec_intel_err_hdr ihdr = {};
 
-		xe_cper_init_intel_err_hdr(xe, &entries[i].hdr.error_class, entries[i].timestamp,
-					   sigid, entries[i].hdr.counter, &ihdr);
+		fill_cper_error_class(&ihdr.error_class, &entries[i].hdr.error_class);
+		xe_cper_init_intel_err_hdr(xe, entries[i].timestamp, sigid,
+					   entries[i].hdr.counter, &ihdr);
 
 		xe_cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr,
 				    entries[i].einfo, entries[i].einfo_size);
-- 
2.48.1

