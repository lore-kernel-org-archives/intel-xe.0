Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E253BC00A8F
	for <intel-xe@archiver.kernel.org>; Mon, 23 Oct 2023 22:11:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09A510E059;
	Mon, 23 Oct 2023 22:11:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D77C10E059
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Oct 2023 22:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698099067; x=1729635067;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GaJj4Q//3RsH4D7rS9hQzAxqfEPY1STsheuN0uz6u8o=;
 b=hHBHnq2jZfyaVtBgh3xiP5FqCECd5lPGoWbbLVYgiymp2nup7mrPWC4o
 T4UkOXnSG0SVsU8dxX3t/2+nOys1VDCZA505wMK9dGYjSwDzis5gcHZix
 dZIQByABNeAM6Im/ESalbcx/BpWJNoO/9eT6X73B+NAtYrfvUzDyWJAGO
 eYs+Z3+ZJeJ1b3UsqTTsOQuiVeaoPqmpH9//1WuzM1qN6G7tn0m/TtmrR
 gZl6Vtts/MaBdBGnv86W4QCysgAjDKK1YzxkNNq+OcUaho8ZVaeJMFbOp
 ehh44/7glCNGQYm859P2Xzdi8/9Os3V3CGOgPympxW0La9pUgoTD9H3nh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="366282245"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; d="scan'208";a="366282245"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 15:11:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="874840196"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; d="scan'208";a="874840196"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 15:11:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 23 Oct 2023 15:11:22 -0700
Message-Id: <20231023221122.1025441-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/guc: Return the lower part of blocking
 H2G message
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

v2 (Michal): Drop change of checking the return value.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 8b686c8b3339..092a9563f80a 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -26,6 +26,7 @@
 struct g2h_fence {
 	u32 *response_buffer;
 	u32 seqno;
+	u32 status;
 	u16 response_len;
 	u16 error;
 	u16 hint;
@@ -749,7 +750,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		ret = -EIO;
 	}
 
-	return ret > 0 ? 0 : ret;
+	return ret > 0 ? g2h_fence.status : ret;
 }
 
 int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
@@ -815,6 +816,9 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		g2h_fence->response_len = response_len;
 		memcpy(g2h_fence->response_buffer, msg + GUC_CTB_MSG_MIN_LEN,
 		       response_len * sizeof(u32));
+	} else {
+		g2h_fence->status =
+			FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, msg[1]);
 	}
 
 	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
-- 
2.34.1

