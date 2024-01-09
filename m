Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818EFC47077
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 23:00:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BFC10E543;
	Tue,  9 Jan 2024 23:00:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D1D10E53F
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 23:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704841241; x=1736377241;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1ZdycXLooqMHDJzh6QU5hcwmFmzHsSxw1vKa9Ct85Ro=;
 b=nuaib/1Ub+OzI4d1SZLAmmDcYfM59ztiMUH2hZnZOedjxOGtw1Sn8xWX
 kvV6Ma/c/XN90t4G7Z2cTy4f3yMay1m1wDssyJH42iAwXAIpwIkepc37L
 dX5eyWBVefRf2XW9yhvq4n4TywMGNBXozaO5q3A4EoGGMZX5tRnGn7znK
 XvvEVixJFSNsom2HYPUbo/9k8WsQxSlF1YBBLfWJYfPoI3HSPvMhl9gKT
 /bmpIbkLqGZGXbHAggQ6zFJh5CJY61rBXZ4yU/bbAcqqrAE9JP5BossWX
 XaiM15NRTHHaq7uQ8ZDiAAx8kLQOhnvw08+cMtsXOD6qQ2HFdSIztXHOP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="402133725"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="402133725"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 15:00:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="775017400"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="775017400"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.150.124])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 15:00:39 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe/guc: Use proper definitions while processing G2H
 events
Date: Wed, 10 Jan 2024 00:00:14 +0100
Message-Id: <20240109230015.365-1-michal.wajdeczko@intel.com>
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

While dispatching G2H events we should use HXG EVENT definitions,
no need to rely on outer CTB layer definitions that forced us to
use shifted offsets:

	FIELD_GET(GUC_HXG_MSG_0_xxx, msg[1])
vs
	FIELD_GET(GUC_HXG_MSG_0_xxx, hxg[0])

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index c29f095aa1b9..9d1d855da229 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -923,18 +923,21 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	return ret;
 }
 
-static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
+static int process_g2h_msg(struct xe_guc_ct *ct, u32 *hxg, u32 len)
 {
 	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_guc *guc = ct_to_guc(ct);
-	u32 action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1]);
-	u32 *payload = msg + GUC_CTB_HXG_MSG_MIN_LEN;
-	u32 adj_len = len - GUC_CTB_HXG_MSG_MIN_LEN;
+	u32 action, adj_len;
+	u32 *payload;
 	int ret = 0;
 
-	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[1]) != GUC_HXG_TYPE_EVENT)
+	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]) != GUC_HXG_TYPE_EVENT)
 		return 0;
 
+	action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, hxg[0]);
+	payload = hxg + GUC_HXG_EVENT_MSG_MIN_LEN;
+	adj_len = len - GUC_HXG_EVENT_MSG_MIN_LEN;
+
 	switch (action) {
 	case XE_GUC_ACTION_SCHED_CONTEXT_MODE_DONE:
 		ret = xe_guc_sched_done_handler(guc, payload, adj_len);
@@ -1145,7 +1148,7 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
 	if (unlikely(ret < 0))
 		return ret;
 
-	ret = process_g2h_msg(ct, ct->msg, len);
+	ret = process_g2h_msg(ct, ct->msg + GUC_CTB_MSG_MIN_LEN, len - GUC_CTB_MSG_MIN_LEN);
 	if (unlikely(ret < 0))
 		return ret;
 

base-commit: 39df1f6b1259816cc42b5f2451ca5092fad340ce
-- 
2.25.1

