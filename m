Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0658CC7EE29
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 18:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB13E10E0C8;
	Thu,  8 Jun 2023 18:28:32 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2923710E0C8
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 18:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686248911; x=1717784911;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8+mb39vfDTtS8KePQ8HsbaGhiY0jUCdUapQgn06gcv4=;
 b=FpD1DDas/4peqvZ7nBQWGHXLi39Fcp9ikRJtjgqMU0cymDq1iXzIofoI
 4FiIuaLaUeN6G6pn5Nnj01Ot9cpVTYXlS9WHMlVExORo5z3PotYH5JcI5
 zJ3gdf4JV3QREDZaW4zDFFVuSlEmih4+kiOna2/RcRXqTPnqNYA0GuTNa
 x4GvfB1Q21T5QQcmGClrKaJHr35C8QUkz0eGG1CvJOfMslx1QOuwAtj+A
 0bzyt7iy7kfjSmEFylWIV8TuYuEq4PYTkhsEb93yw7BadbkqB9QCrYs9u
 wDOwDwMoar7wce2lNXEtXXdEvDbcprOsbpFQVHNHU64KaHYLH3O0rNfHN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="423271873"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="423271873"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 11:28:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="834306317"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="834306317"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 11:28:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu,  8 Jun 2023 11:28:38 -0700
Message-Id: <20230608182838.46857-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/guc: Read HXG fields from DW1 of G2H
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The HXG fields are DW1 not DW0, fix this.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 137c184df487..615cc4d4ad69 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -790,13 +790,13 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
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

