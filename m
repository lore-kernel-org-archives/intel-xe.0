Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837BDC7EE23
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 20:09:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B78110E616;
	Thu,  8 Jun 2023 20:09:06 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094E510E612
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 20:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686254941; x=1717790941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8+mb39vfDTtS8KePQ8HsbaGhiY0jUCdUapQgn06gcv4=;
 b=lMUWI8SxRV2cRNcBvtUJldKmSAuZX2/vWd+HdrsyPHTHZTCGRJEdeswU
 +DU/6+f0KR3qu0zAowZqK9YwCI3eIwzsIrYc6pjd4wFl5VE2YU7zFnj5J
 cA8OuNA6S3fKMuiuHhcL/EfrQvd2+m8NtuHv28/aC87m8CqII9FZJw3JW
 rok597QYFQwD59z/sO63Aj4ICSp696fIuQe07q8c06JTDHP4xAkdQG+BS
 4r6SuMuWLjjs41vE1IA6y5XKfbbZuPUL606Q/ryYpU6QALYBNkcRek6wX
 KpvmlimG1nFsZten4VVu9J0tQYKckj4n/A5L1WNoEhhdYBxZzA+cN5HpH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="357427590"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="357427590"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 13:09:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="739888047"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="739888047"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 13:08:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu,  8 Jun 2023 13:08:54 -0700
Message-Id: <20230608200857.124884-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230608200857.124884-1-matthew.brost@intel.com>
References: <20230608200857.124884-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

