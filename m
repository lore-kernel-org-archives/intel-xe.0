Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0C0C7EE29
	for <intel-xe@archiver.kernel.org>; Mon,  1 May 2023 07:51:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9143410E30E;
	Mon,  1 May 2023 07:51:15 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B8D10E303
 for <intel-xe@lists.freedesktop.org>; Mon,  1 May 2023 07:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682927472; x=1714463472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FyObaN2WWyVSiSzYYWkuIi16VR/wQ5+sz9sOn5jcGQo=;
 b=BLd8ykozFUoXxrgNK+1VUsP+Ua3KdMG0rRqSFch/t4WichUKtBJMOgAH
 FH/YJdD/Yl+IWlXN1qmnE8lky+Iam/oV6C3CII2D/YDMfVu9hHaJ6RK5T
 tXyW4U/SQs5fTAoEY0YnIP2Pu3W00qBEmxscdMh894ZaUnDMJ3/AcQ+xQ
 6ASYvimuPFq1ofpevKKZySevg/ShQuufl03Uxo0wWhYnANU+1Z/gwZrzq
 bEE0qtiFDCYlt6lg55hmOnO43LgfRzsu8D3JxZOU6RtB/SajCyMnd+WqL
 jT0Y3+iGvP8JmQdLEMP7DNBeMMP/uHICU8X+AqmP0siquvpqeiPi1OIV2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="346910712"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="346910712"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 00:51:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="870095209"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="870095209"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 00:51:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  1 May 2023 00:50:53 -0700
Message-Id: <20230501075114.3108352-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230501075114.3108352-1-matthew.brost@intel.com>
References: <20230501075114.3108352-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 09/30] drm/xe/guc: Read HXG fields from DW1 of
 G2H response
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
index 9055ff133a7c..6abf1dee95af 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -782,13 +782,13 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
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

