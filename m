Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9ACC47258
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 16:48:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E6410EF0B;
	Thu, 25 Jan 2024 16:48:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBBC10F101
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jan 2024 16:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706201320; x=1737737320;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l4TdYQLat7ReJfbEejRaNVQPxF//++WL6ak26DUg1nQ=;
 b=jjYPYX7szNZzDwRFiLCa4bGtFQzdGwwDsBYfOcrpDOYEzIlGeLNQJ7vd
 uuS+DfEd1owQy+Jjxzc8JUhklQc2MNek5SFAMChgiCVtYRFBZwDepeRUW
 bf7WzAtc+Tzgo1yY5/7+/pnx37EnvHY/IWMpZLeU6SCdRTpTos2ytuneC
 KUGVw4d3C4bOX1smTLG6dRQ9C4+JBXGR4PfHCLwyrzNpXLXKjYEoIUp8I
 Rg68n6mPglelVEKts9ibzVc9PJ0oZ38hSIkRp9ZV0JUSDMD0RDhmZtaJr
 H+EHY5jYGjBKfgRr/LegZcmjs4D4Y0ElrYr7/G2kwEG9HmxN2dW7jj0DZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="15750595"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="15750595"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 08:48:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="877099061"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="877099061"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 08:48:35 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/xe_guc: Reduce a print from warn to debug
Date: Thu, 25 Jan 2024 22:26:52 +0530
Message-Id: <20240125165652.3764711-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: lucas.demarchi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Reduce debug print from warn to debug to avoid uncessary
warning message in dmesg (Lucas).

Fixes: c5a06c9169f3 ("drm/xe/guc: Enable WA 14018913170")
Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 576ff2c1fbb9..f4e555611baa 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -174,8 +174,8 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 		if (GUC_VER(version->major, version->minor, version->patch) >= GUC_VER(70, 7, 0))
 			flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
 		else
-			drm_warn(&xe->drm, "can't apply WA 14018913170, GUC version expected >= 70.7.0, found %u %u %u\n",
-				 version->major, version->minor, version->patch);
+			drm_dbg(&xe->drm, "can't apply WA 14018913170, GUC version expected >= 70.7.0, found %u %u %u\n",
+				version->major, version->minor, version->patch);
 	}
 
 	return flags;
-- 
2.25.1

