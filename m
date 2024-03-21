Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FBEC54E58
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 11:06:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE46210E6E5;
	Thu, 21 Mar 2024 11:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="deZxAkp3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB6D10E6DE
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 11:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711019214; x=1742555214;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tQXD7Hwd2gMtRCd6Pr3b7WgYWBCWl0r/po9N6KGtuSg=;
 b=deZxAkp3mUaoA4XyeDz69ak++Iy9SCC/tFQb323GPaz2R8Q7QgKEVtJm
 s94qmoPGuTn3GfQepMhcEwy/G36jXr7P1YvdKRVBpCipQI5yb9rxvAcJ3
 t45CR1NaH8FN/rOnRi9GgMk1SQqKO4qrwS6MPLuG1G8Yd7bL99lxfdBKq
 334305zqq5aEaDIzeAl9BvBZbqkc+BTiC8DIjVGSYxpvT6mcWpRIG9rLO
 LtoDU0cjpihosna555EQ2fVK94zs4tZlHVkVAFquxo/xGnRxYLjxY5+HC
 /xglnDcnd8ZVf0Ls3rMDXkgfFFlUs9ueSEcbMTHybBaNAkadVYEoVABkp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="16638924"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="16638924"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 04:06:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="45469580"
Received: from unknown (HELO mwauld-mobl1.intel.com) ([10.245.245.59])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 04:06:51 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/xe/query: fix gt_id bounds check
Date: Thu, 21 Mar 2024 11:06:30 +0000
Message-ID: <20240321110629.334701-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.44.0
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

The user provided gt_id should always be less than the
XE_MAX_GT_PER_TILE.

Fixes: 7793d00d1bf5 ("drm/xe: Correlate engine and cpu timestamps with better accuracy")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/xe/xe_query.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index fcd8680d2ccc..df407d73e5f5 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -133,7 +133,7 @@ query_engine_cycles(struct xe_device *xe,
 		return -EINVAL;
 
 	eci = &resp.eci;
-	if (eci->gt_id > XE_MAX_GT_PER_TILE)
+	if (eci->gt_id >= XE_MAX_GT_PER_TILE)
 		return -EINVAL;
 
 	gt = xe_device_get_gt(xe, eci->gt_id);
-- 
2.44.0

