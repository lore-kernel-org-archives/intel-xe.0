Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C68CCD199
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 02:27:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA0710EAF8;
	Fri, 17 Oct 2025 02:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F529JCYO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F58710EAE3
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 02:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760668040; x=1792204040;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bqG2yXB0cLERvE/VKRIWxK2h+bMCXyyFe9LSfyT390M=;
 b=F529JCYOsAyCgNphalS7z5arc/EmJWhfQqSjwG4pcquYFpprks/bGast
 w0nZpORlg4KA2hA8Rrn5OZqWdMRNRJh7kKGdffs5zhcHU6zIthTW2xv8X
 vsbfCsMhAIN+/Dpk0BmVaKHTS6f7zDYJYK3kVsDvYUSdh0Rhr01vCB8+S
 Po2Zq4JhsQQHIbjCj2+403FwDRaQgB1MrRLsCwA0AXkZdWRmNlLLQjB1B
 r7I34jWaO5rfMbpgwXvsDDuMPpr8R6b1EFLlw+IieSrUGx1wWsasqYDXH
 uEHox3QmjoYaNHKNrU7KQlYx/Ld7zN2Szg91TGtXTvsav2N9IedjQsNxv g==;
X-CSE-ConnectionGUID: 08aOMpVoSmq/ul4tN44QZw==
X-CSE-MsgGUID: u4NfwwaeSIqMWVQP/68dqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66739228"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="66739228"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:20 -0700
X-CSE-ConnectionGUID: 3vEe52J6Q9Kd9+ofQJJcbw==
X-CSE-MsgGUID: G5PNRhRwR1Ov8iPjXxVzpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="183089230"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:20 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH v3 24/24] drm/xe/xe3p: Add xe3p EU stall data format
Date: Thu, 16 Oct 2025 19:26:43 -0700
Message-ID: <20251016-xe3p-v3-24-3dd173a3097a@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
References: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Harish Chegondi <harish.chegondi@intel.com>

Starting with Xe3p, IP address in EU stall data increases to 61 bits.
While at it, re-order the if-else ladder so the officially supported
platforms come before PVC.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: reorder the if-else ladder so PVC is the last (Lucas)
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index f5cfdf29fde34..650e45f6a7c7e 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -124,6 +124,27 @@ struct xe_eu_stall_data_xe2 {
 	__u64 unused[6];
 } __packed;
 
+/*
+ * EU stall data format for Xe3p arch GPUs.
+ */
+struct xe_eu_stall_data_xe3p {
+	__u64 ip_addr:61;	  /* Bits 0  to 60  */
+	__u64 tdr_count:8;	  /* Bits 61 to 68  */
+	__u64 other_count:8;	  /* Bits 69 to 76  */
+	__u64 control_count:8;	  /* Bits 77 to 84  */
+	__u64 pipestall_count:8;  /* Bits 85 to 92  */
+	__u64 send_count:8;	  /* Bits 93 to 100 */
+	__u64 dist_acc_count:8;   /* Bits 101 to 108 */
+	__u64 sbid_count:8;	  /* Bits 109 to 116 */
+	__u64 sync_count:8;	  /* Bits 117 to 124 */
+	__u64 inst_fetch_count:8; /* Bits 125 to 132 */
+	__u64 active_count:8;	  /* Bits 133 to 140 */
+	__u64 ex_id:3;		  /* Bits 141 to 143 */
+	__u64 end_flag:1;	  /* Bit  144 */
+	__u64 unused_bits:47;
+	__u64 unused[5];
+} __packed;
+
 const u64 eu_stall_sampling_rates[] = {251, 251 * 2, 251 * 3, 251 * 4, 251 * 5, 251 * 6, 251 * 7};
 
 /**
@@ -167,10 +188,13 @@ size_t xe_eu_stall_data_record_size(struct xe_device *xe)
 {
 	size_t record_size = 0;
 
-	if (xe->info.platform == XE_PVC)
-		record_size = sizeof(struct xe_eu_stall_data_pvc);
+	if (GRAPHICS_VER(xe) >= 35)
+		record_size = sizeof(struct xe_eu_stall_data_xe3p);
 	else if (GRAPHICS_VER(xe) >= 20)
 		record_size = sizeof(struct xe_eu_stall_data_xe2);
+	else if (xe->info.platform == XE_PVC)
+		record_size = sizeof(struct xe_eu_stall_data_pvc);
+
 
 	xe_assert(xe, is_power_of_2(record_size));
 

-- 
2.51.0

