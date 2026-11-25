Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C08606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 10:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FqJrRPdy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6960610E865;
	Wed, 25 Nov 2026 10:07:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5605C10E865
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 10:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795601261; x=1827137261;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5Mmey8Geo+Skcajl4wl8YrAHSmu0rz462ri3GQ3FHPA=;
 b=FqJrRPdy6Xm1AI/HdmN69mI93mxduAy/mD3Nhgq5tzhukSXNV8LjGxjV
 G8Qi+yNyWBvswKeU+TkMnN2xpvZBwm3/nSZ3Z+yEHDnwZihjLeC0rShCc
 KyS0k3wkZnoPEy5ml+A/9we20JFCZV3rxbGiY/IHG67mP9+tWdMD5ZXZZ
 V9Rqk9r1vp6/cjob8Z8DInrsJkZwYCdFMnO5xZOqcC5knzo1z4SD7hENV
 XrhfO//o7id+yeHPU2QKZMJbNBeq/DIZAhoBeD6uCavP8GfvUcqxHYRxi
 CbCixN0pjBH5wp5Ywt6WTrFqkPTkGZuxt2Fjka/TR9OVMyR3TJe1etM06 Q==;
X-CSE-ConnectionGUID: JgK4viwvTlChAGR91kD/MQ==
X-CSE-MsgGUID: 7Rdub6voQ5yAoAK0DmGTGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4450564"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4450564"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 02:07:41 -0800
X-CSE-ConnectionGUID: /AUkHmDQRZaekhqXgh3CPA==
X-CSE-MsgGUID: 8YlxTrz6Tx+3DoIJpRpNSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="12136411"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 25 Nov 2026 02:07:37 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com, jani.nikula@linux.intel.com,
 daniele.ceraolospurio@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v6 4/6] drm/xe/cper: Handle CPER allocations in atomic context
Date: Wed, 25 Nov 2026 15:37:20 +0530
Message-ID: <20261125100716.2151294-12-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125100716.2151294-8-mallesh.koujalagi@intel.com>
References: <20261125100716.2151294-8-mallesh.koujalagi@intel.com>
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

Use GFP_NOWAIT | __GFP_NOWARN for software CPER allocations, keep
GFP_KERNEL for hardware CPER allocations, and track/report dropped
records on allocation failures.

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
---
 drivers/gpu/drm/xe/xe_cper.c       | 23 ++++++++++++++++-------
 drivers/gpu/drm/xe/xe_cper_types.h |  3 +++
 drivers/gpu/drm/xe/xe_printk.h     |  3 +++
 3 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index 9161f2b52e9b..d8fff57a349e 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -180,10 +180,14 @@ static void cper_init_section_desc(struct xe_device *xe, u8 severity,
 	}
 }
 
+/* TODO: Handle xe_log_* helper function for atomic context */
+/* Software CPER may be emitted from atomic context */
+#define XE_CPER_SW_GFP	(GFP_NOWAIT | __GFP_NOWARN)
+
 static void cper_record_emit(struct xe_device *xe, u8 severity,
 			     const guid_t *notification_type,
 			     const struct xe_cper_intel_hdr *ihdr,
-			     const void *einfo, u32 einfo_len)
+			     const void *einfo, u32 einfo_len, gfp_t gfp)
 {
 	struct cper_section_descriptor *sdesc;
 	struct xe_cper_nonstd_record *rec;
@@ -191,9 +195,13 @@ static void cper_record_emit(struct xe_device *xe, u8 severity,
 	u32 total_len;
 
 	total_len = sizeof(struct xe_cper_nonstd_record) + einfo_len;
-	rec = kzalloc(total_len, GFP_KERNEL);
-	if (!rec)
+	rec = kzalloc(total_len, gfp);
+	if (!rec) {
+		int total = atomic_inc_return(&xe->cper.dropped);
+
+		xe_warn_ratelimited(xe, "CPER: record dropped, total=%d\n", total);
 		return;
+	}
 
 	rhdr = &rec->record_hdr;
 	sdesc = &rec->section_desc;
@@ -477,7 +485,7 @@ void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigi
 				    entries[i].einfo_size, &ihdr);
 
 		cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr,
-				 entries[i].einfo, entries[i].einfo_size);
+				 entries[i].einfo, entries[i].einfo_size, GFP_KERNEL);
 	}
 
 	free_info_arr(info_arr, num_entries);
@@ -511,9 +519,9 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	char *msg;
 	size_t msg_len;
 
-	msg = kvasprintf(GFP_KERNEL, vaf->fmt, *vaf->va);
+	msg = kvasprintf(XE_CPER_SW_GFP, vaf->fmt, *vaf->va);
 	if (!msg)
-		xe_warn(xe, "Failed to allocate CPER message\n");
+		xe_warn_ratelimited(xe, "CPER: message dropped\n");
 
 	driver->error_type = cper_sev;
 	driver->error_component = component;
@@ -525,7 +533,8 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	timestamp = ktime_get_real_ns();
 
 	cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, msg_len, &ihdr);
-	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len);
+	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len,
+			 XE_CPER_SW_GFP);
 	kfree(msg);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
index 5cfa32c75764..500207bd2e75 100644
--- a/drivers/gpu/drm/xe/xe_cper_types.h
+++ b/drivers/gpu/drm/xe/xe_cper_types.h
@@ -6,6 +6,7 @@
 #ifndef _XE_CPER_TYPES_H_
 #define _XE_CPER_TYPES_H_
 
+#include <linux/atomic.h>
 #include <linux/cper.h>
 #include <linux/types.h>
 #include <linux/uuid.h>
@@ -192,6 +193,8 @@ struct xe_cper_info_entry {
 struct xe_cper {
 	/** @on_query: Emit a CPER record on each RAS counter query */
 	bool on_query;
+	/** @dropped: Number of CPER records dropped due to allocation failure */
+	atomic_t dropped;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_printk.h b/drivers/gpu/drm/xe/xe_printk.h
index 87f51d7edfa8..47886897b4ac 100644
--- a/drivers/gpu/drm/xe/xe_printk.h
+++ b/drivers/gpu/drm/xe/xe_printk.h
@@ -27,6 +27,9 @@
 #define xe_warn(_xe, _fmt, ...) \
 	xe_printk((_xe), warn, _fmt, ##__VA_ARGS__)
 
+#define xe_warn_ratelimited(_xe, _fmt, ...) \
+	xe_printk((_xe), warn_ratelimited, _fmt, ##__VA_ARGS__)
+
 #define xe_notice(_xe, _fmt, ...) \
 	xe_printk((_xe), notice, _fmt, ##__VA_ARGS__)
 
-- 
2.48.1

