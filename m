Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19A9C76196
	for <intel-xe@archiver.kernel.org>; Tue, 28 Mar 2023 21:09:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C868B10E4AA;
	Tue, 28 Mar 2023 21:09:17 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449F210E98E
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Mar 2023 21:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680037757; x=1711573757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9cWqn/rThRgExKoAu6nDDfkEkvjh97Uzc/b8mK4WYs4=;
 b=BkGTfj2mI+MRB+XAj0K2RamGCFGiV2M6GfuTS2eetzh0EcJ0yoqzqrYd
 cI02b5qbCciUtqiTR+J6vKHKbbECFch03n+bWAXq1e8IfwkM0FS7juIQx
 mdvNEZviTa/ehrnC2ZQ6PN5LDsC5UlIhO47+N9fgx4U1jh5OJ3kldOdwO
 4elI6NHwYv+DzqlPT8p6ko5FgQOJXDjDCR7DjGIggSUqKFz4fHk2DadHT
 Xk7cU/wHY1v5r+HcX80patgrBoRcooLKxmj5sqAbBDnwBkTv2HEfhLg5V
 GltVY+L4qZPFYNnLiHBSRS8YeuuEug9LrWkYEdsmYce3zEVxO3ITSuqBa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="320346723"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="320346723"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 14:09:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="716607500"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="716607500"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 14:09:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 28 Mar 2023 14:09:18 -0700
Message-Id: <20230328210920.2110910-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328210920.2110910-1-matthew.brost@intel.com>
References: <20230328210920.2110910-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/4] drm/xe/guc: Return the lower part of
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
index e5ed9022a0a2..54578a21da47 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -26,6 +26,7 @@ struct g2h_fence {
 	wait_queue_head_t wq;
 	u32 *response_buffer;
 	u32 seqno;
+	u32 status;
 	u16 response_len;
 	u16 error;
 	u16 hint;
@@ -728,7 +729,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		ret = -EIO;
 	}
 
-	return ret > 0 ? 0 : ret;
+	return ret > 0 ? g2h_fence.status : ret;
 }
 
 int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
@@ -794,6 +795,9 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		g2h_fence->response_len = response_len;
 		memcpy(g2h_fence->response_buffer, msg + GUC_CTB_MSG_MIN_LEN,
 		       response_len * sizeof(u32));
+	} else {
+		g2h_fence->status =
+			FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, msg[1]);
 	}
 
 	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 5a8d827ba770..df080588dd02 100644
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
index a9448c6f6418..2203d281853a 100644
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

