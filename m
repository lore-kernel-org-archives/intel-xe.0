Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4801CCCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 03:25:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046EA10E53B;
	Tue, 14 Oct 2025 03:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FTjKLhoN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2E410E1B0
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 03:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760412330; x=1791948330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eHfcmIG8R0ZeEJmEqbMBV5MBiA2AyVTOeRgsBDatXeY=;
 b=FTjKLhoNpR6eIStoxHzsoADKL8RlCUacdIL8RTwkQcr7lM+mVJ4W57X2
 JYOatgDSOz1ZpW7n3jnNjpk3TFWnLtlfrXp/BOTvYTYbMKNkP7VPA87e0
 HoeLbQrM/Ez9Rngv8ppgNV/uMX1Jbw45lPTzcHdtXz78XpLsl6MBOl6qU
 R88dkpb9cI031KNudYvR0vUBmZI8goSvsQQS0Y8ubgIval5PbUAuxaowF
 /IZYI6C+ffn7huQg0a9J48wX6IopLteAxL69e+9k37NluwnK9UZ+r5OZI
 dlx/qQ0yiT36CBR943sYerIpovP1DLInT8oKNsrsdQmeqmZS2fbklooMA w==;
X-CSE-ConnectionGUID: +LQ0EeQkQ9CNSLKJDEw/ug==
X-CSE-MsgGUID: NqnYIh/QSomVVAvSCXjdDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66414887"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="66414887"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:30 -0700
X-CSE-ConnectionGUID: ZdARufjKTMyIy9ztAdbWmg==
X-CSE-MsgGUID: 3D6lUbrZRSuzw4nCN6pXJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181567335"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:30 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 23/23] drm/xe/xe3p: Add xe3p EU stall data format
Date: Mon, 13 Oct 2025 20:24:55 -0700
Message-ID: <20251013-xe3p-v1-23-bfb74f038215@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
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

Starting with Xe3p, IP address in EU stall data is increases to 61 bits.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index f5cfdf29fde34..2bc6b593ff172 100644
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
@@ -169,6 +190,8 @@ size_t xe_eu_stall_data_record_size(struct xe_device *xe)
 
 	if (xe->info.platform == XE_PVC)
 		record_size = sizeof(struct xe_eu_stall_data_pvc);
+	else if (GRAPHICS_VER(xe) >= 35)
+		record_size = sizeof(struct xe_eu_stall_data_xe3p);
 	else if (GRAPHICS_VER(xe) >= 20)
 		record_size = sizeof(struct xe_eu_stall_data_xe2);
 

-- 
2.51.0

