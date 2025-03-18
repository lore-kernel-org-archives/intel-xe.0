Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FCFC282EC
	for <intel-xe@archiver.kernel.org>; Tue, 18 Mar 2025 14:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CEF10E497;
	Tue, 18 Mar 2025 14:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bultX6mn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5971510E497
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Mar 2025 14:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742307494; x=1773843494;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9SGIG47D8ZuhU/39by3MqFTPP7n0MrvJdxHJX3UTjyM=;
 b=bultX6mnH8x06pb4kpWSX5LCtzC4lBOxzyRYZhbTSlgWZBBw2coLmki8
 ZncQoSqyi11mNHOqoKhmKExNRZSKYLdvoO0w2Cnpp0ED5D0YYzibCwfOf
 pYkwzO/P4XOU1FLxe3kSP2m3gjIoe243hfELclAzH0L7I/1LzfDZmaTPz
 ia23THXkUl7myB81CR6/lAbxn7nC4xhNQfRlH1ewceheX6hMuG67StUFC
 6PdIalJ9nadA8RD8PuiEbjidgGZA1FYi/0iWgODHqy4qsAp8GhEbhS+pX
 HMukrA6NtL+62CKyYm5PhVAdM6gShJKi/gEjreKXVe85HVbw/QkoZwwt6 g==;
X-CSE-ConnectionGUID: IhRgDLD+SVSqKF0jDQEiRw==
X-CSE-MsgGUID: 2u1INBODRiiwPyRZvqROJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="54835995"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="54835995"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 07:18:04 -0700
X-CSE-ConnectionGUID: 2yZLP+vXRniYRd93ak4WJg==
X-CSE-MsgGUID: hBbKtJ1UScezSwmiScwM1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="122767752"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa010.fm.intel.com with ESMTP; 18 Mar 2025 07:18:04 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v1] drm/xe/guc: Disable lite restore for MTL
Date: Tue, 18 Mar 2025 07:18:02 -0700
Message-Id: <20250318141802.2516616-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

Lite restore for MTL is not POR for Xe, then disable it for MTL.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index bc5714a5b36b..0c2629e578d9 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -80,7 +80,9 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
 
 static u32 guc_ctl_feature_flags(struct xe_guc *guc)
 {
-	u32 flags = GUC_CTL_ENABLE_LITE_RESTORE;
+	u32 flags = (guc_to_xe(guc)->info.platform == XE_METEORLAKE) ?
+		    0 : GUC_CTL_ENABLE_LITE_RESTORE;
+
 
 	if (!guc_to_xe(guc)->info.skip_guc_pc)
 		flags |= GUC_CTL_ENABLE_SLPC;
-- 
2.34.1

