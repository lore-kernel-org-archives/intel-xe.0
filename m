Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E703CC7EE45
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 20:09:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AFE10E614;
	Thu,  8 Jun 2023 20:09:03 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416CC10E610
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 20:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686254941; x=1717790941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pt6wlIJwijnEeGmyOgrnSp4Fk26ctFLcG/FPILSTeKc=;
 b=Ve7mGXh0a//cittBUfev8iPS378lqe2W/rR8bR3/rReNVyrVQRxWyDRF
 DPWTogHF/7y+z0OOiCiWXDyuOkz0TuCm1sPkxDZzIEv4a/z8xv9ch6pzi
 F7qeMXGMExEQHhduaIztUXP/kg26V3LYWUvoV0T7//EpbJYGaTB8ZdRZO
 hgPXBQoe9r6hFGoaK5D+nWkLYG4lKknoL9QZbYT8ISarKm5ZC9+uWWwPQ
 D2yANFnTDQsWvQnbJ/eqZdkc+2IvQnGwIsxxTmT2/S3lgVjawThUP6ncY
 VJbbbBH88cATzduqh01mSCxaZb5Za8g8UGOylC4bz3tgXwa3czDSU6eUZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="357427592"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="357427592"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 13:09:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="739888051"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="739888051"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 13:08:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu,  8 Jun 2023 13:08:55 -0700
Message-Id: <20230608200857.124884-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230608200857.124884-1-matthew.brost@intel.com>
References: <20230608200857.124884-1-matthew.brost@intel.com>
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

v2 (Michal): Drop change of checking the return value.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 615cc4d4ad69..7502e32c4ef6 100644
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
@@ -735,7 +736,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		ret = -EIO;
 	}
 
-	return ret > 0 ? 0 : ret;
+	return ret > 0 ? g2h_fence.status : ret;
 }
 
 int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
@@ -801,6 +802,9 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
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

