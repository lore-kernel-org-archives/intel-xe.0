Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF156C47DDB
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 19:01:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1782010E864;
	Tue, 23 Jan 2024 19:01:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E0310E864
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 19:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706036489; x=1737572489;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LkfS7uMu8VFr812RiIePDVvZutibHKVhQSodOPaY7JQ=;
 b=Cw10WreqK+jRqbMyy62qYwsnE+T0c9qibMouM2Cg7Muc9NhmAQ9qW/LS
 4o090rmKyiC8VxyzIxOnLqSJDwzt6tbLBy2Tjn05k37I+oCzvpr9fNQDM
 LMwTjVo+YDxVP/bG9hFrjctD12zZNyyNvuCjSxmEf2/DriGT8TzJDY6LL
 v76srvwh+ToLF8HbvVl+ubUzHg9+HBY88Ziohf/dPybS4dOaHiE3a/Wc0
 8DFGp/ZPw6AgBGOBM17+QbBesa4pF1V1NCfwyNdTK+NPuxyo1Ah2qk4pA
 voFcmoUf0r65y6SlMWkDqIDEhFwcWpVhfLefMRlbmv5oDjDBe9wEz8BvB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="400491259"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="400491259"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:01:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1714439"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:01:28 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH] drm/xe: Prefer BIT/GENMASK macros over shifts
Date: Tue, 23 Jan 2024 11:02:01 -0800
Message-Id: <20240123190201.1599333-1-matthew.brost@intel.com>
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

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c    | 2 +-
 drivers/gpu/drm/xe/xe_guc_relay.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

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

