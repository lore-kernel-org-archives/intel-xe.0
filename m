Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D72C47072
	for <intel-xe@archiver.kernel.org>; Fri, 22 Dec 2023 21:02:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CFC10E101;
	Fri, 22 Dec 2023 21:02:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD0810E101
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Dec 2023 21:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703278942; x=1734814942;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Pw0+XJOvEiLXc8/GMjDu1jc+G+YklLaON02cmpy9G4A=;
 b=aFgOI5CJYy6yWZd7hUsNq9GX9eJ3GrYgrjRmb7vUP8LZxRHFOaiV3xzo
 NhVzE+ytxOLn4lrQs10spX6oOhcBMloqlbdTGCnjDozHx2t/ZpHIyBQ6L
 M8dprJ/m+7kmBC4K2qrPGHl/SXDYRO3aIBWYU4HYq5mUSbFSlbquKjE2T
 sTDC2T2juRF7ePu9e9jfyABZ9rTgZccoJcyGq12+Jsh4BGBe0qZ2ve9aJ
 XRcJ5Cgt0dW5x1S8OS8xWGA6zRYs8h1Qpf46KBst1kRK8kcEoWoPI1FBk
 p2flm+laeMyC2UbfwyRB9NTKzN+tEXwdl6ffLOMycn78d/y6ky2FlL3I8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="399982065"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; d="scan'208";a="399982065"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2023 13:02:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="920739617"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; d="scan'208";a="920739617"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmsmga001.fm.intel.com with ESMTP; 22 Dec 2023 13:02:21 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Check skip_guc_pc before setting SLPC flag
Date: Fri, 22 Dec 2023 13:01:09 -0800
Message-Id: <20231222210109.533215-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

Don't set SLPC GuC feature ctl flag if skip_guc_pc is true.

Fixes: 975e4a3795d4 ("drm/xe: Manually setup C6 when skip_guc_pc is set")
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 811e8b201270..0e112b144ec8 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -62,7 +62,12 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
 
 static u32 guc_ctl_feature_flags(struct xe_guc *guc)
 {
-	return GUC_CTL_ENABLE_SLPC;
+	u32 flags = 0;
+
+	if (!(guc_to_xe(guc))->info.skip_guc_pc)
+		flags |= GUC_CTL_ENABLE_SLPC;
+
+	return flags;
 }
 
 static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
-- 
2.38.1

