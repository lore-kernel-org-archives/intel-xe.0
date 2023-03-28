Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC414C6FD18
	for <intel-xe@archiver.kernel.org>; Tue, 28 Mar 2023 21:09:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AAE10E4AE;
	Tue, 28 Mar 2023 21:09:18 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F1C10E4AE
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Mar 2023 21:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680037757; x=1711573757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3NpX2z/1a0Nt4clHyuqJZFpEx9xsRs+abvY1WfIu9Is=;
 b=bCfQAfXqMY2X5TKEqnGkGZYHwCY923eB85H6i5ZSIM3Ix8Z8qMB6jden
 iim/ko6OZ3xafD0/YGaXeTlEuBhmx7NUB6VynVHKp70T7Om8XDyZc/452
 r5OJOaeWjoACIRpYlYd8rlHqbRwgQSTTqhp9o5Eb7RjNVvIisUvMNXQEq
 Pm3kv+Mc7s39QIGzRb49ugqCXBDr+m0IL5jqFf+L0XvpoCoyJDJ1ldHNt
 TEzytGKBPyPJgFcJ5d+FI2p37NK1/QYYFLTqzwhCheLUQG7gp4dg+EPF6
 0Yxb0jdYelId1+qdAQeS1cu2iKrMu1kZPmiAvLfCupXL92QfrmG8ZRZzz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="320346722"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="320346722"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 14:09:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="716607497"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="716607497"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 14:09:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 28 Mar 2023 14:09:17 -0700
Message-Id: <20230328210920.2110910-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328210920.2110910-1-matthew.brost@intel.com>
References: <20230328210920.2110910-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/4] drm/xe/guc: Read HXG fields from DW1 of G2H
 response
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

The HXG fields are DW1 not DW0, fix this.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 5e00b75d3ca2..e5ed9022a0a2 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -783,13 +783,13 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	if (type == GUC_HXG_TYPE_RESPONSE_FAILURE) {
 		g2h_fence->fail = true;
 		g2h_fence->error =
-			FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[0]);
+			FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[1]);
 		g2h_fence->hint =
-			FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[0]);
+			FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[1]);
 	} else if (type == GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
 		g2h_fence->retry = true;
 		g2h_fence->reason =
-			FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, msg[0]);
+			FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, msg[1]);
 	} else if (g2h_fence->response_buffer) {
 		g2h_fence->response_len = response_len;
 		memcpy(g2h_fence->response_buffer, msg + GUC_CTB_MSG_MIN_LEN,
-- 
2.34.1

