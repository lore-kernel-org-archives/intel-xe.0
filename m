Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69574C197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 15:12:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F50410E60D;
	Thu, 16 Nov 2023 15:12:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3355E10E611
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 15:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700147573; x=1731683573;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xBloBgtD80RnoGOFSQA4mv8SDk9yizMU4YlGQPMeJb0=;
 b=Q3/ljvYqvuQoLd6zSxjhSv98dyJPyB93qrAPauONCSDGQI/vH1M4rR8z
 oIdsJhLOLK66P/3Z0+2a7pFzvnr3OjnIBtDJrCOgY911xrGYfylE6dZyf
 aUvVMnbwIHTfAhPAIBgMpJBpK5ou7sYXEBxlkyYnkIDOGBDf0PrfnGI+F
 xGYbcghJz74Ve/9BZeQVWnoiJQO0gSV+CDztLUaUaryTo8SEf5rAOuC6Z
 lBP6kuIZKnpcOXQ95Gk6riRsDOpXwLBVHMj2BHvxUvwOqdZQh/zgsxyxv
 sXRIYd0GIqzOX4TY+/XgkfMqrgoAM/EurdI/jPCiuc4LH3xZgqvEThv7F w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="388269204"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="388269204"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 07:12:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="938863144"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="938863144"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.152.135])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 07:12:51 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Nov 2023 16:12:39 +0100
Message-Id: <20231116151242.2125-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/4] drm/xe/guc: Fix wrong assert about
 full_len
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

This variable holds full length of the message, including header
length so it should be checked against GUC_CTB_MSG_MAX_LEN.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index a84e111bb36a..c44e75074695 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -419,7 +419,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	full_len = len + GUC_CTB_HDR_LEN;
 
 	lockdep_assert_held(&ct->lock);
-	xe_assert(xe, full_len <= (GUC_CTB_MSG_MAX_LEN - GUC_CTB_HDR_LEN));
+	xe_assert(xe, full_len <= GUC_CTB_MSG_MAX_LEN);
 	xe_assert(xe, tail <= h2g->info.size);
 
 	/* Command will wrap, zero fill (NOPs), return and check credits again */
-- 
2.25.1

