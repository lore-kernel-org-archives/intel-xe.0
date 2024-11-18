Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E65D43FFC
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 09:07:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4938F10E470;
	Mon, 18 Nov 2024 09:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ad7W7WvH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8854410E0A0
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Nov 2024 09:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731920846; x=1763456846;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e+v4vj6eVVuX48lxv96EDyvZGhyU9+tsZ5phv69vSf8=;
 b=ad7W7WvHwGHc9+AYKmsLaw5YzaqVk6JTI5aN5YmhBoCMvkQhSNkR0OjI
 YNTdbPRhczWqdEDTP6gs/2aFHWU6MeVEh+YB42ITu34IzPEESYeYTynOy
 NEqtRp2UutJOlyk0jTwJBAZeb9+psCP1DFHq7Q7RS9Ai6VUbBb5DQD+SV
 ALHm1q7HBPK7ctmxd0RKkit31nqDzVxtjA4VA87+sQJb+R2pDt81D2KYc
 JYyIXMi0dykk8GHDW/1bZJus94/e7j+/+tGAgjzn79UX6Zs2EH9ww6tt0
 6rOJlDoZnCahT7B6IcOSvl+ZhHXOghg+TkBpxMbBpVSwp6+wdHcRJEBik g==;
X-CSE-ConnectionGUID: e3U7fu9lTxOp89DeLLZOVA==
X-CSE-MsgGUID: P6NL46gXQOioJvw3K9e0Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31242928"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="31242928"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 01:07:25 -0800
X-CSE-ConnectionGUID: TZspPWjiQlWHUqZ+Xz3i4g==
X-CSE-MsgGUID: pN+MNtTaRnSSwNtHd1g+DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="126705158"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 01:07:25 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, jose.souza@intel.com, matias.a.cabral@intel.com,
 joshua.santosh.ranjan@intel.com, shubham.kumar@intel.com,
 matthew.d.roper@intel.com, matthew.olson@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v5 5/7] drm/xe/eustall: Add EU stall sampling support for Xe2
Date: Mon, 18 Nov 2024 01:07:17 -0800
Message-ID: <1323c4472484a58d5c73cc2b0ae00ebf07ce04bb.1731919693.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1731919693.git.harish.chegondi@intel.com>
References: <cover.1731919693.git.harish.chegondi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add EU stall sampling support for Xe2 architecture GPUs - LNL and BMG.
EU stall data format for LNL and BMG is different from that of PVC.

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 52 ++++++++++++++++++++++++++++++--
 1 file changed, 49 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index 96ac08cc7bf2..9169a31f620c 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -73,6 +73,42 @@ struct drm_xe_eu_stall_data_pvc {
 	__u64 unused[6];
 } __packed;
 
+/**
+ * struct drm_xe_eu_stall_data_xe2 - EU stall data format for LNL, BMG
+ *
+ * Bits		Field
+ * 0  to 28	IP (addr)
+ * 29 to 36	Tdr count
+ * 37 to 44	other count
+ * 45 to 52	control count
+ * 53 to 60	pipestall count
+ * 61 to 68	send count
+ * 69 to 76	dist_acc count
+ * 77 to 84	sbid count
+ * 85 to 92	sync count
+ * 93 to 100	inst_fetch count
+ * 101 to 108	Active count
+ * 109 to 111	Exid
+ * 112		EndFlag (is always 1)
+ */
+struct drm_xe_eu_stall_data_xe2 {
+	__u64 ip_addr:29;
+	__u64 tdr_count:8;
+	__u64 other_count:8;
+	__u64 control_count:8;
+	__u64 pipestall_count:8;
+	__u64 send_count:8;
+	__u64 dist_acc_count:8;
+	__u64 sbid_count:8;
+	__u64 sync_count:8;
+	__u64 inst_fetch_count:8;
+	__u64 active_count:8;
+	__u64 ex_id:3;
+	__u64 end_flag:1;
+	__u64 unused_bits:15;
+	__u64 unused[6];
+} __packed;
+
 static unsigned long
 xe_eu_stall_data_record_size(struct xe_device *xe)
 {
@@ -81,6 +117,8 @@ xe_eu_stall_data_record_size(struct xe_device *xe)
 
 	if (platform == XE_PVC)
 		record_size = sizeof(struct drm_xe_eu_stall_data_pvc);
+	else if ((platform == XE_LUNARLAKE) || (platform == XE_BATTLEMAGE))
+		record_size = sizeof(struct drm_xe_eu_stall_data_xe2);
 
 	return record_size;
 }
@@ -308,10 +346,16 @@ eu_stall_data_buf_check(struct xe_eu_stall_data_stream *stream)
 static void
 clear_dropped_eviction_line_bit(struct xe_gt *gt, u16 group, u16 instance)
 {
+	struct xe_device *xe = gt_to_xe(gt);
 	u32 write_ptr_reg;
 
-	/* On PVC, the overflow bit has to be cleared by writing 1 to it. */
-	write_ptr_reg = _MASKED_BIT_ENABLE(XEHPC_EUSTALL_REPORT_OVERFLOW_DROP);
+	/* On PVC, the overflow bit has to be cleared by writing 1 to it.
+	 * On other GPUs, the bit has to be cleared by writing 0 to it.
+	 */
+	if (GRAPHICS_VER(xe) >= 20)
+		write_ptr_reg = _MASKED_BIT_DISABLE(XEHPC_EUSTALL_REPORT_OVERFLOW_DROP);
+	else
+		write_ptr_reg = _MASKED_BIT_ENABLE(XEHPC_EUSTALL_REPORT_OVERFLOW_DROP);
 
 	xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT, write_ptr_reg, group, instance);
 }
@@ -872,7 +916,9 @@ static const struct file_operations fops_eu_stall = {
 
 static inline bool has_eu_stall_sampling_support(struct xe_device *xe)
 {
-	return ((xe->info.platform == XE_PVC) ? true : false);
+	return ((xe->info.platform == XE_PVC ||
+		 xe->info.platform == XE_LUNARLAKE ||
+		 xe->info.platform == XE_BATTLEMAGE) ? true : false);
 }
 
 /**
-- 
2.45.1

