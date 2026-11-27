Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E94E606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 09:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=afnhd1Du
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D0010E5A5;
	Fri, 27 Nov 2026 09:29:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4105F10E5AB
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 09:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795771778; x=1827307778;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DQFY7PtPDYt1t1mwXck8kqm9zwXdzpfNiKlg/95jTzU=;
 b=afnhd1DuU2o3mFQLo3zA5JuLT4ykVknwlolkc1fYkQY8bNYMDfdTLksn
 A5yuqgSUNjhs/bmEs9Pyf6I6WAG/LNXnyLzCaV1g3rrapo3BTo9mxrYTL
 fgr4ahtEEyAzCAuW5P5AFvoj6EXs3judPUop5nYEN9uKCdbpEmTsl3Z5O
 R0EdsgxMdVJL6axxtGcJnJV44OunlaggwEd4G7CDW6v5euHGr7rUgfbln
 Jnu2nXoCj/qI9SWgBQbaXVneTrcTDQqLs/xhvRb55kbcrFlXZr6ocYrbC
 EONyjV0OxYIvaTRkl3hEjKySKZh3iEGV3T+uTiAV8v1qR6xKqzIqaIsGR A==;
X-CSE-ConnectionGUID: jP/Lr0S/RaemwRJP2v0jBg==
X-CSE-MsgGUID: MBtmt+N+Qeu6mMop/SPz0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4678867"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4678867"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 01:29:38 -0800
X-CSE-ConnectionGUID: VKmtKVN+QW+iOwPsZ3QPMQ==
X-CSE-MsgGUID: Awtu+Ac2SvyEZOkh4vp+PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12276159"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 27 Nov 2026 01:29:35 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com, jani.nikula@linux.intel.com,
 daniele.ceraolospurio@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v7 4/6] drm/xe/cper: Handle CPER allocations in atomic context
Date: Fri, 27 Nov 2026 14:59:18 +0530
Message-ID: <20261127092914.2176025-12-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127092914.2176025-8-mallesh.koujalagi@intel.com>
References: <20261127092914.2176025-8-mallesh.koujalagi@intel.com>
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

Software CPER records are emitted through xe_log_*() helpers. Those
helpers can be called from both sleepable and atomic contexts, such as
IRQ handlers or while holding spinlocks.

Software CPER record generation uses kvasprintf() and kzalloc(), which
cannot determine the caller's context. Using GFP_KERNEL from atomic
context may trigger sleeping-in-atomic warnings and potentially
deadlocks.

Add a GFP argument to xe_cper_emit() and introduce xe_log_*_atomic()
helpers. That allows sleepable callers to use GFP_KERNEL while atomic
callers use GFP_ATOMIC allocation flags, ensuring CPER records can be
emitted safely in all contexts without relying on a single GFP_NOWAIT
allocation policy.

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v3:
- Handle atomic context when SIGIDs are logged. (Sashiko)

v4:
- Add can_sleep bool parameter in per_record_emit. (Badal)

v5:
- Move gfp variable where it's used.

v6:
- Pass gfp_t directly. (Badal)

v7:
- Update commit message. (Badal)
- Remove dropped variable from xe_cper structure.
- Use only GFP_NOWAIT.
---
 drivers/gpu/drm/xe/xe_cper.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index 9161f2b52e9b..10a4085d47f0 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -183,7 +183,7 @@ static void cper_init_section_desc(struct xe_device *xe, u8 severity,
 static void cper_record_emit(struct xe_device *xe, u8 severity,
 			     const guid_t *notification_type,
 			     const struct xe_cper_intel_hdr *ihdr,
-			     const void *einfo, u32 einfo_len)
+			     const void *einfo, u32 einfo_len, gfp_t gfp)
 {
 	struct cper_section_descriptor *sdesc;
 	struct xe_cper_nonstd_record *rec;
@@ -191,7 +191,7 @@ static void cper_record_emit(struct xe_device *xe, u8 severity,
 	u32 total_len;
 
 	total_len = sizeof(struct xe_cper_nonstd_record) + einfo_len;
-	rec = kzalloc(total_len, GFP_KERNEL);
+	rec = kzalloc(total_len, gfp);
 	if (!rec)
 		return;
 
@@ -477,7 +477,7 @@ void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigi
 				    entries[i].einfo_size, &ihdr);
 
 		cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr,
-				 entries[i].einfo, entries[i].einfo_size);
+				 entries[i].einfo, entries[i].einfo_size, GFP_KERNEL);
 	}
 
 	free_info_arr(info_arr, num_entries);
@@ -511,7 +511,8 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	char *msg;
 	size_t msg_len;
 
-	msg = kvasprintf(GFP_KERNEL, vaf->fmt, *vaf->va);
+	/* TODO: Handle xe_log_* helper function for atomic context */
+	msg = kvasprintf(GFP_NOWAIT, vaf->fmt, *vaf->va);
 	if (!msg)
 		xe_warn(xe, "Failed to allocate CPER message\n");
 
@@ -525,7 +526,8 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	timestamp = ktime_get_real_ns();
 
 	cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, msg_len, &ihdr);
-	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len);
+	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len,
+			 GFP_NOWAIT);
 	kfree(msg);
 }
 
-- 
2.48.1

