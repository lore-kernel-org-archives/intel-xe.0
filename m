Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544CBC021A4
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 13:47:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2F710E557;
	Mon, 10 Feb 2025 13:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c1aAbxhl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017C010E54B
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 13:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739195219; x=1770731219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H29+kf6AXrqpg0duPda+CD9yb7Kp6mq+ikamDSz+bZY=;
 b=c1aAbxhl+0mm7CrJpVPQuhd/4IUMlLajp9svZBWa0uvhEOVsSxnp0JfZ
 j/tQyRQ3f3GJIMaF2//660EzlUCv15muoK6KZ9q1j/69XeKnLTdQ/pdN6
 Ad2vds18afbtABzp74e9+mrxEeqYhwgCCZ//ApP/8Yko8ZpfJs6apA0oL
 1wddpKTyzLJYE5L7C3FzYLcmpt/hIjPETEi9xsBgSfOt2s8o6FqzJS88k
 re/XUkPFNx3AE6yoI4kJv/lBAU6DyT4MwzplT4Rt5qp7BkWHuwcI1wgN5
 MZtmblu4+2xK5+LbdTAXt52hp8Qf/OxAbKsN8wDxsKI73ov2SwryWeNHr A==;
X-CSE-ConnectionGUID: wNibSlAHQUqgp6QpBHeEgg==
X-CSE-MsgGUID: iwYXWPLbQRqwkl7Zdnpmbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="27378426"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="27378426"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 05:46:58 -0800
X-CSE-ConnectionGUID: 4fuvjmKJQf+IYVV83waylQ==
X-CSE-MsgGUID: mFdge6myQCq6zcp/vshzAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="149386847"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 05:46:58 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matthew.olson@intel.com,
 lucas.demarchi@intel.com, Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v9 6/8] drm/xe/eustall: Add EU stall sampling support for Xe2
Date: Mon, 10 Feb 2025 05:46:47 -0800
Message-ID: <358f15b45853d412f4d6f19cb3e1e334d2549d62.1739193510.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739193510.git.harish.chegondi@intel.com>
References: <cover.1739193510.git.harish.chegondi@intel.com>
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

v9: Use GRAPHICS_VER() check instead of platform

v8: Renamed struct drm_xe_eu_stall_data_xe2 to struct xe_eu_stall_data_xe2
    since it is a local structure.

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 51 ++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index 428267010805..52f8f40ba9a6 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -113,12 +113,51 @@ struct xe_eu_stall_data_pvc {
 	__u64 unused[6];
 } __packed;
 
+/**
+ * struct xe_eu_stall_data_xe2 - EU stall data format for LNL, BMG
+ *			Bits		Field
+ * @ip_addr:		0  to 28	IP (addr)
+ * @tdr_count:		29 to 36	Tdr count
+ * @other_count:	37 to 44	other count
+ * @control_count:	45 to 52	control count
+ * @pipestall_count:	53 to 60	pipestall count
+ * @send_count:		61 to 68	send count
+ * @dist_acc_count:	69 to 76	dist_acc count
+ * @sbid_count:		77 to 84	sbid count
+ * @sync_count:		85 to 92	sync count
+ * @inst_fetch_count:	93 to 100	inst_fetch count
+ * @active_count:	101 to 108	Active count
+ * @ex_id:		109 to 111	Exid
+ * @end_flag:		112		EndFlag (is always 1)
+ * @unused_bits:	113 to 127	unused bits
+ * @unused:		remaining	unused bytes
+ */
+struct xe_eu_stall_data_xe2 {
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
 static size_t xe_eu_stall_data_record_size(struct xe_device *xe)
 {
 	unsigned long record_size = 0;
 
 	if (xe->info.platform == XE_PVC)
 		record_size = sizeof(struct xe_eu_stall_data_pvc);
+	else if (GRAPHICS_VER(xe) >= 20)
+		record_size = sizeof(struct xe_eu_stall_data_xe2);
 
 	return record_size;
 }
@@ -345,10 +384,16 @@ static bool eu_stall_data_buf_poll(struct xe_eu_stall_data_stream *stream)
 
 static void clear_dropped_eviction_line_bit(struct xe_gt *gt, u16 group, u16 instance)
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
@@ -821,7 +866,7 @@ static const struct file_operations fops_eu_stall = {
 
 static inline bool has_eu_stall_sampling_support(struct xe_device *xe)
 {
-	return ((xe->info.platform == XE_PVC) ? true : false);
+	return ((xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) ? true : false);
 }
 
 /**
-- 
2.48.1

