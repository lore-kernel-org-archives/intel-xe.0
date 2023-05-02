Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728A6C7EE29
	for <intel-xe@archiver.kernel.org>; Tue,  2 May 2023 00:17:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D7510E402;
	Tue,  2 May 2023 00:17:31 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C10C10E400
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 00:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682986649; x=1714522649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6ipsv3lMIuRzFuJUNqxbLtgZh/ClW1ChTRBkjsZRGy4=;
 b=CODjnn/sHziQSglgi+53sIWLLTDZw+iJdpYiq8xTmCx6RAy134icUwKP
 oi+WwFCEtW4sxIrruTT/1VRbcpQerNaS8NP6KPIjKcJanISVPAgapSgW1
 sReR6lqucP/75Xti4NSk6b3Xw+8G/YkfwomDBp+qri34naouGRxAl/G8x
 mFhpCdvAa0Ba+LLemQpd+2STK6uVt+/tqQog8IvcVPcsNp0qPCna/tsFf
 7CrPfwPHvZycU9c5IwiCKo4BFip40s2RReuJVPuOF0dJnALGUuSECBHZi
 aO6D3ugj2fPAQzJpwCyqwPnhPXLDZx39Wl2gpqjpjGYtv59Y+T7Jk46zV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="332619571"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="332619571"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 17:17:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="765541691"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="765541691"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 17:17:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  1 May 2023 17:17:06 -0700
Message-Id: <20230502001727.3211096-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502001727.3211096-1-matthew.brost@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 10/31] drm/xe/guc: Return the lower part of
 blocking H2G message
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

The upper layers may need this data, an example of this is allocating
DIST doorbell.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 6 +++++-
 drivers/gpu/drm/xe/xe_guc_pc.c | 6 ++++--
 drivers/gpu/drm/xe/xe_huc.c    | 2 +-
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 6abf1dee95af..60b69fcfac9f 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -25,6 +25,7 @@
 struct g2h_fence {
 	u32 *response_buffer;
 	u32 seqno;
+	u32 status;
 	u16 response_len;
 	u16 error;
 	u16 hint;
@@ -727,7 +728,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		ret = -EIO;
 	}
 
-	return ret > 0 ? 0 : ret;
+	return ret > 0 ? g2h_fence.status : ret;
 }
 
 int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
@@ -793,6 +794,9 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		g2h_fence->response_len = response_len;
 		memcpy(g2h_fence->response_buffer, msg + GUC_CTB_MSG_MIN_LEN,
 		       response_len * sizeof(u32));
+	} else {
+		g2h_fence->status =
+			FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, msg[1]);
 	}
 
 	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 72d460d5323b..3d2ea723a4a7 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -204,11 +204,13 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
 
 	/* Blocking here to ensure the results are ready before reading them */
 	ret = xe_guc_ct_send_block(ct, action, ARRAY_SIZE(action));
-	if (ret)
+	if (ret < 0) {
 		drm_err(&pc_to_xe(pc)->drm,
 			"GuC PC query task state failed: %pe", ERR_PTR(ret));
+		return ret;
+	}
 
-	return ret;
+	return 0;
 }
 
 static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 55dcaab34ea4..9c48c3075410 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -39,7 +39,7 @@ int xe_huc_init(struct xe_huc *huc)
 
 	huc->fw.type = XE_UC_FW_TYPE_HUC;
 	ret = xe_uc_fw_init(&huc->fw);
-	if (ret)
+	if (ret < 0)
 		goto out;
 
 	xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_LOADABLE);
-- 
2.34.1

