Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2029C021AA
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 19:54:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7A910E752;
	Tue, 18 Feb 2025 19:54:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WxbxcwK+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173AE10E74F
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Feb 2025 19:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739908459; x=1771444459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=au3jK0YGTdeJLKBjpvUD+WlA7r3ZFuhRWZJRqfq7AMo=;
 b=WxbxcwK+/Fwns8avbLpJTk0p60zy8tb+tPIJilcG0UTgVccidX9yONLX
 QmlWNPb/hfHWOihGGBPeJqMhPg5gkb5kfBK0h5xWn3jYAl8o+2+g0ChtN
 M1+D24uXCcSvtIJvxYZ6a+Dt7Y3MFpYx5igsCgGLS2DoCdIXc5bgZaWwk
 VSFo3a3RPX2C5+0zQNF75g3Fdfhfh/LE/KTE54fV0oCIGC79ltOatMH2r
 qqxMBHXfq69OFVZ00KVX5W3fOH8Icy115X9Dj8mDJkafOzmTpc3yaFWyI
 qhi32gYMhTWF4iGtjsznH/sQ3VbOSIiaY0yY+ir6vwVetYehXbcwnoQ6x Q==;
X-CSE-ConnectionGUID: nihAsTbkQomaT1VRNngn8g==
X-CSE-MsgGUID: XWLYUoFmTuerLjH1Fgpgkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44382056"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="44382056"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 11:54:18 -0800
X-CSE-ConnectionGUID: YXYzHhgdTQq1P0F64+5dJg==
X-CSE-MsgGUID: 3UgtZq+JQFefwOHoa6fqYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="151706363"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 11:54:18 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matthew.olson@intel.com,
 lucas.demarchi@intel.com, Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v10 6/8] drm/xe/eustall: Add EU stall sampling support for Xe2
Date: Tue, 18 Feb 2025 11:53:56 -0800
Message-ID: <02844ddb9d3752d8f43d0335fbd732c2c12228b8.1739906138.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739906138.git.harish.chegondi@intel.com>
References: <cover.1739906138.git.harish.chegondi@intel.com>
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

v10: Update comments as per review feedback

v9: Use GRAPHICS_VER() check instead of platform

v8: Renamed struct drm_xe_eu_stall_data_xe2 to struct xe_eu_stall_data_xe2
    since it is a local structure.

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 35 +++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index c37fa4486b2e..07c891da90cc 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -100,12 +100,35 @@ struct xe_eu_stall_data_pvc {
 	__u64 unused[6];
 } __packed;
 
+/*
+ * EU stall data format for Xe2 arch GPUs (LNL, BMG).
+ */
+struct xe_eu_stall_data_xe2 {
+	__u64 ip_addr:29;	  /* Bits 0  to 28  */
+	__u64 tdr_count:8;	  /* Bits 29 to 36  */
+	__u64 other_count:8;	  /* Bits 37 to 44  */
+	__u64 control_count:8;	  /* Bits 45 to 52  */
+	__u64 pipestall_count:8;  /* Bits 53 to 60  */
+	__u64 send_count:8;	  /* Bits 61 to 68  */
+	__u64 dist_acc_count:8;   /* Bits 69 to 76  */
+	__u64 sbid_count:8;	  /* Bits 77 to 84  */
+	__u64 sync_count:8;	  /* Bits 85 to 92  */
+	__u64 inst_fetch_count:8; /* Bits 93 to 100 */
+	__u64 active_count:8;	  /* Bits 101 to 108 */
+	__u64 ex_id:3;		  /* Bits 109 to 111 */
+	__u64 end_flag:1;	  /* Bit  112 */
+	__u64 unused_bits:15;
+	__u64 unused[6];
+} __packed;
+
 static size_t xe_eu_stall_data_record_size(struct xe_device *xe)
 {
 	size_t record_size = 0;
 
 	if (xe->info.platform == XE_PVC)
 		record_size = sizeof(struct xe_eu_stall_data_pvc);
+	else if (GRAPHICS_VER(xe) >= 20)
+		record_size = sizeof(struct xe_eu_stall_data_xe2);
 
 	xe_assert(xe, is_power_of_2(record_size));
 
@@ -326,10 +349,16 @@ static bool eu_stall_data_buf_poll(struct xe_eu_stall_data_stream *stream)
 
 static void clear_dropped_eviction_line_bit(struct xe_gt *gt, u16 group, u16 instance)
 {
+	struct xe_device *xe = gt_to_xe(gt);
 	u32 write_ptr_reg;
 
-	/* On PVC, the overflow bit has to be cleared by writing 1 to it. */
-	write_ptr_reg = _MASKED_BIT_ENABLE(XEHPC_EUSTALL_REPORT_OVERFLOW_DROP);
+	/* On PVC, the overflow bit has to be cleared by writing 1 to it.
+	 * On Xe2 and later GPUs, the bit has to be cleared by writing 0 to it.
+	 */
+	if (GRAPHICS_VER(xe) >= 20)
+		write_ptr_reg = _MASKED_BIT_DISABLE(XEHPC_EUSTALL_REPORT_OVERFLOW_DROP);
+	else
+		write_ptr_reg = _MASKED_BIT_ENABLE(XEHPC_EUSTALL_REPORT_OVERFLOW_DROP);
 
 	xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT, write_ptr_reg, group, instance);
 }
@@ -766,7 +795,7 @@ static const struct file_operations fops_eu_stall = {
 
 static inline bool has_eu_stall_sampling_support(struct xe_device *xe)
 {
-	return xe->info.platform == XE_PVC;
+	return xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20;
 }
 
 static int xe_eu_stall_stream_open_locked(struct drm_device *dev,
-- 
2.48.1

