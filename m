Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB732C04A95
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:36:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4272110EA04;
	Fri,  3 Nov 2023 14:36:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC71F10EA01
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022158; x=1730558158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KhBqbzrvg9V0HMi78CCFTw8oM+rOVsBwMTj9Q4fwmss=;
 b=DvdzCHy3pm8+pBVIZpeAzPR2UgMwkX7/ihNbOaZohZThp6Q1HIw8ZPht
 lYE3M9WVWSa9ijZPPzczUr0WQLddSb21vysp191LpQqTBl3N9ZnQVt+dG
 pAbxCtADmoYbJi95K0OIhXWU9n/9Vh23QbD7cbCn2fqi7U16etW5DLbn+
 gohdXwSx1AFJfThemIjgx7ggztX337/UOLFQ9R7M2bxSlcpa0Y6NUP1gW
 TkzHVklX0opbETG31eWMBx83Dda+OO0KVNwzyeGU+hiAGcyiv7c0jZM2d
 uOiWRd3wHR+8Yn03fwtl6lJi0t/1INdjqajxX5+/uKpjmTVr1Ud8eOrLL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843468"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843468"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832512"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832512"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:46 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:37 +0000
Message-Id: <20231103143456.7-32-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 31/50] drm/xe/uapi: Differentiate WAIT_OP from
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
index 7d854c368336..659cc0a71f8c 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1137,22 +1137,22 @@ struct drm_xe_exec_queue_get_property {
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
@@ -1164,12 +1164,12 @@ struct drm_xe_wait_user_fence {
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
 
@@ -1184,12 +1184,13 @@ struct drm_xe_wait_user_fence {
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

