Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4667BC83003
	for <intel-xe@archiver.kernel.org>; Mon,  1 May 2023 07:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E802810E3CF;
	Mon,  1 May 2023 07:51:17 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00A910E315
 for <intel-xe@lists.freedesktop.org>; Mon,  1 May 2023 07:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682927472; x=1714463472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6ipsv3lMIuRzFuJUNqxbLtgZh/ClW1ChTRBkjsZRGy4=;
 b=IFQh/iOdjtEV8ayO964Yq3qXRyYERLywcWvzVYN/CVCGwvphN6BolP/8
 giDmQP/AyFzcUZSxGXxSrZawpaxCJ665XFW8IfRvSxwa2FmoOE9SKMEfr
 olMlKp9lsS7jMahmyK28tkoP6yXk+EynKjPmv3FaMLPxieC+7GiNzsmuw
 iYikUfJp4pyTrfFZFw7Yz04gvZy2a27C5Z3yOgC2vlbsVNTk2jlluNbeG
 MlETxPfhy0wNRXFOqZ8UhoLGEAjHmgICseFPCvK7GG8y7oIolsHafH63i
 Nk5UFFZX2ai/sD5uJ3/sZF2l8Jb9WLNvXwvhjckwCx8fQ9D9I1oIQjwj7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="346910713"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="346910713"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 00:51:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="870095212"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="870095212"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 00:51:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  1 May 2023 00:50:54 -0700
Message-Id: <20230501075114.3108352-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230501075114.3108352-1-matthew.brost@intel.com>
References: <20230501075114.3108352-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 10/30] drm/xe/guc: Return the lower part of
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

