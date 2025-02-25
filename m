Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B308C021BE
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 09:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50AE110E5DF;
	Tue, 25 Feb 2025 09:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pt4mlqEq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31BAF10E5D7
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 09:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740475233; x=1772011233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n2Esj9mRu9FhQtAsoo3UWRyOnOTgblO6NlGgItX8qZk=;
 b=Pt4mlqEqasxyx8GrZgkRdI5vqwFTk/c4j571ojy+n64oP9BO4s80fDX1
 xHRF9PhdVxr6Ih3sMTLghUwiG9fesus5cKvxc8p/MbPWz1WJnI01vQUzR
 FbbbaJr/G+ugyAwZVUMQpfbopZKxv4GfDddLIwsxQUuk4QfiwWCgNNOkv
 5ZKJcfhBQhV3bdgTK3OMtb1ue0LOE/TwqgO1VS+45Yk49Ha3MKTVmT0xx
 gmOnQMdAw842G6+ISefant58C0OLNVmifl6CJCN/N7Q8z9HKt5Q2Br04q
 aHQuSqjgnHAxfmRBv3XFeRNSkndWHBYIB5f/oF//genZK6d4h7308pyjf w==;
X-CSE-ConnectionGUID: YxBfwModTY2VaeBCJnrBpQ==
X-CSE-MsgGUID: w3gWvk+ERHqTv+0UmEe/1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40507678"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="40507678"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 01:20:33 -0800
X-CSE-ConnectionGUID: 9oZCOH2RTPG7uU6fIEJuiA==
X-CSE-MsgGUID: 7wqR674qToii5CMp97vHkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117261784"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 01:20:32 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matthew.olson@intel.com,
 shubham.kumar@intel.com, joshua.santosh.ranjan@intel.com,
 lucas.demarchi@intel.com, Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v11 6/8] drm/xe/eustall: Add EU stall sampling support for Xe2
Date: Tue, 25 Feb 2025 01:20:23 -0800
Message-ID: <440bbe7c97a45a040324124baa365bf95991a01b.1740474556.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740474556.git.harish.chegondi@intel.com>
References: <cover.1740474556.git.harish.chegondi@intel.com>
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

Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 35 +++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index d0d4151bea10..74ff4a848df6 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -99,12 +99,35 @@ struct xe_eu_stall_data_pvc {
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
 
@@ -345,10 +368,16 @@ static bool eu_stall_data_buf_poll(struct xe_eu_stall_data_stream *stream)
 
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
@@ -788,7 +817,7 @@ static const struct file_operations fops_eu_stall = {
 
 static inline bool has_eu_stall_sampling_support(struct xe_device *xe)
 {
-	return xe->info.platform == XE_PVC;
+	return xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20;
 }
 
 static int xe_eu_stall_stream_open_locked(struct drm_device *dev,
-- 
2.48.1

