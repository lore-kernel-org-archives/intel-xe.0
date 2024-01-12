Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4C2C4706C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 10:26:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE7C10E115;
	Fri, 12 Jan 2024 10:26:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8ED610E10D
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 10:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705055169; x=1736591169;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AZsX/kKTZbRMOtIK2A3//rDRd8gyBASSujj0wLH3BMA=;
 b=b+gjbLoK6yoWEmtH8+6F3vNGcuiMOUhis+4IHFgP0NIVYX4rH1q45PdX
 a+qfHuUDR49L3o/KbqsJ0nkR/p7qe6xd20DisqCnUomczVqnawGe+eRpb
 Pblg243X6llyoGbOKM74WejrABjq3ynYsDIHhun8d1M15SyoqTEDHkzKV
 wczNvqXwjomv+wrxH4sOJuipyhODv403+s5oVx2eIVwJFH9eAo6ZZYbzQ
 VJuzCB9W8t+WBeZgR1rAg03a04tzMKQsIoytGhUc6eJh+RCfZcaLqcfaU
 Wi4eMlgG5aVPT39ugH0FiHexeLVTwVCAKBbtgw5yW8yPp1CzrYso6ShQh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="485313883"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="485313883"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 02:26:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="24667211"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.135.224])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 02:26:08 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe/guc: Return CTB HXG response DATA0 if no buffer
 provided
Date: Fri, 12 Jan 2024 11:25:53 +0100
Message-Id: <20240112102554.761-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Most of the synchronous GuC HXG action responses are defined in
such a way that only mandatory DATA0 from the HXG header is used
and only in few cases it is more than MBZ (must be zero).

For those cases where HXG action returns just DATA0, return that
value if caller didn't provide buffer for the full response.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index b2cc3f993eb6..4ae1a0cd9537 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -33,6 +33,7 @@
 struct g2h_fence {
 	u32 *response_buffer;
 	u32 seqno;
+	u32 response_data;
 	u16 response_len;
 	u16 error;
 	u16 hint;
@@ -45,6 +46,7 @@ struct g2h_fence {
 static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
 {
 	g2h_fence->response_buffer = response_buffer;
+	g2h_fence->response_data = 0;
 	g2h_fence->response_len = 0;
 	g2h_fence->fail = false;
 	g2h_fence->retry = false;
@@ -780,7 +782,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		ret = -EIO;
 	}
 
-	return ret > 0 ? response_buffer ? g2h_fence.response_len : 0 : ret;
+	return ret > 0 ? response_buffer ? g2h_fence.response_len : g2h_fence.response_data : ret;
 }
 
 int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
@@ -877,6 +879,8 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	} else if (g2h_fence->response_buffer) {
 		g2h_fence->response_len = hxg_len;
 		memcpy(g2h_fence->response_buffer, hxg, hxg_len * sizeof(u32));
+	} else {
+		g2h_fence->response_data = FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, hxg[0]);
 	}
 
 	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);

base-commit: 10923212b018be3edb1c21b75f432c6cf3f50c6b
-- 
2.25.1

