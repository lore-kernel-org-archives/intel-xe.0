Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA61C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:46:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB6610E8E0;
	Thu,  9 Nov 2023 15:46:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1897710E8E0
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699544770; x=1731080770;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4E8x8CNaEzyoD91Kee0G6pjMOvuwH65zLmDrmDj9Kqg=;
 b=m9qMbfPvuWXK3tMwGsK58mdv3BjhzqVPBGtDRcONx2bgq+LkvHZx/iFH
 /vgqbSY1Csyg83F4AK9HnKxSw/dGfVeweIK/SXVvscro4MPpRwS5FfBX7
 C6xPegejA5ufmKeWSOLKVTkZ0xp6TYgE48pevQ8T5/63yh0e39TXcPMRa
 /a4ES+tzVn9TW1WvUJuBI2bj8kd4GrgaG+KtfJbs/mwBzbHHmNkH0dD8l
 bT23c/8BTgn3jWpUShk6hYTTm2xe2mCCU0uUDCQgROx/8++qHXA63joWj
 AJI5yPTebULZFF5G2jJ04BmCmByV5ELpHuTPB5FDyp2IuZFuIaiou96bP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11556789"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11556789"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936886054"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="936886054"
Received: from hschreib-mobl.ger.corp.intel.com (HELO ac699de916ef.intel.com)
 ([10.249.42.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:48 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:44:42 +0000
Message-Id: <20231109154457.7-29-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109154457.7-1-francois.dugast@intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 28/43] drm/xe/uapi: Differentiate WAIT_OP from
 WAIT_MASK
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

On one hand the WAIT_OP represents the operation use for waiting such
as ==, !=, > and so on. On the other hand, the mask is applied to the
value used for comparision. Split those two to bring clarity to the uapi.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 14 ++++-----
 include/uapi/drm/xe_drm.h               | 41 +++++++++++++------------
 2 files changed, 28 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 13562db6c07f..4d5c2555ce41 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -25,22 +25,22 @@ static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
 		return -EFAULT;
 
 	switch (op) {
-	case DRM_XE_UFENCE_WAIT_EQ:
+	case DRM_XE_UFENCE_WAIT_OP_EQ:
 		passed = (rvalue & mask) == (value & mask);
 		break;
-	case DRM_XE_UFENCE_WAIT_NEQ:
+	case DRM_XE_UFENCE_WAIT_OP_NEQ:
 		passed = (rvalue & mask) != (value & mask);
 		break;
-	case DRM_XE_UFENCE_WAIT_GT:
+	case DRM_XE_UFENCE_WAIT_OP_GT:
 		passed = (rvalue & mask) > (value & mask);
 		break;
-	case DRM_XE_UFENCE_WAIT_GTE:
+	case DRM_XE_UFENCE_WAIT_OP_GTE:
 		passed = (rvalue & mask) >= (value & mask);
 		break;
-	case DRM_XE_UFENCE_WAIT_LT:
+	case DRM_XE_UFENCE_WAIT_OP_LT:
 		passed = (rvalue & mask) < (value & mask);
 		break;
-	case DRM_XE_UFENCE_WAIT_LTE:
+	case DRM_XE_UFENCE_WAIT_OP_LTE:
 		passed = (rvalue & mask) <= (value & mask);
 		break;
 	default:
@@ -81,7 +81,7 @@ static int check_hw_engines(struct xe_device *xe,
 
 #define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP | \
 			 DRM_XE_UFENCE_WAIT_FLAG_ABSTIME)
-#define MAX_OP		DRM_XE_UFENCE_WAIT_LTE
+#define MAX_OP		DRM_XE_UFENCE_WAIT_OP_LTE
 
 static long to_jiffies_timeout(struct xe_device *xe,
 			       struct drm_xe_wait_user_fence *args)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 5217558a32d0..c30f7ea3fae3 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1140,22 +1140,22 @@ struct drm_xe_exec_queue_get_property {
  * Returns to user on user fence completion or timeout.
  *
  * The wait @op can be:
- *  - %DRM_XE_UFENCE_WAIT_EQ
- *  - %DRM_XE_UFENCE_WAIT_NEQ
- *  - %DRM_XE_UFENCE_WAIT_GT
- *  - %DRM_XE_UFENCE_WAIT_GTE
- *  - %DRM_XE_UFENCE_WAIT_LT
- *  - %DRM_XE_UFENCE_WAIT_LTE
+ *  - %DRM_XE_UFENCE_WAIT_OP_EQ
+ *  - %DRM_XE_UFENCE_WAIT_OP_NEQ
+ *  - %DRM_XE_UFENCE_WAIT_OP_GT
+ *  - %DRM_XE_UFENCE_WAIT_OP_GTE
+ *  - %DRM_XE_UFENCE_WAIT_OP_LT
+ *  - %DRM_XE_UFENCE_WAIT_OP_LTE
  *
  * The wait @flags can be:
  *  - %DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP
  *  - %DRM_XE_UFENCE_WAIT_FLAG_ABSTIME
  *
  * The wait @mask can be:
- *  - %DRM_XE_UFENCE_WAIT_U8
- *  - %DRM_XE_UFENCE_WAIT_U16
- *  - %DRM_XE_UFENCE_WAIT_U32
- *  - %DRM_XE_UFENCE_WAIT_U64
+ *  - %DRM_XE_UFENCE_WAIT_MASK_U8
+ *  - %DRM_XE_UFENCE_WAIT_MASK_U16
+ *  - %DRM_XE_UFENCE_WAIT_MASK_U32
+ *  - %DRM_XE_UFENCE_WAIT_MASK_U64
  *
  */
 struct drm_xe_wait_user_fence {
@@ -1167,12 +1167,12 @@ struct drm_xe_wait_user_fence {
 	 */
 	__u64 addr;
 
-#define DRM_XE_UFENCE_WAIT_EQ	0
-#define DRM_XE_UFENCE_WAIT_NEQ	1
-#define DRM_XE_UFENCE_WAIT_GT	2
-#define DRM_XE_UFENCE_WAIT_GTE	3
-#define DRM_XE_UFENCE_WAIT_LT	4
-#define DRM_XE_UFENCE_WAIT_LTE	5
+#define DRM_XE_UFENCE_WAIT_OP_EQ	0x0
+#define DRM_XE_UFENCE_WAIT_OP_NEQ	0x1
+#define DRM_XE_UFENCE_WAIT_OP_GT	0x2
+#define DRM_XE_UFENCE_WAIT_OP_GTE	0x3
+#define DRM_XE_UFENCE_WAIT_OP_LT	0x4
+#define DRM_XE_UFENCE_WAIT_OP_LTE	0x5
 	/** @op: wait operation (type of comparison) */
 	__u16 op;
 
@@ -1187,12 +1187,13 @@ struct drm_xe_wait_user_fence {
 	/** @value: compare value */
 	__u64 value;
 
-#define DRM_XE_UFENCE_WAIT_U8		0xffu
-#define DRM_XE_UFENCE_WAIT_U16		0xffffu
-#define DRM_XE_UFENCE_WAIT_U32		0xffffffffu
-#define DRM_XE_UFENCE_WAIT_U64		0xffffffffffffffffu
+#define DRM_XE_UFENCE_WAIT_MASK_U8	0xffu
+#define DRM_XE_UFENCE_WAIT_MASK_U16	0xffffu
+#define DRM_XE_UFENCE_WAIT_MASK_U32	0xffffffffu
+#define DRM_XE_UFENCE_WAIT_MASK_U64	0xffffffffffffffffu
 	/** @mask: comparison mask */
 	__u64 mask;
+
 	/**
 	 * @timeout: how long to wait before bailing, value in nanoseconds.
 	 * Without DRM_XE_UFENCE_WAIT_FLAG_ABSTIME flag set (relative timeout)
-- 
2.34.1

