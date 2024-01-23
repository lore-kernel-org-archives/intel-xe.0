Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D47C47E49
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 21:22:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F35F10E06A;
	Tue, 23 Jan 2024 21:22:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B276010E06A
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 21:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706044966; x=1737580966;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ptF9WNNhj1TkuKEAQO8Jo56PVnLW7fR6WTzuVY+vA6w=;
 b=oBZHpsT9TzMMyfTwI7+/RtFWS/QUUoBLScOuLqMvWWWlTB9gJK5djEgD
 DzIQWtpLLrRTIaaquEjc97S17wwZKeVya4VfMYeObzR9tmtPB+aF/+Iv+
 1R62LNstMvfeuecmDwN+S8eLB/IpDFkwl7XGJI0mD24qU8DsjOXsn7dwb
 4bsRYNpvXO5hkh3xiVa/2XqeWZ24SQ9lXrBKZwIFv5++Tpz2Y5TfuFDOB
 D+K6Sqc4D69cDfS5t8Wh/+fEduLxYEylu+etfpb6/KMgtedfSwhHWbzD8
 5g4inhMJeBaeKpkLClapQxgy9ka81nmd7w6+7Rrl92+Cb2yZtwr2wFQk6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="392071645"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="392071645"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 13:22:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1719323"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 13:22:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v2] drm/xe: Prefer BIT/GENMASK macros over shifts
Date: Tue, 23 Jan 2024 13:23:17 -0800
Message-Id: <20240123212317.1600836-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Using BIT/GENMASK macros is a better convention than using manual shift
and will also fix build errors [1].

[1] http://kisskb.ellerman.id.au/kisskb/buildresult/15112475/log/

v2:
- Include abi/*.h files (Jani / Michal)

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h      | 13 ++++----
 drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  4 +--
 .../drm/xe/abi/guc_communication_ctb_abi.h    | 14 ++++-----
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  6 ++--
 drivers/gpu/drm/xe/abi/guc_messages_abi.h     | 31 +++++++++----------
 drivers/gpu/drm/xe/xe_guc_ct.c                |  2 +-
 drivers/gpu/drm/xe/xe_guc_relay.c             |  2 +-
 7 files changed, 35 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index 3062e0e0d467..083bd966829b 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -50,8 +50,8 @@
 
 #define HOST2GUC_SELF_CFG_REQUEST_MSG_LEN		(GUC_HXG_REQUEST_MSG_MIN_LEN + 3u)
 #define HOST2GUC_SELF_CFG_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
-#define HOST2GUC_SELF_CFG_REQUEST_MSG_1_KLV_KEY		(0xffff << 16)
-#define HOST2GUC_SELF_CFG_REQUEST_MSG_1_KLV_LEN		(0xffff << 0)
+#define HOST2GUC_SELF_CFG_REQUEST_MSG_1_KLV_KEY		GENMASK(31, 16)
+#define HOST2GUC_SELF_CFG_REQUEST_MSG_1_KLV_LEN		GENMASK(15, 0)
 #define HOST2GUC_SELF_CFG_REQUEST_MSG_2_VALUE32		GUC_HXG_REQUEST_MSG_n_DATAn
 #define HOST2GUC_SELF_CFG_REQUEST_MSG_3_VALUE64		GUC_HXG_REQUEST_MSG_n_DATAn
 
@@ -177,15 +177,14 @@ enum xe_guc_sleep_state_status {
 #define XE_GUC_SLEEP_STATE_INVALID_MASK 0x80000000
 };
 
-#define GUC_LOG_CONTROL_LOGGING_ENABLED	(1 << 0)
-#define GUC_LOG_CONTROL_VERBOSITY_SHIFT	4
-#define GUC_LOG_CONTROL_VERBOSITY_MASK	(0xF << GUC_LOG_CONTROL_VERBOSITY_SHIFT)
-#define GUC_LOG_CONTROL_DEFAULT_LOGGING	(1 << 8)
+#define GUC_LOG_CONTROL_LOGGING_ENABLED	BIT(0)
+#define GUC_LOG_CONTROL_VERBOSITY_MASK	GENMASK(7, 4)
+#define GUC_LOG_CONTROL_DEFAULT_LOGGING	BIT(8)
 
 #define XE_GUC_TLB_INVAL_TYPE_SHIFT 0
 #define XE_GUC_TLB_INVAL_MODE_SHIFT 8
 /* Flush PPC or SMRO caches along with TLB invalidation request */
-#define XE_GUC_TLB_INVAL_FLUSH_CACHE (1 << 31)
+#define XE_GUC_TLB_INVAL_FLUSH_CACHE BIT(31)
 
 enum xe_guc_tlb_invalidation_type {
 	XE_GUC_TLB_INVAL_FULL = 0x0,
diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
index 811add10c30d..ff49f283f5c3 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
@@ -242,8 +242,8 @@ struct slpc_shared_data {
 		(HOST2GUC_PC_SLPC_REQUEST_REQUEST_MSG_MIN_LEN + \
 			HOST2GUC_PC_SLPC_EVENT_MAX_INPUT_ARGS)
 #define HOST2GUC_PC_SLPC_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
-#define HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ID		(0xff << 8)
-#define HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC	(0xff << 0)
+#define HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ID		GENMASK(15, 8)
+#define HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC	GENMASK(7, 0)
 #define HOST2GUC_PC_SLPC_REQUEST_MSG_N_EVENT_DATA_N	GUC_HXG_REQUEST_MSG_n_DATAn
 
 #endif
diff --git a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
index 4aaed1cb4e12..d7e4dd92c313 100644
--- a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
@@ -49,9 +49,9 @@ struct guc_ct_buffer_desc {
 	u32 tail;
 	u32 status;
 #define GUC_CTB_STATUS_NO_ERROR				0
-#define GUC_CTB_STATUS_OVERFLOW				(1 << 0)
-#define GUC_CTB_STATUS_UNDERFLOW			(1 << 1)
-#define GUC_CTB_STATUS_MISMATCH				(1 << 2)
+#define GUC_CTB_STATUS_OVERFLOW				BIT(0)
+#define GUC_CTB_STATUS_UNDERFLOW			BIT(1)
+#define GUC_CTB_STATUS_MISMATCH				BIT(2)
 	u32 reserved[13];
 } __packed;
 static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
@@ -82,11 +82,11 @@ static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
 #define GUC_CTB_HDR_LEN				1u
 #define GUC_CTB_MSG_MIN_LEN			GUC_CTB_HDR_LEN
 #define GUC_CTB_MSG_MAX_LEN			(GUC_CTB_MSG_MIN_LEN + GUC_CTB_MAX_DWORDS)
-#define GUC_CTB_MSG_0_FENCE			(0xffff << 16)
-#define GUC_CTB_MSG_0_FORMAT			(0xf << 12)
+#define GUC_CTB_MSG_0_FENCE			GENMASK(31, 16)
+#define GUC_CTB_MSG_0_FORMAT			GENMASK(15, 12)
 #define   GUC_CTB_FORMAT_HXG			0u
-#define GUC_CTB_MSG_0_RESERVED			(0xf << 8)
-#define GUC_CTB_MSG_0_NUM_DWORDS		(0xff << 0)
+#define GUC_CTB_MSG_0_RESERVED			GENMASK(11, 8)
+#define GUC_CTB_MSG_0_NUM_DWORDS		GENMASK(7, 0)
 #define   GUC_CTB_MAX_DWORDS			255
 
 /**
diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 47094b9b044c..076d072cb8b3 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -31,9 +31,9 @@
  */
 
 #define GUC_KLV_LEN_MIN				1u
-#define GUC_KLV_0_KEY				(0xffff << 16)
-#define GUC_KLV_0_LEN				(0xffff << 0)
-#define GUC_KLV_n_VALUE				(0xffffffff << 0)
+#define GUC_KLV_0_KEY				GENMASK(31, 16)
+#define GUC_KLV_0_LEN				GENMASK(15, 0)
+#define GUC_KLV_n_VALUE				GENMASK(31, 0)
 
 /**
  * DOC: GuC Self Config KLVs
diff --git a/drivers/gpu/drm/xe/abi/guc_messages_abi.h b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
index ff888d16bd4f..7cc79c0ce3bb 100644
--- a/drivers/gpu/drm/xe/abi/guc_messages_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
@@ -6,6 +6,8 @@
 #ifndef _ABI_GUC_MESSAGES_ABI_H
 #define _ABI_GUC_MESSAGES_ABI_H
 
+#include <linux/bits.h>
+
 /**
  * DOC: HXG Message
  *
@@ -41,10 +43,10 @@
  */
 
 #define GUC_HXG_MSG_MIN_LEN			1u
-#define GUC_HXG_MSG_0_ORIGIN			(0x1 << 31)
+#define GUC_HXG_MSG_0_ORIGIN			BIT(31)
 #define   GUC_HXG_ORIGIN_HOST			0u
 #define   GUC_HXG_ORIGIN_GUC			1u
-#define GUC_HXG_MSG_0_TYPE			(0x7 << 28)
+#define GUC_HXG_MSG_0_TYPE			GENMASK(30, 28)
 #define   GUC_HXG_TYPE_REQUEST			0u
 #define   GUC_HXG_TYPE_EVENT			1u
 #define   GUC_HXG_TYPE_FAST_REQUEST		2u
@@ -52,8 +54,8 @@
 #define   GUC_HXG_TYPE_NO_RESPONSE_RETRY	5u
 #define   GUC_HXG_TYPE_RESPONSE_FAILURE		6u
 #define   GUC_HXG_TYPE_RESPONSE_SUCCESS		7u
-#define GUC_HXG_MSG_0_AUX			(0xfffffff << 0)
-#define GUC_HXG_MSG_n_PAYLOAD			(0xffffffff << 0)
+#define GUC_HXG_MSG_0_AUX			GENMASK(27, 0)
+#define GUC_HXG_MSG_n_PAYLOAD			GENMASK(31, 0)
 
 /**
  * DOC: HXG Request
@@ -87,8 +89,8 @@
  */
 
 #define GUC_HXG_REQUEST_MSG_MIN_LEN		GUC_HXG_MSG_MIN_LEN
-#define GUC_HXG_REQUEST_MSG_0_DATA0		(0xfff << 16)
-#define GUC_HXG_REQUEST_MSG_0_ACTION		(0xffff << 0)
+#define GUC_HXG_REQUEST_MSG_0_DATA0		GENMASK(27, 16)
+#define GUC_HXG_REQUEST_MSG_0_ACTION		GENMASK(15, 0)
 #define GUC_HXG_REQUEST_MSG_n_DATAn		GUC_HXG_MSG_n_PAYLOAD
 
 /**
@@ -119,8 +121,8 @@
  */
 
 #define GUC_HXG_EVENT_MSG_MIN_LEN		GUC_HXG_MSG_MIN_LEN
-#define GUC_HXG_EVENT_MSG_0_DATA0		(0xfff << 16)
-#define GUC_HXG_EVENT_MSG_0_ACTION		(0xffff << 0)
+#define GUC_HXG_EVENT_MSG_0_DATA0		GENMASK(27, 16)
+#define GUC_HXG_EVENT_MSG_0_ACTION		GENMASK(15, 0)
 #define GUC_HXG_EVENT_MSG_n_DATAn		GUC_HXG_MSG_n_PAYLOAD
 
 /**
@@ -190,8 +192,8 @@
  */
 
 #define GUC_HXG_FAILURE_MSG_LEN			GUC_HXG_MSG_MIN_LEN
-#define GUC_HXG_FAILURE_MSG_0_HINT		(0xfff << 16)
-#define GUC_HXG_FAILURE_MSG_0_ERROR		(0xffff << 0)
+#define GUC_HXG_FAILURE_MSG_0_HINT		GENMASK(27, 16)
+#define GUC_HXG_FAILURE_MSG_0_ERROR		GENMASK(15, 0)
 
 /**
  * DOC: HXG Response
@@ -221,12 +223,9 @@
 #define GUC_HXG_RESPONSE_MSG_n_DATAn		GUC_HXG_MSG_n_PAYLOAD
 
 /* deprecated */
-#define INTEL_GUC_MSG_TYPE_SHIFT	28
-#define INTEL_GUC_MSG_TYPE_MASK		(0xF << INTEL_GUC_MSG_TYPE_SHIFT)
-#define INTEL_GUC_MSG_DATA_SHIFT	16
-#define INTEL_GUC_MSG_DATA_MASK		(0xFFF << INTEL_GUC_MSG_DATA_SHIFT)
-#define INTEL_GUC_MSG_CODE_SHIFT	0
-#define INTEL_GUC_MSG_CODE_MASK		(0xFFFF << INTEL_GUC_MSG_CODE_SHIFT)
+#define INTEL_GUC_MSG_TYPE_MASK		GENMASK(31, 28)
+#define INTEL_GUC_MSG_DATA_MASK		GENMASK(27, 16)
+#define INTEL_GUC_MSG_CODE_MASK		GENMASK(15, 0)
 
 enum intel_guc_msg_type {
 	INTEL_GUC_MSG_TYPE_REQUEST = 0x0,
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index ee5d99456aeb..fc5cc2b2bcc5 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -866,7 +866,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	 */
 	if (fence & CT_SEQNO_UNTRACKED) {
 		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE)
-			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
+			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=0x%lx, h=%lu\n",
 				  fence,
 				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
 				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
index c0a2d8d5d3b3..2d1f19270d9a 100644
--- a/drivers/gpu/drm/xe/xe_guc_relay.c
+++ b/drivers/gpu/drm/xe/xe_guc_relay.c
@@ -300,7 +300,7 @@ static int relay_send_transaction(struct xe_guc_relay *relay, struct relay_trans
 		ret = -EPROTO;
 	}
 	if (unlikely(ret < 0)) {
-		relay_notice(relay, "Failed to send %s.%x to GuC (%pe) %*ph ...\n",
+		relay_notice(relay, "Failed to send %s.%lx to GuC (%pe) %*ph ...\n",
 			     guc_hxg_type_to_string(FIELD_GET(GUC_HXG_MSG_0_TYPE, buf[0])),
 			     FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, buf[0]),
 			     ERR_PTR(ret), (int)sizeof(u32) * txn->offset, buf);
-- 
2.34.1

