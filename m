Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB44EE14D6
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 19:30:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528AE10E1E5;
	Wed,  6 Sep 2023 19:30:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1782410E1E0
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 19:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694028615; x=1725564615;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9XvCum7Z574U7LZ8H7V305LXeUJKn6bsCVpt4jnk5Ag=;
 b=GLlEkQiwpRS8deYPugknl+rRXMqlZTPlDPSWGKjwDTwJcGe/oRgw35nq
 0gU/pfnzGdcSUrwwX59tUYIUWLNKoELNPyFg1J8bVliF2Ar8OjnvBAI8d
 1n/8eLH+iXyIIc2/Bo7oTh1NBdvtbb9SqizXWbTqdWpMWeQPz42Gz1xvn
 bdNcCw/rtnxFA1af4rsscAYfYztGkKk5jRfPsUovmVZKacoNbcWugT+gQ
 IV83wbpMjKNeYGqJNNV1T4aV7ww5r3IbZrENY7xyp6Naz4WCdId3VCR2m
 wT/uzukn5+BvRj1U0VVclntXf+VT7ZE4hfEYkMw+JDFTE/pNyTUeanmmm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="356646101"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="356646101"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 12:30:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="856587836"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="856587836"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 12:30:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Sep 2023 12:30:09 -0700
Message-Id: <20230906193009.1912129-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/pat: Use 0 instead of space on error
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

Use 0 in format string instead of space so it shows as

	[drm] *ERROR* Missing PAT table for platform with graphics version 20.04!

instead of

	[drm] *ERROR* Missing PAT table for platform with graphics version 20. 4!

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index b56a65779d26..71e0e047fff3 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -107,7 +107,7 @@ void xe_pat_init(struct xe_gt *gt)
 		 * raise an error rather than trying to silently inherit the
 		 * most recent platform's behavior.
 		 */
-		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%2d!\n",
+		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%02d!\n",
 			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
 	}
 }
-- 
2.40.1

